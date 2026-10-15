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
    -- Ding - Leveling: what each trip is for (trainers, weapon masters, pets)
    ["Loot the beasts you kill on the way here"] =
        "Plündere die Tiere, die du auf dem Weg hierher tötest",
    ["Learn First Aid from the trainer"] =
        "Lerne Erste Hilfe beim Lehrer",
    ["Learn Blacksmithing from the trainer"] =
        "Lerne Schmiedekunst beim Lehrer",
    ["Learn Mining from the trainer"] =
        "Lerne Bergbau beim Lehrer",
    ["Learn Cooking from the trainer"] =
        "Lerne Kochkunst beim Lehrer",
    ["Learn Herbalism from the trainer"] =
        "Lerne Kräuterkunde beim Lehrer",
    ["Learn Thrown at the weapon master"] =
        "Lerne Wurfwaffen beim Waffenmeister",
    ["Learn Staves at the weapon master"] =
        "Lerne Stäbe beim Waffenmeister",
    ["Learn Swords at the weapon master"] =
        "Lerne Schwerter beim Waffenmeister",
    ["Learn Maces at the weapon master"] =
        "Lerne Streitkolben beim Waffenmeister",
    ["Learn Bows at the weapon master"] =
        "Lerne Bogen beim Waffenmeister",
    ["Learn Guns at the weapon master"] =
        "Lerne Schusswaffen beim Waffenmeister",
    ["Learn Two-Handed Swords at the weapon master"] =
        "Lerne Zweihandschwerter beim Waffenmeister",
    ["Learn Two-Handed Axes at the weapon master"] =
        "Lerne Zweihandäxte beim Waffenmeister",
    ["Learn Two-Handed Maces at the weapon master"] =
        "Lerne Zweihandstreitkolben beim Waffenmeister",
    ["Learn Swords and Daggers at the weapon master"] =
        "Lerne Schwerter und Dolche beim Waffenmeister",
    ["Learn Swords and Staves at the weapon master"] =
        "Lerne Schwerter und Stäbe beim Waffenmeister",
    ["Learn Bows and Staves at the weapon master"] =
        "Lerne Bogen und Stäbe beim Waffenmeister",
    ["Learn Guns and Maces at the weapon master"] =
        "Lerne Schusswaffen und Streitkolben beim Waffenmeister",
    ["Learn Guns and Two-Handed Axes at the weapon master"] =
        "Lerne Schusswaffen und Zweihandäxte beim Waffenmeister",
    ["Learn Two-Handed Swords and Staves at the weapon master"] =
        "Lerne Zweihandschwerter und Stäbe beim Waffenmeister",
    ["Learn Two-Handed Axes and Two-Handed Maces at the weapon master"] =
        "Lerne Zweihandäxte und Zweihandstreitkolben beim Waffenmeister",
    ["Learn Two-Handed Maces and Staves at the weapon master"] =
        "Lerne Zweihandstreitkolben und Stäbe beim Waffenmeister",
    ["Learn Crossbows and Two-Handed Swords at the weapon master"] =
        "Lerne Armbrüste und Zweihandschwerter beim Waffenmeister",
    ["Learn Guns, Two-Handed Axes and Two-Handed Maces at the weapon master"] =
        "Lerne Schusswaffen, Zweihandäxte und Zweihandstreitkolben beim Waffenmeister",
    ["Tame a pet here"] =
        "Zähme hier einen Begleiter",
    ["Tame a beast here to learn the next rank of Claw"] =
        "Zähme hier ein Tier, um den nächsten Rang von Klaue zu lernen",
    ["Head to the big cage"] =
        "Geh zum großen Käfig",
    ["Visit the caged quilboar"] =
        "Besuche den eingesperrten Stacheleber",
    ["Go to the corrupted moonwell"] =
        "Geh zum verderbten Mondbrunnen",
    -- Ding - Leveling: where an object or a monster target is (notes)
    ["The object is indoors."] =
        "Das Objekt ist drinnen.",
    ["The object is indoors, one floor up."] =
        "Das Objekt ist drinnen, ein Stockwerk höher.",
    ["The object is on the lower level, indoors."] =
        "Das Objekt ist drinnen auf der unteren Ebene.",
    ["The object is on the lower level within the bridge."] =
        "Das Objekt ist auf der unteren Ebene im Inneren der Brücke.",
    ["The object is on the highest level of this structure."] =
        "Das Objekt ist auf der obersten Ebene dieses Gebäudes.",
    ["The object is up on the summit."] =
        "Das Objekt ist oben auf dem Gipfel.",
    ["The object sits on the rocky shelf above."] =
        "Das Objekt ist oben auf dem Felsvorsprung.",
    ["The target is indoors."] =
        "Das Ziel ist drinnen.",
    ["The target is indoors, one floor up."] =
        "Das Ziel ist drinnen, ein Stockwerk höher.",
    ["The target is indoors at street level."] =
        "Das Ziel ist drinnen, auf Straßenhöhe.",
    ["The target is indoors, on the central storey."] =
        "Das Ziel ist drinnen, im mittleren Stockwerk.",
    ["The target is on the lower level, indoors."] =
        "Das Ziel ist drinnen auf der unteren Ebene.",
    ["The target is on the tower's highest floor."] =
        "Das Ziel ist im obersten Stockwerk des Turms.",
    ["The target is up on the summit."] =
        "Das Ziel ist oben auf dem Gipfel.",
    ["The target is down in the Cleft of Shadow."] =
        "Das Ziel ist unten in der Kluft der Schatten.",
    ["The target can be indoors or out."] =
        "Das Ziel kann drinnen oder draußen sein.",
    ["The target patrols a long route; look along it."] =
        "Das Ziel patrouilliert eine lange Route; such entlang dieser Route.",
    ["The target waits here, then strolls out onto the big branch close by."] =
        "Das Ziel wartet hier und geht dann auf den großen Ast in der Nähe hinaus.",
    -- Ding - Leveling: why an item goes to the bank (notes)
    ["You need it later for \"The Legend of Stalvan\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Die Legende von Stalvan“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need it later for \"Juice Delivery\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Saftlieferung“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need it later for \"The Brassbolts Brothers\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Die Brüder Brassbolt“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need it later for \"A Noble Brew\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Ein nobles Bräu“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need it later for \"Soothing Turtle Bisque\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Milde Schildkrötensuppe“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need it later for \"Reassignment\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Versetzungen“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need it later for \"Parts for Kravel\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Teile für Kravel“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need them later for \"Goblin Sponsorship\" and \"The Hidden Key\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Goblin-Sponsoring“ und „Der versteckte Schlüssel“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need it later for \"Chapter I\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Kapitel I“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need it later for \"Chapter II\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Kapitel II“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need it later for \"Chapter III\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Kapitel III“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need it later for \"Chapter IV\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Kapitel IV“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need it later for \"The Karnitol Shipwreck\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Karnitols Schiffbruch“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need them later for \"Magical Analysis\" and \"Caught!\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Magische Analyse“ und „Eingesperrt!“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need it later for \"Rumors for Kravel\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Gerüchte für Kravel“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need it later for \"Ongeku\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Ongeku“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need it later for \"Sunken Treasure\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Versunkener Schatz“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need them later for \"Back to Booty Bay\" and \"Safety First\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Zurück nach Booty Bay“ und „Sicherheit zuerst“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need them later for \"Report Back to Fizzlebub\" and \"Rhapsody's Kalimdor Kocktail\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Meldet Euch bei Fizzlebub“ und „Rhapsodys Kalimdor-Cocktail“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need them later for \"The Borrower\", \"Screecher Spirits\", \"The Super Egg-O-Matic\" and \"Rhapsody's Kalimdor Kocktail\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Der Borger“, „Kreischergeister“, „Der Super-Ei-O-Mat“ und „Rhapsodys Kalimdor-Cocktail“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need them later for \"Crystals of Power\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Machtkristalle“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need them later for \"Rhapsody's Tale\", \"The Super Snapper FX\", \"Whiskey Slim's Lost Grog\" and \"Favored of Elune?\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Rhapsodys Geschichte“, „Der Superschnapper FX“, „Whiskey Slim's verlorener Grog“ und „Elunes Lieblinge?“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need it later for \"Deliver to MacKinley\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Lieferung für MacKinley“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need them later for \"The Bait for Lar'korwi\", \"Un'Goro Soil\", \"A Visit to Gregan\" and \"It's a Secret to Everybody\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Ein Köder für Lar'korwi“, „Un'Goro-Erde“, „Ein Besuch bei Gregan“ und „Es ist für jeden ein Geheimnis“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need it later for \"Rise of the Silithid\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Aufstieg der Silithid“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need it later for \"A Taste of Flame\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Eine Kostprobe der Flamme“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need them later for \"Chasing A-Me 01\" and \"Arcane Runes\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Chasing A-Me 01“ und „Arkane Runen“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need them later for \"Good Natured Emma\", \"Arcane Runes\" and \"Sprinkle's Secret Ingredient\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Emma die Nette“, „Arkane Runen“ und „Sprinkles Geheimzutat“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need them later for \"The Stone Circle\", \"Felbound Ancients\", \"A Little Slime Goes a Long Way\", \"Moontouched Wildkin\" and \"Meet at the Grave\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Der runde Stein“, „Gebundene Urtume“, „Brühschleimer auf Abwegen“, „Mondbestrahltes Wildekin“ und „Treffen am Grab“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need it later for \"Return to Tymor\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Rückkehr zu Magier Tymor“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need them later for \"Aquementas\", \"The Everlook Report\", \"Duke Nicholas Zverenhoff\" and \"Troubled Spirits of Kel'Theril\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Aquementas“, „Der Everlook-Bericht“, „Fürst Nicholas Zverenhoff“ und „Die gequälten Seelen von Kel'Theril“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need it later for \"Felnok Steelspring\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Felnok Steelspring“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need it later for \"Glyphed Oaken Branch\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Glyphenverzierter Eichenast“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need them later for \"The Disruption Ends\" and \"Supplies for the Crossroads\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Das Ende der Unterbrechungen“ und „Vorräte für Crossroads“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need it later for \"Chen's Empty Keg\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Chens leeres Fässchen“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need it later for \"Egg Hunt\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Eierjagd“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need them later for \"Souvenirs of Death\" and \"Battle of Hillsbrad\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Andenken des Todes“ und „Kampf um Hillsbrad“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need it later for \"Frostmaw\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Frostrachen“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need it later for \"The Swarm Grows\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Der Schwarm wächst“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need them later for \"Martek the Exiled\" and \"Hemet Nesingwary\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Martek der Verbannte“ und „Hemet Nesingwary“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need it later for \"Caught!\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Eingesperrt!“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need them later for \"The Black Shield\" and \"Into the Field\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Der Schwarze Schild“ und „Auf ins Feld“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need them later for \"Tanaris Field Sampling\" and \"Screecher Spirits\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Tanaris-Feldproben“ und „Kreischergeister“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need it later for \"Back to Booty Bay\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Zurück nach Booty Bay“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need them later for \"Deadmire\" and \"Safety First\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Schlammwühler“ und „Sicherheit zuerst“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need them later for \"Another Message to the Wildhammer\", \"Screecher Spirits\" and \"The Super Egg-O-Matic\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Eine weitere Botschaft an die Wildhammer“, „Kreischergeister“ und „Der Super-Ei-O-Mat“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need it later for \"Return to Witch Doctor Uzer'i\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Kehrt zu Hexendoktor Uzer'i zurück“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need it later for \"The Atal'ai Exile\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Der Verbannte der Atal'ai“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need them later for \"Testing the Vessel\" and \"Report Back to Fizzlebub\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Das Gefäß wird getestet“ und „Meldet Euch bei Fizzlebub“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need it later for \"Return to Apothecary Zinge\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Kehrt zu Apothekerin Zinge zurück“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need them later for \"The Stone Circle\" and \"Crystals of Power\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Der runde Stein“ und „Machtkristalle“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need them later for \"Ripple Delivery\", \"Whiskey Slim's Lost Grog\" and \"Seeping Corruption\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Wellenlieferung“, „Whiskey Slim's verlorener Grog“ und „Verbreitete Verderbnis“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need them later for \"Bungle in the Jungle\", \"The Bait for Lar'korwi\" and \"It's a Secret to Everybody\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Dschungelei“, „Ein Köder für Lar'korwi“ und „Es ist für jeden ein Geheimnis“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need them later for \"Delivery to Magatha\" and \"Seeping Corruption\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Lieferung an Magatha“ und „Verbreitete Verderbnis“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need it later for \"Jes'rimon's Payment to Jediga\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Jes'rimons Bezahlung für Jediga“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need it later for \"Meet at the Grave\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Treffen am Grab“: Lass es in der Bank, das spart einen Taschenplatz.",
    ["You need them later for \"Delivery to Andron Gant\", \"A Grave Situation\" and \"Betrayed\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Lieferung an Andron Gant“, „Grabesstille“ und „Verraten“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need them later for \"The Everlook Report\" and \"Duke Nicholas Zverenhoff\": keep them in the bank to free bag slots."] =
        "Du brauchst sie später für „Der Everlook-Bericht“ und „Fürst Nicholas Zverenhoff“: Lass sie in der Bank, das spart Taschenplätze.",
    ["You need it later for \"Aquementas\": keep it in the bank to free a bag slot."] =
        "Du brauchst es später für „Aquementas“: Lass es in der Bank, das spart einen Taschenplatz.",
    -- Places of the hearthstone steps (`sethearth`): the town, as this language names it (an
    -- inn's own name: its town).
    ["Astranaar"] =
        "Astranaar",
    ["Auberdine"] =
        "Auberdine",
    ["Bloodhoof Village"] =
        "Dorf der Bluthufe",
    ["Booty Bay"] =
        "Beutebucht",
    ["Brill"] =
        "Brill",
    ["Camp Mojache"] =
        "Camp Mojache",
    ["Camp Taurajo"] =
        "Camp Taurajo",
    ["Cenarion Hold"] =
        "Burg Cenarius",
    ["Coriella Calmbreeze"] =
        "Coriella Calmbreeze",
    ["Darkshire"] =
        "Dunkelhain",
    ["Deepwater Tavern"] =
        "Hafen von Menethil",
    ["Dolanaar"] =
        "Dolanaar",
    ["Donaal Downbreeze"] =
        "Donaal Downbreeze",
    ["Everlook"] =
        "Ewige Warte",
    ["Feathermoon Stronghold"] =
        "Mondfederfeste",
    ["Freewind Post"] =
        "Freiwindposten",
    ["Gadgetzan"] =
        "Gadgetzan",
    ["Gallows' End Tavern"] =
        "Brill",
    ["Goldshire"] =
        "Goldhain",
    ["Grom'gol"] =
        "Grom'gol",
    ["Hammerfall"] =
        "Hammerfall",
    ["Ironforge"] =
        "Eisenschmiede",
    ["Kargath"] =
        "Kargath",
    ["Kharanos"] =
        "Kharanos",
    ["Lakeshire"] =
        "Seenhain",
    ["Light's Hope Chapel"] =
        "Kapelle des Hoffnungsvollen Lichts",
    ["Menethil Harbor"] =
        "Hafen von Menethil",
    ["Nijel's Point"] =
        "Nijelspitze",
    ["Orgrimmar"] =
        "Orgrimmar",
    ["Ratchet"] =
        "Ratschet",
    ["Razor Hill"] =
        "Klingenhügel",
    ["Revantusk Village"] =
        "Dorf der Revantusk",
    ["Sentinel Hill"] =
        "Späherkuppe",
    ["Shadowprey Village"] =
        "Shadowprey Village",
    ["Southshore"] =
        "Süderstade",
    ["Splintertree Post"] =
        "Splitterholzposten",
    ["Stonard"] =
        "Steinard",
    ["Stonetalon Peak"] =
        "Steinkrallengipfel",
    ["Stormwind City"] =
        "Sturmwind",
    ["Stoutlager Inn"] =
        "Thelsamar",
    ["Sun Rock Retreat"] =
        "Sonnenfels",
    ["Tarren Mill"] =
        "Tarrens Mühle",
    ["The Crossroads"] =
        "Das Wegekreuz",
    ["The Sepulcher"] =
        "Das Grabmal",
    ["Thelsamar"] =
        "Thelsamar",
    ["Theramore"] =
        "Theramore",
    ["Theramore Isle"] =
        "Insel Theramore",
    ["Thunder Bluff"] =
        "Donnerfels",
    ["Thunderbrew Distillery"] =
        "Kharanos",
    -- Ding! - Class quests (hand-written guides)
    ["Druid quests"] =
        "Druidenquests",
    ["At level 10, your trainer teaches Teleport: Moonglade: the quick way to Moonglade and back, used all through this guide."] =
        "Auf Stufe 10 bringt dir dein Lehrer Teleportieren: Mondlichtung bei: der schnelle Weg zur Mondlichtung und zurück, den dieser Guide durchgehend nutzt.",
    ["Denatharion, the druid trainer of the Cenarion Enclave in Darnassus, sends you to Mathrengyl next to him."] =
        "Denatharion, der Druidenlehrer der Enklave des Cenarius in Darnassus, schickt dich zu Mathrengyl neben ihm.",
    ["Mathrengyl Bearwalker, upstairs in the Cenarion Enclave."] =
        "Mathrengyl Bearwalker, oben in der Enklave des Cenarius.",
    ["From level 10: the chain that teaches Bear Form."] =
        "Ab Stufe 10: die Questreihe, die dir Bärengestalt beibringt.",
    ["Dendrite Starblaze waits on the upper floor of the great house of Nighthaven."] =
        "Dendrite Starblaze wartet im oberen Stockwerk des großen Hauses von Nachthafen.",
    ["The Great Bear Spirit waits northwest of the village, up the hill path: listen to all it has to say."] =
        "Der Große Bärengeist wartet nordwestlich des Dorfes, den Hügelpfad hinauf: Hör dir alles an, was er zu sagen hat.",
    ["Sindrayl, the hippogryph master south of Nighthaven: take this flight path for your next trips here."] =
        "Sindrayl, die Hippogryphenmeisterin südlich von Nachthafen: Schalte diese Flugroute für deine nächsten Reisen hierher frei.",
    ["Lunaclaw's cave, in the hills east of Auberdine"] =
        "Mondklaues Höhle, in den Hügeln östlich von Auberdine",
    ["Deep in the cave, use the Cenarion Moondust by the moonkin stone: Lunaclaw appears. Defeat her, then speak to her spirit."] =
        "Benutze tief in der Höhle den Mondstaub des Cenarius am Moonkinstein: Mondklaue erscheint. Besiege sie und sprich dann mit ihrem Geist.",
    ["Turning this in teaches Bear Form."] =
        "Die Abgabe bringt dir Bärengestalt bei.",
    ["From level 10: the Skyborne quests of the bear spirit, on Zephras Isle."] =
        "Ab Stufe 10: die Skyborne-Quests des Bärengeists, auf der Insel Zephras.",
    ["Alfina Nightgaze, the druid trainer of Dalaran, gives it."] =
        "Alfina Nightgaze, die Druidenlehrerin von Dalaran, vergibt sie.",
    ["Opens the way to Moonglade, the home of the druids."] =
        "Öffnet den Weg zur Mondlichtung, der Heimat der Druiden.",
    ["Sheldras Moontree, the druid trainer of Stormwind, in the park."] =
        "Sheldras Moontree, der Druidenlehrer von Sturmwind, im Park.",
    ["Five Earthroot will be needed: an herb found along the roads, picked with Herbalism or bought at the auction house."] =
        "Fünf Erdwurzeln werden gebraucht: ein Kraut, das an den Straßen wächst, mit Kräuterkunde gesammelt oder im Auktionshaus gekauft.",
    ["From level 14: the chain that teaches Cure Poison."] =
        "Ab Stufe 14: die Questreihe, die dir Vergiftung heilen beibringt.",
    ["Fill the sampler at the mouth of the Cliffspring Falls cave, northeast of Auberdine."] =
        "Fülle die Probe am Eingang der Höhle an den Cliffspring Falls, nordöstlich von Auberdine.",
    ["Alanndarian Nightsong, in her house in Auberdine."] =
        "Alanndarian Nightsong, in ihrem Haus in Auberdine.",
    ["The Lunar Fungus grows in the small caves of the hills east of Auberdine, near Lunaclaw's."] =
        "Der Lunarfungus wächst in den kleinen Höhlen der Hügel östlich von Auberdine, nahe Mondklaues Höhle.",
    ["Sickly Deer wander the woods of Darkshore: use the salve on them."] =
        "Kränkliche Rehe streifen durch die Wälder der Dunkelküste: Benutze die Salbe an ihnen.",
    ["Turning this in teaches Cure Poison."] =
        "Die Abgabe bringt dir Vergiftung heilen bei.",
    ["From level 16: the chain that teaches Aquatic Form."] =
        "Ab Stufe 16: die Questreihe, die dir Wassergestalt beibringt.",
    ["The Shrine Bauble, a small wicker urn, lies on the bottom of Lake Elune'ara: dive around the shrine."] =
        "Das Schrein-Schmuckstück, eine kleine geflochtene Urne, liegt auf dem Grund des Sees Elune'ara: Tauche rund um den Schrein.",
    ["Use the bauble at the Shrine of Remulos, by the lake."] =
        "Benutze das Schmuckstück am Schrein von Remulos, am See.",
    ["The first half of the pendant lies under the water off the north of Darkshore."] =
        "Die erste Hälfte des Anhängers liegt unter Wasser vor dem Nordende der Dunkelküste.",
    ["The second half lies under the water off the western coast of Westfall."] =
        "Die zweite Hälfte liegt unter Wasser vor der Westküste von Westfall.",
    ["Back at the Shrine of Remulos: use a half pendant there to make it whole."] =
        "Zurück am Schrein von Remulos: Benutze dort eine Anhängerhälfte, um den Anhänger zusammenzufügen.",
    ["Turning this in teaches Aquatic Form."] =
        "Die Abgabe bringt dir Wassergestalt bei.",
    ["Night Elves get it from Mathrengyl Bearwalker in Darnassus."] =
        "Nachtelfen bekommen sie von Mathrengyl Bearwalker in Darnassus.",
    ["From level 20: Forever's chain of the Great Cat Spirit, in Moonglade."] =
        "Ab Stufe 20: die Forever-Questreihe des Großen Katzengeists, in der Mondlichtung.",
    ["The Great Cat Spirit rests in the south of Moonglade."] =
        "Der Große Katzengeist ruht im Süden der Mondlichtung.",
    ["The three relics lie in the southeast of Moonglade."] =
        "Die drei Relikte liegen im Südosten der Mondlichtung.",
    ["The Avatar of Saeyleenan waits in the south of Moonglade."] =
        "Der Avatar von Saeyleenan wartet im Süden der Mondlichtung.",
    ["Mathrengyl Bearwalker, upstairs in the Cenarion Enclave of Darnassus."] =
        "Mathrengyl Bearwalker, oben in der Enklave des Cenarius in Darnassus.",
    ["Any druid trainer of a capital gives it."] =
        "Jeder Druidenlehrer einer Hauptstadt vergibt sie.",
    ["From level 50: Torwa Pathfinder's chain in Un'Goro Crater, which ends in the Temple of Atal'Hakkar."] =
        "Ab Stufe 50: Torwa Pathfinders Questreihe im Krater von Un'Goro, die im Tempel von Atal'Hakkar endet.",
    ["Torwa Pathfinder camps on the eastern side of the crater."] =
        "Torwa Pathfinder lagert auf der Ostseite des Kraters.",
    ["The Gorishi wasps of the hive in the south carry the stings; the Bloodcaps grow on red plants all over the crater."] =
        "Die Wespen der Gorishi aus dem Schwarmbau im Süden tragen die Stacheln; die Blutkappenpilze wachsen an roten Pflanzen überall im Krater.",
    ["Use the barb on a devilsaur: they roam the open plains of the crater."] =
        "Benutze den Haken an einem Teufelssaurier: Sie streifen über die offenen Ebenen des Kraters.",
    ["Atal'alarion, the guardian of the idol in the temple, drops the Putrid Vine."] =
        "Atal'alarion, der Wächter des Götzen im Tempel, lässt die Fäulnisranke fallen.",
    ["Hunter quests"] =
        "Jägerquests",
    ["Dazalar, the hunter trainer of Dolanaar."] =
        "Dazalar, der Jägerlehrer von Dolanaar.",
    ["From level 10: three beasts to tame, then you can tame a pet of your own."] =
        "Ab Stufe 10: drei Tiere zum Zähmen, danach kannst du einen eigenen Begleiter zähmen.",
    ["Use the taming rod on a Webwood Lurker, east of Dolanaar. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "Benutze die Zähmerrute an einem Waldweberlauerer, östlich von Dolanaar. Sobald das Tier gezähmt ist, entlasse es: Es greift dich wieder an, also sei bereit.",
    ["Use the rod on a Nightsaber Stalker, west of Dolanaar, then dismiss it the same way."] =
        "Benutze die Rute an einem pirschenden Nachtsäbler, westlich von Dolanaar, und entlasse das Tier dann genauso.",
    ["Use the rod on a Strigid Screecher, south of Dolanaar."] =
        "Benutze die Rute an einem Strigidkreischer, südlich von Dolanaar.",
    ["Turning this in teaches Tame Beast: you can now keep a pet."] =
        "Die Abgabe bringt dir Wildtier zähmen bei: Jetzt kannst du einen Begleiter behalten.",
    ["Jocaste, the hunter trainer of Darnassus, upstairs."] =
        "Jocaste, die Jägerlehrerin von Darnassus, oben.",
    ["Your pet can now learn new skills."] =
        "Dein Begleiter kann jetzt neue Fähigkeiten lernen.",
    ["Grif Wildheart, the hunter trainer of Kharanos."] =
        "Grif Wildheart, der Jägerlehrer von Kharanos.",
    ["Use the taming rod on a Large Crag Boar, north of Kharanos. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "Benutze die Zähmerrute an einem großen Klippeneber, nördlich von Kharanos. Sobald das Tier gezähmt ist, entlasse es: Es greift dich wieder an, also sei bereit.",
    ["Use the rod on a Snow Leopard, south of Kharanos, then dismiss it the same way."] =
        "Benutze die Rute an einem Schneeleoparden, südlich von Kharanos, und entlasse das Tier dann genauso.",
    ["Use the rod on an Ice Claw Bear, in the hills south of Kharanos."] =
        "Benutze die Rute an einem Eisklauenbären, in den Hügeln südlich von Kharanos.",
    ["Belia Thundergranite, the pet trainer of Ironforge, in the Hall of Arms."] =
        "Belia Thundergranite, die Tierausbilderin von Eisenschmiede, in der Halle der Waffen.",
    ["Josephine Carson, the hunter trainer of Goldshire."] =
        "Josephine Carson, die Jägerlehrerin von Goldhain.",
    ["Use the taming rod on a Rockhide Boar, in the southeast of Elwynn Forest. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "Benutze die Zähmerrute an einem Felsnischeneber, im Südosten des Waldes von Elwynn. Sobald das Tier gezähmt ist, entlasse es: Es greift dich wieder an, also sei bereit.",
    ["Use the rod on a Gray Forest Wolf, in the east of the forest, then dismiss it the same way."] =
        "Benutze die Rute an einem grauen Forstwolf, im Osten des Waldes, und entlasse das Tier dann genauso.",
    ["Use the rod on a Young Forest Bear, in the west of the forest near Westbrook Garrison."] =
        "Benutze die Rute an einem jungen Waldbären, im Westen des Waldes nahe der Weststromgarnison.",
    ["Isaac Chan, the pet trainer, stands next to Josephine."] =
        "Isaac Chan, der Tierausbilder, steht neben Josephine.",
    ["Elayaa Easewind sends you to Quel'ana Quickgale."] =
        "Elayaa Easewind schickt dich zu Quel'ana Quickgale.",
    ["Use the taming rod on a Windsong Crawler. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "Benutze die Zähmerrute an einem Windsong Crawler. Sobald das Tier gezähmt ist, entlasse es: Es greift dich wieder an, also sei bereit.",
    ["Use the rod on an Ornery Galestrider, then dismiss it the same way."] =
        "Benutze die Rute an einem Ornery Galestrider und entlasse das Tier dann genauso.",
    ["Use the rod on a Vuldren Alpha."] =
        "Benutze die Rute an einem Vuldren Alpha.",
    ["Quel'dora Quickgale, the pet trainer, stands next to Quel'ana."] =
        "Quel'dora Quickgale, die Tierausbilderin, steht neben Quel'ana.",
    ["Any hunter trainer of a capital gives it."] =
        "Jeder Jägerlehrer einer Hauptstadt vergibt sie.",
    ["From level 50: Ogtinc's chain in Azshara, which ends in the Temple of Atal'Hakkar."] =
        "Ab Stufe 50: Ogtincs Questreihe in Azshara, die im Tempel von Atal'Hakkar endet.",
    ["Ogtinc lives up a hill path in the middle of Azshara."] =
        "Ogtinc lebt oben an einem Hügelpfad mitten in Azshara.",
    ["The Mosshoof Coursers of northern Azshara carry the antlers; only some do."] =
        "Die Mooshufrenner im Norden von Azshara tragen das Geweih, aber nur manche.",
    ["Wavethrashers haunt the Azshara shoreline; not every one leaves a scale."] =
        "Wellenhauer treiben sich an der Küste von Azshara herum; nicht jeder hinterlässt eine Schuppe.",
    ["Morphaz, one of the green dragons of the temple, drops the tooth."] =
        "Morphaz, einer der grünen Drachen des Tempels, lässt den Zahn fallen.",
    ["Mage quests"] =
        "Magierquests",
    ["Zaldimar Wefhellt, the mage trainer of Goldshire, upstairs in the inn."] =
        "Zaldimar Wefhellt, der Magielehrer von Goldhain, oben im Gasthaus.",
    ["From level 10: your trainer's first errand, a few minutes from Goldshire."] =
        "Ab Stufe 10: der erste Auftrag deines Lehrers, ein paar Minuten von Goldhain entfernt.",
    ["Jennea Cannon, upstairs in the Wizard's Sanctum of the Mage Quarter, in Stormwind."] =
        "Jennea Cannon, oben im Magiersanktum des Magierviertels, in Sturmwind.",
    ["Stand in the water of Mirror Lake, in the west of Elwynn Forest, and use the flask there."] =
        "Stell dich ins Wasser des Spiegelsees, im Westen des Waldes von Elwynn, und benutze dort die Flasche.",
    ["Magis Sparkmantle, the mage trainer of Kharanos."] =
        "Magis Sparkmantle, der Magielehrer von Kharanos.",
    ["From level 10: your trainer's first errand, in Dun Morogh."] =
        "Ab Stufe 10: der erste Auftrag deines Lehrers, in Dun Morogh.",
    ["Bink, the mage trainer of Ironforge, in the Hall of Mysteries."] =
        "Bink, die Magielehrerin von Eisenschmiede, in der Halle der Mysterien.",
    ["Bink's toolbox lies by the gates of Gnomeregan, in the west of Dun Morogh."] =
        "Binks Werkzeugkasten liegt an den Toren von Gnomeregan, im Westen von Dun Morogh.",
    ["From level 10: the Skyborne mage quests of Zephras Isle."] =
        "Ab Stufe 10: die Skyborne-Magierquests der Insel Zephras.",
    ["The wind-infused boughs lie on the ground west of the camp."] =
        "Die windgetränkten Äste liegen westlich des Lagers auf dem Boden.",
    ["Your mage trainer gives it."] =
        "Dein Magielehrer vergibt sie.",
    ["From level 15: a chain in Stormwind that ends with a robe for you."] =
        "Ab Stufe 15: eine Questreihe in Sturmwind, die mit einer Robe für dich endet.",
    ["The chest of coffers and the cantation lie in Jennea's tower."] =
        "Die Truhe mit Verwahrungskästen und die Inkantation liegen in Jenneas Turm.",
    ["The Blue Recluse, the inn of the Mage Quarter"] =
        "Der Blaue Eremit, das Gasthaus des Magierviertels",
    ["Read the cantation to reveal a Rift Spawn, fight it until it is stunned, then use a coffer on it. Three hide in the inn, one of them downstairs."] =
        "Lies die Inkantation, um eine Spaltbrut sichtbar zu machen, bekämpfe sie, bis sie betäubt ist, und benutze dann einen Kasten an ihr. Drei verstecken sich im Gasthaus, eine davon unten.",
    ["The Charged Rift Gem lies in the Silver Stream Mine, in the north of Loch Modan; the linen comes from humanoids anywhere."] =
        "Der Aufgeladene Rissedelstein liegt in der Silberbachmine, im Norden von Loch Modan; den Leinenstoff bekommst du überall von Humanoiden.",
    ["Wynne Larson, the robe merchant of the Mage Quarter."] =
        "Wynne Larson, die Robenhändlerin des Magierviertels.",
    ["Your reward: the Manaweave Robe."] =
        "Deine Belohnung: die Managewirkte Robe.",
    ["From level 26: a chain that ends with a second robe."] =
        "Ab Stufe 26: eine Questreihe, die mit einer zweiten Robe endet.",
    ["High Sorcerer Andromath, at the top of the Wizard's Sanctum."] =
        "Zaubermeister Andromath, ganz oben im Magiersanktum.",
    ["The book lies in the Tower of Ilgalar, in the east of Redridge Mountains."] =
        "Das Buch liegt im Turm von Ilgalar, im Osten des Rotkammgebirges.",
    ["The spiders of the western woods of Duskwood carry the silk."] =
        "Die Spinnen in den westlichen Wäldern des Dämmerwalds tragen die Seide.",
    ["Your reward: the Astral Knot Garment."] =
        "Deine Belohnung: das Astralknotengewand.",
    ["Your capital's mage trainer gives it."] =
        "Der Magielehrer deiner Hauptstadt vergibt sie.",
    ["From level 30: Tabetha's quests in Dustwallow Marsh, which end with a mage's wand."] =
        "Ab Stufe 30: Tabethas Quests in den Düstermarschen, die mit einem Magierzauberstab enden.",
    ["Tabetha lives on her farm in the south of Dustwallow Marsh."] =
        "Tabetha lebt auf ihrem Hof im Süden der Düstermarschen.",
    ["Magus Tirth, at the Shimmering Flats of Thousand Needles, near the race track."] =
        "Magus Tirth, an der Schimmernden Ebene in Tausend Nadeln, nahe der Rennstrecke.",
    ["\"Plucky\" Johnson, the chicken by the tent: beckon to him with the emote so he turns back into a man, then ask him for the phrase."] =
        "Eisenherz Johnson, das Huhn beim Zelt: Wink ihn mit dem Emote heran, damit er wieder zum Menschen wird, und frag ihn dann nach dem Spruch.",
    ["Tabetha gives it too."] =
        "Tabetha vergibt sie auch.",
    ["The Witherbark trolls of eastern Arathi Highlands carry the totem sticks."] =
        "Die Trolle der Witherbark im Osten des Arathihochlands tragen die Totemstecken.",
    ["Use the stick on the central stone of the Circle of Outer Binding, in Arathi Highlands; clear its guards first. The Jade is a gem found while mining, or at the auction house."] =
        "Benutze den Stecken am mittleren Stein des Kreises der äußeren Bindung, im Arathihochland; besiege zuerst seine Wachen. Die Jade ist ein Edelstein, den man beim Bergbau findet oder im Auktionshaus bekommt.",
    ["The book lies in the Library of the Scarlet Monastery."] =
        "Das Buch liegt in der Bibliothek des Scharlachroten Klosters.",
    ["Your reward: a mage's wand."] =
        "Deine Belohnung: ein Magierzauberstab.",
    ["From level 35: Tabetha's second chain, which goes through Uldaman."] =
        "Ab Stufe 35: Tabethas zweite Questreihe, die durch Uldaman führt.",
    ["The Burning Blade summoners of Mannoroc Coven, in southern Desolace, carry the orb."] =
        "Die Beschwörer der Burning Blade in Mannorocs Koven, im Süden von Desolace, tragen die Kugel.",
    ["Right there: Tabetha frees the demon of the orb; defeat it."] =
        "Gleich hier: Tabetha befreit den Dämon aus der Kugel; besiege ihn.",
    ["The Obsidian Sentinel of Uldaman holds the power source."] =
        "Die Obsidianschildwache von Uldaman hat die Kraftquelle.",
    ["Right there: destroy the mana surges as they appear around Tabetha."] =
        "Gleich hier: Vernichte die Manawogen, sobald sie um Tabetha herum erscheinen.",
    ["From level 40: Tabetha's task in Zul'Farrak."] =
        "Ab Stufe 40: Tabethas Aufgabe in Zul'Farrak.",
    ["Hydromancer Velratha, by the sacred pool of Zul'Farrak, drops the tiara."] =
        "Wasserbeschwörerin Velratha, am heiligen Teich von Zul'Farrak, lässt die Tiara fallen.",
    ["Your capital's master mage gives it."] =
        "Der Meistermagier deiner Hauptstadt vergibt sie.",
    ["From level 50: Archmage Xylem's chain in Azshara, which ends in the Temple of Atal'Hakkar."] =
        "Ab Stufe 50: die Questreihe von Erzmagier Xylem in Azshara, die im Tempel von Atal'Hakkar endet.",
    ["Sanath Lim-yo, at the foot of Archmage Xylem's tower in Azshara: talk to him to be sent up to the archmage."] =
        "Sanath Lim-yo, am Fuß des Turms von Erzmagier Xylem in Azshara: Sprich mit ihm, damit er dich zum Erzmagier hinaufschickt.",
    ["The blood elves of the ruins in northeastern Azshara carry the dust."] =
        "Die Blutelfen in den Ruinen im Nordosten von Azshara tragen den Staub.",
    ["The Spitelash sirens of the western shore of Azshara carry the coral."] =
        "Die Sirenen der Grollflossen an der Westküste von Azshara tragen die Koralle.",
    ["Morphaz, one of the green dragons of the temple, drops the shard."] =
        "Morphaz, einer der grünen Drachen des Tempels, lässt den Splitter fallen.",
    ["From level 60: Lorekeeper Lydros' quest, inside Dire Maul."] =
        "Ab Stufe 60: die Quest des Hüters des Wissens Lydros, in Düsterbruch.",
    ["Hydrospawn, a water elemental of Dire Maul, drops the essence."] =
        "Hydrobrut, ein Wasserelementar in Düsterbruch, lässt die Essenz fallen.",
    ["Paladin quests"] =
        "Paladinquests",
    ["Brother Wilhelm, the paladin trainer of Goldshire, sends you to Stormwind."] =
        "Bruder Wilhelm, der Paladinlehrer von Goldhain, schickt dich nach Sturmwind.",
    ["Duthorian Rall, in the Cathedral of Light."] =
        "Duthorian Rall, in der Kathedrale des Lichts.",
    ["From level 12: the chain that teaches Redemption."] =
        "Ab Stufe 12: die Questreihe, die dir Erlösung beibringt.",
    ["Read the Tome of Divinity from your bags to start the next quest."] =
        "Lies den Folianten der Offenbarung aus deinen Taschen, um die nächste Quest zu starten.",
    ["Stephanie Turner, a poor woman of Old Town."] =
        "Stephanie Turner, eine arme Frau aus der Altstadt.",
    ["She needs Linen Cloth: humanoids carry it everywhere."] =
        "Sie braucht Leinenstoff: Humanoide tragen ihn überall.",
    ["Gazin Tenorm, in the Cathedral of Light."] =
        "Gazin Tenorm, in der Kathedrale des Lichts.",
    ["Henze Faulk lies lifeless in the east of Elwynn Forest: use the Symbol of Life on him."] =
        "Henze Faulk liegt leblos im Osten des Waldes von Elwynn: Benutze das Symbol des Lebens an ihm.",
    ["The Defias around Henze carry the script."] =
        "Die Defias rund um Henze tragen die Schrift.",
    ["Turning this in teaches Redemption."] =
        "Die Abgabe bringt dir Erlösung bei.",
    ["Azar Stronghammer, the paladin trainer of Kharanos, sends you to Ironforge."] =
        "Azar Stronghammer, der Paladinlehrer von Kharanos, schickt dich nach Eisenschmiede.",
    ["Tiza Battleforge, in the Mystic Ward of Ironforge."] =
        "Tiza Battleforge, im Mystikerviertel von Eisenschmiede.",
    ["John Turner, a poor man who walks the streets of Ironforge."] =
        "John Turner, ein armer Mann, der durch die Straßen von Eisenschmiede läuft.",
    ["He needs Linen Cloth: humanoids carry it everywhere."] =
        "Er braucht Leinenstoff: Humanoide tragen ihn überall.",
    ["Muiredon Battleforge, beside Tiza."] =
        "Muiredon Battleforge, neben Tiza.",
    ["Narm Faulk lies lifeless in the east of Dun Morogh: use the Symbol of Life on him."] =
        "Narm Faulk liegt leblos im Osten von Dun Morogh: Benutze das Symbol des Lebens an ihm.",
    ["The Dark Iron spies around Narm carry the script."] =
        "Die Spione der Dunkeleisenzwerge rund um Narm tragen die Schrift.",
    ["From level 20: the Tome of Valor, then the Test of Righteousness, which ends with Verigan's Fist, a two-handed mace."] =
        "Ab Stufe 20: der Foliant der Ehre, dann die Prüfung der Rechtschaffenheit, die mit Verigans Faust endet, einem Zweihandstreitkolben.",
    ["Read the Tome of Valor from your bags to start the next quest."] =
        "Lies den Folianten der Ehre aus deinen Taschen, um die nächste Quest zu starten.",
    ["Duthorian Rall, in the Cathedral of Light of Stormwind."] =
        "Duthorian Rall, in der Kathedrale des Lichts in Sturmwind.",
    ["Daphne Stilwell, at her house in the south of Westfall. Take her quest only when ready: three waves of Defias attack, then more."] =
        "Daphne Stilwell, bei ihrem Haus im Süden von Westfall. Nimm ihre Quest erst an, wenn du bereit bist: Drei Wellen von Defias greifen an, dann noch mehr.",
    ["Stay by Daphne until the last wave falls; a friend helps."] =
        "Bleib bei Daphne, bis die letzte Welle fällt; ein Freund an deiner Seite hilft.",
    ["Jordan Stilwell, outside the gates of Ironforge."] =
        "Jordan Stilwell, vor den Toren von Eisenschmiede.",
    ["Four items: the lumber from the Deadmines, the hammer from Shadowfang Keep, the ore from Loch Modan and the Kor Gem from Darkshore."] =
        "Vier Gegenstände: das Holz aus den Todesminen, der Hammer aus Burg Schattenfang, das Erz aus Loch Modan und der Kor-Edelstein von der Dunkelküste.",
    ["Bailor Stonehand, in Thelsamar."] =
        "Bailor Stonehand, in Thelsamar.",
    ["The ore lies in a crate by a tree stump, in the northeast of Loch Modan."] =
        "Das Erz liegt in einer Kiste neben einem Baumstumpf, im Nordosten von Loch Modan.",
    ["Thundris Windweaver, in Auberdine."] =
        "Thundris Windwirker, in Auberdine.",
    ["The naga of the Blackfathom Deeps entrance, under the water of Zoram Strand in Ashenvale, carry the corrupted gem. They are elite: bring a group."] =
        "Die Naga am Eingang der Tiefschwarzen Grotte, unter Wasser am Zoramstrand im Eschental, tragen den verderbten Edelstein. Sie sind Elite: Bring eine Gruppe mit.",
    ["The goblin woodcarvers of the Deadmines carry the lumber."] =
        "Die Goblin-Holzschnitzer in den Todesminen tragen das Holz.",
    ["Jordan's hammer lies in the stables of Shadowfang Keep."] =
        "Jordans Hammer liegt in den Ställen von Burg Schattenfang.",
    ["Your reward: Verigan's Fist."] =
        "Deine Belohnung: Verigans Faust.",
    ["Delgren the Purifier, at Maestra's Post in Ashenvale."] =
        "Delgren der Läuterer, in Maestras Posten im Eschental.",
    ["From level 22: Forever's paladin chain of Delgren the Purifier."] =
        "Ab Stufe 22: die Forever-Paladinquestreihe von Delgren dem Läuterer.",
    ["Katherine the Pure, in the Cathedral of Light of Stormwind."] =
        "Katharina die Reine, in der Kathedrale des Lichts in Sturmwind.",
    ["Ursula Deline, the warlock trainer of the Mage Quarter."] =
        "Ursula Deline, die Hexenmeisterlehrerin des Magierviertels.",
    ["The Blackrock orcs of Redridge Mountains carry the summoner's salt."] =
        "Die Orcs der Blackrock im Rotkammgebirge tragen das Beschwörersalz.",
    ["The demons of Demon Fall Canyon, in the southeast of Ashenvale, carry the motes."] =
        "Die Dämonen im Demonfall-Canyon, im Südosten des Eschentals, tragen die Partikel.",
    ["Bring them to the Spear of Mannoroth, in the canyon."] =
        "Bring sie zum Speer des Mannoroth, im Canyon.",
    ["From level 40: the quest of your warhorse."] =
        "Ab Stufe 40: die Quest deines Schlachtrosses.",
    ["Turning this in teaches Summon Warhorse."] =
        "Die Abgabe bringt dir Schlachtross beschwören bei.",
    ["Lord Grayson Shadowbreaker, in the Cathedral of Light."] =
        "Lord Grayson Shadowbreaker, in der Kathedrale des Lichts.",
    ["From level 50: the chain of the Mightstone, which ends in the Temple of Atal'Hakkar."] =
        "Ab Stufe 50: die Questreihe des Steins der Macht, die im Tempel von Atal'Hakkar endet.",
    ["Commander Ashlam Valorfist, at Chillwind Camp in the Western Plaguelands."] =
        "Kommandant Ashlam Valorfist, im Lager Kühlwind in den Westlichen Pestländern.",
    ["The skeletons of the fields of Andorhal carry the scourgestones."] =
        "Die Skelette auf den Feldern von Andorhal tragen die Geißelsteine.",
    ["High Priest Thel'danis walks around Chillwind Camp."] =
        "Hohepriester Thel'danis läuft im Lager Kühlwind umher.",
    ["The six troll bosses of the temple's upper ring each drop one feather: Gasher, Zul'Lor, Mijan, Hukku, Zolo and Loro."] =
        "Die sechs Trollbosse im oberen Ring des Tempels lassen je eine Feder fallen: Schlitzer, Zul'Lor, Mijan, Hukku, Zolo und Loro.",
    ["From level 60: the long chain of your charger. It asks for about 200 gold and goes through Stratholme, Dire Maul and Scholomance."] =
        "Ab Stufe 60: die lange Questreihe deines Streitrosses. Sie verlangt etwa 200 Gold und führt durch Stratholme, Düsterbruch und Scholomance.",
    ["High Priest Rohan, in the Mystic Ward of Ironforge: the sacrifice he asks for is gold."] =
        "Hohepriester Rohan, im Mystikerviertel von Eisenschmiede: Das Opfer, das er verlangt, ist Gold.",
    ["Use the censer on the Terrordale Spirits, in the northwest of the Eastern Plaguelands."] =
        "Benutze den Weihrauchschwenker an den Schreckenstalgeistern, im Nordwesten der Östlichen Pestländer.",
    ["Grimand Elmore, in the Dwarven District of Stormwind."] =
        "Grimand Elmore, im Zwergendistrikt von Sturmwind.",
    ["Grimand wants gold, Arthas' Tears (a herb), Runecloth, an Arcanite Bar, and holy water from the supply crates of Stratholme."] =
        "Grimand will Gold, Arthas' Tränen (ein Kraut), Runenstoff, einen Arkanitbarren und heiliges Wasser aus den Vorratskisten von Stratholme.",
    ["Merideth Carlson, the horse breeder of Southshore, makes the horse feed."] =
        "Merideth Carlson, die Pferdezüchterin von Süderstade, stellt das Pferdefutter her.",
    ["The Enriched Manna Biscuits are sold by the Argent Dawn's quartermasters."] =
        "Die Angereicherten Manakekse verkaufen die Rüstmeister der Argentumdämmerung.",
    ["The Ancient Equine Spirit waits in western Dire Maul, past Tendris Warpwood."] =
        "Der Uralte Pferdegeist wartet im Westen von Düsterbruch, hinter Tendris Wucherborke.",
    ["An Azerothian Diamond and a Pristine Black Diamond: found while mining and on monsters of the Plaguelands, or at the auction house."] =
        "Ein Azerothianischer Diamant und ein Makelloser schwarzer Diamant: beim Bergbau und bei Monstern der Pestländer zu finden, oder im Auktionshaus.",
    ["In Scholomance, use the Divination Scryer to call Death Knight Darkreaver, defeat him, then use the charger's soul on his fallen mount."] =
        "Benutze in Scholomance das Orakel der Anrufung, um Todesritter Schattensichel herbeizurufen, besiege ihn und benutze dann die Seele des Streitrosses an seinem gefallenen Reittier.",
    ["Your reward: Summon Charger, your epic mount."] =
        "Deine Belohnung: Streitross beschwören, dein episches Reittier.",
    ["Priest quests"] =
        "Priesterquests",
    ["Priestess Anetta, the priest trainer of Northshire Abbey."] =
        "Priesterin Anetta, die Priesterlehrerin der Abtei von Nordhain.",
    ["From level 5: heal a wounded guard, and get your first robe."] =
        "Ab Stufe 5: Heile eine verwundete Wache und hol dir deine erste Robe.",
    ["Priestess Josetta, the priest trainer of Goldshire."] =
        "Priesterin Josetta, die Priesterlehrerin von Goldhain.",
    ["Guard Roberts lies wounded east of Goldshire: heal him with Lesser Heal, then give him Power Word: Fortitude."] =
        "Wache Roberts liegt verwundet östlich von Goldhain: Heile ihn mit Geringes Heilen und gib ihm dann Machtwort: Seelenstärke.",
    ["Branstock Khalder, the priest trainer of Coldridge Valley."] =
        "Branstock Khalder, der Priesterlehrer des Eisklammtals.",
    ["From level 5: heal a wounded mountaineer, and get your first robe."] =
        "Ab Stufe 5: Heile einen verwundeten Gebirgsjäger und hol dir deine erste Robe.",
    ["Maxan Anvol, the priest trainer of Kharanos."] =
        "Maxan Anvol, der Priesterlehrer von Kharanos.",
    ["Mountaineer Dolf lies wounded near Kharanos: heal him with Lesser Heal, then give him Power Word: Fortitude."] =
        "Gebirgsjäger Dolf liegt verwundet nahe Kharanos: Heile ihn mit Geringes Heilen und gib ihm dann Machtwort: Seelenstärke.",
    ["Shanda, the priest trainer of Aldrassil, in Shadowglen."] =
        "Shanda, die Priesterlehrerin von Aldrassil, im Laubschattental.",
    ["From level 5: heal a wounded sentinel, and get your first robe."] =
        "Ab Stufe 5: Heile eine verwundete Schildwache und hol dir deine erste Robe.",
    ["Laurna Morninglight, the priest trainer of Dolanaar."] =
        "Laurna Morninglight, die Priesterlehrerin von Dolanaar.",
    ["Sentinel Shaya lies wounded south of Dolanaar: heal her with Lesser Heal, then give her Power Word: Fortitude."] =
        "Schildwache Shaya liegt verwundet südlich von Dolanaar: Heile sie mit Geringes Heilen und gib ihr dann Machtwort: Seelenstärke.",
    ["From level 10: the quest that teaches Desperate Prayer."] =
        "Ab Stufe 10: die Quest, die dir Verzweifeltes Gebet beibringt.",
    ["High Priestess Laurena, in the Cathedral of Light of Stormwind."] =
        "Hohepriesterin Laurena, in der Kathedrale des Lichts in Sturmwind.",
    ["Priestess Josetta gives it too."] =
        "Priesterin Josetta vergibt sie auch.",
    ["From level 10: Forever's quest of Divine Grace, for Humans."] =
        "Ab Stufe 10: die Forever-Quest zu Divine Grace, für Menschen.",
    ["From level 10: Forever's quest of Confounding Flash, for Gnomes."] =
        "Ab Stufe 10: die Forever-Quest zu Confounding Flash, für Gnome.",
    ["High Priestess Mims, in the Mystic Ward of Ironforge."] =
        "Hohepriesterin Mims, im Mystikerviertel von Eisenschmiede.",
    ["From level 10: the quest that teaches Starshards."] =
        "Ab Stufe 10: die Quest, die dir Sternensplitter beibringt.",
    ["Priestess Alathea, in the Temple of the Moon of Darnassus."] =
        "Priesterin Alathea, im Tempel des Mondes in Darnassus.",
    ["From level 20: the quest that teaches Feedback."] =
        "Ab Stufe 20: die Quest, die dir Rückkopplung beibringt.",
    ["High Priest Rohan, in the Mystic Ward of Ironforge."] =
        "Hohepriester Rohan, im Mystikerviertel von Eisenschmiede.",
    ["From level 20: the quest that teaches Fear Ward."] =
        "Ab Stufe 20: die Quest, die dir Furchtzauberschutz beibringt.",
    ["From level 20: Forever's second Gnome priest quest."] =
        "Ab Stufe 20: die zweite Forever-Priesterquest für Gnome.",
    ["From level 20: the quest that teaches Elune's Grace."] =
        "Ab Stufe 20: die Quest, die dir Elunes Anmut beibringt.",
    ["Any priest trainer of a capital gives it."] =
        "Jeder Priesterlehrer einer Hauptstadt vergibt sie.",
    ["The Mosshoof Coursers of northern Azshara carry the glands; only some do."] =
        "Die Mooshufrenner im Norden von Azshara tragen die Drüsen, aber nur manche.",
    ["The undead of the Western Plaguelands and the Zanzil zombies of Stranglethorn carry the ichor."] =
        "Die Untoten der Westlichen Pestländer und die Zombies von Zanzil im Schlingendorntal tragen das Sekret.",
    ["Morphaz, one of the green dragons of the temple, carries the blood."] =
        "Morphaz, einer der grünen Drachen des Tempels, trägt das Blut.",
    ["Greta Mosshoof, at the Emerald Sanctuary in Felwood."] =
        "Greta Mosshoof, im Smaragdrefugium im Teufelswald.",
    ["Rogue quests"] =
        "Schurkenquests",
    ["Hogral Bakkan, the rogue trainer of Kharanos."] =
        "Hogral Bakkan, der Schurkenlehrer von Kharanos.",
    ["From level 10: a first errand for the rogues of Ironforge."] =
        "Ab Stufe 10: ein erster Auftrag für die Schurken von Eisenschmiede.",
    ["Hulfdan Blackbeard, in the Forlorn Cavern of Ironforge."] =
        "Hulfdan Blackbeard, im Düsteren Viertel von Eisenschmiede.",
    ["Onin MacHammar stands on a platform in the west of Dun Morogh, near Gnomeregan."] =
        "Onin MacHammar steht auf einer Plattform im Westen von Dun Morogh, nahe Gnomeregan.",
    ["Learn Pick Lock at your trainer, then practice on lockboxes until your skill reaches 75."] =
        "Lerne Schloss knacken bei deinem Lehrer und übe dann an Schließkassetten, bis deine Fertigkeit 75 erreicht.",
    ["From level 16: Pick Lock opens the chests and boxes of the quests to come."] =
        "Ab Stufe 16: Schloss knacken öffnet die Truhen und Kassetten der kommenden Quests.",
    ["Master Mathias Shaw, on the top floor of SI:7's headquarters, in Old Town."] =
        "Meister Mathias Shaw, im obersten Stockwerk des Hauptquartiers von SI:7, in der Altstadt.",
    ["From level 20: the chain that teaches your poisons."] =
        "Ab Stufe 20: die Questreihe, die dir deine Gifte beibringt.",
    ["Agent Kearnen watches from a hill in the southeast of Westfall."] =
        "Agentin Kearnen beobachtet von einem Hügel im Südosten von Westfall aus.",
    ["Pick the Defias Tower Key from the pocket of a Malformed Defias Drone, by the tower; then, upstairs, sap Klaven Mortwake before you open the chest."] =
        "Stiehl den Turmschlüssel der Defias aus der Tasche einer missgestalteten Drohne der Defias beim Turm; setz dann oben Kopfnuss gegen Klaven Mortwake ein, bevor du die Truhe öffnest.",
    ["The chest leaves a sickness on you: that is the next quest."] =
        "Die Truhe hinterlässt eine Krankheit bei dir: Das ist die nächste Quest.",
    ["Doc Mixilpixil works in the cellar of SI:7's headquarters."] =
        "Doc Mixilpixil arbeitet im Keller des Hauptquartiers von SI:7.",
    ["Lie down in front of him (the emote) so he can examine you."] =
        "Leg dich vor ihm hin (das Emote), damit er dich untersuchen kann.",
    ["Turning this in teaches your poisons."] =
        "Die Abgabe bringt dir deine Gifte bei.",
    ["Myrokos Silentform, at Ravenholdt Manor in the Alterac Mountains: the way in is a cave in the north of Hillsbrad Foothills."] =
        "Myrokos Silentform, im Ravenholdt-Anwesen im Alteracgebirge: Der Weg hinein führt durch eine Höhle im Norden des Vorgebirges des Hügellands.",
    ["From level 24: Forever's Syndicate quests, at Ravenholdt Manor."] =
        "Ab Stufe 24: die Forever-Quests zum Syndikat, im Ravenholdt-Anwesen.",
    ["Lord Tomas is hiding in the east of Hillsbrad Foothills."] =
        "Lord Tomas versteckt sich im Osten des Vorgebirges des Hügellands.",
    ["Any rogue trainer of a capital gives it."] =
        "Jeder Schurkenlehrer einer Hauptstadt vergibt sie.",
    ["From level 50: Lord Jorach Ravenholdt's chain, which ends in the Temple of Atal'Hakkar."] =
        "Ab Stufe 50: die Questreihe von Lord Jorach Ravenholdt, die im Tempel von Atal'Hakkar endet.",
    ["Lord Jorach Ravenholdt, in Ravenholdt Manor."] =
        "Lord Jorach Ravenholdt, im Ravenholdt-Anwesen.",
    ["The Timbermaw shamans of northern Azshara carry the bag."] =
        "Die Schamanen der Holzschlundfeste im Norden von Azshara tragen die Tasche.",
    ["Archmage Xylem, at the top of his tower in Azshara: Sanath Lim-yo, at its foot, sends you up."] =
        "Erzmagier Xylem, ganz oben in seinem Turm in Azshara: Sanath Lim-yo, an seinem Fuß, schickt dich hinauf.",
    ["The Forest Oozes of northeastern Azshara carry the fragments."] =
        "Die Waldbrühschlammer im Nordosten von Azshara tragen die Fragmente.",
    ["Morphaz, one of the green dragons of the temple, drops the key."] =
        "Morphaz, einer der grünen Drachen des Tempels, lässt den Schlüssel fallen.",
    ["Shaman quests"] =
        "Schamanenquests",
    ["Teo Hammerstorm, the shaman trainer of Coldridge Valley."] =
        "Teo Hammerstorm, der Schamanenlehrer des Eisklammtals.",
    ["From level 4: the Call of Earth, your first totem."] =
        "Ab Stufe 4: Ruf der Erde, dein erstes Totem.",
    ["The Frostmane trolls south of the valley carry the pendant."] =
        "Die Trolle der Frostmane südlich des Tals tragen den Anhänger.",
    ["On the hill west of the valley: drink the Earth Sapta to see the Minor Manifestation of Earth."] =
        "Auf dem Hügel westlich des Tals: Trink das Erdsapta, um die Schwache Erdmanifestation zu sehen.",
    ["Turning this in teaches your first earth totem."] =
        "Die Abgabe bringt dir dein erstes Erdtotem bei.",
    ["Ingrid Dunwald in Kharanos, or Eldrun Stormbreaker in Ironforge."] =
        "Ingrid Dunwald in Kharanos oder Eldrun Stormbreaker in Eisenschmiede.",
    ["From level 10: the Call of Fire, your first fire totem."] =
        "Ab Stufe 10: Ruf des Feuers, dein erstes Feuertotem.",
    ["Bruegs Kindleborn, in the far east of Dun Morogh, by the road to Loch Modan."] =
        "Bruegs Kindleborn, im äußersten Osten von Dun Morogh, an der Straße nach Loch Modan.",
    ["Braldir Ashmantle, on a hill in the southwest of Loch Modan."] =
        "Braldir Ashmantle, auf einem Hügel im Südwesten von Loch Modan.",
    ["The Tunnel Rat geomancers of Loch Modan carry the Fire Tar; the Stonesplinter seers of the south carry the pouches."] =
        "Die Geomanten der Tunnelratten in Loch Modan tragen den Feuerteer; die Seher der Splittersteintroggs im Süden tragen die Beutel.",
    ["Right by Braldir: call the Minor Manifestation of Fire at the brazier, then defeat it for its ember."] =
        "Gleich bei Braldir: Ruf die Schwache Feuermanifestation an der Kohlenpfanne herbei und besiege sie dann für ihre Glut.",
    ["Light the Brazier of the Dormant Flame with the ember."] =
        "Entzünde die Kohlenpfanne der schlafenden Flamme mit der Glut.",
    ["Bruegs Kindleborn, in the far east of Dun Morogh."] =
        "Bruegs Kindleborn, im äußersten Osten von Dun Morogh.",
    ["Turning this in teaches your first fire totem."] =
        "Die Abgabe bringt dir dein erstes Feuertotem bei.",
    ["Eldrun Stormbreaker, the shaman trainer of Ironforge."] =
        "Eldrun Stormbreaker, der Schamanenlehrer von Eisenschmiede.",
    ["From level 20: the Call of Water, your first water totem."] =
        "Ab Stufe 20: Ruf des Wassers, dein erstes Wassertotem.",
    ["Norric Lochthane, by the dam in the north of Loch Modan."] =
        "Norric Lochthane, am Damm im Norden von Loch Modan.",
    ["Hervdana Saegrund, in the southeast of the Wetlands."] =
        "Hervdana Saegrund, im Südosten des Sumpflands.",
    ["Fill the waterskin where Hervdana's quest says: DingDB does not hold this place yet."] =
        "Fülle den Wasserschlauch dort, wo Hervdanas Quest es angibt: DingDB kennt diesen Ort noch nicht.",
    ["At the Forgotten Shrine of Westfall: call the corrupt manifestation of water, then defeat it for its bracers."] =
        "Am Vergessenen Schrein in Westfall: Ruf die verderbte Wassermanifestation herbei und besiege sie dann für ihre Armschienen.",
    ["The Minor Manifestation of Water rises beside the shrine."] =
        "Die Schwache Wassermanifestation erhebt sich neben dem Schrein.",
    ["Turning this in teaches your first water totem."] =
        "Die Abgabe bringt dir dein erstes Wassertotem bei.",
    ["From level 30: the Call of Air, your first air totem."] =
        "Ab Stufe 30: Ruf der Luft, dein erstes Lufttotem.",
    ["Veyric Thunderhame, in the north of Arathi Highlands."] =
        "Veyric Thunderhame, im Norden des Arathihochlands.",
    ["Turning this in teaches your first air totem."] =
        "Die Abgabe bringt dir dein erstes Lufttotem bei.",
    ["From level 30: Veyric Thunderhame's elemental quests, to level 40."] =
        "Ab Stufe 30: Veyric Thunderhames Elementarquests, bis Stufe 40.",
    ["Four twisted totems: from the Stonevault troggs of the Badlands, the Maraudine centaurs of Desolace, the Lost Ones of the Swamp of Sorrows and the Mirefin murlocs of Dustwallow Marsh."] =
        "Vier verdrehte Totems: von den Steingrufttroggs im Ödland, den Zentauren der Maraudine in Desolace, den Verirrten in den Sümpfen des Elends und den Murlocs der Schlammflossen in den Düstermarschen.",
    ["Charlga Razorflank, the crone of Razorfen Kraul, carries the note."] =
        "Charlga Razorflank, die Greisin im Kral der Klingenhauer, trägt die Notiz.",
    ["The Ravaging Tempests of western Thousand Needles carry the eye."] =
        "Die Ravaging Tempests im Westen von Tausend Nadeln tragen das Auge.",
    ["Bath'rah the Windwatcher, in the hills of the Alterac Mountains."] =
        "Bath'rah der Windbehüter, in den Hügeln des Alteracgebirges.",
    ["Warlock quests"] =
        "Hexenmeisterquests",
    ["Drusilla La Salle, the warlock trainer of Northshire Abbey."] =
        "Drusilla La Salle, die Hexenmeisterlehrerin der Abtei von Nordhain.",
    ["Your trainer's first errand, around Northshire Abbey."] =
        "Der erste Auftrag deines Lehrers, rund um die Abtei von Nordhain.",
    ["The stolen books lie in the kobold camp east of the abbey."] =
        "Die gestohlenen Bücher liegen im Koboldlager östlich der Abtei.",
    ["Alamar Grimm, the warlock trainer of Coldridge Valley."] =
        "Alamar Grimm, der Hexenmeisterlehrer des Eisklammtals.",
    ["Your trainer's first errand, around Coldridge Valley."] =
        "Der erste Auftrag deines Lehrers, rund um das Eisklammtal.",
    ["The Frostmane novices of the troll cave in the south of the valley carry the charm."] =
        "Die Novizen der Frostmane in der Trollhöhle im Süden des Tals tragen den Talisman.",
    ["Remen Marcot, in the inn of Goldshire, sends you to Stormwind."] =
        "Remen Marcot, im Gasthaus von Goldhain, schickt dich nach Sturmwind.",
    ["Lago Blackwrench, in the Forlorn Cavern of Ironforge, sends you to Stormwind."] =
        "Lago Blackwrench, im Düsteren Viertel von Eisenschmiede, schickt dich nach Sturmwind.",
    ["Gakin the Darkbinder, in the cellar of the Slaughtered Lamb, in the Mage Quarter of Stormwind."] =
        "Gakin der Dunkelbinder, im Keller des Geschlachteten Lamms, im Magierviertel von Sturmwind.",
    ["From level 10: the chain that teaches Summon Voidwalker."] =
        "Ab Stufe 10: die Questreihe, die dir Leerwandler beschwören beibringt.",
    ["Surena Caledon hides in a house of the Brackwell Pumpkin Patch, in the east of Elwynn Forest."] =
        "Surena Caledon versteckt sich in einem Haus auf dem Kürbisfeld der Brackwells, im Osten des Waldes von Elwynn.",
    ["Down the stairs of the Slaughtered Lamb's crypt: use the choker on the summoning circle, then defeat the voidwalker."] =
        "Die Treppe hinunter in die Gruft des Geschlachteten Lamms: Benutze den Halsschmuck am Beschwörungskreis und besiege dann den Leerwandler.",
    ["Turning this in teaches Summon Voidwalker."] =
        "Die Abgabe bringt dir Leerwandler beschwören bei.",
    ["Gakin the Darkbinder, in the cellar of the Slaughtered Lamb."] =
        "Gakin der Dunkelbinder, im Keller des Geschlachteten Lamms.",
    ["From level 20: the chain that teaches Summon Succubus."] =
        "Ab Stufe 20: die Questreihe, die dir Sukkubus beschwören beibringt.",
    ["Takar the Seer, north of Camp Taurajo in the Barrens: Horde land, stay clear of the guards."] =
        "Takar der Seher, nördlich von Camp Taurajo im Brachland: Gebiet der Horde, halte dich von den Wachen fern.",
    ["The Heartswood grows in the north of Ashenvale, near the Horde's lumber camp."] =
        "Das Herzholz wächst im Norden des Eschentals, nahe dem Holzfällerlager der Horde.",
    ["In the Slaughtered Lamb's crypt again: use the heartswood core on the summoning circle, then defeat the succubus."] =
        "Wieder in der Gruft des Geschlachteten Lamms: Benutze den Herzholzkern am Beschwörungskreis und besiege dann den Sukkubus.",
    ["Turning this in teaches Summon Succubus."] =
        "Die Abgabe bringt dir Sukkubus beschwören bei.",
    ["From level 30: the chain that teaches Summon Felhunter."] =
        "Ab Stufe 30: die Questreihe, die dir Teufelsjäger beschwören beibringt.",
    ["Strahad Farsan, in Ratchet."] =
        "Strahad Farsan, in Ratschet.",
    ["Krom Stoutarm, in the Hall of Explorers of Ironforge."] =
        "Krom Stoutarm, in der Halle der Forscher von Eisenschmiede.",
    ["The moldy tome lies in the southwest of Hillsbrad Foothills; the tattered manuscript, in a damaged chest of western Thousand Needles."] =
        "Der schimmlige Foliant liegt im Südwesten des Vorgebirges des Hügellands; das zerlumpte Manuskript in einer beschädigten Truhe im Westen von Tausend Nadeln.",
    ["The Dragonmaw orcs of the Wetlands carry the rod."] =
        "Die Orcs der Dragonmaw im Sumpfland tragen den Stab.",
    ["Right by Strahad: use the tome on the summoning circle, then defeat the felhunter."] =
        "Gleich bei Strahad: Benutze den Folianten am Beschwörungskreis und besiege dann den Teufelsjäger.",
    ["Turning this in teaches Summon Felhunter."] =
        "Die Abgabe bringt dir Teufelsjäger beschwören bei.",
    ["Demisette Cloyce, in the Slaughtered Lamb of Stormwind."] =
        "Demisette Cloyce, im Geschlachteten Lamm in Sturmwind.",
    ["From level 40: the quest of your felsteed."] =
        "Ab Stufe 40: die Quest deines Teufelsrosses.",
    ["Turning this in teaches Summon Felsteed."] =
        "Die Abgabe bringt dir Teufelsross beschwören bei.",
    ["Niby the Almighty and Impsy wait in a small camp of central Felwood."] =
        "Niby der Allmächtige und Impsy warten in einem kleinen Lager mitten im Teufelswald.",
    ["From level 50: the demonic quests of Niby and Impsy, in Felwood."] =
        "Ab Stufe 50: die dämonischen Quests von Niby und Impsy, im Teufelswald.",
    ["Felcloth drops from demons and satyrs, Azshara's above all; the auction house sells it too."] =
        "Teufelsstoff lassen Dämonen und Satyrn fallen, vor allem die von Azshara; das Auktionshaus verkauft ihn auch.",
    ["The Irontree treants of northern Felwood carry the rotting wood; the oozes of the Bloodvenom river, the essence."] =
        "Die Baumwesen der Eisenstämme im Norden des Teufelswalds tragen das faule Holz; die Brühschlammer am Blutgiftfluss die Essenz.",
    ["Three essences: from the satyrs of Jaedenar in Felwood, the Legashi satyrs of Azshara, and the felguards by the Dark Portal in the Blasted Lands."] =
        "Drei Essenzen: von den Satyrn in Jaedenar im Teufelswald, den Satyrn der Legashi in Azshara und den Teufelswachen am Dunklen Portal in den Verwüsteten Landen.",
    ["North of the camp, by the remains of Kroshius: use the item Impsy gives you to wake him, then defeat him."] =
        "Nördlich des Lagers, bei den Überresten von Kroshius: Benutze den Gegenstand, den Impsy dir gibt, um ihn zu wecken, und besiege ihn dann.",
    ["Spackle Thornberry, the demon trainer of the Slaughtered Lamb."] =
        "Spackle Thornberry, der Dämonenausbilder des Geschlachteten Lamms.",
    ["From level 60: the long chain of your dreadsteed. It asks for costly materials and goes through Scholomance and Dire Maul."] =
        "Ab Stufe 60: die lange Questreihe deines Schreckensrosses. Sie verlangt teure Materialien und führt durch Scholomance und Düsterbruch.",
    ["Mor'zul Bloodbringer, in the west of the Burning Steppes."] =
        "Mor'zul Bloodbringer, im Westen der Brennenden Steppe.",
    ["The owlbeasts of Winterspring carry the blood."] =
        "Die Eulenbestien in Winterquell tragen das Blut.",
    ["Gorzeeki Wildeyes, right by Mor'zul."] =
        "Gorzeeki Wildeyes, gleich bei Mor'zul.",
    ["Mor'zul gives these three."] =
        "Mor'zul vergibt diese drei.",
    ["These three ask for an alchemist's elixir, an enchanter's shard with ore of the Burning Steppes, and scales of black dragonkin: make them, find them, or buy them at the auction house."] =
        "Diese drei verlangen das Elixier eines Alchimisten, den Splitter eines Verzauberers mit Erz aus der Brennenden Steppe und Schuppen schwarzer Drachkin: Stell sie her, finde sie oder kauf sie im Auktionshaus.",
    ["An Arcanite Bar: an alchemist makes it, or the auction house sells it."] =
        "Ein Arkanitbarren: Ein Alchimist stellt ihn her, oder das Auktionshaus verkauft ihn.",
    ["Lord Banehollow, in the shrine of Jaedenar, in Felwood."] =
        "Lord Banehollow, im Schrein von Jaedenar, im Teufelswald.",
    ["Ulathek hides in Jaedenar too: defeat him for his heart."] =
        "Ulathek versteckt sich auch in Jaedenar: Besiege ihn für sein Herz.",
    ["Ur'dan sells the stardust, right by Lord Banehollow."] =
        "Ur'dan verkauft den Sternenstaub, gleich bei Lord Banehollow.",
    ["In the alchemy lab of Scholomance, use the imp in a jar and let it do its work."] =
        "Benutze im Alchimielabor von Scholomance den Wichtel im Glas und lass ihn seine Arbeit machen.",
    ["In Dire Maul, summon the Xorothian Dreadsteed with the ritual items and defeat it; then speak to its spirit."] =
        "Beschwöre in Düsterbruch mit den Ritualgegenständen das Xorothianische Schreckensross und besiege es; sprich dann mit seinem Geist.",
    ["Your reward: Summon Dreadsteed, your epic mount."] =
        "Deine Belohnung: Schreckensross beschwören, dein episches Reittier.",
    ["Warrior quests"] =
        "Kriegerquests",
    ["Lyria Du Lac, the warrior trainer of Goldshire."] =
        "Lyria Du Lac, die Kriegerlehrerin von Goldhain.",
    ["From level 10: the chain that teaches Defensive Stance."] =
        "Ab Stufe 10: die Questreihe, die dir Verteidigungshaltung beibringt.",
    ["Harry Burlguard, in the tavern of Old Town, in Stormwind."] =
        "Harry Burlguard, in der Taverne der Altstadt, in Sturmwind.",
    ["Bartleby, a drunk in the same tavern: he attacks as soon as you take his quest."] =
        "Bartleby, ein Betrunkener in derselben Taverne: Er greift an, sobald du seine Quest annimmst.",
    ["Turning this in teaches Defensive Stance."] =
        "Die Abgabe bringt dir Verteidigungshaltung bei.",
    ["Granis Swiftaxe, the warrior trainer of Kharanos."] =
        "Granis Swiftaxe, der Kriegerlehrer von Kharanos.",
    ["Muren Stormpike, upstairs in the Hall of Arms of Ironforge."] =
        "Muren Stormpike, oben in der Halle der Waffen von Eisenschmiede.",
    ["Vejrek waits in a Frostmane hut in the west of Dun Morogh."] =
        "Vejrek wartet in einer Hütte der Frostmane im Westen von Dun Morogh.",
    ["Kyra Windblade, the warrior trainer of Dolanaar."] =
        "Kyra Windblade, die Kriegerlehrerin von Dolanaar.",
    ["Elanaria, on the Warrior's Terrace of Darnassus."] =
        "Elanaria, auf der Terrasse der Krieger in Darnassus.",
    ["Vorlus Vilehoof roams with the satyrs southwest of Dolanaar."] =
        "Vorlus Elendshuf streift mit den Satyrn südwestlich von Dolanaar umher.",
    ["Seena Skybreaker, the warrior trainer of Zephras Isle."] =
        "Seena Skybreaker, die Kriegerlehrerin der Insel Zephras.",
    ["From level 10: the Skyborne warrior quest of Zephras Isle."] =
        "Ab Stufe 10: die Skyborne-Kriegerquest der Insel Zephras.",
    ["Zaal Stormshield carries the bulwark, in the north of the isle."] =
        "Zaal Stormshield trägt das Bollwerk, im Norden der Insel.",
    ["Your capital's warrior trainer gives it."] =
        "Der Kriegerlehrer deiner Hauptstadt vergibt sie.",
    ["From level 30: the chain that teaches Berserker Stance."] =
        "Ab Stufe 30: die Questreihe, die dir Berserkerhaltung beibringt.",
    ["Klannoc Macleod, on Fray Island, off the coast of the Barrens."] =
        "Klannoc Macleod, auf dem Prügel-Eiland, vor der Küste des Brachlands.",
    ["Step on the grate of the arena: six fighters come one at a time, then Big Will."] =
        "Stell dich auf das Gitter der Arena: Sechs Kämpfer kommen einer nach dem anderen, dann Big Will.",
    ["Turning this in teaches Berserker Stance."] =
        "Die Abgabe bringt dir Berserkerhaltung bei.",
    ["From level 30: Bath'rah's chain, which ends with a Whirlwind weapon of your choice."] =
        "Ab Stufe 30: Bath'rahs Questreihe, die mit einer Wirbelwaffe deiner Wahl endet.",
    ["Eight Liferoot: an herb, picked with Herbalism or bought at the auction house."] =
        "Acht Lebenswurz: ein Kraut, mit Kräuterkunde gesammelt oder im Auktionshaus gekauft.",
    ["The Drywhisker kobolds of eastern Arathi Highlands carry the three charms."] =
        "Die Kobolde der Trockenstoppel im Osten des Arathihochlands tragen die drei Talismane.",
    ["At Bath'rah's cauldron, right by him: put the three charms in it."] =
        "An Bath'rahs Kessel, gleich bei ihm: Leg die drei Talismane hinein.",
    ["The Bloodscalp trolls of northern Stranglethorn carry the tusks."] =
        "Die Trolle der Bloodscalp im Norden des Schlingendorntals tragen die Hauer.",
    ["Follow Bath'rah to the summoning, then defeat Cyclonian for its heart: a strong foe, bring help."] =
        "Folge Bath'rah zur Beschwörung und besiege dann Cyclonian für sein Herz: ein starker Gegner, bring Hilfe mit.",
    ["Your reward: a Whirlwind weapon of your choice."] =
        "Deine Belohnung: eine Wirbelwaffe deiner Wahl.",
    ["From level 50: the Fallen Hero's chain, which ends in the Temple of Atal'Hakkar."] =
        "Ab Stufe 50: die Questreihe des Gefallenen Helden, die im Tempel von Atal'Hakkar endet.",
    ["The Fallen Hero of the Horde, a spirit in the west of the Swamp of Sorrows."] =
        "Der Gefallene Held der Horde, ein Geist im Westen der Sümpfe des Elends.",
    ["The Helboars of the Blasted Lands."] =
        "Die Hölleneber der Verwüsteten Lande.",
    ["The Shadowsworn of the Blasted Lands, by the Dark Portal; they come back quickly."] =
        "Die Schattenanbeter der Verwüsteten Lande, beim Dunklen Portal; sie tauchen schnell wieder auf.",
    ["Gennia Runetotem, the druid trainer of Bloodhoof Village, sends you to Thunder Bluff."] =
        "Gennia Runetotem, die Druidenlehrerin des Dorfs der Bluthufe, schickt dich nach Donnerfels.",
    ["Turak Runetotem, in the Elder Rise of Thunder Bluff."] =
        "Turak Runetotem, auf der Anhöhe der Ältesten in Donnerfels.",
    ["Faustron, the wind rider master southwest of Nighthaven: take this flight path for your next trips here."] =
        "Faustron, der Windreitermeister südwestlich von Nachthafen: Schalte diese Flugroute für deine nächsten Reisen hierher frei.",
    ["Lunaclaw's spot, west of Camp Taurajo in the Barrens"] =
        "Mondklaues Stelle, westlich von Camp Taurajo im Brachland",
    ["Use the Cenarion Lunardust by the moonkin stone: Lunaclaw appears. Defeat her, then speak to her spirit."] =
        "Benutze den Lunarstaub des Cenarius am Moonkinstein: Mondklaue erscheint. Besiege sie und sprich dann mit ihrem Geist.",
    ["Muln Earthfury gives it, in the northwest of Mulgore."] =
        "Muln Earthfury vergibt sie, im Nordwesten von Mulgore.",
    ["Fill the sampler in the bubbling pool at the top of Dreadmist Peak: three acolytes attack right after, so clear the top first or bring help."] =
        "Fülle die Probe im blubbernden Teich auf dem Glutnebelgipfel: Gleich danach greifen drei Akolythen an, also räum zuerst den Gipfel frei oder bring Hilfe mit.",
    ["Tonga Runetotem, just south of the Crossroads."] =
        "Tonga Runetotem, direkt südlich vom Wegekreuz.",
    ["The kodos of the northern Barrens carry the Kodo Horns."] =
        "Die Kodos im nördlichen Brachland tragen die Kodohörner.",
    ["Sickly Gazelles graze in the north of the Barrens: use the salve on them."] =
        "Kränkliche Gazellen grasen im Norden des Brachlands: Benutze die Salbe an ihnen.",
    ["The first half of the pendant lies under the water in the far north of the Barrens."] =
        "Die erste Hälfte des Anhängers liegt unter Wasser im äußersten Norden des Brachlands.",
    ["The second half lies under the water off the coast of Silverpine Forest."] =
        "Die zweite Hälfte liegt unter Wasser vor der Küste des Silberwalds.",
    ["Turak Runetotem gives it, in the Elder Rise of Thunder Bluff."] =
        "Turak Runetotem vergibt sie, auf der Anhöhe der Ältesten in Donnerfels.",
    ["Thotar, the hunter trainer of Razor Hill."] =
        "Thotar, der Jägerlehrer vom Klingenhügel.",
    ["Use the taming rod on a Dire Mottled Boar, south of Razor Hill. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "Benutze die Zähmerrute an einem scheckigen Terroreber, südlich vom Klingenhügel. Sobald das Tier gezähmt ist, entlasse es: Es greift dich wieder an, also sei bereit.",
    ["Use the rod on a Surf Crawler, on the southern shore of Durotar, then dismiss it the same way."] =
        "Benutze die Rute an einem Brandungskriecher, an der Südküste von Durotar, und entlasse das Tier dann genauso.",
    ["Use the rod on an Armored Scorpid, northwest of Razor Hill."] =
        "Benutze die Rute an einem gepanzerten Skorpid, nordwestlich vom Klingenhügel.",
    ["Ormak Grimshot, the hunter trainer of Orgrimmar, in the Valley of Honor."] =
        "Ormak Grimshot, der Jägerlehrer von Orgrimmar, im Tal der Ehre.",
    ["Yaw Sharpmane, the hunter trainer of Bloodhoof Village."] =
        "Yaw Sharpmane, der Jägerlehrer des Dorfs der Bluthufe.",
    ["Use the taming rod on an Adult Plainstrider, north of the village. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "Benutze die Zähmerrute an einem erwachsenen Ebenenschreiter, nördlich des Dorfes. Sobald das Tier gezähmt ist, entlasse es: Es greift dich wieder an, also sei bereit.",
    ["Use the rod on a Prairie Stalker, southeast of the village, then dismiss it the same way."] =
        "Benutze die Rute an einem Präriepirscher, südöstlich des Dorfes, und entlasse das Tier dann genauso.",
    ["Use the rod on a Swoop, in the plains north of the village."] =
        "Benutze die Rute an einem Sturzflieger, in den Ebenen nördlich des Dorfes.",
    ["Holt Thunderhorn, the hunter trainer of Thunder Bluff, on the Hunter Rise."] =
        "Holt Thunderhorn, der Jägerlehrer von Donnerfels, auf der Anhöhe der Jäger.",
    ["Uthel'nay, the mage trainer of Orgrimmar, in the Valley of Spirits."] =
        "Uthel'nay, der Magielehrer von Orgrimmar, im Tal der Geister.",
    ["From level 10: your trainer's first errand, in Durotar."] =
        "Ab Stufe 10: der erste Auftrag deines Lehrers, in Durotar.",
    ["Un'Thuwa, the mage trainer of Sen'jin Village."] =
        "Un'Thuwa, der Magielehrer des Dorfs der Sen'jin.",
    ["The Ju-Ju Heaps stand on the Echo Isles, off the southern coast."] =
        "Die Jujuhaufen stehen auf den Echoinseln, vor der Südküste.",
    ["Cain Firesong, the mage trainer of Brill."] =
        "Cain Firesong, der Magielehrer von Brill.",
    ["From level 10: your trainer's first errand, in Tirisfal Glades."] =
        "Ab Stufe 10: der erste Auftrag deines Lehrers, in Tirisfal.",
    ["Anastasia Hartwell, the mage trainer of the Undercity, in the Magic Quarter."] =
        "Anastasia Hartwell, die Magielehrerin von Unterstadt, im Magieviertel.",
    ["The snapdragons grow by the farm of the Balnirs, in the east of Tirisfal Glades."] =
        "Die Löwenmäulchen wachsen beim Hof der Balnirs, im Osten von Tirisfal.",
    ["From level 15: a chain in the Undercity that ends with a robe for you."] =
        "Ab Stufe 15: eine Questreihe in Unterstadt, die mit einer Robe für dich endet.",
    ["The chest of coffers and the cantation lie beside Anastasia."] =
        "Die Truhe mit Verwahrungskästen und die Inkantation liegen neben Anastasia.",
    ["The alchemist shop of the Undercity"] =
        "Der Alchimistenladen von Unterstadt",
    ["Read the cantation to reveal a Rift Spawn, fight it until it is stunned, then use a coffer on it."] =
        "Lies die Inkantation, um eine Spaltbrut sichtbar zu machen, bekämpfe sie, bis sie betäubt ist, und benutze dann einen Kasten an ihr.",
    ["The Dalaran mages of Ambermill, in Silverpine Forest, carry the mana gems; the linen comes from humanoids anywhere."] =
        "Die Magier von Dalaran in Bernsteinmühle, im Silberwald, tragen die Manaedelsteine; den Leinenstoff bekommst du überall von Humanoiden.",
    ["Josef Gregorian, the tailor of the Undercity's Rogues' Quarter."] =
        "Josef Gregorian, der Schneider im Schurkenviertel von Unterstadt.",
    ["Your reward: the Spellfire Robes."] =
        "Deine Belohnung: die Roben des Zauberfeuers.",
    ["Deino, the mage trainer of Orgrimmar, in the Valley of Spirits."] =
        "Deino, die Magielehrerin von Orgrimmar, im Tal der Geister.",
    ["Fill the flask at the waterfall of Xavian, in eastern Ashenvale: take the path up from the south."] =
        "Fülle die Flasche am Wasserfall von Xavian, im Osten des Eschentals: Nimm den Pfad von Süden hinauf.",
    ["The Laughing Sisters, nymphs of the woods of central Ashenvale, carry the hair."] =
        "Die Lachenden Schwestern, Nymphen der Wälder im mittleren Eschental, tragen das Haar.",
    ["Kil'hala, the tailor of the Crossroads."] =
        "Kil'hala, die Schneiderin des Wegekreuzes.",
    ["Your reward: the Nether-lace Garment."] =
        "Deine Belohnung: das Netherspitzengewand.",
    ["Shadow Priest Sarvis, at the start of Deathknell."] =
        "Schattenpriester Sarvis, am Anfang von Todesend.",
    ["The Forsaken paladin's story, a chain added by Forever, starts in Deathknell."] =
        "Die Geschichte des Paladins der Verlassenen, eine von Forever hinzugefügte Questreihe, beginnt in Todesend.",
    ["Aramis Hammerhand, the paladin trainer of Deathknell."] =
        "Aramis Hammerhand, der Paladinlehrer von Todesend.",
    ["Shari Stilwell, the paladin trainer of Brill."] =
        "Shari Stilwell, die Paladinlehrerin von Brill.",
    ["Breton Samuels, at the outpost in the west of Tirisfal Glades."] =
        "Breton Samuels, am Außenposten im Westen von Tirisfal.",
    ["Jorin Croge, a few steps away."] =
        "Jorin Croge, ein paar Schritte entfernt.",
    ["The Vile Fin murlocs of the western coast."] =
        "Die Murlocs der Finsterflossen an der Westküste.",
    ["The lumber piles lie on the western coast, south of the murlocs."] =
        "Die Holzstapel liegen an der Westküste, südlich der Murlocs.",
    ["Danitha Morr, at the outpost."] =
        "Danitha Morr, am Außenposten.",
    ["The Tarnished gather on the western coast; Rudolph Gelhardt, their paladin, carries the head the quest asks for."] =
        "Die Tarnished sammeln sich an der Westküste; Rudolph Gelhardt, ihr Paladin, trägt den Kopf, den die Quest verlangt.",
    ["Lady Sylvanas Windrunner, in the Royal Quarter of the Undercity."] =
        "Fürstin Sylvanas Windrunner, im Königsviertel von Unterstadt.",
    ["Danitha Morr, at the outpost in the west of Tirisfal Glades."] =
        "Danitha Morr, am Außenposten im Westen von Tirisfal.",
    ["From level 12: the lessons in divinity, the next chapter of the Forsaken paladin's story."] =
        "Ab Stufe 12: die Lektionen in Göttlichkeit, das nächste Kapitel der Geschichte des Paladins der Verlassenen.",
    ["Tanis Alderwood, in the Undercity."] =
        "Tanis Alderwood, in Unterstadt.",
    ["Tanis needs Linen Cloth: humanoids carry it everywhere."] =
        "Tanis braucht Leinenstoff: Humanoide tragen ihn überall.",
    ["Deathguard Billmuth, at the outpost."] =
        "Todeswache Billmuth, am Außenposten.",
    ["Deathguard Falgan, in the east of Tirisfal Glades, near the Scarlet watch post."] =
        "Todeswache Falgan, im Osten von Tirisfal, nahe dem Wachposten des Scharlachroten Kreuzzugs.",
    ["The Scarlet zealots and friars of the watch post carry the attack plans."] =
        "Die Scharlachroten Zeloten und Ordensmitglieder des Wachpostens tragen die Angriffspläne.",
    ["From level 18: the story goes on in Silverpine Forest, around a moonsilver blade."] =
        "Ab Stufe 18: Die Geschichte geht im Silberwald weiter, rund um eine Mondsilberklinge.",
    ["Trevan Rol, at the Sepulcher."] =
        "Trevan Rol, am Grabmal.",
    ["Deathguard Baldren, at the Sepulcher."] =
        "Todeswache Baldren, am Grabmal.",
    ["The charred remains lie in the east of Silverpine Forest, facing Fenris Isle."] =
        "Die verkohlten Überreste liegen im Osten des Silberwalds, gegenüber der Insel Fenris.",
    ["Lumina Windsinger, held in Fenris Keep."] =
        "Lumina Windsinger, gefangen in Burg Fenris.",
    ["The Rot Hide gnolls of Fenris Isle carry the key."] =
        "Die Gnolle der Moderfelle auf der Insel Fenris tragen den Schlüssel.",
    ["Lumina Windsinger waits again at the Sepulcher."] =
        "Lumina Windsinger wartet wieder am Grabmal.",
    ["Old Fire-Eye prowls the south of Silverpine Forest."] =
        "Old Fire-Eye streift durch den Süden des Silberwalds.",
    ["Ott, the weaponsmith of Tarren Mill."] =
        "Ott, der Waffenschmied von Tarrens Mühle.",
    ["Ulric Frostveil, at Zoram'gar Outpost on the coast of Ashenvale."] =
        "Ulric Frostveil, im Außenposten von Zoram'gar an der Küste des Eschentals.",
    ["From level 20: Ulric Frostveil's quest of the Kor Gem, in Ashenvale."] =
        "Ab Stufe 20: Ulric Frostveils Quest um den Kor-Edelstein, im Eschental.",
    ["The naga of the Blackfathom Deeps entrance, under the water of Zoram Strand, carry the corrupted gem. They are elite: bring a group."] =
        "Die Naga am Eingang der Tiefschwarzen Grotte, unter Wasser am Zoramstrand, tragen den verderbten Edelstein. Sie sind Elite: Bring eine Gruppe mit.",
    ["Ken'jai, the priest trainer of the Valley of Trials."] =
        "Ken'jai, der Priesterlehrer im Tal der Prüfungen.",
    ["From level 5: heal a wounded grunt, and get your first robe."] =
        "Ab Stufe 5: Heile einen verwundeten Grunzer und hol dir deine erste Robe.",
    ["Tai'jin, the priest trainer of Razor Hill."] =
        "Tai'jin, die Priesterlehrerin vom Klingenhügel.",
    ["Grunt Kor'ja lies wounded south of Razor Hill: heal her with Lesser Heal, then give her Power Word: Fortitude."] =
        "Grunzer Kor'ja liegt verwundet südlich vom Klingenhügel: Heile sie mit Geringes Heilen und gib ihr dann Machtwort: Seelenstärke.",
    ["Dark Cleric Duesten, the priest trainer of Deathknell."] =
        "Dunkler Kleriker Duesten, der Priesterlehrer von Todesend.",
    ["From level 5: heal a wounded deathguard, and get your first robe."] =
        "Ab Stufe 5: Heile eine verwundete Todeswache und hol dir deine erste Robe.",
    ["Dark Cleric Beryl, the priest trainer of Brill."] =
        "Dunkler Kleriker Beryl, der Priesterlehrer von Brill.",
    ["Deathguard Kel lies wounded north of Brill: heal him with Lesser Heal, then give him Power Word: Fortitude."] =
        "Todeswache Kel liegt verwundet nördlich von Brill: Heile ihn mit Geringes Heilen und gib ihm dann Machtwort: Seelenstärke.",
    ["From level 10: the quest that teaches Hex of Weakness."] =
        "Ab Stufe 10: die Quest, die dir Verhexung der Schwäche beibringt.",
    ["Ur'kyo, the priest trainer of Orgrimmar, in the Valley of Spirits."] =
        "Ur'kyo, der Priesterlehrer von Orgrimmar, im Tal der Geister.",
    ["Aelthalyste, the priest trainer of the Undercity, in the War Quarter."] =
        "Aelthalyste, die Priesterlehrerin von Unterstadt, im Kriegsviertel.",
    ["From level 10: the quest that teaches Touch of Weakness."] =
        "Ab Stufe 10: die Quest, die dir Berührung der Schwäche beibringt.",
    ["From level 20: the quest that teaches Shadowguard."] =
        "Ab Stufe 20: die Quest, die dir Schattenwache beibringt.",
    ["From level 20: the quest that teaches Devouring Plague."] =
        "Ab Stufe 20: die Quest, die dir Verschlingende Seuche beibringt.",
    ["Learn Pick Lock at your trainer, then practice on lockboxes until your skill reaches 75: Gallywix's lockbox, at 20, needs it."] =
        "Lerne Schloss knacken bei deinem Lehrer und übe dann an Schließkassetten, bis deine Fertigkeit 75 erreicht: Gallywix' Schließkassette, auf Stufe 20, verlangt sie.",
    ["Shenthul, in a tent of the Cleft of Shadow, in Orgrimmar."] =
        "Shenthul, in einem Zelt in der Kluft der Schatten, in Orgrimmar.",
    ["Shenthul greets you with a hand sign: answer it with the salute emote."] =
        "Shenthul begrüßt dich mit einem Handzeichen: Antworte mit dem Salutieren-Emote.",
    ["By the Venture Co. tower in the far north of the Barrens: target Taskmaster Fizzule, fire the flare gun twice, then salute him."] =
        "Beim Turm der Venture Co. im äußersten Norden des Brachlands: Nimm Zuchtmeister Fizzule ins Ziel, feuere die Leuchtfeuerwaffe zweimal ab und salutiere dann vor ihm.",
    ["In the tower: pick Silixiz's key from his pocket, kill the guards floor by floor, Gallywix at the top, then open his lockbox."] =
        "Im Turm: Stiehl Silixiz den Schlüssel aus der Tasche, töte die Wachen Stockwerk für Stockwerk, Gallywix ganz oben, und öffne dann seine Schließkassette.",
    ["The lockbox leaves a sickness on you: Shenthul sends you to be cured."] =
        "Die Schließkassette hinterlässt eine Krankheit bei dir: Shenthul schickt dich zur Heilung.",
    ["Serge Hinott, the alchemist of Tarren Mill."] =
        "Serge Hinott, der Alchimist von Tarrens Mühle.",
    ["Stay by Serge while he prepares the cure."] =
        "Bleib bei Serge, während er das Heilmittel zubereitet.",
    ["Canaga Earthcaller, in the Valley of Trials."] =
        "Canaga Earthcaller, im Tal der Prüfungen.",
    ["The Felstalkers of the valley carry the hooves."] =
        "Die Teufelspirscher des Tals tragen die Hufe.",
    ["Up the hill path south of the valley: drink the Earth Sapta to see the Minor Manifestation of Earth."] =
        "Den Hügelpfad südlich des Tals hinauf: Trink das Erdsapta, um die Schwache Erdmanifestation zu sehen.",
    ["Seer Ravenfeather, in Camp Narache."] =
        "Seherin Ravenfeather, im Camp Narache.",
    ["The Bristleback shamans east of the camp carry the salve."] =
        "Die Schamanen der Borstennacken östlich des Lagers tragen die Salbe.",
    ["On the hill south of the camp: drink the Earth Sapta to see the Minor Manifestation of Earth."] =
        "Auf dem Hügel südlich des Lagers: Trink das Erdsapta, um die Schwache Erdmanifestation zu sehen.",
    ["Windshaper Boro, on Zephras Isle."] =
        "Windshaper Boro, auf der Insel Zephras.",
    ["Drink the Earth Sapta to see the Minor Manifestation of Earth, east of Boro."] =
        "Trink das Erdsapta, um die Schwache Erdmanifestation zu sehen, östlich von Boro.",
    ["Swart, the shaman trainer of Razor Hill."] =
        "Swart, der Schamanenlehrer vom Klingenhügel.",
    ["Narm Skychaser, the shaman trainer of Bloodhoof Village."] =
        "Narm Skychaser, der Schamanenlehrer des Dorfs der Bluthufe.",
    ["Kranal Fiss, at the Far Watch Post on the border of the Barrens."] =
        "Kranal Fiss, am Fernwachtposten an der Grenze zum Brachland.",
    ["Telf Joolam, on top of a mountain in the west of Durotar."] =
        "Telf Joolam, auf einem Berggipfel im Westen von Durotar.",
    ["The Razormane of the northern Barrens carry the Fire Tar; the Burning Blade cultists of the cave north of Razor Hill carry the pouches."] =
        "Die Grimmhauer im nördlichen Brachland tragen den Feuerteer; die Kultisten der Burning Blade in der Höhle nördlich vom Klingenhügel tragen die Beutel.",
    ["Right by Telf: drink the Fire Sapta, then defeat the Minor Manifestation of Fire for its ember."] =
        "Gleich bei Telf: Trink das Feuersapta und besiege dann die Schwache Feuermanifestation für ihre Glut.",
    ["Sessaria Skystride, on Zephras Isle."] =
        "Sessaria Skystride, auf der Insel Zephras.",
    ["Olariaan Swiftburn, in the south of the isle."] =
        "Olariaan Swiftburn, im Süden der Insel.",
    ["Skypriest Faladiel carries the heart."] =
        "Skypriest Faladiel trägt das Herz.",
    ["Kuramaa, the spirit of mischief, carries the mask."] =
        "Kuramaa, der Geist des Unfugs, trägt die Maske.",
    ["Light the Brazier of Offering by Olariaan, then the Brazier of Eternal Flame by Sessaria."] =
        "Entzünde die Kohlenpfanne der Opfergabe bei Olariaan, dann die Kohlenpfanne der Ewigen Flamme bei Sessaria.",
    ["Searn Firewarder, in the Valley of Wisdom of Orgrimmar."] =
        "Searn Firewarder, im Tal der Weisheit in Orgrimmar.",
    ["Xanis Flameweaver, on the Elder Rise of Thunder Bluff."] =
        "Xanis Flameweaver, auf der Anhöhe der Ältesten in Donnerfels.",
    ["Islen Waterseer, by the coast east of the Barrens."] =
        "Islen Waterseer, an der Küste östlich des Brachlands.",
    ["Brine, in the south of the Barrens."] =
        "Brine, im Süden des Brachlands.",
    ["Fill the waterskin at the quilboar watering hole, right by Brine."] =
        "Fülle den Wasserschlauch am Wasserloch der Stacheleber, gleich bei Brine.",
    ["Fill it at the Spring Well of Tarren Mill, in Hillsbrad Foothills."] =
        "Fülle ihn am Quellbrunnen von Tarrens Mühle, im Vorgebirge des Hügellands.",
    ["Fill it at the ruins of the Stardust Fountain, in the south of Ashenvale."] =
        "Fülle ihn an den Ruinen des Sternenstaubbrunnens, im Süden des Eschentals.",
    ["By the Brazier of Everfount, in the lake of Silverpine Forest: use the brazier's water, then defeat the corrupt manifestation for its bracers."] =
        "Bei der Kohlenpfanne von Everfount, im See des Silberwalds: Benutze das Wasser der Kohlenpfanne und besiege dann die verderbte Manifestation für ihre Armschienen.",
    ["The Minor Manifestation of Water rises beside the brazier."] =
        "Die Schwache Wassermanifestation erhebt sich neben der Kohlenpfanne.",
    ["Prate Cloudseer, on a mesa in the middle of Thousand Needles."] =
        "Prate Cloudseer, auf einem Tafelberg mitten in Tausend Nadeln.",
    ["Rau Cliffrunner, at Freewind Post."] =
        "Rau Cliffrunner, im Freiwindposten.",
    ["From level 33: Forever's elemental quests of Rau Cliffrunner, in Thousand Needles."] =
        "Ab Stufe 33: die Forever-Elementarquests von Rau Cliffrunner, in Tausend Nadeln.",
    ["Beram Skychaser in Thunder Bluff, or Sagorne Creststrider in Orgrimmar."] =
        "Beram Skychaser in Donnerfels oder Sagorne Creststrider in Orgrimmar.",
    ["From level 50: Bath'rah the Windwatcher's chain, which ends in the Temple of Atal'Hakkar."] =
        "Ab Stufe 50: die Questreihe von Bath'rah dem Windbehüter, die im Tempel von Atal'Hakkar endet.",
    ["One Elemental Earth, Fire, Water and Air: elementals drop them, or the auction house sells them."] =
        "Je eine Elementarerde, ein Elementarfeuer, ein Elementarwasser und eine Elementarluft: Elementare lassen sie fallen, oder das Auktionshaus verkauft sie.",
    ["The spiders and the bears of the Western Plaguelands carry the eyes and the claws."] =
        "Die Spinnen und die Bären der Westlichen Pestländer tragen die Augen und die Klauen.",
    ["Ruzan, in the Valley of Trials."] =
        "Ruzan, im Tal der Prüfungen.",
    ["Your trainer's first errand, in the Valley of Trials."] =
        "Der erste Auftrag deines Lehrers, im Tal der Prüfungen.",
    ["The Vile Familiars of the cave south of the valley carry the heads."] =
        "Die Üblen Familiare in der Höhle südlich des Tals tragen die Köpfe.",
    ["Zureetha Fargaze, beside Ruzan."] =
        "Zureetha Fargaze, neben Ruzan.",
    ["Venya Marthand, in Deathknell."] =
        "Venya Marthand, in Todesend.",
    ["Your trainer's first errand, in Deathknell."] =
        "Der erste Auftrag deines Lehrers, in Todesend.",
    ["The Rattlecage Skeletons east of Deathknell carry the skulls."] =
        "Die Klappernden Skelette östlich von Todesend tragen die Schädel.",
    ["Ophek, in Razor Hill, sends you to Orgrimmar."] =
        "Ophek, am Klingenhügel, schickt dich nach Orgrimmar.",
    ["Gan'rul Bloodeye, in the Cleft of Shadow of Orgrimmar."] =
        "Gan'rul Bloodeye, in der Kluft der Schatten in Orgrimmar.",
    ["The Tablet of Verga lies in the Burning Blade stash at the back of Skull Rock, in the north of Durotar."] =
        "Die Schrifttafel der Verga liegt im Versteck der Burning Blade hinten in der Knochenhöhle, im Norden von Durotar.",
    ["Right by Gan'rul: use the glyphs on the summoning circle, then defeat the voidwalker."] =
        "Gleich bei Gan'rul: Benutze die Glyphe am Beschwörungskreis und besiege dann den Leerwandler.",
    ["Ageron Kargal, in Brill, sends you to the Undercity."] =
        "Ageron Kargal, in Brill, schickt dich nach Unterstadt.",
    ["Carendin Halgar, in the Magic Quarter of the Undercity."] =
        "Carendin Halgar, im Magieviertel von Unterstadt.",
    ["Egalin's Grimoire lies in Perrine's chest, in the house south of Brill."] =
        "Egalins Zauberfoliant liegt in Perrines Truhe, im Haus südlich von Brill.",
    ["Right by Carendin: use the runes on the summoning circle, then defeat the voidwalker."] =
        "Gleich bei Carendin: Benutze die Runen am Beschwörungskreis und besiege dann den Leerwandler.",
    ["Cazul, in the Cleft of Shadow."] =
        "Cazul, in der Kluft der Schatten.",
    ["Zankaja, in the Valley of Spirits of Orgrimmar."] =
        "Zankaja, im Tal der Geister in Orgrimmar.",
    ["Gazrog, at the Crossroads."] =
        "Gazrog, am Wegekreuz.",
    ["Ken'zigla, at the camp of Malaka'jin in the far south of Stonetalon Mountains."] =
        "Ken'zigla, im Lager von Malaka'jin im äußersten Süden des Steinkrallengebirges.",
    ["Grunt Logmar, by the road north of Camp Taurajo."] =
        "Grunzer Logmar, an der Straße nördlich von Camp Taurajo.",
    ["Grunt Dogran is held by the Kolkar in the Barrens: give him the draught."] =
        "Grunzer Dogran wird von den Kolkar im Brachland festgehalten: Gib ihm den Trank.",
    ["Right by Gan'rul: use Dogran's pendant on the summoning circle, then defeat the succubus."] =
        "Gleich bei Gan'rul: Benutze Dograns Anhänger am Beschwörungskreis und besiege dann den Sukkubus.",
    ["Jorah Annison, in the Magic Quarter of the Undercity."] =
        "Jorah Annison, im Magieviertel von Unterstadt.",
    ["The Dragonmaw orcs of the Wetlands carry the rod: Alliance land, stay clear of the guards."] =
        "Die Orcs der Dragonmaw im Sumpfland tragen den Stab: Gebiet der Allianz, halte dich von den Wachen fern.",
    ["Zevrost, the warlock trainer of the Cleft of Shadow."] =
        "Zevrost, der Hexenmeisterlehrer der Kluft der Schatten.",
    ["Kurgul, the demon trainer of the Cleft of Shadow."] =
        "Kurgul, der Dämonenausbilder der Kluft der Schatten.",
    ["Your warrior trainer, in Razor Hill or Bloodhoof Village, sends you to Uzzek."] =
        "Dein Kriegerlehrer, am Klingenhügel oder im Dorf der Bluthufe, schickt dich zu Uzzek.",
    ["Uzzek, at the Far Watch Post on the border of the Barrens."] =
        "Uzzek, am Fernwachtposten an der Grenze zum Brachland.",
    ["From level 10: the quest that teaches Defensive Stance."] =
        "Ab Stufe 10: die Quest, die dir Verteidigungshaltung beibringt.",
    ["The Thunder Lizards of the north of Durotar carry the scales."] =
        "Die Donnerechsen im Norden von Durotar tragen die Schuppen.",
    ["Thun'grim Firegaze, on a hill east of the Crossroads."] =
        "Thun'grim Firegaze, auf einem Hügel östlich vom Wegekreuz.",
    ["The steel bars lie in the Razormane camp below the hill."] =
        "Die Stahlbarren liegen im Lager der Grimmhauer unterhalb des Hügels.",
    ["Austil de Mon, the warrior trainer of Brill."] =
        "Austil de Mon, der Kriegerlehrer von Brill.",
    ["Deathguard Dillinger, in Brill."] =
        "Todeswache Dillinger, in Brill.",
    ["Open the mausoleum north of Brill: Ulag the Cleaver comes out."] =
        "Öffne das Mausoleum nördlich von Brill: Ulag der Spalter kommt heraus.",
    ["Coleman Farthing, in the inn of Brill."] =
        "Coleman Farthing, im Gasthaus von Brill.",
    ["The four heirlooms lie in the crypt of the Agamand Mills, in the northwest of Tirisfal Glades."] =
        "Die vier Erbstücke liegen in der Gruft von Agamands Mühlen, im Nordwesten von Tirisfal.",
    -- Ding! - Dungeon quests (hand-written guides)
    ["The Hall of Thanes"] =
        "Die Halle der Thane",
    ["Afadra Dunwall and Thom Filch, in the west of Ironforge."] =
        "Afadra Dunwall und Thom Filch, im Westen von Eisenschmiede.",
    ["Two quests of the hall: a leather belt or mail bracers, cloth gloves or an off-hand tome."] =
        "Zwei Quests der Halle: ein Ledergürtel oder Kettenarmschienen, Stoffhandschuhe oder ein Foliant für die Schildhand.",
    ["The Dark Iron spies of the east of Dun Morogh may drop a Dark Iron map: read it."] =
        "Die Spione der Dunkeleisenzwerge im Osten von Dun Morogh können eine Dark Iron Map fallen lassen: Lies sie.",
    ["The Dark Iron map opens Old Ironforge Incursion: a gun, a wand or a two-handed mace."] =
        "Die Dark Iron Map öffnet „Old Ironforge Incursion“: eine Schusswaffe, ein Zauberstab oder ein Zweihandstreitkolben.",
    ["Earthseer Farsen, in the east of Dun Morogh."] =
        "Earthseer Farsen, im Osten von Dun Morogh.",
    ["Enter the Hall of Thanes"] =
        "Betritt die Halle der Thane",
    ["The hall lies beneath Old Ironforge, in the west of the city."] =
        "Die Halle liegt unter Alt-Eisenschmiede, im Westen der Stadt.",
    ["Kill the enraged apparitions and the tormented souls of the hall, then put the spirit of Anvilmar to rest."] =
        "Töte die Enraged Apparitions und die Tormented Souls der Halle und bring dann den Geist von Ambossar zur Ruhe.",
    ["The dwarven heirlooms lie around the hall."] =
        "Die Dwarven Heirlooms liegen überall in der Halle verstreut.",
    ["The Treaty of Understanding lies in the hall: take it, then read it."] =
        "Der Treaty of Understanding liegt in der Halle: Nimm ihn und lies ihn dann.",
    ["Durgen Dirgehammer carries the head the quest asks for."] =
        "Durgen Dirgehammer trägt den Kopf, den die Quest verlangt.",
    ["Afadra Dunwall and Thom Filch, in Ironforge."] =
        "Afadra Dunwall und Thom Filch, in Eisenschmiede.",
    ["King Magni Bronzebeard, in the High Seat of Ironforge."] =
        "König Magni Bronzebeard, im Hohen Sitz von Eisenschmiede.",
    ["King Magni Bronzebeard."] =
        "König Magni Bronzebeard.",
    ["Wailing Caverns"] =
        "Höhlen des Wehklagens",
    ["Mebok Mizzyrix, in Ratchet."] =
        "Mebok Mizzyrix, in Ratschet.",
    ["Raptor Horns opens Smart Drinks, a quest of the caverns."] =
        "„Raptorhörner“ öffnet „Klugheitstränke“, eine Quest der Höhlen.",
    ["Crane Operator Bigglefuzz, on the docks of Ratchet."] =
        "Kranführer Bigglefuzz, an den Docks von Ratschet.",
    ["The sunscale raptors roam the plains between the Crossroads and Ratchet."] =
        "Die Bluthornraptoren streifen über die Ebenen zwischen dem Wegekreuz und Ratschet.",
    ["Nalpak and Ebru stand in a cave on the caverns' hill: climb the hill from the east, follow the trail and drop onto the rock ledge."] =
        "Nalpak und Ebru stehen in einer Höhle auf dem Hügel über den Höhlen: Steig von Osten auf den Hügel, folge dem Pfad und lass dich auf den Felsvorsprung hinunterfallen.",
    ["Two quests of the deviate creatures; their rewards include a bag, leather leggings, mail gauntlets or a wand."] =
        "Zwei Quests zu den Deviatkreaturen; ihre Belohnungen umfassen eine Tasche, Ledergamaschen, Kettenstulpen oder einen Zauberstab.",
    ["Mad Magglish, a goblin who stays hidden, walks the caves around the dungeon's door."] =
        "Zausel der Verrückte, ein Goblin, der sich versteckt hält, streift durch die Höhlen rund um den Eingang des Dungeons.",
    ["Enter Wailing Caverns"] =
        "Betritt die Höhlen des Wehklagens",
    ["The mouth of the caverns opens on the hill above the Lushwater Oasis."] =
        "Der Eingang der Höhlen öffnet sich am Hügel über der Blühenden Oase.",
    ["Every deviate creature drops hides: raptors, lashers and snakes, from the first halls on."] =
        "Jede Deviatkreatur lässt Bälge fallen: Raptoren, Peitscher und Schlangen, schon ab den ersten Hallen.",
    ["The ectoplasms, living oozes of the caverns, drop the essence."] =
        "Die Ektoplasmen, lebendige Schlammer der Höhlen, lassen die Essenz fallen.",
    ["Ravagers and vipers fill the first halls; shamblers and dreadfangs come further in."] =
        "Verheerer und Vipern füllen die ersten Hallen; Schlurfer und Schreckensfänge kommen weiter hinten.",
    ["Mutanus the Devourer may drop the Glowing Shard: he appears after the Disciple of Naralex's ritual, which starts once the four Fanglords are dead."] =
        "Mutanus der Verschlinger kann den Leuchtenden Splitter fallen lassen: Er erscheint nach dem Ritual des Jüngers von Naralex, das beginnt, sobald die vier Giftzahnlords tot sind.",
    ["Nalpak and Ebru, in their cave on the caverns' hill."] =
        "Nalpak und Ebru, in ihrer Höhle auf dem Hügel über den Höhlen.",
    ["Mebok Mizzyrix and Crane Operator Bigglefuzz, in Ratchet."] =
        "Mebok Mizzyrix und Kranführer Bigglefuzz, in Ratschet.",
    ["Sputtervalve, in Ratchet, knows what the shard is."] =
        "Sputtervalve, in Ratschet, weiß, was es mit dem Splitter auf sich hat.",
    ["Falla Sagewind, on top of the caverns' hill."] =
        "Falla Sagewind, oben auf dem Hügel über den Höhlen.",
    ["Mathrengyl Bearwalker, in the Cenarion Enclave of Darnassus."] =
        "Mathrengyl Bearwalker, in der Enklave des Cenarius in Darnassus.",
    ["The Deadmines"] =
        "Die Todesminen",
    ["Wilder Thistlenettle, in the Dwarven District of Stormwind."] =
        "Wilder Thistlenettle, im Zwergendistrikt von Sturmwind.",
    ["Two quests of the mine under Moonbrook; their rewards include a two-handed axe and cloth, leather or mail armor."] =
        "Zwei Quests der Mine unter Mondbruch; ihre Belohnungen umfassen eine Zweihandaxt sowie Rüstung aus Stoff, Leder oder Kette.",
    ["Shoni the Shilent, in the Dwarven District."] =
        "Shoni die Schtille, im Zwergendistrikt.",
    ["Reward: armor of leather or mail, or a wand."] =
        "Belohnung: Rüstung aus Leder oder Kette oder ein Zauberstab.",
    ["Gryan Stoutmantle, in the tower of Sentinel Hill, in Westfall."] =
        "Gryan Stoutmantle, im Turm der Späherkuppe, in Westfall.",
    ["A long chain of six quests between Westfall, Redridge and Stormwind: it leads to VanCleef, whose head brings mail leggings, a leather tunic or a staff."] =
        "Eine lange Questreihe aus sechs Quests zwischen Westfall, dem Rotkammgebirge und Sturmwind: Sie führt zu van Cleef, dessen Kopf Kettengamaschen, eine Ledertunika oder einen Stab einbringt.",
    ["Alba Fairmoon, south-west of Sentinel Hill."] =
        "Alba Fairmoon, südwestlich der Späherkuppe.",
    ["A quest of the mine under Moonbrook, ended at the Deadmines' exit."] =
        "Eine Quest der Mine unter Mondbruch, die am Ausgang der Todesminen abgegeben wird.",
    ["Wiley the Black, in the inn of Lakeshire, in Redridge."] =
        "Wiley der Schwarze, im Gasthaus von Seenhain, im Rotkammgebirge.",
    ["Gryan Stoutmantle, at Sentinel Hill."] =
        "Gryan Stoutmantle, auf der Späherkuppe.",
    ["Master Mathias Shaw, in the SI:7 house of Old Town, in Stormwind."] =
        "Meister Mathias Shaw, im Haus von SI:7 in der Altstadt, in Sturmwind.",
    ["The Defias Messenger walks the road to Moonbrook; he carries the message."] =
        "Der Bote der Defias läuft die Straße nach Mondbruch entlang; er trägt die Nachricht.",
    ["Follow the Defias Traitor to Moonbrook; Defias attack on the way."] =
        "Folge dem Verräter der Defias nach Mondbruch; unterwegs greifen Defias an.",
    ["Scout Riell, at the top of the Sentinel Hill tower."] =
        "Späherin Riell, oben im Turm der Späherkuppe.",
    ["Reward: a weapon of your choice."] =
        "Belohnung: eine Waffe deiner Wahl.",
    ["Go down into the mine under Moonbrook"] =
        "Steig in die Mine unter Mondbruch hinab",
    ["The mine opens inside a house in the middle of Moonbrook."] =
        "Der Eingang der Mine liegt in einem Haus mitten in Mondbruch.",
    ["Foreman Thistlenettle and the undead miners roam the mine's tunnels, before the dungeon's door."] =
        "Großknecht Thistlenettle und die untoten Minenarbeiter streifen durch die Tunnel der Mine, vor dem Eingang des Dungeons.",
    ["Plant the explosives by the forge hidden in the Deadmines."] =
        "Platziere den Sprengstoff an der versteckten Schmiede in den Todesminen.",
    ["Every Defias of the dungeon may drop a bandana."] =
        "Jeder Defias im Dungeon kann ein Kopftuch fallen lassen.",
    ["Sneed's Shredder, the second boss, in the goblins' lumber cave, drops the Gnoam Sprecklesprocket."] =
        "Sneeds Schredder, der zweite Boss, in der Sägewerkshöhle der Goblins, lässt den Gnoam-Sprecklesprocket fallen.",
    ["Edwin VanCleef, the last boss, waits on the deck of the Defias ship at the end of the cave."] =
        "Edwin van Cleef, der letzte Boss, wartet an Deck des Schiffs der Defias am Ende der Höhle.",
    ["VanCleef drops a letter: read it to take its quest."] =
        "Van Cleef lässt einen Brief fallen: Lies ihn, um seine Quest anzunehmen.",
    ["Alba Fairmoon waits at the Deadmines' exit, on the coast south-west of Moonbrook."] =
        "Alba Fairmoon wartet am Ausgang der Todesminen, an der Küste südwestlich von Mondbruch.",
    ["Use her detonator, then tell her."] =
        "Benutze ihren Zünder und gib ihr dann Bescheid.",
    ["Gryan Stoutmantle and Scout Riell, in the Sentinel Hill tower."] =
        "Gryan Stoutmantle und Späherin Riell, im Turm der Späherkuppe.",
    ["Baros Alexston, in the City Hall of the Cathedral Square."] =
        "Baros Alexston, im Rathaus am Kathedralenplatz.",
    ["Bazil Thredd leads to the Stockade's riots."] =
        "„Bazil Thredd“ führt zum Aufstand im Verlies.",
    ["Warden Thelwater, at the door of the Stockade, in Stormwind."] =
        "Aufseher Thelwater, am Tor des Verlieses, in Sturmwind.",
    ["Ruins of Lordaeron"] =
        "Ruinen von Lordaeron",
    ["Enter the Ruins of Lordaeron"] =
        "Betritt die Ruinen von Lordaeron",
    ["The ruins rise above Undercity, in Tirisfal Glades: Horde land, keep your guard up."] =
        "Die Ruinen erheben sich über Unterstadt, in Tirisfal: Gebiet der Horde, sei auf der Hut.",
    ["The undead of the ruins may drop a bloodied insignia: read it."] =
        "Die Untoten der Ruinen können ein Bloodied Insignia fallen lassen: Lies es.",
    ["Reward: leather leggings or mail armor."] =
        "Belohnung: Ledergamaschen oder eine Kettenrüstung.",
    ["Ten insignias, from the undead of the ruins."] =
        "Zehn Insignien, von den Untoten der Ruinen.",
    ["The Crest of Lordaeron lies in the ruins: take it, then read it."] =
        "Das Crest of Lordaeron liegt in den Ruinen: Nimm es und lies es dann.",
    ["Reward: a small sack of gems."] =
        "Belohnung: ein kleiner Sack mit Edelsteinen.",
    ["Edward Heartweaver's last letter lies in the ruins: read it."] =
        "Edward Heartweavers letzter Brief liegt in den Ruinen: Lies ihn.",
    ["General Marcus Jonathan, at the gate of Stormwind."] =
        "General Marcus Jonathan, am Tor von Sturmwind.",
    ["Lady Dena Kennedy, in Stormwind."] =
        "Lady Dena Kennedy, in Sturmwind.",
    ["Orphan Matron Nightingale, at the orphanage of Stormwind."] =
        "Waisenmatrone Nightingale, im Waisenhaus von Sturmwind.",
    ["Blackfathom Deeps"] =
        "Tiefschwarze Grotte",
    ["Argos Nightwhisper, in Stormwind."] =
        "Argos Nightwhisper, in Sturmwind.",
    ["Optional: a lead to Auberdine, worth about 1,450 XP once there."] =
        "Optional: ein Hinweis nach Auberdine, dort etwa 1.450 EP wert.",
    ["Gerrig Bonegrip, in the Forlorn Cavern of Ironforge."] =
        "Gerrig Bonegrip, im Düsteren Viertel von Eisenschmiede.",
    ["Reward: a ring."] =
        "Belohnung: ein Ring.",
    ["Gershala Nightwhisper, in Auberdine, in Darkshore."] =
        "Gershala Nightwhisper, in Auberdine, an der Dunkelküste.",
    ["Gershala Nightwhisper, in Auberdine."] =
        "Gershala Nightwhisper, in Auberdine.",
    ["Reward: cloth, leather or mail armor."] =
        "Belohnung: Rüstung aus Stoff, Leder oder Kette.",
    ["Argent Guard Manados and Dawnwatcher Shaedlass, in Darnassus."] =
        "Argentumwache Manados und Dämmerungsbehüter Shaedlass, in Darnassus.",
    ["Two quests of the Argent Dawn: the second leads to Twilight Lord Kelris and a wand, a shield or leather armor."] =
        "Zwei Quests der Argentumdämmerung: Die zweite führt zu Twilight-Lord Kelris und zu einem Zauberstab, einem Schild oder einer Lederrüstung.",
    ["Enter Blackfathom Deeps"] =
        "Betritt die Tiefschwarze Grotte",
    ["The deeps open in ruins half under water, on the coast of Ashenvale's Zoram Strand."] =
        "Die Grotte öffnet sich in halb versunkenen Ruinen, an der Küste des Zoramstrands im Eschental.",
    ["The Blackfathom and Fallenroot creatures carry the brain stems, from the cave before the dungeon's door on."] =
        "Die Kreaturen der Blackfathom und der Leidbringer tragen die Hirnstämme, schon ab der Höhle vor dem Eingang des Dungeons.",
    ["The manuscript lies in a chest under the water, by Ghamoo-ra, the first boss, in the Pool of Ask'ar."] =
        "Das Manuskript liegt in einer Truhe unter Wasser, bei Ghamoo-ra, dem ersten Boss, im Teich von Ask'ar.",
    ["Argent Guard Thaelrid waits in an underwater cave south-west of the Pool of Ask'ar."] =
        "Argentumwache Thaelrid wartet in einer Unterwasserhöhle südwestlich des Teichs von Ask'ar.",
    ["Every Twilight cultist of the deeps may drop a pendant."] =
        "Jeder Twilight-Kultist der Grotte kann einen Anhänger fallen lassen.",
    ["Twilight Lord Kelris, the fourth boss, holds the Moonshrine Sanctum."] =
        "Twilight-Lord Kelris, der vierte Boss, hält das Mondschreinsanktum.",
    ["Argent Guard Manados, in Darnassus."] =
        "Argentumwache Manados, in Darnassus.",
    ["Dawnwatcher Selgorm, beside him in Darnassus."] =
        "Dämmerungsbehüter Selgorm, neben ihm in Darnassus.",
    ["The Stockade"] =
        "Das Verlies",
    ["Motley Garmason, at Dun Modr, in the north of the Wetlands."] =
        "Motley Garmason, in Dun Modr, im Norden des Sumpflands.",
    ["Far north in the Wetlands: it opens The Fury Runs Deep, whose reward is a two-handed mace or a leather belt."] =
        "Weit im Norden des Sumpflands: Sie öffnet „Tief empfundener Zorn“, deren Belohnung ein Zweihandstreitkolben oder ein Ledergürtel ist.",
    ["The Dark Iron dwarves camp around Dun Modr."] =
        "Die Dunkeleisenzwerge lagern rund um Dun Modr.",
    ["Guard Berton, in Lakeshire, in Redridge."] =
        "Wache Berton, in Seenhain, im Rotkammgebirge.",
    ["Reward: a staff, a sword or a two-handed mace."] =
        "Belohnung: ein Stab, ein Schwert oder ein Zweihandstreitkolben.",
    ["Councilman Millstipe, in the town hall of Darkshire, in Duskwood."] =
        "Ratsherr Millstipe, im Rathaus von Dunkelhain, im Dämmerwald.",
    ["Nikova Raskol, in Old Town, in Stormwind."] =
        "Nikova Raskol, in der Altstadt, in Sturmwind.",
    ["Warden Thelwater, at the door of the Stockade."] =
        "Aufseher Thelwater, am Tor des Verlieses.",
    ["Warden Thelwater asks for Bazil Thredd's head."] =
        "Aufseher Thelwater verlangt den Kopf von Bazil Thredd.",
    ["Enter the Stockade"] =
        "Betritt das Verlies",
    ["The prison's door is by Warden Thelwater, in Stormwind."] =
        "Das Tor des Gefängnisses liegt bei Aufseher Thelwater, in Sturmwind.",
    ["Targorr the Dread, the first boss, sits in a cell near the start."] =
        "Targorr der Schreckliche, der erste Boss, sitzt in einer Zelle nahe dem Eingang.",
    ["Kam Deepfury: go north, then east; he waits in the second small cell on the left."] =
        "Kam Deepfury: Geh nach Norden, dann nach Osten; er wartet in der zweiten kleinen Zelle links.",
    ["Bazil Thredd waits at the end of the east corridor."] =
        "Bazil Thredd wartet am Ende des Ostgangs.",
    ["Dextren Ward waits at the end of the west corridor."] =
        "Dextren Ward wartet am Ende des Westgangs.",
    ["The prisoners, convicts and insurgents fill every cell; the Defias among them drop the bandanas."] =
        "Gefangene, Eingekerkerte und Aufrührer füllen jede Zelle; die Defias unter ihnen lassen die Kopftücher fallen.",
    ["Optional: nine more quests in Stormwind; the last brings a ring and about 3,750 XP."] =
        "Optional: neun weitere Quests in Sturmwind; die letzte bringt einen Ring und etwa 3.750 EP.",
    ["Baros Alexston, in the City Hall."] =
        "Baros Alexston, im Rathaus.",
    ["Master Mathias Shaw, in the SI:7 house of Old Town."] =
        "Meister Mathias Shaw, im Haus von SI:7 in der Altstadt.",
    ["Elling Trias, in the cheese shop of the Trade District."] =
        "Elling Trias, im Käseladen des Handelsdistrikts.",
    ["Tyrion, near Stormwind Keep."] =
        "Tyrion, nahe der Burg Sturmwind.",
    ["Three silk cloth, and two of Clara's fresh apples, from a basket north-west of Goldshire, in Elwynn Forest."] =
        "Drei Seidenstoff und zwei von Claras frischen Äpfeln, aus einem Korb nordwestlich von Goldhain, im Wald von Elwynn.",
    ["Wait in the garden by Stormwind Keep until Lord Gregor Lescovar and Marzon the Silent Blade have talked, then defeat both."] =
        "Warte im Garten bei der Burg Sturmwind, bis Lord Gregor Lescovar und Marzon die Stille Klinge ihr Gespräch beendet haben, und besiege dann beide.",
    ["Elling Trias, in the cheese shop."] =
        "Elling Trias, im Käseladen.",
    ["Master Mathias Shaw, in the SI:7 house."] =
        "Meister Mathias Shaw, im Haus von SI:7.",
    ["Lady Katrana Prestor, beside the king in Stormwind Keep."] =
        "Lady Katrana Prestor, neben dem König in der Burg Sturmwind.",
    ["Nikova Raskol, in Old Town."] =
        "Nikova Raskol, in der Altstadt.",
    ["Guard Berton, in Lakeshire."] =
        "Wache Berton, in Seenhain.",
    ["Councilman Millstipe, in Darkshire."] =
        "Ratsherr Millstipe, in Dunkelhain.",
    ["Motley Garmason, at Dun Modr."] =
        "Motley Garmason, in Dun Modr.",
    ["Excavation Site: Wetlands"] =
        "Ausgrabungsstätte: Sumpfland",
    ["James Halloran, the tanner of Menethil Harbor, in the Wetlands."] =
        "James Halloran, der Gerber des Hafens von Menethil, im Sumpfland.",
    ["Caitlin Grassman, in Menethil Harbor."] =
        "Caitlin Grassman, im Hafen von Menethil.",
    ["Optional: the guide does not know yet who ends this search; its follow-up brings a satchel of potions."] =
        "Optional: Der Guide weiß noch nicht, wer diese Suche abschließt; ihre Folgequest bringt einen Ranzen voller Tränke.",
    ["Rethiel the Greenwarden, in the middle of the Wetlands."] =
        "Rethiel der Sumpfhüter, mitten im Sumpfland.",
    ["Reward: an axe, and about 3,200 XP."] =
        "Belohnung: eine Axt und etwa 3.200 EP.",
    ["Dorin Songblade, the armorer of Lakeshire, in Redridge."] =
        "Dorin Songblade, der Rüstungsschmied von Seenhain, im Rotkammgebirge.",
    ["Optional: the guide does not know yet who ends this search."] =
        "Optional: Der Guide weiß noch nicht, wer diese Suche abschließt.",
    ["Enter the Excavation Site"] =
        "Betritt die Ausgrabungsstätte",
    ["The excavation site opens by the dig in the middle of the Wetlands."] =
        "Die Ausgrabungsstätte öffnet sich bei der Grabung mitten im Sumpfland.",
    ["Four thicket raptor hides, from the raptors of the site."] =
        "Vier Thicket Raptor Hides, von den Raptoren der Stätte.",
    ["A Highland Horror carries the root core."] =
        "Ein Highland Horror trägt den Wurzelkern.",
    ["Ardin Grassman, somewhere in the site."] =
        "Ardin Grassman, irgendwo in der Stätte.",
    ["Daewyn, somewhere in the site."] =
        "Daewyn, irgendwo in der Stätte.",
    ["The relic guardians may drop a Titan relic: read it."] =
        "Die Relic Guardians können ein Titan Relic fallen lassen: Lies es.",
    ["The Titan relic leads to Ironforge's explorers: a staff or a two-handed mace."] =
        "Das Titan Relic führt zu den Forschern von Eisenschmiede: ein Stab oder ein Zweihandstreitkolben.",
    ["Prospector Whelgar, at his excavation camp in the Wetlands."] =
        "Ausgrabungsleiter Whelgar, in seinem Ausgrabungslager im Sumpfland.",
    ["Rethiel the Greenwarden."] =
        "Rethiel der Sumpfhüter.",
    ["James Halloran, in Menethil Harbor."] =
        "James Halloran, im Hafen von Menethil.",
    ["Dorin Songblade, in Lakeshire."] =
        "Dorin Songblade, in Seenhain.",
    ["High Explorer Magellas, in the Hall of Explorers of Ironforge."] =
        "Hochforscher Magellas, in der Halle der Forscher von Eisenschmiede.",
    ["Gnomeregan"] =
        "Gnomeregan",
    ["Shoni the Shilent, in the Dwarven District of Stormwind."] =
        "Shoni die Schtille, im Zwergendistrikt von Sturmwind.",
    ["Reward: cloth or leather gloves, or an axe."] =
        "Belohnung: Handschuhe aus Stoff oder Leder oder eine Axt.",
    ["Brother Sarno, in the Cathedral of Light."] =
        "Bruder Sarno, in der Kathedrale des Lichts.",
    ["Optional: a lead to Tinkmaster Overspark in Ironforge."] =
        "Optional: ein Hinweis zu Tüftlermeister Overspark in Eisenschmiede.",
    ["Tinkmaster Overspark, in Tinker Town, in Ironforge."] =
        "Tüftlermeister Overspark, in der Tüftlerstadt, in Eisenschmiede.",
    ["Tinkmaster Overspark, in Tinker Town."] =
        "Tüftlermeister Overspark, in der Tüftlerstadt.",
    ["Master Mechanic Castpipe, Klockmort Spannerspan and High Tinker Mekkatorque, in Tinker Town."] =
        "Mechanikermeister Castpipe, Klockmort Spannerspan und Hochtüftler Mekkatorque, in der Tüftlerstadt.",
    ["Tinker Town's quests: Data Rescue brings a two-handed mace or a cloak, The Grand Betrayal cloth, leather or mail armor."] =
        "Die Quests der Tüftlerstadt: „Datenrettung“ bringt einen Zweihandstreitkolben oder einen Umhang, „Der große Verrat“ Rüstung aus Stoff, Leder oder Kette.",
    ["Gnoarn, in Tinker Town."] =
        "Gnoarn, in der Tüftlerstadt.",
    ["Ozzie Togglevolt, in Kharanos, in Dun Morogh."] =
        "Ozzie Togglevolt, in Kharanos, in Dun Morogh.",
    ["Use the empty phial on the irradiated troggs that roam the gates of Gnomeregan."] =
        "Benutze die leere Phiole an den bestrahlten Troggs, die vor den Toren von Gnomeregan umherstreifen.",
    ["Back to Ozzie Togglevolt, in Kharanos."] =
        "Zurück zu Ozzie Togglevolt, in Kharanos.",
    ["Enter Gnomeregan"] =
        "Betritt Gnomeregan",
    ["The gates of Gnomeregan stand in the west of Dun Morogh."] =
        "Die Tore von Gnomeregan stehen im Westen von Dun Morogh.",
    ["Techbot, the first boss, waits just inside: he drops the memory core."] =
        "Techbot, der erste Boss, wartet gleich hinter dem Eingang: Er lässt den Speicherkern fallen.",
    ["The tall, square machines of the city hold the artificials; every mechanical creature may drop the guts."] =
        "Die hohen, eckigen Maschinen der Stadt enthalten die Artifixe; jede mechanische Kreatur kann die Gedärme fallen lassen.",
    ["Use the heavy phial on a living irradiated slime, in the lower Hall of Gears; the fallout does not last long."] =
        "Benutze die schwere Phiole an einem lebenden bestrahlten Brühschleimer, in der unteren Halle der Zahnräder; der Niederschlag hält nicht lange an.",
    ["The addled leper gnomes drop the white card; the four Matrix Punchographs, from A to D, turn it yellow, blue, red, then prismatic: A on the way in, B at the bottom of the Dormitory, C on the Launch Bay's platform (Electrocutioner 6000's key opens it), D in the lower Engineering Labs."] =
        "Die verwirrten aussätzigen Gnome lassen die weiße Karte fallen; die vier Matrix Punchographs, von A bis D, färben sie gelb, blau, rot und dann prismatisch: A auf dem Weg hinein, B unten im Schlafsaal, C auf der Plattform der Startbucht (der Schlüssel von Elektrokutionator 6000 öffnet sie), D in den unteren Ingenieurslaboren.",
    ["Kernobee, a gnome held inside the city."] =
        "Kernobee, ein Gnom, der in der Stadt festgehalten wird.",
    ["Optional: an escort, turned in at Booty Bay, far away; it rewards bracers or shoulders."] =
        "Optional: eine Eskorte, die weit entfernt in Beutebucht abgegeben wird; sie belohnt mit Armschienen oder Schultern.",
    ["Lead Kernobee to the Clean Zone, by the dungeon's back door."] =
        "Führ Kernobee zur Sauberen Zone, beim Hintereingang des Dungeons.",
    ["The Dark Iron agents may drop a grimy ring: use it."] =
        "Die Agenten der Dunkeleisenzwerge können einen schmutzigen Ring fallen lassen: Benutze ihn.",
    ["Put it in the Sparklematic 5200, a cleaning machine of the city."] =
        "Leg ihn in den Funkelmat 5200, eine Reinigungsmaschine der Stadt.",
    ["Mekgineer Thermaplugg, the last boss, waits in the Tinkers' Court."] =
        "Robogenieur Thermaplugg, der letzte Boss, wartet im Hof der Tüftler.",
    ["Ozzie Togglevolt, in Kharanos."] =
        "Ozzie Togglevolt, in Kharanos.",
    ["Tinker Town, in Ironforge."] =
        "Tüftlerstadt, in Eisenschmiede.",
    ["Talvash del Kissel, in the Mystic Ward of Ironforge."] =
        "Talvash del Kissel, im Mystikerviertel von Eisenschmiede.",
    ["A gold ring, for a silver bar, a moss agate and 30 silver."] =
        "Ein Goldring, für einen Silberbarren, einen Moosachat und 30 Silber.",
    ["A silver bar and a moss agate: from mining, or the auction house."] =
        "Ein Silberbarren und ein Moosachat: aus dem Bergbau oder aus dem Auktionshaus.",
    ["Scooty, the goblin engineer of Booty Bay, in Stranglethorn Vale."] =
        "Scooty, der Goblin-Ingenieur von Beutebucht, im Schlingendorntal.",
    ["Razorfen Kraul"] =
        "Kral der Klingenhauer",
    ["Veyric Thunderhame, in the north-east of Arathi Highlands."] =
        "Veyric Thunderhame, im Nordosten des Arathihochlands.",
    ["Shamans: Charlga Razorflank carries the note this quest asks for."] =
        "Schamanen: Charlga Razorflank trägt die Notiz, die diese Quest verlangt.",
    ["Reward: a small container of gems."] =
        "Belohnung: ein kleiner Behälter mit Edelsteinen.",
    ["Take the crate with holes and the owner's manual beside Mebok, and read the manual."] =
        "Nimm die Kiste mit Löchern und die Besitzeranleitung neben Mebok und lies die Anleitung.",
    ["The journal lies by a body in the north-west of Thousand Needles, below the Great Lift: read it."] =
        "Das Tagebuch liegt bei einer Leiche im Nordwesten von Tausend Nadeln, unterhalb des Great Lift: Lies es.",
    ["Henrig Lonebrow's journal opens The Crone of the Kraul: cloth shoulders, mail belt or a shield."] =
        "Henrik Lonebrows Tagebuch öffnet „Die Greisin des Krals“: Stoffschultern, ein Kettengürtel oder ein Schild.",
    ["Falfindel Waywarder, at Thalanaar, on the eastern edge of Feralas."] =
        "Falfindel Waywarder, in Thalanaar, am Ostrand von Feralas.",
    ["Enter Razorfen Kraul"] =
        "Betritt den Kral der Klingenhauer",
    ["The kraul's thorny mound rises in the far south of the Barrens."] =
        "Der dornige Hügel des Krals erhebt sich im äußersten Süden des Brachlands.",
    ["Past Overlord Ramtusk, open the crate to call the gopher and use the stick on it: it digs up the tubers."] =
        "Hinter Oberanführer Rammhauer: Öffne die Kiste, um das Ziesel zu rufen, und benutze den Leitstecken an ihm: Es gräbt die Knollen aus.",
    ["Charlga Razorflank, the last boss, holds the top of the kraul."] =
        "Charlga Razorflank, der letzte Boss, hält die Spitze des Krals.",
    ["Heralath Fallowbrook lies in the tent on the left, below Charlga Razorflank's platform."] =
        "Heralath Fallowbrook liegt im Zelt links, unterhalb der Plattform von Charlga Razorflank.",
    ["Reward: boots of leather or mail, or a cloak."] =
        "Belohnung: Stiefel aus Leder oder Kette oder ein Umhang.",
    ["Willix the Importer waits beside Heralath's tent."] =
        "Willix der Importeur wartet neben Heralaths Zelt.",
    ["Reward: a ring of your choice."] =
        "Belohnung: ein Ring deiner Wahl.",
    ["Lead Willix back to the entrance; quilboar attack on the way."] =
        "Führ Willix zurück zum Eingang; unterwegs greifen Stacheleber an.",
    ["Every Razorfen quilboar may drop Treshala's pendant."] =
        "Jeder Stacheleber der Klingenhauer kann Treshalas Anhänger fallen lassen.",
    ["Falfindel Waywarder, at Thalanaar."] =
        "Falfindel Waywarder, in Thalanaar.",
    ["Treshala Fallowbrook, in Darnassus."] =
        "Treshala Fallowbrook, in Darnassus.",
    ["Veyric Thunderhame, in Arathi Highlands."] =
        "Veyric Thunderhame, im Arathihochland.",
    ["City of Dalaran"] =
        "Stadt Dalaran",
    ["Shylamiir, the herbalism trainer of Stormwind, and High Sorcerer Andromath, in the Mage Quarter."] =
        "Shylamiir, die Kräuterkundelehrerin von Sturmwind, und Zaubermeister Andromath, im Magierviertel.",
    ["Two quests of the city from Stormwind: the blossom brings a cloak or a mail belt."] =
        "Zwei Quests der Stadt aus Sturmwind: Die Blüte bringt einen Umhang oder einen Kettengürtel.",
    ["Emissary Jacques, in Hillsbrad Foothills."] =
        "Emissary Jacques, im Vorgebirge des Hügellands.",
    ["The Image of Archmage Modera, by the walls of Dalaran, at the eastern edge of Silverpine Forest."] =
        "Image of Archmage Modera, an den Mauern von Dalaran, am Ostrand des Silberwalds.",
    ["The Image of Archmage Modera."] =
        "Image of Archmage Modera.",
    ["Archmage Modera's quests: a pendant or an off-hand rod, and an introduction to the Kirin Tor."] =
        "Die Quests von Archmage Modera: ein Anhänger oder eine Rute für die Schildhand und eine Einführung beim Kirin Tor.",
    ["Enter the City of Dalaran"] =
        "Betritt die Stadt Dalaran",
    ["The city lies under its dome, in the west of the Alterac Mountains."] =
        "Die Stadt liegt unter ihrer Kuppel, im Westen des Alteracgebirges.",
    ["Eight seeking remnants, eight saturated remnants and eight mana echoes, inside the city."] =
        "Acht Seeking Remnants, acht Saturated Remnants und acht Mana Echoes, in der Stadt.",
    ["The arcane mote, inside the city."] =
        "Das Arcane Mote, in der Stadt.",
    ["A fel infused blossom, inside the city."] =
        "Eine Fel Infused Blossom, in der Stadt.",
    ["The mana elemental, inside the city."] =
        "Der Mana Elemental, in der Stadt.",
    ["Archmage Celindra, in the City of Dalaran."] =
        "Archmage Celindra, in der Stadt Dalaran.",
    ["The Image of Archmage Modera, by the walls of Dalaran."] =
        "Image of Archmage Modera, an den Mauern von Dalaran.",
    ["Shylamiir and High Sorcerer Andromath, in Stormwind."] =
        "Shylamiir und Zaubermeister Andromath, in Sturmwind.",
    ["Scarlet Monastery"] =
        "Scharlachrotes Kloster",
    ["Brother Crowley, in the Cathedral of Light of Stormwind."] =
        "Bruder Crowley, in der Kathedrale des Lichts in Sturmwind.",
    ["Optional: a lead to Brother Anton in Desolace."] =
        "Optional: ein Hinweis zu Bruder Anton in Desolace.",
    ["Librarian Mae Paledust, in the Hall of Explorers of Ironforge."] =
        "Bilbliothekarin Mae Paledust, in der Halle der Forscher von Eisenschmiede.",
    ["Reward: a necklace, and about 3,550 XP."] =
        "Belohnung: eine Halskette und etwa 3.550 EP.",
    ["Brother Anton, at Nijel's Point, in Desolace."] =
        "Bruder Anton, an der Nijelspitze, in Desolace.",
    ["Brother Anton, at Nijel's Point."] =
        "Bruder Anton, an der Nijelspitze.",
    ["Down the Scarlet Path, in Desolace then Southshore, opens In the Name of the Light: a weapon or an off-hand orb, and about 4,700 XP."] =
        "„Auf dem Scharlachroten Pfad“, erst in Desolace, dann in Süderstade, öffnet „Im Namen des Lichts“: eine Waffe oder eine Kugel für die Schildhand und etwa 4.700 EP.",
    ["The undead ravagers roam the south-east of Desolace."] =
        "Die untoten Verheerer streifen durch den Südosten von Desolace.",
    ["Raleigh the Devout, in the inn of Southshore, in Hillsbrad Foothills."] =
        "Raleigh der Andächtige, im Gasthaus von Süderstade, im Vorgebirge des Hügellands.",
    ["Magus Olvek, in the west of the Alterac Mountains."] =
        "Magus Olvek, im Westen des Alteracgebirges.",
    ["About 3,200 XP."] =
        "Etwa 3.200 EP.",
    ["Enter the Scarlet Monastery"] =
        "Betritt das Scharlachrote Kloster",
    ["The monastery stands in the far east of Tirisfal Glades; its four wings, Graveyard, Library, Armory and Cathedral, each have their own door."] =
        "Das Kloster steht im äußersten Osten von Tirisfal; seine vier Flügel, Friedhof, Bibliothek, Waffenkammer und Kathedrale, haben jeweils einen eigenen Eingang.",
    ["Magus Olvek's book lies somewhere in the monastery."] =
        "Das Buch von Magus Olvek liegt irgendwo im Kloster.",
    ["Library: the book lies on the floor under a window, on the left of the room after the Gallery of Treasures."] =
        "Bibliothek: Das Buch liegt auf dem Boden unter einem Fenster, links im Raum nach der Galerie der Schätze.",
    ["Houndmaster Loksey, the Library's first boss; Herod, the Armory's only boss; Scarlet Commander Mograine and High Inquisitor Whitemane, at the end of the Cathedral. Arcanist Doan's chest, at the end of the Library, holds the Scarlet Key that opens the Armory and the Cathedral."] =
        "Hundemeister Loksey, der erste Boss der Bibliothek; Herod, der einzige Boss der Waffenkammer; Scharlachroter Kommandant Mograine und Hochinquisitor Whitemane, am Ende der Kathedrale. Die Truhe von Arkanist Doan, am Ende der Bibliothek, enthält den scharlachroten Schlüssel, der die Waffenkammer und die Kathedrale öffnet.",
    ["Magus Olvek, in the Alterac Mountains."] =
        "Magus Olvek, im Alteracgebirge.",
    ["Raleigh the Devout, in Southshore."] =
        "Raleigh der Andächtige, in Süderstade.",
    ["Librarian Mae Paledust, in Ironforge."] =
        "Bilbliothekarin Mae Paledust, in Eisenschmiede.",
    ["Razorfen Downs"] =
        "Hügel der Klingenhauer",
    ["Archbishop Benedictus, in the Cathedral of Light of Stormwind."] =
        "Erzbischof Benedictus, in der Kathedrale des Lichts in Sturmwind.",
    ["Reward: a sword or a talisman, and about 4,300 XP."] =
        "Belohnung: ein Schwert oder ein Talisman und etwa 4.300 EP.",
    ["Myriam Moonsinger, outside Razorfen Downs, in the far south of the Barrens."] =
        "Myriam Moonsinger, vor den Hügeln der Klingenhauer, im äußersten Süden des Brachlands.",
    ["About 3,450 XP, without entering the downs."] =
        "Etwa 3.450 EP, ohne die Hügel zu betreten.",
    ["The Razorfen battleguards, thornweavers and Death's Head cultists guard the slopes before the downs."] =
        "Die Schlachtwachen und Dornenwirker von Razorfen und die Kultisten der Totenköpfe bewachen die Hänge vor den Hügeln.",
    ["Myriam Moonsinger."] =
        "Myriam Moonsinger.",
    ["Enter Razorfen Downs"] =
        "Betritt die Hügel der Klingenhauer",
    ["The downs' entrance is by Myriam Moonsinger, at the foot of the great thorn mound."] =
        "Der Eingang der Hügel liegt bei Myriam Moonsinger, am Fuß des großen Dornenhügels.",
    ["Belnistrasz waits in the Holding Pen, on the north side of the Murder Pens; taking his second quest starts his ritual at once."] =
        "Belnistrasz wartet im Haltepferch, auf der Nordseite der Mordpferche; sobald du seine zweite Quest annimmst, beginnt sein Ritual.",
    ["Belnistrasz's ritual: a ring, and about 4,250 XP."] =
        "Das Ritual von Belnistrasz: ein Ring und etwa 4.250 EP.",
    ["Defend Belnistrasz while he works: waves of quilboar and undead come. Then use his brazier, in the same room."] =
        "Verteidige Belnistrasz, während er arbeitet: Wellen von Stachelebern und Untoten kommen. Benutze dann seine Kohlenpfanne, im selben Raum.",
    ["Amnennar the Coldbringer, the last boss, waits at the top of the Spiral of Thorns."] =
        "Amnennar der Kältebringer, der letzte Boss, wartet oben auf der Dornenspirale.",
    ["Archbishop Benedictus, in Stormwind."] =
        "Erzbischof Benedictus, in Sturmwind.",
    ["Uldaman"] =
        "Uldaman",
    ["Prospector Stormpike, in the Hall of Explorers of Ironforge."] =
        "Ausgrabungsleiter Stormpike, in der Halle der Forscher von Eisenschmiede.",
    ["The Lost Dwarves leads to the Hidden Chamber: a two-handed axe or a lodestar, and about 3,900 XP."] =
        "„Die verschollenen Zwerge“ führt zu „Die geheime Kammer“: eine Zweihandaxt oder ein Leitstern und etwa 3.900 EP.",
    ["Krom Stoutarm, in the Hall of Explorers."] =
        "Krom Stoutarm, in der Halle der Forscher.",
    ["About 3,600 XP for a chest at Uldaman's gates."] =
        "Etwa 3.600 EP für eine Truhe an den Toren von Uldaman.",
    ["Prospector Ironband, at his excavation site in the south-east of Loch Modan."] =
        "Ausgrabungsleiter Ironband, an seiner Ausgrabungsstätte im Südosten von Loch Modan.",
    ["Find Agmond leads to Agmond's Fate: gloves of cloth, leather or mail."] =
        "„Sucht Agmond“ führt zu „Agmonds Schicksal“: Handschuhe aus Stoff, Leder oder Kette.",
    ["Ghak Healtouch, in Thelsamar."] =
        "Ghak Healtouch, in Thelsamar.",
    ["It opens Uldaman Reagent Run: restorative potions and about 3,450 XP."] =
        "Sie öffnet „Reagenzsuche in Uldaman“: Regenerationstränke und etwa 3.450 EP.",
    ["Rigglefuzz, in the middle of the Badlands."] =
        "Rigglefuzz, mitten im Ödland.",
    ["Reward: leather or mail bracers, cloth boots or a shield."] =
        "Belohnung: Armschienen aus Leder oder Kette, Stoffstiefel oder ein Schild.",
    ["Theldurin the Lost, in the south of the Badlands."] =
        "Theldurin der Verirrte, im Süden des Ödlands.",
    ["Reward: a cloth robe."] =
        "Belohnung: eine Stoffrobe.",
    ["A crumpled map lies on the ground in the north of the Badlands."] =
        "Eine zerknitterte Karte liegt im Norden des Ödlands auf dem Boden.",
    ["A long chain of nine quests between the Badlands and Ironforge: it ends inside Uldaman with the Lost Tablets of Will, a medal and about 5,850 XP."] =
        "Eine lange Questreihe aus neun Quests zwischen dem Ödland und Eisenschmiede: Sie endet in Uldaman mit „Die verlorene Tafel des Willens“, einer Medaille und etwa 5.850 EP.",
    ["Prospector Ryedol, a short walk south of the map."] =
        "Ausgrabungsleiter Ryedol, ein kurzes Stück südlich der Karte.",
    ["A battered dwarven skeleton lies in the middle of the Badlands."] =
        "Ein ramponiertes Zwergenskelett liegt mitten im Ödland.",
    ["Murdaloc and the Stonevault troggs camp just south of the skeleton."] =
        "Murdaloc und die Steingrufttroggs lagern gleich südlich des Skeletts.",
    ["The buzzards and crag coyotes of the Badlands drop the gizzards and fangs."] =
        "Die Bussarde und Klippenkojoten des Ödlands lassen die Muskelmägen und Fangzähne fallen.",
    ["Hammertoe Grez, by the gates of Uldaman, in the north of the Badlands."] =
        "Hammertoe Grez, an den Toren von Uldaman, im Norden des Ödlands.",
    ["Magregan Deepshadow, a Shadowforge dwarf by the gates, carries the amulet; the tablet lies in an ancient chest close by."] =
        "Magregan Grubenschatten, ein Zwerg der Schattenschmiede bei den Toren, trägt das Amulett; die Schrifttafel liegt in einer uralten Truhe ganz in der Nähe.",
    ["The Shadowforge dwarves around the gates drop the power stones."] =
        "Die Zwerge der Schattenschmiede rund um die Tore lassen die Kraftsteine fallen.",
    ["The Shadowforge dwarves may also drop a shattered necklace: use it."] =
        "Die Zwerge der Schattenschmiede können auch eine zerrissene Halskette fallen lassen: Benutze sie.",
    ["Hammertoe Grez."] =
        "Hammertoe Grez.",
    ["Prospector Ryedol."] =
        "Ausgrabungsleiter Ryedol.",
    ["Theldurin the Lost."] =
        "Theldurin der Verirrte.",
    ["Prospector Ironband, in Loch Modan."] =
        "Ausgrabungsleiter Ironband, in Loch Modan.",
    ["Historian Karnik, in the Hall of Explorers of Ironforge."] =
        "Historiker Karnik, in der Halle der Forscher von Eisenschmiede.",
    ["Advisor Belgrum, in the Hall of Explorers."] =
        "Berater Belgrum, in der Halle der Forscher.",
    ["Historian Karnik."] =
        "Historiker Karnik.",
    ["Talvash's chain ends inside Uldaman with a necklace and about 5,600 XP."] =
        "Talvashs Questreihe endet in Uldaman mit einer Halskette und etwa 5.600 EP.",
    ["Five silver bars: from mining, or the auction house."] =
        "Fünf Silberbarren: aus dem Bergbau oder aus dem Auktionshaus.",
    ["Ambassador Infernus walks with the Dark Iron dwarves south of Uldaman's gates."] =
        "Botschafter Infernus läuft mit den Dunkeleisenzwergen südlich der Tore von Uldaman umher.",
    ["Krom Stoutarm's chest stands in the dig south-west of Uldaman's gates."] =
        "Krom Stoutarms Truhe steht in der Grabung südwestlich der Tore von Uldaman.",
    ["Carved stone urns lie around the dig and inside Uldaman."] =
        "Verzierte Steinurnen liegen rund um die Grabung und in Uldaman.",
    ["Magenta cap clusters grow on the cave walls, south-west of the gates and inside."] =
        "Magenta Kappengruppen wachsen an den Höhlenwänden, südwestlich der Tore und drinnen.",
    ["Advisor Belgrum, in the Hall of Explorers of Ironforge."] =
        "Berater Belgrum, in der Halle der Forscher von Eisenschmiede.",
    ["Enter Uldaman"] =
        "Betritt Uldaman",
    ["The dungeon's door is at the back of the cave by Hammertoe Grez's dig."] =
        "Der Eingang des Dungeons liegt hinten in der Höhle bei der Grabung von Hammertoe Grez.",
    ["A dead paladin rests just off the first great hall, down its second right-hand passage."] =
        "Ein toter Paladin ruht gleich neben der ersten großen Halle, im zweiten Gang rechts.",
    ["Baelog, the first boss, in Dig Two: the left corridor, then the room to the south."] =
        "Baelog, der erste Boss, in Grabung Zwei: der linke Gang, dann der Raum im Süden.",
    ["The Tablet of Will stands against a wall of Dig Three."] =
        "Die Schrifttafel des Willens steht an einer Wand von Grabung Drei.",
    ["The Gni'kiv Medallion lies in Baelog's chest, Revelosh drops the Shaft of Tsol: join them into the Staff of Prehistoria, use it in the Map Chamber, then step into Ironaya's room."] =
        "Das Gni'kiv-Medaillon liegt in Baelogs Truhe, Revelosh lässt den Schaft von Tsol fallen: Füge beide zum Stab der Prähistorie zusammen, benutze ihn in der Kartenkammer und betritt dann Ironayas Raum.",
    ["The topaz is in a conspicuous urn south-east of Dig Two, the ruby in a stone chest north-west of Dig Three (it calls monsters), the sapphire on Grimlok at the end of the Stone Vault."] =
        "Der Topas ist in einer verdächtigen Urne südöstlich von Grabung Zwei, der Rubin in einer Steintruhe nordwestlich von Grabung Drei (sie ruft Monster herbei), der Saphir bei Grimlok am Ende des Steingewölbes.",
    ["Use Talvash's phial at his scrying bowl, in the dungeon."] =
        "Benutze Talvashs Phiole an seiner Wahrsageschale, im Dungeon.",
    ["Archaedas, the last boss, guards the Hall of the Crafters: he drops the power source."] =
        "Archaedas, der letzte Boss, bewacht die Halle der Handwerker: Er lässt die Kraftquelle fallen.",
    ["The Discs of Norgannon, in the room behind Archaedas."] =
        "Die Scheiben von Norgannon, im Raum hinter Archaedas.",
    ["Optional: the Discs of Norgannon, behind Archaedas, tell their story; it ends in Ironforge with potions or a bag."] =
        "Optional: Die Scheiben von Norgannon, hinter Archaedas, erzählen ihre Geschichte; sie endet in Eisenschmiede mit Tränken oder einer Tasche.",
    ["Prospector Stormpike and Krom Stoutarm, in the Hall of Explorers of Ironforge."] =
        "Ausgrabungsleiter Stormpike und Krom Stoutarm, in der Halle der Forscher von Eisenschmiede.",
    ["Talvash del Kissel, in the Mystic Ward."] =
        "Talvash del Kissel, im Mystikerviertel.",
    ["High Explorer Magellas, in the Hall of Explorers."] =
        "Hochforscher Magellas, in der Halle der Forscher.",
    ["Dinita Stonemantle, in Ironforge."] =
        "Dinita Stonemantle, in Eisenschmiede.",
    ["Zul'Farrak"] =
        "Zul'Farrak",
    ["Gryphon Master Talonaxe, at Aerie Peak, in the Hinterlands."] =
        "Greifenmeister Talonaxe, am Nistgipfel, im Hinterland.",
    ["Optional: a chain of seven quests between the Hinterlands, the Blasted Lands and the city; the last one, an elite fight to the top of Jintha'Alor, brings a mace or leather leggings."] =
        "Optional: eine Questreihe aus sieben Quests zwischen dem Hinterland, den Verwüsteten Landen und der Stadt; die letzte, ein Kampf gegen Elitegegner bis zur Spitze von Jintha'Alor, bringt einen Streitkolben oder Ledergamaschen.",
    ["The Witherbark cages stand in the troll camps of the south-west of the Hinterlands."] =
        "Die Käfige der Witherbark stehen in den Trolllagern im Südwesten des Hinterlands.",
    ["Search the Altar of Zul, in the middle of the trolls' ruins in the south of the Hinterlands."] =
        "Durchsuche den Altar von Zul, mitten in den Trollruinen im Süden des Hinterlands.",
    ["Thadius Grimshade, at the top of Nethergarde Keep, in the Blasted Lands."] =
        "Thadius Grimshade, ganz oben in der Burg Nethergarde, in den Verwüsteten Landen.",
    ["Your mage trainer, in a capital."] =
        "Dein Magielehrer, in einer Hauptstadt.",
    ["Tabetha, in her house in the middle of Dustwallow Marsh."] =
        "Tabetha, in ihrem Haus mitten in den Düstermarschen.",
    ["Reward: a staff or plate shoulders."] =
        "Belohnung: ein Stab oder Plattenschultern.",
    ["Wizzle Brassbolts, at the racetrack of the Shimmering Flats, in Thousand Needles."] =
        "Wizzle Brassbolts, an der Rennstrecke der Schimmernden Ebene, in Tausend Nadeln.",
    ["Reward: a carrot on a stick, which makes your mount faster."] =
        "Belohnung: eine Karotte am Stiel, die dein Reittier schneller macht.",
    ["Tran'rek, Trenton Lighthammer and Chief Engineer Bilgewhizzle, in Gadgetzan, in Tanaris."] =
        "Tran'rek, Trenton Lighthammer und Chefingenieur Bilgewhizzle, in Gadgetzan, in Tanaris.",
    ["Gadgetzan's quests: the Divino-matic Rod brings a ring or a leather helm; the other two, about 3,900 XP each."] =
        "Die Quests von Gadgetzan: „Wünschel-mato-Rute“ bringt einen Ring oder einen Lederhelm; die anderen beiden je etwa 3.900 EP.",
    ["Yeh'kinya, at Steamwheedle Port, on the east coast of Tanaris."] =
        "Yeh'kinya, am Dampfdruckpier, an der Ostküste von Tanaris.",
    ["It opens The Prophecy of Mosh'aru, about 5,250 XP."] =
        "Sie öffnet „Die Prophezeiung von Mosh'aru“, etwa 5.250 EP.",
    ["Kill the vale screechers of Feralas and use Yeh'kinya's bramble on their bodies."] =
        "Töte die Talkreischer in Feralas und benutze Yeh'kinyas Dornbusch an ihren Leichen.",
    ["Yeh'kinya, at Steamwheedle Port."] =
        "Yeh'kinya, am Dampfdruckpier.",
    ["Enter Zul'Farrak"] =
        "Betritt Zul'Farrak",
    ["The city's gate is in the north-west of Tanaris."] =
        "Das Tor der Stadt liegt im Nordwesten von Tanaris.",
    ["The scarabs drop the shells; most of them crowd Theka the Martyr's chamber."] =
        "Die Skarabäen lassen die Panzerschalen fallen; die meisten drängen sich in der Kammer von Theka dem Märtyrer.",
    ["Theka the Martyr, the second boss, in the scarabs' room to the north, holds the first tablet; Hydromancer Velratha, by the pool to the south-east, the second."] =
        "Theka der Märtyrer, der zweite Boss, im Skarabäenraum im Norden, hat die erste Schrifttafel; Wasserbeschwörerin Velratha, am Teich im Südosten, die zweite.",
    ["Hydromancer Velratha also wears the Tiara of the Deep."] =
        "Wasserbeschwörerin Velratha trägt auch die Tiara der Tiefen.",
    ["Gahz'rilla rises from the pool when its gong is struck with the Mallet of Zul'Farrak, made in the Hinterlands: one of the group needs it."] =
        "Gahz'rilla steigt aus dem Teich, wenn sein Gong mit dem Schlaghammer von Zul'Farrak geschlagen wird, der im Hinterland hergestellt wird: Einer aus der Gruppe braucht ihn.",
    ["Nekrum Gutchewer joins the fight at the top of the pyramid, when the prisoners are freed."] =
        "Nekrum der Ausweider greift oben auf der Pyramide in den Kampf ein, wenn die Gefangenen befreit sind.",
    ["Sergeant Bly, one of the prisoners at the top of the pyramid: free them, defend them, then he turns on you."] =
        "Sergeant Bly, einer der Gefangenen oben auf der Pyramide: Befreie sie, verteidige sie, dann wendet er sich gegen dich.",
    ["Every troll of the city may drop a troll temper; it can take more than one run."] =
        "Jeder Troll der Stadt kann einen Trollaushärter fallen lassen; es kann mehr als einen Durchlauf dauern.",
    ["Tran'rek, Trenton Lighthammer and Chief Engineer Bilgewhizzle, in Gadgetzan."] =
        "Tran'rek, Trenton Lighthammer und Chefingenieur Bilgewhizzle, in Gadgetzan.",
    ["Optional: an egg in the Hinterlands; it opens The God Hakkar, a quest of the Temple of Atal'Hakkar."] =
        "Optional: ein Ei im Hinterland; es öffnet „Der Gott Hakkar“, eine Quest im Tempel von Atal'Hakkar.",
    ["Wizzle Brassbolts, at the Shimmering Flats."] =
        "Wizzle Brassbolts, an der Schimmernden Ebene.",
    ["Tabetha, in Dustwallow Marsh."] =
        "Tabetha, in den Düstermarschen.",
    ["Thadius Grimshade, in Nethergarde Keep."] =
        "Thadius Grimshade, in der Burg Nethergarde.",
    ["Wait while Thadius Grimshade performs his divination."] =
        "Warte, während Thadius Grimshade seine Weissagung durchführt.",
    ["Gryphon Master Talonaxe, at Aerie Peak."] =
        "Greifenmeister Talonaxe, am Nistgipfel.",
    ["Vile Priestess Hexx, at the top of Jintha'Alor, carries the key to Sharpbeak's cage: elite trolls all the way up."] =
        "Üble Priesterin Hexx, oben auf Jintha'Alor, trägt den Schlüssel zu Scharfschnabels Käfig: Elitetrolle auf dem ganzen Weg nach oben.",
    ["The Ancient Egg lies at the top of Jintha'Alor too."] =
        "Das Uralte Ei liegt ebenfalls oben auf Jintha'Alor.",
    ["Gryphon Master Talonaxe."] =
        "Greifenmeister Talonaxe.",
    ["Maraudon"] =
        "Maraudon",
    ["Archmage Tervosh, in his tower in Theramore, in Dustwallow Marsh."] =
        "Erzmagier Tervosh, in seinem Turm in Theramore, in den Düstermarschen.",
    ["Reward: a pendant of your choice."] =
        "Belohnung: ein Anhänger deiner Wahl.",
    ["Talendria and Keeper Marandis, at Nijel's Point, in the north of Desolace."] =
        "Talendria und Bewahrer Marandis, an der Nijelspitze, im Norden von Desolace.",
    ["Nijel's Point's two quests: a ring, plate gauntlets or a leather belt; then Theradras's end brings a sword, a staff or a bow."] =
        "Die zwei Quests der Nijelspitze: ein Ring, Plattenstulpen oder ein Ledergürtel; dann bringt das Ende von Theradras ein Schwert, einen Stab oder einen Bogen.",
    ["Willow, in the middle of Desolace."] =
        "Willow, mitten in Desolace.",
    ["Reward: cloth, leather, mail or plate armor."] =
        "Belohnung: Rüstung aus Stoff, Leder, Kette oder Platte.",
    ["The Centaur Pariah, an outcast in the south of Desolace."] =
        "Der Zentaurenpariah, ein Ausgestoßener im Süden von Desolace.",
    ["About 5,450 XP."] =
        "Etwa 5.450 EP.",
    ["Cavindra, on the path to Maraudon, in the west of Desolace."] =
        "Cavindra, am Pfad nach Maraudon, im Westen von Desolace.",
    ["Legends of Maraudon leads to the Scepter of Celebras, a shortcut into the inner falls."] =
        "„Legenden von Maraudon“ führt zum Szepter von Celebras, einer Abkürzung zu den inneren Wasserfällen.",
    ["Enter Maraudon"] =
        "Betritt Maraudon",
    ["Maraudon's caves open in the west of Desolace; inside, an orange and a purple wing lead down to the inner falls."] =
        "Die Höhlen von Maraudon öffnen sich im Westen von Desolace; drinnen führen ein orangefarbener und ein violetter Flügel hinab zu den inneren Wasserfällen.",
    ["The Shadowshard elementals of the outer caves drop the fragments."] =
        "Die Schattenstein-Elementare der äußeren Höhlen lassen die Splitter fallen.",
    ["Fill the vial at the orange crystal pool, in the caves before the Orange wing; in the wing, use it on the stumps with red tops: the Noxxious scions come out."] =
        "Fülle die Phiole am orangefarbenen Kristallteich, in den Höhlen vor dem orangefarbenen Flügel; benutze sie im Flügel an den Stümpfen mit roten Spitzen: Die Noxxious-Sprosse kommen heraus.",
    ["Every creature of Maraudon may drop a crystal carving."] =
        "Jede Kreatur in Maraudon kann eine Kristallschnitzerei fallen lassen.",
    ["Use the Amulet of Spirits on the Spirit of Veng, who walks the Orange wing, then kill Veng; then on the Spirit of Maraudos in the Purple wing's grotto, then kill Maraudos. Join the two gems."] =
        "Benutze das Amulett der Geister am Geist von Veng, der durch den orangefarbenen Flügel streift, und töte dann Veng; danach am Geist von Maraudos in der Grotte des violetten Flügels, und töte dann Maraudos. Füge die beiden Edelsteine zusammen.",
    ["Noxxion, the Orange wing's first boss, drops the rod; Lord Vyletongue, in a small room north of his seat in the Purple wing, the diamond."] =
        "Noxxion, der erste Boss des orangefarbenen Flügels, lässt den Griff fallen; Lord Schlangenzunge, in einem kleinen Raum nördlich seines Sitzes im violetten Flügel, den Diamanten.",
    ["Kill Celebras the Cursed, on the island of the Poison Falls: Celebras the Redeemed appears."] =
        "Töte Celebras den Verfluchten, auf der Insel der Giftfälle: Celebras der Erlöste erscheint.",
    ["Follow Celebras to his stone and wait for his incantation."] =
        "Folge Celebras zu seinem Stein und warte auf seine Beschwörungsformel.",
    ["Celebras the Redeemed, by his stone."] =
        "Celebras der Erlöste, bei seinem Stein.",
    ["Princess Theradras, the last boss, waits at the end of Zaetar's Grave, south and down the waterfall."] =
        "Prinzessin Theradras, der letzte Boss, wartet am Ende von Zaetars Grab, im Süden den Wasserfall hinunter.",
    ["Zaetar's Spirit appears in the middle of Theradras's room."] =
        "Zaetars Geist erscheint mitten im Raum von Theradras.",
    ["About 6,100 XP; the seed goes to Moonglade."] =
        "Etwa 6.100 EP; das Samenkorn geht zur Mondlichtung.",
    ["The Centaur Pariah, in the south of Desolace."] =
        "Der Zentaurenpariah, im Süden von Desolace.",
    ["Talendria and Keeper Marandis, at Nijel's Point."] =
        "Talendria und Bewahrer Marandis, an der Nijelspitze.",
    ["Archmage Tervosh, in Theramore."] =
        "Erzmagier Tervosh, in Theramore.",
    ["Keeper Remulos, at the Shrine of Remulos, in Moonglade."] =
        "Bewahrer Remulos, am Schrein von Remulos, in der Mondlichtung.",
    ["The Temple of Atal'Hakkar"] =
        "Der Tempel von Atal'Hakkar",
    ["Brohann Caskbelly, in the Dwarven District of Stormwind."] =
        "Brohann Caskbelly, im Zwergendistrikt von Sturmwind.",
    ["Optional: a chain of eight quests from Stormwind to the Hinterlands, Tanaris and Feralas; it opens Into the Temple of Atal'Hakkar, a talisman and about 7,100 XP."] =
        "Optional: eine Questreihe aus acht Quests von Sturmwind ins Hinterland, nach Tanaris und nach Feralas; sie öffnet „Im Tempel von Atal'Hakkar“, einen Talisman und etwa 7.100 EP.",
    ["Find the temple: the ruins in the Pool of Tears, in the east of the Swamp of Sorrows."] =
        "Finde den Tempel: die Ruinen im Tränenteich, im Osten der Sümpfe des Elends.",
    ["Brohann Caskbelly, in Stormwind."] =
        "Brohann Caskbelly, in Sturmwind.",
    ["Falstad Wildhammer, at Aerie Peak, in the Hinterlands."] =
        "Falstad Wildhammer, am Nistgipfel, im Hinterland.",
    ["Rhapsody Shindigger, on the road east of Aerie Peak."] =
        "Rhapsody Shindigger, an der Straße östlich des Nistgipfels.",
    ["The Atal'ai Exile, in the south of the Hinterlands."] =
        "Der Verbannte der Atal'ai, im Süden des Hinterlands.",
    ["Reward: cloth leggings or a mail helm, and about 6,550 XP."] =
        "Belohnung: Stoffgamaschen oder ein Kettenhelm und etwa 6.550 EP.",
    ["Muigin, at Marshal's Refuge, in Un'Goro Crater."] =
        "Muigin, in Marschalls Zuflucht, im Krater von Un'Goro.",
    ["Muigin's chain leads to the temple's haze."] =
        "Muigins Questreihe führt zum Dunst des Tempels.",
    ["The bloodpetal plants of Un'Goro drop the petals."] =
        "Die Blutblütenpflanzen von Un'Goro lassen die Blütenblätter fallen.",
    ["Gregan Brewspewer, in the north of Feralas."] =
        "Gregan Brewspewer, im Norden von Feralas.",
    ["Angelas Moonbreeze, at Feathermoon Stronghold, in Feralas."] =
        "Angelas Moonbreeze, in der Mondfederfeste, in Feralas.",
    ["Marvon's chain opens two quests of the temple; one rewards a Hakkari urn."] =
        "Marvons Questreihe öffnet zwei Quests des Tempels; eine belohnt mit einer Urne der Hakkari.",
    ["Groddoc and ironfur livers in Feralas, roc gizzards in Tanaris."] =
        "Groddoc- und Eisenfelllebern in Feralas, Muskelmägen von Rocs in Tanaris.",
    ["Marvon Rivetseeker, in Tanaris, south of Gadgetzan."] =
        "Marvon Rivetseeker, in Tanaris, südlich von Gadgetzan.",
    ["Marvon's chest, in his old workshop in Ratchet, holds the stone circle."] =
        "Marvons Truhe, in seiner alten Werkstatt in Ratschet, enthält den Steinkreis.",
    ["Marvon Rivetseeker, in Tanaris."] =
        "Marvon Rivetseeker, in Tanaris.",
    ["Yeh'kinya, at Steamwheedle Port, in Tanaris."] =
        "Yeh'kinya, am Dampfdruckpier, in Tanaris.",
    ["The Ancient Egg lies at the top of Jintha'Alor, in the Hinterlands, among elite trolls."] =
        "Das Uralte Ei liegt oben auf Jintha'Alor, im Hinterland, zwischen Elitetrollen.",
    ["Reward: a plate helm, a cloth circlet or a dagger, and about 7,900 XP."] =
        "Belohnung: ein Plattenhelm, ein Stoffreif oder ein Dolch und etwa 7.900 EP.",
    ["Rhapsody Shindigger, in the Hinterlands."] =
        "Rhapsody Shindigger, im Hinterland.",
    ["The Atal'ai tablets lie in the ruins around the Pool of Tears, and inside the temple."] =
        "Die Schrifttafeln der Atal'ai liegen in den Ruinen rund um den Tränenteich und im Tempel.",
    ["Enter the Temple of Atal'Hakkar"] =
        "Betritt den Tempel von Atal'Hakkar",
    ["The temple lies sunken in the Pool of Tears, in the east of the Swamp of Sorrows: swim down to the ruins' stairs."] =
        "Der Tempel liegt versunken im Tränenteich, im Osten der Sümpfe des Elends: Tauch hinab zur Treppe der Ruinen.",
    ["The murk worms, deep lurkers and oozes of the temple drop the haze."] =
        "Die Düsterwürmer, Tiefenlauerer und Schlammer des Tempels lassen den Dunst fallen.",
    ["Hall of Serpents: use the six statues in this order: south, north, south-west, south-east, north-west, north-east; Atal'alarion appears. The Idol of Hakkar stands in the middle of the Pit of Refuse."] =
        "Halle der Schlangen: Benutze die sechs Statuen in dieser Reihenfolge: Süden, Norden, Südwesten, Südosten, Nordwesten, Nordosten; Atal'alarion erscheint. Der Götze von Hakkar steht mitten in der Abfallgrube.",
    ["Climb the stairs of the Pit of Refuse: the Altar of Hakkar waits up there."] =
        "Steig die Treppe der Abfallgrube hinauf: Oben wartet der Altar von Hakkar.",
    ["Kill the six troll elites on the balconies first: Jammal'an's barrier falls; he waits south-east of the Pit of Sacrifice."] =
        "Töte zuerst die sechs Elitetrolle auf den Balkonen: Die Barriere von Jammal'an fällt; er wartet südöstlich der Opfergrube.",
    ["The Shade of Eranikus, at the end of the south path, may drop his essence: use it."] =
        "Eranikus' Schemen, am Ende des Südpfads, kann seine Essenz fallen lassen: Benutze sie.",
    ["The Essence Font, in the north-east corner of his room."] =
        "Der Essenz-Born, in der Nordostecke seines Raums.",
    ["Use the Oathstone of Ysera's Dragonflight it gives you."] =
        "Benutze den Schwurstein von Yseras Drachenschwarm, den er dir gibt.",
    ["Keep the Chained Essence of Eranikus, the font's reward: Itharius asks for it."] =
        "Behalte die Angekettete Essenz des Eranikus, die Belohnung des Borns: Itharius verlangt sie.",
    ["Use the Egg of Hakkar by the skeleton in the Sanctum of the Fallen God, south-west: Hakkari bloodkeepers come, their blood puts out the four eternal flames, then the Avatar of Hakkar comes; his essence fills the egg."] =
        "Benutze das Ei von Hakkar beim Skelett im Sanktum des Gefallenen Gottes, im Südwesten: Blutbewahrer der Hakkari kommen, ihr Blut löscht die vier ewigen Flammen, dann kommt der Avatar von Hakkar; seine Essenz füllt das Ei.",
    ["Itharius, a green dragon in the south-west of the Swamp of Sorrows."] =
        "Itharius, ein grüner Drache im Südwesten der Sümpfe des Elends.",
    ["The Atal'ai Exile, in the Hinterlands."] =
        "Der Verbannte der Atal'ai, im Hinterland.",
    ["The beasts of Un'Goro drop the bloodpetal sprouts."] =
        "Die Wildtiere von Un'Goro lassen die Blutblütensprösslinge fallen.",
    ["Umbranse the Spiritspeaker, in the east of Winterspring."] =
        "Umbranse der Geistsprecher, im Osten von Winterquell.",
    ["Blackrock Depths"] =
        "Schwarzfelstiefen",
    ["Royal Historian Archesonus, in the Hall of Explorers of Ironforge."] =
        "Königliche Historikerin Archesonus, in der Halle der Forscher von Eisenschmiede.",
    ["The royal historian's chain leads to Kharan Mighthammer, then to the emperor and the princess: King Magni's reward and about 9,650 XP at its end."] =
        "Die Questreihe der königlichen Historikerin führt zu Kharan Mighthammer, dann zum Imperator und zur Prinzessin: König Magnis Belohnung und etwa 9.650 EP an ihrem Ende.",
    ["Listen to the royal historian."] =
        "Hör der königlichen Historikerin zu.",
    ["Ragnar Thunderbrew, in Kharanos, in Dun Morogh."] =
        "Ragnar Donnerbräu, in Kharanos, in Dun Morogh.",
    ["Reward: a two-handed axe or a mace, or dark dwarven lager."] =
        "Belohnung: eine Zweihandaxt oder ein Streitkolben oder dunkles zwergisches Lagerbier.",
    ["Kalaran Windblade, in the middle of the Searing Gorge."] =
        "Kalaran Windblade, mitten in der Sengenden Schlucht.",
    ["Optional: ten quests in the Searing Gorge before A Taste of Flame, which brings a cloth cape or sash or leather shoulders."] =
        "Optional: zehn Quests in der Sengenden Schlucht vor „Eine Kostprobe der Flamme“, die ein Stoffcape, eine Stoffschärpe oder Lederschultern bringt.",
    ["Listen to Kalaran Windblade's story."] =
        "Hör dir die Geschichte von Kalaran Windblade an.",
    ["The fire elementals of the Searing Gorge drop the hearts of flame; the golems, the oil."] =
        "Die Feuerelementare der Sengenden Schlucht lassen die Herzen der Flamme fallen; die Golems das Öl.",
    ["The Dark Iron dwarves of the gorge carry the thorium plated daggers."] =
        "Die Dunkeleisenzwerge der Schlucht tragen die thoriumbeschichteten Dolche.",
    ["The Twilight cultists of the gorge carry the symbols of Ragnaros."] =
        "Die Twilight-Kultisten der Schlucht tragen die Symbole von Ragnaros.",
    ["Listen to Kalaran Windblade."] =
        "Hör Kalaran Windblade zu.",
    ["Use the Torch of Retribution beside Kalaran."] =
        "Benutze die Fackel der Vergeltung neben Kalaran.",
    ["Squire Maltrake, beside Kalaran."] =
        "Knappe Maltrake, neben Kalaran.",
    ["Light the four sentry braziers on the Dark Iron watchtowers of the gorge."] =
        "Entzünde die vier Wachposten-Kohlenpfannen auf den Wachtürmen der Dunkeleisenzwerge in der Schlucht.",
    ["The Hoard of the Black Dragonflight, beside Squire Maltrake."] =
        "Der Hort des schwarzen Drachenschwarms, neben Knappe Maltrake.",
    ["The ghost of Franclorn Forgewright, inside Blackrock Mountain, by the way down to the depths."] =
        "Der Geist von Franclorn Forgewright, im Schwarzfels, am Weg hinab zu den Tiefen.",
    ["Franclorn's quest brings the Shadowforge Key, which opens doors of the depths."] =
        "Franclorns Quest bringt den Schlüssel zur Schattenschmiede, der Türen in den Tiefen öffnet.",
    ["Use the Thaurissan relic in the ruins of Thaurissan, in the middle of the Burning Steppes."] =
        "Benutze das Thauris-Relikt in den Ruinen von Thaurissan, mitten in der Brennenden Steppe.",
    ["Yuka Screwspigot and Maxwort Uberglint, at Flame Crest, in the north of the Burning Steppes."] =
        "Yuka Screwspigot und Maxwort Uberglint, am Flammenkamm, im Norden der Brennenden Steppe.",
    ["Flame Crest's two quests: Ribbly's head brings leather shoulders, cloth boots or mail armor."] =
        "Die zwei Quests des Flammenkamms: Ribblys Kopf bringt Lederschultern, Stoffstiefel oder eine Kettenrüstung.",
    ["Jalinda Sprig and Oralius, at Morgan's Vigil, in the east of the Burning Steppes."] =
        "Jalinda Sprig und Oralius, in Morgans Wacht, im Osten der Brennenden Steppe.",
    ["Morgan's Vigil's quests: Incendius! brings armor of any kind, The Good Stuff a fanny pack of loot."] =
        "Die Quests von Morgans Wacht: „Incendius!“ bringt Rüstung jeder Art, „Feine Sachen“ eine Gürteltasche voller Beute.",
    ["Cyrus Therepentous, in the far east of the Burning Steppes."] =
        "Cyrus Therepentous, im äußersten Osten der Brennenden Steppe.",
    ["A frenzied black drake of the steppes drops the molt; then talk to Cyrus."] =
        "Ein Rasender Schwarzdrache der Steppe lässt die abgestreifte Haut fallen; sprich dann mit Cyrus.",
    ["Helendis Riverhorn, at Morgan's Vigil."] =
        "Helendis Riverhorn, in Morgans Wacht.",
    ["Optional: eight quests between the steppes, Lakeshire and Stormwind before Marshal Windsor, whose Jail Break! brings a sword or a dagger among its rewards, and about 7,750 XP."] =
        "Optional: acht Quests zwischen der Steppe, Seenhain und Sturmwind vor Marshal Windsor, dessen „Gefängnisausbruch!“ unter anderem ein Schwert oder einen Dolch bringt, und etwa 7.750 EP.",
    ["The black dragonkin of the steppes' north."] =
        "Die schwarzen Drachkin im Norden der Steppe.",
    ["Magistrate Solomon, in the town hall of Lakeshire, in Redridge."] =
        "Magistrat Solomon, im Rathaus von Seenhain, im Rotkammgebirge.",
    ["Highlord Bolvar Fordragon, in Stormwind Keep."] =
        "Hochlord Bolvar Fordragon, in der Burg Sturmwind.",
    ["Talk to Lady Katrana Prestor, beside the king."] =
        "Sprich mit Lady Katrana Prestor, neben dem König.",
    ["Magistrate Solomon, in Lakeshire."] =
        "Magistrat Solomon, in Seenhain.",
    ["Marshal Maxwell, at Morgan's Vigil."] =
        "Marshal Maxwell, in Morgans Wacht.",
    ["Talk to Ragged John, at Flame Crest."] =
        "Sprich mit dem Struppigen John, am Flammenkamm.",
    ["Royal Historian Archesonus, in Ironforge."] =
        "Königliche Historikerin Archesonus, in Eisenschmiede.",
    ["Overmaster Pyron walks the bottom of Blackrock Mountain, before the depths' door."] =
        "Übermeister Pyron läuft unten im Schwarzfels umher, vor dem Eingang der Tiefen.",
    ["Enter Blackrock Depths"] =
        "Betritt die Schwarzfelstiefen",
    ["Blackrock Mountain opens in the west of the Burning Steppes; inside, the depths' door is at the bottom of the mountain."] =
        "Der Schwarzfels öffnet sich im Westen der Brennenden Steppe; drinnen liegt der Eingang der Tiefen ganz unten im Berg.",
    ["High Interrogator Gerstahn, in a back room on the right of the Detention Block, carries the cell key; Kharan Mighthammer sits in the second cell on the right of the tunnel."] =
        "Verhörmeisterin Gerstahn, in einem Hinterzimmer rechts im Gefängnistrakt, trägt den Zellenschlüssel; Kharan Mighthammer sitzt in der zweiten Zelle rechts im Tunnel.",
    ["Let Kharan tell his story."] =
        "Lass Kharan seine Geschichte erzählen.",
    ["Marshal Windsor, two cells further."] =
        "Marshal Windsor, zwei Zellen weiter.",
    ["The Anvilrage dwarves of the first rooms may drop a crumpled note: read it."] =
        "Die Zwerge der Zorneshämmer in den ersten Räumen können eine zusammengeknüllte Notiz fallen lassen: Lies sie.",
    ["Marshal Windsor, in his cell."] =
        "Marshal Windsor, in seiner Zelle.",
    ["Fineous Darkvire, in the lower Hall of Crafting, carries Ironfel; the Monument of Franclorn Forgewright stands at the dead end past the Shrine of Thaurissan."] =
        "Fineous Darkvire, in der unteren Halle der Handwerkskunst, trägt Ironfel; das Denkmal für Franclorn Forgewright steht in der Sackgasse hinter dem Schrein von Thaurissan.",
    ["The Monument of Franclorn Forgewright."] =
        "Das Denkmal für Franclorn Forgewright.",
    ["Bael'Gar waits at the end of the Dark Iron Highway: use Cyrus's molt on his body."] =
        "Bael'Gar wartet am Ende der Dunkeleisenschnellstraße: Benutze die Haut von Cyrus an seiner Leiche.",
    ["General Angerforge, down the stairs of the West Garrison, and Golem Lord Argelmach, in the Manufactory, carry Windsor's lost information."] =
        "General Zornesschmied, die Treppe der Westgarnison hinunter, und Golemlord Argelmach, in der Manufaktur, tragen Windsors verlorene Informationen.",
    ["Free Marshal Windsor and follow him through the Detention Block and the Halls of the Law."] =
        "Befreie Marshal Windsor und folge ihm durch den Gefängnistrakt und die Hallen des Gesetzes.",
    ["Mistress Nagmara, in the Grim Guzzler tavern."] =
        "Herrin Nagmara, in der Taverne zum Grimmigen Säufer.",
    ["Optional: Mistress Nagmara's love potion needs herbs, silver veins of giants and water of Un'Goro's hot springs; it brings cloth bracers or a leather belt."] =
        "Optional: Der Liebestrank von Herrin Nagmara braucht Kräuter, Silbervenen von Riesen und Wasser aus den heißen Quellen von Un'Goro; er bringt Stoffarmschienen oder einen Ledergürtel.",
    ["Ribbly Screwspigot sits at the bottom of the Grim Guzzler: talk to him, then fight him."] =
        "Ribbly Screwspigot sitzt unten im Grimmigen Säufer: Sprich mit ihm und kämpfe dann gegen ihn.",
    ["Break the three Thunderbrew lager kegs in a side room of the lower Grim Guzzler: Hurley Blackbreath comes."] =
        "Zerschlag die drei Fässchen mit Donnerbräu Lagerbier in einem Nebenraum des unteren Grimmigen Säufers: Hurley Pestatem kommt.",
    ["The relic coffer keys drop from the dwarves; the twelve coffers of the Black Vault call Watchman Doomgrip, who opens the Heart's vault."] =
        "Die Reliktkastenschlüssel lassen die Zwerge fallen; die zwölf Kästen des Schwarzen Gewölbes rufen Wachmann Stahlgriff herbei, der den Tresor des Herzens öffnet.",
    ["The Anvilrage dwarves drop the fanny packs."] =
        "Die Zwerge der Zorneshämmer lassen die Gürteltaschen fallen.",
    ["King Magni Bronzebeard, in Ironforge."] =
        "König Magni Bronzebeard, in Eisenschmiede.",
    ["Jalinda Sprig, at Morgan's Vigil."] =
        "Jalinda Sprig, in Morgans Wacht.",
    ["Gromsblood, from herbalism or the auction house; giant silver veins from the giants of Azshara; the vial filled at the Golakka Hot Springs of Un'Goro Crater."] =
        "Gromsblut, aus der Kräuterkunde oder aus dem Auktionshaus; Riesensilbervenen von den Riesen in Azshara; die Phiole, gefüllt an den Heißen Quellen von Golakka im Krater von Un'Goro.",
    ["Enter Blackrock Depths again"] =
        "Betritt die Schwarzfelstiefen erneut",
    ["Lord Incendius waits at the Black Anvil, in Shadowforge City."] =
        "Lord Incendius wartet am Schwarzen Amboss, in der Stadt Schattenschmiede.",
    ["Mistress Nagmara, in the Grim Guzzler."] =
        "Herrin Nagmara, im Grimmigen Säufer.",
    ["Emperor Dagran Thaurissan, the last boss, sits in the Imperial Seat: keep Princess Moira alive while you fight him."] =
        "Imperator Dagran Thaurissan, der letzte Boss, sitzt im Imperialen Sitz: Halte Prinzessin Moira am Leben, während du gegen ihn kämpfst.",
    ["Princess Moira Bronzebeard, in the Imperial Seat."] =
        "Prinzessin Moira Bronzebeard, im Imperialen Sitz.",
    ["Yuka Screwspigot and Maxwort Uberglint, at Flame Crest."] =
        "Yuka Screwspigot und Maxwort Uberglint, am Flammenkamm.",
    ["Cyrus Therepentous, in the far east of the steppes."] =
        "Cyrus Therepentous, im äußersten Osten der Steppe.",
    ["Jalinda Sprig and Oralius, at Morgan's Vigil."] =
        "Jalinda Sprig und Oralius, in Morgans Wacht.",
    ["Marshal Maxwell."] =
        "Marshal Maxwell.",
    ["Ragnar Thunderbrew, in Kharanos."] =
        "Ragnar Donnerbräu, in Kharanos.",
    ["Blackrock Spire"] =
        "Schwarzfelsspitze",
    ["Prospector Ironboot, at Steamwheedle Port, in Tanaris."] =
        "Ausgrabungsleiter Ironboot, am Dampfdruckpier, in Tanaris.",
    ["Yeh'kinya's chain from Zul'Farrak and the sunken temple goes on: two tablets in the Eastern Plaguelands, two inside the spire, then a cloak."] =
        "Yeh'kinyas Questreihe aus Zul'Farrak und dem versunkenen Tempel geht weiter: zwei Schrifttafeln in den Östlichen Pestländern, zwei in der Spitze, dann ein Umhang.",
    ["The third and fourth tablets lie in the troll ruins of the north of the Eastern Plaguelands."] =
        "Die dritte und die vierte Schrifttafel liegen in den Trollruinen im Norden der Östlichen Pestländer.",
    ["Prospector Ironboot, at Steamwheedle Port."] =
        "Ausgrabungsleiter Ironboot, am Dampfdruckpier.",
    ["Kibler, at Flame Crest, in the north of the Burning Steppes."] =
        "Kibler, am Flammenkamm, im Norden der Brennenden Steppe.",
    ["Kibler's two quests: a worg pup or a smolderweb spider, pets that follow you."] =
        "Die zwei Quests von Kibler: ein Worgwelpe oder eine Glimmernetzspinne, Haustiere, die dir folgen.",
    ["Ragged John, at Flame Crest."] =
        "Struppiger John, am Flammenkamm.",
    ["Reward: Ragged John's neverending cup, and about 9,950 XP."] =
        "Belohnung: der immervolle Becher des struppigen John und etwa 9.950 EP.",
    ["Helendis Riverhorn, at Morgan's Vigil, in the east of the Burning Steppes."] =
        "Helendis Riverhorn, in Morgans Wacht, im Osten der Brennenden Steppe.",
    ["Reward: a cloth robe, a leather jerkin or a mail breastplate."] =
        "Belohnung: eine Stoffrobe, ein Lederwams oder eine Kettenbrustplatte.",
    ["Enter Blackrock Spire"] =
        "Betritt die Schwarzfelsspitze",
    ["Blackrock Mountain opens in the west of the Burning Steppes; inside, the spire's door is at the top of the mountain."] =
        "Der Schwarzfels öffnet sich im Westen der Brennenden Steppe; drinnen liegt der Eingang der Spitze ganz oben im Berg.",
    ["Warosh, a troll who walks near the spire's entrance."] =
        "Warosh, ein Troll, der nahe dem Eingang der Spitze umherläuft.",
    ["Reward: a charm, after a fight with Urok Doomhowl."] =
        "Belohnung: ein Talisman, nach einem Kampf gegen Urok Schreckensbote.",
    ["Vaelan, a Scarshield infiltrator, stands up the ramp near the spire's entrance."] =
        "Vaelan, ein Spitzel der Schmetterschilde, steht oben an der Rampe nahe dem Eingang der Spitze.",
    ["Optional: the Seal of Ascension, the key to the Upper Spire, a raid of ten; its last part is in Dustwallow Marsh."] =
        "Optional: das Siegel des Aufstiegs, der Schlüssel zur Oberen Schwarzfelsspitze, einem Schlachtzug für zehn; sein letzter Teil findet in den Düstermarschen statt.",
    ["Bijou hides down in the trench after Hordemar City's second bridge."] =
        "Bijou versteckt sich unten im Graben hinter der zweiten Brücke der Stadt Hordemar.",
    ["Bijou's chain leads to Maxwell's Mission: armor of any kind, after a second visit."] =
        "Bijous Questreihe führt zu „Maxwells Mission“: Rüstung jeder Art, nach einem zweiten Besuch.",
    ["Her belongings lie in a chest on the bottom tier of Hordemar City; it can also stand as far as the Skitterweb Tunnels."] =
        "Ihre Habseligkeiten liegen in einer Truhe auf der untersten Ebene der Stadt Hordemar; die Truhe kann auch bis in die Listspinnertunnel hinein stehen.",
    ["Back to Bijou."] =
        "Zurück zu Bijou.",
    ["The fifth tablet hangs on a wall of Shadow Hunter Vosh'gajin's room, the sixth on a wall of War Master Voone's room."] =
        "Die fünfte Schrifttafel hängt an einer Wand im Raum von Schattenjägerin Vosh'gajin, die sechste an einer Wand im Raum von Kriegsmeister Voone.",
    ["Take the Roughshod Pike from a weapon rack on the left wall after Hordemar City's second bridge, join it to Highlord Omokk's head, and use it on the skull pile up the ramp past Mother Smolderweb: ogres come, then Urok Doomhowl."] =
        "Nimm die Beschlagene Pike aus einem Waffenständer an der linken Wand hinter der zweiten Brücke der Stadt Hordemar, verbinde sie mit dem Kopf von Hochlord Omokk und benutze sie am Schädelhaufen oben an der Rampe hinter Mutter Glimmernetz: Oger kommen, dann Urok Schreckensbote.",
    ["The spire spider eggs lie in the upper Skitterweb Tunnels."] =
        "Die Spitzenspinneneier liegen in den oberen Listspinnertunneln.",
    ["Use the empty cage on a Bloodaxe worg pup, in Halycon's room."] =
        "Benutze den leeren Käfig an einem Worgwelpen der Blutäxte, im Raum von Halycon.",
    ["Halycon, the worgs' mother, holds Halycon's Lair."] =
        "Halycon, die Mutter der Worgs, hält Halycons Hort.",
    ["The Scarshield dwarves drop the unadorned seal; Highlord Omokk, north of Mok'Doom, may drop the Spirestone gem, War Master Voone, at the bottom of Tazz'Alaor, the Smolderthorn gem, and Overlord Wyrmthalak, the last boss, the Bloodaxe gem."] =
        "Die Zwerge der Schmetterschilde lassen das unverzierte Siegel fallen; Hochlord Omokk, nördlich von Mok'Doom, kann den Edelstein der Felsspitzoger fallen lassen, Kriegsmeister Voone, unten in Tazz'Alaor, den Edelstein der Gluthauer, und Oberanführer Wyrmthalak, der letzte Boss, den Edelstein der Blutäxte.",
    ["Vaelan, near the entrance."] =
        "Vaelan, nahe dem Eingang.",
    ["Warosh, near the entrance."] =
        "Warosh, nahe dem Eingang.",
    ["Let Mother Smolderweb poison you and do not cure it: the poison must last until Ragged John, at Flame Crest."] =
        "Lass dich von Mutter Glimmernetz vergiften und heile das Gift nicht: Es muss anhalten, bis du beim Struppigen John am Flammenkamm bist.",
    ["Enter Blackrock Spire again"] =
        "Betritt die Schwarzfelsspitze erneut",
    ["Highlord Omokk, north of Mok'Doom; War Master Voone, at the bottom of Tazz'Alaor; Overlord Wyrmthalak, the last boss, in the Chamber of Battle."] =
        "Hochlord Omokk, nördlich von Mok'Doom; Kriegsmeister Voone, unten in Tazz'Alaor; Oberanführer Wyrmthalak, der letzte Boss, in der Kammer der Schlacht.",
    ["Kibler and Ragged John, at Flame Crest."] =
        "Kibler und der Struppige John, am Flammenkamm.",
    ["Helendis Riverhorn and Marshal Maxwell, at Morgan's Vigil."] =
        "Helendis Riverhorn und Marshal Maxwell, in Morgans Wacht.",
    ["Beat Emberstrife, a dragon of the Wyrmbog in Dustwallow Marsh, until his will breaks, then place the seal before him."] =
        "Bezwinge Aschenschwinge, einen Drachen im Drachensumpf der Düstermarschen, bis sein Wille bricht, und leg dann das Siegel vor ihn.",
    ["Vaelan, near the spire's entrance."] =
        "Vaelan, nahe dem Eingang der Spitze.",
    ["Yeh'kinya, beside him."] =
        "Yeh'kinya, neben ihm.",
    ["Dire Maul"] =
        "Düsterbruch",
    ["A herald of your capital: Crier Goodman in Stormwind, Courier Hammerfall in Ironforge, Herald Moonstalker in Darnassus."] =
        "Ein Herold deiner Hauptstadt: Ausrufer Goodman in Sturmwind, Kurier Hammerfall in Eisenschmiede, Herold Moonstalker in Darnassus.",
    ["Optional: a lead to Feathermoon Stronghold, about 1,500 XP."] =
        "Optional: ein Hinweis zur Mondfederfeste, etwa 1.500 EP.",
    ["Latronicus Moonspear, at Feathermoon Stronghold, in Feralas."] =
        "Latronicus Moonspear, in der Mondfederfeste, in Feralas.",
    ["Latronicus Moonspear and Scholar Runethorn, at Feathermoon Stronghold."] =
        "Latronicus Moonspear und Gelehrter Runethorn, in der Mondfederfeste.",
    ["Lethtendris's Web brings a dagger; Elven Legends, about 8,300 XP for a search in the library."] =
        "„Lethtendris' Netz“ bringt einen Dolch; „Elfische Legenden“ etwa 8.300 EP für eine Suche in der Bibliothek.",
    ["Azj'Tordin, at Lariss Pavilion, in the east of Feralas."] =
        "Azj'Tordin, am Larisspavillon, im Osten von Feralas.",
    ["Reward: a two-handed sword or leather boots; Pusillin also drops the Crescent Key, which opens the west and north wings."] =
        "Belohnung: ein Zweihandschwert oder Lederstiefel; Pusillin lässt auch den Mondsichelschlüssel fallen, der den West- und den Nordflügel öffnet.",
    ["Rabine Saturna, in Nighthaven, in Moonglade."] =
        "Rabine Saturna, in Nachthafen, in der Mondlichtung.",
    ["Optional: a reliquary in Silithus for Rabine Saturna in Moonglade, then a shard of the Felvine: a shield or an off-hand lexicon."] =
        "Optional: ein Reliquiar in Silithus für Rabine Saturna in der Mondlichtung, dann ein Splitter der Teufelsranke: ein Schild oder ein Lexikon für die Schildhand.",
    ["The Reliquary of Purity lies in the ruins of Southwind Village, in Silithus."] =
        "Das Reliquiar der Reinheit liegt in den Ruinen des Südwindpostens, in Silithus.",
    ["Rabine Saturna, in Nighthaven."] =
        "Rabine Saturna, in Nachthafen.",
    ["Enter Dire Maul"] =
        "Betritt Düsterbruch",
    ["The ruins of Dire Maul stand in the middle of Feralas; the east, west and north wings each have their own door."] =
        "Die Ruinen von Düsterbruch stehen mitten in Feralas; der Ost-, der West- und der Nordflügel haben jeweils einen eigenen Eingang.",
    ["East: talk to Pusillin each time he stops; he runs five times, then fights on a small platform up a ramp and drops the book."] =
        "Ost: Sprich jedes Mal mit Pusillin, wenn er stehen bleibt; er läuft fünfmal davon, kämpft dann auf einer kleinen Plattform oben an einer Rampe und lässt das Buch fallen.",
    ["East: Lethtendris waits on the upper level of the room left of the ramps between the Hidden Reach and the Warpwood Quarter."] =
        "Ost: Lethtendris wartet auf der oberen Ebene des Raums links der Rampen zwischen dem Verborgenen Winkel und dem Wucherborkenviertel.",
    ["East: kill Zevrim Thornhoof, then Ironbark the Redeemed, in the Conservatory, opens the door to Alzzin the Wildshaper; after Alzzin, use the reliquary by the twisted vine."] =
        "Ost: Töte Zevrim Dornhuf, dann öffnet Eisenborke der Erlöste, im Konservatorium, die Tür zu Alzzin dem Wildformer; benutze nach Alzzin das Reliquiar bei der verdrehten Ranke.",
    ["West: the Shen'dralar Ancient stands above the platform over Tendris Warpwood."] =
        "West: Die Uralte Shen'dralar steht über der Plattform oberhalb von Tendris Wucherborke.",
    ["About 9,950 XP; its treasure, a chest in the library, brings a two-handed mace, a mail helm or leather boots."] =
        "Etwa 9.950 EP; ihr Schatz, eine Truhe in der Bibliothek, bringt einen Zweihandstreitkolben, einen Kettenhelm oder Lederstiefel.",
    ["West: destroy the five pylons of the Capital Gardens, the Court of the Highborne and the Prison; Immol'thar waits in the Prison, behind Tendris (the Crescent Key opens it); Prince Tortheldrin, under the entry platform of the Athenaeum."] =
        "West: Zerstöre die fünf Pylonen in den Hauptstadtgärten, im Hof der Hochgeborenen und im Gefängnis; Immol'thar wartet im Gefängnis, hinter Tendris (der Mondsichelschlüssel öffnet es); Prinz Tortheldrin, unter der Eingangsplattform des Athenaeums.",
    ["West: the treasure is a big stone chest under the ramp of the Athenaeum."] =
        "West: Der Schatz ist eine große Steintruhe unter der Rampe des Athenaeums.",
    ["West: through the Conservatory Door (the Crescent Key opens it), the remains lie by a dead elf and a bookcase, in the north of the Athenaeum."] =
        "West: Hinter der Tür zum Konservatorium (der Mondsichelschlüssel öffnet sie) liegen die Überreste bei einem toten Elfen und einem Bücherregal, im Norden des Athenaeums.",
    ["North: Knot Thimblejack is chained in the north-east corner of the Halls of Destruction."] =
        "Nord: Knot Thimblejack liegt in der Nordostecke der Hallen der Zerstörung in Ketten.",
    ["About 6,600 XP for a key the Gordok guards carry."] =
        "Etwa 6.600 EP für einen Schlüssel, den die Wachen der Gordok tragen.",
    ["Optional: the Gordok Ogre Suit needs runecloth, rugged leather and rune threads."] =
        "Optional: Der Ogeranzug der Gordok braucht Runenstoff, unverwüstliches Leder und Runenfaden.",
    ["North: the Gordok guards Mol'dar, Slip'kik and Fengus, and Captain Kromcrush, carry the shackle key."] =
        "Nord: Die Wachen der Gordok Mol'dar, Slip'kik und Fengus sowie Captain Kromcrush tragen den Fesselschlüssel.",
    ["Knot Thimblejack."] =
        "Knot Thimblejack.",
    ["North: the ogre tannin lies up the ramp above Knot, in the north-west corner: one per group."] =
        "Nord: Das Ogergerbemittel liegt oben an der Rampe über Knot, in der Nordwestecke: eines pro Gruppe.",
    ["North: Captain Kromcrush, once King Gordok is dead."] =
        "Nord: Captain Kromcrush, sobald König Gordok tot ist.",
    ["Optional, after a tribute run (King Gordok dead, his guards alive): gloves of any kind."] =
        "Optional, nach einem Tributlauf (König Gordok tot, seine Wachen am Leben): Handschuhe jeder Art.",
    ["The Gauntlet of Gordok Might lies in the Prince's chest, in the Athenaeum of the west wing."] =
        "Die Stulpen der Gordokmacht liegen in der Truhe des Prinzen, im Athenaeum des Westflügels.",
    ["North: Stomper Kreeg, after a tribute run."] =
        "Nord: Stampfer Kreeg, nach einem Tributlauf.",
    ["Azj'Tordin, at Lariss Pavilion."] =
        "Azj'Tordin, am Larisspavillon.",
    ["Latronicus Moonspear, at Feathermoon Stronghold."] =
        "Latronicus Moonspear, in der Mondfederfeste.",
    ["Scholar Runethorn, at Feathermoon Stronghold."] =
        "Gelehrter Runethorn, in der Mondfederfeste.",
    ["Scholomance"] =
        "Scholomance",
    ["Commander Ashlam Valorfist, at Chillwind Camp, in the Western Plaguelands."] =
        "Kommandant Ashlam Valorfist, im Lager Kühlwind, in den Westlichen Pestländern.",
    ["Optional: the chain of the Skeleton Key, which opens Scholomance's door: one key per group is enough. It goes through the Plaguelands, Gadgetzan and Un'Goro."] =
        "Optional: die Questreihe des Skelettschlüssels, der die Tür von Scholomance öffnet: Ein Schlüssel pro Gruppe reicht. Sie führt durch die Pestländer, Gadgetzan und Un'Goro.",
    ["The skeletal flayers and slavering ghouls of Sorrow Hill, in the south of the Western Plaguelands."] =
        "Die Skelettschinder und sabbernden Ghule am Trauerhügel, im Süden der Westlichen Pestländer.",
    ["Mark the four watchtowers of Andorhal with the beacon torch, standing in each doorway."] =
        "Markiere die vier Wachtürme von Andorhal mit der Signalfackel, indem du dich in jeden Eingang stellst.",
    ["Alchemist Arbington, at Chillwind Camp."] =
        "Alchimist Arbington, im Lager Kühlwind.",
    ["The undead of the Western Plaguelands drop the skeletal fragments."] =
        "Die Untoten der Westlichen Pestländer lassen die Skelettfragmente fallen.",
    ["Krinkle Goodsteel, in Gadgetzan, in Tanaris: bring 15 gold."] =
        "Krinkle Goodsteel, in Gadgetzan, in Tanaris: Bring 15 Gold mit.",
    ["Bring two thorium bars to the top of Fire Plume Ridge, in Un'Goro Crater, and use the mold by the lava lake."] =
        "Bring zwei Thoriumbarren auf den Gipfel des Feuersäulengrats, im Krater von Un'Goro, und benutze die Form am Lavasee.",
    ["Araj the Summoner stands in the middle of Andorhal."] =
        "Araj der Beschwörer steht mitten in Andorhal.",
    ["Betina Bigglezink, at Light's Hope Chapel, in the Eastern Plaguelands."] =
        "Betina Bigglezink, an der Kapelle des Hoffnungsvollen Lichts, in den Östlichen Pestländern.",
    ["About 6,200 XP; a hatchling may drop a scale that starts another quest."] =
        "Etwa 6.200 EP; ein Jungtier kann eine Schuppe fallen lassen, die eine weitere Quest startet.",
    ["Weldon Barov, at Chillwind Camp."] =
        "Weldon Barov, im Lager Kühlwind.",
    ["The Barov fortune: four deeds inside the school; its follow-up sends you to kill Alexi Barov in the Horde's Bulwark."] =
        "Das Vermögen der Barovs: vier Besitzurkunden in der Schule; die Folgequest schickt dich, Alexi Barov im Bollwerk der Horde zu töten.",
    ["Eva Sarkhoff, in Caer Darrow, on the island of Darrowmere Lake."] =
        "Eva Sarkhoff, in Caer Darrow, auf der Insel im Darromersee.",
    ["Eva Sarkhoff's chain: three parts inside the school, then Kirtonos the Herald and a sword or an off-hand item among its rewards."] =
        "Die Questreihe von Eva Sarkhoff: drei Teile in der Schule, dann Kirtonos der Herold und unter ihren Belohnungen ein Schwert oder ein Gegenstand für die Schildhand.",
    ["Enter Scholomance"] =
        "Betritt Scholomance",
    ["The school stands on the island of Caer Darrow, in Darrowmere Lake, in the south-east of the Western Plaguelands."] =
        "Die Schule steht auf der Insel Caer Darrow, im Darromersee, im Südosten der Westlichen Pestländer.",
    ["The deeds: Southshore's on a table north-east of the Reliquary; Tarren Mill's on a table on the left at the entry of the Great Ossuary; Brill's on a ledge south-west of the Laboratory; Caer Darrow's on a table east of the Barov Family Vault."] =
        "Die Besitzurkunden: die für Süderstade auf einem Tisch nordöstlich des Reliquiars; die für Tarrens Mühle auf einem Tisch links am Eingang des Großen Ossuariums; die für Brill auf einem Sims südwestlich des Labors; die für Caer Darrow auf einem Tisch östlich der Familiengruft der Barovs.",
    ["The plagued hatchlings fill a room of the Great Ossuary."] =
        "Die verseuchten Jungtiere füllen einen Raum des Großen Ossuariums.",
    ["A hatchling may drop a healthy dragon scale: use it."] =
        "Ein Jungtier kann eine gesunde Großdrachenschuppe fallen lassen: Benutze sie.",
    ["Doctor Theolen Krastinov, in the east of the upper Headmaster's Study: kill him, then burn the two piles of remains, to the north and the south-east of his room."] =
        "Doktor Theolen Krastinov, im Osten des oberen Arbeitszimmers des Direktors: Töte ihn und verbrenne dann die beiden Haufen Überreste, im Norden und im Südosten seines Raums.",
    ["Eva Sarkhoff, in Caer Darrow."] =
        "Eva Sarkhoff, in Caer Darrow.",
    ["Enter Scholomance again"] =
        "Betritt Scholomance erneut",
    ["Jandice Barov waits in the north-east of the room down the stairs, on the right of the second big room."] =
        "Jandice Barov wartet im Nordosten des Raums unten an der Treppe, rechts vom zweiten großen Raum.",
    ["Rattlegore, at the bottom of the Great Ossuary, drops the Viewing Room key; put the Blood of Innocents in the brazier on the balcony on the right of the Chamber of Summoning: Kirtonos the Herald comes."] =
        "Blutrippe, unten im Großen Ossuarium, lässt den Schlüssel zum Vorführraum fallen; leg das Blut Unschuldiger in die Kohlenpfanne auf dem Balkon rechts in der Beschwörungskammer: Kirtonos der Herold kommt.",
    ["Betina Bigglezink, at Light's Hope Chapel."] =
        "Betina Bigglezink, an der Kapelle des Hoffnungsvollen Lichts.",
    ["Optional: an assassination in the other side's camp, among its guards; it brings the Barov Peasant Caller."] =
        "Optional: ein Attentat im Lager der anderen Fraktion, zwischen ihren Wachen; es bringt den Barov-Arbeiterrufer.",
    ["Alexi Barov stands among the guards of the Bulwark, the Horde's camp in the north of the Western Plaguelands."] =
        "Alexi Barov steht zwischen den Wachen des Bollwerks, des Lagers der Horde im Norden der Westlichen Pestländer.",
    ["Magistrate Marduke, in Caer Darrow."] =
        "Magistrat Marduke, in Caer Darrow.",
    ["Optional: a chain through Stromgarde, Light's Hope and the Baron's room of Stratholme, back to the school's last boss; it brings a sword, a dagger, a cloth crown or a shield and about 9,950 XP."] =
        "Optional: eine Questreihe über Stromgarde, die Kapelle des Hoffnungsvollen Lichts und den Raum des Barons in Stratholme zurück zum letzten Boss der Schule; sie bringt ein Schwert, einen Dolch, eine Stoffkrone oder einen Schild und etwa 9.950 EP.",
    ["The Keepsake of Remembrance lies in the ruins of Stromgarde, in Arathi Highlands."] =
        "Das Andenken der Erinnerung liegt in den Ruinen von Stromgarde, im Arathihochland.",
    ["Leonid Barthalomew the Revered, at Light's Hope Chapel."] =
        "Leonid Barthalomew der Geachtete, an der Kapelle des Hoffnungsvollen Lichts.",
    ["Stratholme: place the keepsake on the unholy ground of Baron Rivendare's room."] =
        "Stratholme: Leg das Andenken auf den unheiligen Boden im Raum von Baron Rivendare.",
    ["Ras Frostwhisper waits in the Laboratory: use the Soulbound Keepsake on him."] =
        "Ras Frostraunen wartet im Labor: Benutze das Seelengebundene Andenken an ihm.",
    ["Stratholme"] =
        "Stratholme",
    ["Smokey LaRue and Leonid Barthalomew the Revered, at Light's Hope Chapel, in the east of the Eastern Plaguelands."] =
        "Smokey LaRue und Leonid Barthalomew der Geachtete, an der Kapelle des Hoffnungsvollen Lichts, im Osten der Östlichen Pestländer.",
    ["Smokey LaRue's tobacco brings a lighter (a trinket); Leonid's holy water, a cloth crown, a ring or potions."] =
        "Der Tabak von Smokey LaRue bringt ein Feuerzeug (ein Schmuckstück); das heilige Wasser für Leonid eine Stoffkrone, einen Ring oder Tränke.",
    ["Betina's flesh samples open The Active Agent: a choice of two trinkets."] =
        "Betinas Fleischproben öffnen „Der aktive Wirkstoff“: zwei Schmuckstücke zur Wahl.",
    ["Duke Nicholas Zverenhoff, at Light's Hope Chapel."] =
        "Fürst Nicholas Zverenhoff, an der Kapelle des Hoffnungsvollen Lichts.",
    ["Duke Nicholas's chain leads to Balnazzar, then Baron Rivendare, then the Argent Hold: a sword, a staff or a shield."] =
        "Die Questreihe von Fürst Nicholas führt zu Balnazzar, dann zu Baron Rivendare, dann zum Argentumtresor: ein Schwert, ein Stab oder ein Schild.",
    ["Caretaker Alen, at Light's Hope Chapel."] =
        "Verwalter Alen, an der Kapelle des Hoffnungsvollen Lichts.",
    ["Egan's restless souls bring about 8,300 XP."] =
        "Egans ruhelose Seelen bringen etwa 8.300 EP.",
    ["Tirion Fordring, in his hut by the lake on the western edge of the Eastern Plaguelands."] =
        "Tirion Fordring, in seiner Hütte am See am Westrand der Östlichen Pestländer.",
    ["Optional: Tirion Fordring's long chain across both Plaguelands and Caer Darrow; its painting hangs in the city, and its end, In Dreams, brings armor, a warhammer or jewelry and about 9,950 XP."] =
        "Optional: die lange Questreihe von Tirion Fordring durch beide Pestländer und Caer Darrow; ihr Gemälde hängt in der Stadt, und ihr Ende, „In den Träumen“, bringt Rüstung, einen Kriegshammer oder Schmuck und etwa 9.950 EP.",
    ["The plaguehounds, plaguebats and carrion grubs of the Eastern Plaguelands."] =
        "Die Seuchenhunde, Seuchenfledermäuse und Aaslarven der Östlichen Pestländer.",
    ["Listen to Tirion Fordring."] =
        "Hör Tirion Fordring zu.",
    ["Taelan's hammer lies in the Undercroft, at the southern end of the Eastern Plaguelands."] =
        "Taelans Hammer liegt im Tiefgewölbe, am Südende der Östlichen Pestländer.",
    ["The Symbol of Lost Honor lies in Northdale, in the north-east of the Eastern Plaguelands."] =
        "Das Symbol der verlorenen Ehre liegt in Nordtal, im Nordosten der Östlichen Pestländer.",
    ["Artist Renfray, in Caer Darrow, in the Western Plaguelands."] =
        "Grafiker Renfray, in Caer Darrow, in den Westlichen Pestländern.",
    ["Egan, by the road to Stratholme's gate, in the north-west of the Eastern Plaguelands."] =
        "Egan, an der Straße zum Tor von Stratholme, im Nordwesten der Östlichen Pestländer.",
    ["Enter Stratholme"] =
        "Betritt Stratholme",
    ["The city's main gate, in the north of the Eastern Plaguelands, opens on the Scarlet side."] =
        "Das Haupttor der Stadt, im Norden der Östlichen Pestländer, führt auf die Seite der Scharlachroten.",
    ["King's Square: take the box of tobacco in Ezra Grimm's smoke shop; Ezra Grimm comes for it."] =
        "Königsplatz: Nimm die Tabakkiste in Ezra Grimms Rauchwarenladen; Ezra Grimm kommt, um sie zu holen.",
    ["The supply crates along the city's walls hold the holy water; some call monsters."] =
        "Die Vorratskisten entlang der Stadtmauern enthalten das heilige Wasser; manche rufen Monster herbei.",
    ["Every creature of the city may drop a flesh sample."] =
        "Jede Kreatur der Stadt kann eine Fleischprobe fallen lassen.",
    ["Use Egan's blaster on the spectral citizens, then again on the restless souls that break free."] =
        "Benutze Egans Blaster an den spektralen Bürgern und dann noch einmal an den ruhelosen Seelen, die sich befreien.",
    ["Archivist Galford waits near the end of the Scarlet Bastion: kill him and burn the book on his table."] =
        "Archivar Galford wartet nahe dem Ende der Scharlachroten Bastion: Töte ihn und verbrenne das Buch auf seinem Tisch.",
    ["The painting hangs in Galford's room."] =
        "Das Gemälde hängt in Galfords Raum.",
    ["Balnazzar, at the end of the Scarlet Bastion, drops his head: use it."] =
        "Balnazzar, am Ende der Scharlachroten Bastion, lässt seinen Kopf fallen: Benutze ihn.",
    ["Aurius waits in a chapel by the service entrance, the other gate of the city."] =
        "Aurius wartet in einer Kapelle beim Dienstboteneingang, dem anderen Tor der Stadt.",
    ["Optional: Aurius's medallion makes him join the fight against Baron Rivendare: a choice of two trinkets."] =
        "Optional: Durch das Medaillon von Aurius schließt er sich dem Kampf gegen Baron Rivendare an: zwei Schmuckstücke zur Wahl.",
    ["The medallion lies in Malor's strongbox, in Malor the Zealous's room of the Hall of Lights: the Scarlet Key, or a rogue, opens the Bastion's door."] =
        "Das Medaillon liegt in Malors Geldkassette, im Raum von Malor dem Eifrigen in der Halle der Lichter: Der scharlachrote Schlüssel oder ein Schurke öffnet die Tür der Bastion.",
    ["Aurius, in his chapel."] =
        "Aurius, in seiner Kapelle.",
    ["Smokey LaRue and Leonid Barthalomew the Revered, at Light's Hope Chapel."] =
        "Smokey LaRue und Leonid Barthalomew der Geachtete, an der Kapelle des Hoffnungsvollen Lichts.",
    ["Enter Stratholme by the service entrance"] =
        "Betritt Stratholme durch den Dienstboteneingang",
    ["The service entrance, east of the main gate, opens on the side of Baron Rivendare."] =
        "Der Dienstboteneingang, östlich des Haupttors, führt auf die Seite von Baron Rivendare.",
    ["The new Scourge data lies in one of the three ziggurats of the Gauntlet."] =
        "Die neuen Geißeldaten liegen in einem der drei Ziggurats des Spießrutenlaufs.",
    ["Baron Rivendare waits downstairs in the building of Slaughter Square."] =
        "Baron Rivendare wartet unten im Gebäude am Schlächterplatz.",
    ["Aurius appears in the Baron's room and fights at your side."] =
        "Aurius erscheint im Raum des Barons und kämpft an deiner Seite.",
    ["Lord Maxwell Tyrosus, inside Light's Hope Chapel."] =
        "Lord Maxwell Tyrosus, in der Kapelle des Hoffnungsvollen Lichts.",
    ["Open the Argent Hold, inside the chapel."] =
        "Öffne den Argentumtresor, in der Kapelle.",
    ["Egan, by the road to Stratholme."] =
        "Egan, an der Straße nach Stratholme.",
    ["Tirion Fordring, in his hut."] =
        "Tirion Fordring, in seiner Hütte.",
    ["Myranda the Hag, at Uther's Tomb, in the Western Plaguelands."] =
        "Myranda die Vettel, an Uthers Grabmal, in den Westlichen Pestländern.",
    ["Under Myranda's Scarlet illusion, walk into Hearthglen and give Tirion's gift to Highlord Taelan Fordring."] =
        "Geh unter Myrandas scharlachroter Illusion nach Herdweiler und gib Hochlord Taelan Fordring Tirions Geschenk.",
    ["Lead Taelan Fordring out of Hearthglen; the Scarlet give chase."] =
        "Führ Taelan Fordring aus Herdweiler hinaus; die Scharlachroten verfolgen euch.",
    ["Tirion Fordring."] =
        "Tirion Fordring.",
    ["Ragefire Chasm"] =
        "Flammenschlund",
    ["Rahauro, on the Elder Rise of Thunder Bluff."] =
        "Rahauro, auf der Anhöhe der Ältesten in Donnerfels.",
    ["The lost satchel's quest ends with bracers of cloth, leather or mail."] =
        "Die Quest um den verloren gegangenen Ranzen endet mit Armschienen aus Stoff, Leder oder Kette.",
    ["Varimathras, beside Sylvanas in the Royal Quarter of Undercity."] =
        "Varimathras, neben Sylvanas im Königsviertel von Unterstadt.",
    ["Optional: given in Undercity, a zeppelin ride each way. Rewards leggings of cloth, leather or mail."] =
        "Optional: wird in Unterstadt vergeben, mit einer Zeppelinfahrt in jede Richtung. Belohnt mit Gamaschen aus Stoff, Leder oder Kette.",
    ["Thrall, in Grommash Hold, in the Valley of Wisdom."] =
        "Thrall, in der Feste Grommash, im Tal der Weisheit.",
    ["Thrall's chain of four quests ends with a weapon of your choice."] =
        "Thralls Questreihe aus vier Quests endet mit einer Waffe deiner Wahl.",
    ["The Burning Blade cultists of the Cleft of Shadow carry the insignia."] =
        "Die Kultisten der Burning Blade in der Kluft der Schatten tragen die Insignien.",
    ["Talk to Neeru Fireblade, in the Darkbriar Lodge of the Cleft of Shadow."] =
        "Sprich mit Neeru Fireblade, in der Dunkeldornenlodge in der Kluft der Schatten.",
    ["Neeru Fireblade also asks for the heart of the chasm's beast."] =
        "Neeru Fireblade verlangt auch das Herz der Bestie des Schlunds.",
    ["Back to Thrall, in Grommash Hold."] =
        "Zurück zu Thrall, in der Feste Grommash.",
    ["Enter Ragefire Chasm"] =
        "Betritt den Flammenschlund",
    ["The entrance is a cave in the Cleft of Shadow, in the middle of Orgrimmar."] =
        "Der Eingang ist eine Höhle in der Kluft der Schatten, mitten in Orgrimmar.",
    ["Ragefire troggs and their shamans fill the first caves."] =
        "Ragefire-Troggs und ihre Schamanen füllen die ersten Höhlen.",
    ["Maur Grimtotem's body lies in a small cave on the right, past the big trogg cave."] =
        "Maur Grimmtotems Leiche liegt in einer kleinen Höhle rechts, hinter der großen Trogghöhle.",
    ["The Searing Blade cultists and warlocks carry both books."] =
        "Die Searingblade-Kultisten und -Hexenmeister tragen beide Bücher.",
    ["Taragaman the Hungerer, the chasm's second boss, guards a lava cave."] =
        "Taragaman der Hungerleider, der zweite Boss des Schlunds, bewacht eine Lavahöhle.",
    ["Jergosh the Invoker is the third boss; Bazzalan waits at the very end of the chasm."] =
        "Jergosh der Herbeirufer ist der dritte Boss; Bazzalan wartet ganz am Ende des Schlunds.",
    ["Thrall, in Grommash Hold."] =
        "Thrall, in der Feste Grommash.",
    ["Neeru Fireblade, in the Cleft of Shadow."] =
        "Neeru Fireblade, in der Kluft der Schatten.",
    ["Your reward: an axe, a mace, a dagger or a staff of Orgrimmar."] =
        "Deine Belohnung: eine Axt, ein Streitkolben, ein Dolch oder ein Stab von Orgrimmar.",
    ["Varimathras, in the Royal Quarter of Undercity."] =
        "Varimathras, im Königsviertel von Unterstadt.",
    ["Tonga Runetotem, at the Crossroads."] =
        "Tonga Runetotem, am Wegekreuz.",
    ["Tonga's three oases open Leaders of the Fang, the caverns' main quest: a weapon of your choice."] =
        "Tongas drei Oasen öffnen „Anführer der Giftzähne“, die Hauptquest der Höhlen: eine Waffe deiner Wahl.",
    ["The Forgotten Pools lie north-west of the Crossroads, north of the caverns' hill."] =
        "Die Vergessenen Teiche liegen nordwestlich des Wegekreuzes, nördlich des Hügels über den Höhlen.",
    ["The Stagnant Oasis lies south-east of the Crossroads: use the bubbling fissure in its water."] =
        "Die Brackige Oase liegt südöstlich des Wegekreuzes: Benutze den blubbernden Felsspalt in ihrem Wasser.",
    ["The snapjaw turtles of the Lushwater Oasis, at the foot of the caverns' hill."] =
        "Die Schnappkieferschildkröten der Blühenden Oase, am Fuß des Hügels über den Höhlen.",
    ["Apothecary Zamah, in the Pools of Vision under the Spirit Rise."] =
        "Apothekerin Zamah, in den Teichen der Visionen unter der Anhöhe der Geister.",
    ["Reward: a piece of cloth, leather or mail armor."] =
        "Belohnung: ein Rüstungsteil aus Stoff, Leder oder Kette.",
    ["Arch Druid Hamuul Runetotem, on the Elder Rise."] =
        "Erzdruide Hamuul Runetotem, auf der Anhöhe der Ältesten.",
    ["Nara Wildmane, on the Elder Rise."] =
        "Nara Wildmane, auf der Anhöhe der Ältesten.",
    ["Serpentbloom: small green shrubs with violet flowers, in the caves before the door and inside."] =
        "Schlangenflaum: kleine grüne Sträucher mit violetten Blüten, in den Höhlen vor dem Eingang und drinnen.",
    ["The four Fanglords each drop a gem: Lady Anacondra and Lord Cobrahn first, then Lord Pythas, and Lord Serpentis last."] =
        "Die vier Giftzahnlords lassen je einen Edelstein fallen: zuerst Lady Anacondra und Lord Kobrahn, dann Lord Pythas und zuletzt Lord Serpentis.",
    ["Nara Wildmane, on the Elder Rise of Thunder Bluff."] =
        "Nara Wildmane, auf der Anhöhe der Ältesten in Donnerfels.",
    ["Your reward: a staff, a mace or a sword."] =
        "Deine Belohnung: ein Stab, ein Streitkolben oder ein Schwert.",
    ["Apothecary Zamah, in the Pools of Vision."] =
        "Apothekerin Zamah, in den Teichen der Visionen.",
    ["Tabitha Heartweaver, at the Sepulcher, in Silverpine Forest."] =
        "Tabitha Heartweaver, am Grabmal, im Silberwald.",
    ["Reward: a dagger or cloth cuffs."] =
        "Belohnung: ein Dolch oder Stoffmanschetten.",
    ["Deathguard Kristof, in Brill, in Tirisfal Glades."] =
        "Deathguard Kristof, in Brill, in Tirisfal.",
    ["Reward: a two-handed axe or a staff."] =
        "Belohnung: eine Zweihandaxt oder ein Stab.",
    ["Morbin Lightbane, in Undercity."] =
        "Morbin Lightbane, in Unterstadt.",
    ["Reward: leather armor or a mace."] =
        "Belohnung: eine Lederrüstung oder ein Streitkolben.",
    ["Theodore Griffs, in Undercity."] =
        "Theodore Griffs, in Unterstadt.",
    ["Reward: cloth gloves or a sword."] =
        "Belohnung: Stoffhandschuhe oder ein Schwert.",
    ["The ruins rise above Undercity, in Tirisfal Glades."] =
        "Die Ruinen erheben sich über Unterstadt, in Tirisfal.",
    ["Look for Edward Heartweaver in the ruins."] =
        "Suche in den Ruinen nach Edward Heartweaver.",
    ["Twenty-five intact limbs, from the undead of the ruins."] =
        "Fünfundzwanzig Intact Limbs, von den Untoten der Ruinen.",
    ["Rath'mael waits in the ruins."] =
        "Rath'mael wartet in den Ruinen.",
    ["Witherfang carries the highly toxic strain."] =
        "Witherfang trägt den Highly Toxic Strain.",
    ["The Baron may drop an abominable head: read it."] =
        "The Baron kann einen Abominable Head fallen lassen: Lies ihn.",
    ["Oran Snakewrithe, in Undercity."] =
        "Oran Snakewrithe, in Unterstadt.",
    ["Master Apothecary Faranell, in the Apothecarium of Undercity."] =
        "Apothekermeister Faranell, im Apothekarium von Unterstadt.",
    ["Optional: Faranell's Unending Torment goes on in Undercity; its last part has a two-handed sword among its rewards."] =
        "Optional: Faranells „Unending Torment“ geht in Unterstadt weiter; der letzte Teil hat unter anderem ein Zweihandschwert als Belohnung.",
    ["A toxic skullcap from Tawny Grisette in the Trade Quarter, blisterweed near the herbalism trainer, and an essence of agony from the poison vendor of the Rogues' Quarter."] =
        "Eine Toxic Skullcap von Tawny Grisette im Handwerksviertel, Blisterweed nahe dem Kräuterkundelehrer und eine Essenz der Pein vom Giftverkäufer im Schurkenviertel.",
    ["Inject the hissing serum into the system above Othmar's body."] =
        "Spritz das Hissing Serum in die Apparatur über Othmars Körper.",
    ["Bring the Baron's head to Othmar's body, the unfinished abomination."] =
        "Bring den Kopf des Barons zu Othmars Körper, der unfertigen Monstrosität.",
    ["Master Apothecary Faranell."] =
        "Apothekermeister Faranell.",
    ["Deathguard Kristof, in Brill."] =
        "Deathguard Kristof, in Brill.",
    ["Tabitha Heartweaver, at the Sepulcher."] =
        "Tabitha Heartweaver, am Grabmal.",
    ["Shadowfang Keep"] =
        "Burg Schattenfang",
    ["Keeper Bel'dugur, in Undercity."] =
        "Bewahrer Bel'dugur, in Unterstadt.",
    ["Dalar Dawnweaver, at the Sepulcher, in Silverpine Forest."] =
        "Dalar Dawnweaver, am Grabmal, im Silberwald.",
    ["Reward: a ring and about 3,300 XP."] =
        "Belohnung: ein Ring und etwa 3.300 EP.",
    ["High Executor Hadrec, at the Sepulcher."] =
        "Hochexekutor Hadrec, am Grabmal.",
    ["Reward: shoulders of cloth, leather or mail."] =
        "Belohnung: Schultern aus Stoff, Leder oder Kette.",
    ["Enter Shadowfang Keep"] =
        "Betritt Burg Schattenfang",
    ["The keep stands south of the Sepulcher."] =
        "Die Burg steht südlich des Grabmals.",
    ["Deathstalker Vincent lies in the courtyard: Deathstalker Adamant, freed after Rethilgore, opens its door."] =
        "Todespirscher Vincent liegt im Innenhof: Todespirscher Adamant, der nach Rethilgore befreit wird, öffnet dessen Tor.",
    ["The Book of Ur, a blue book, stands on a bookshelf on the left of Fenrus the Devourer's room."] =
        "Das Buch von Ur, ein blaues Buch, steht in einem Bücherregal links im Raum von Fenrus dem Verschlinger.",
    ["Archmage Arugal, the last boss, waits at the top of the keep."] =
        "Erzmagier Arugal, der letzte Boss, wartet ganz oben in der Burg.",
    ["Dalar Dawnweaver, at the Sepulcher."] =
        "Dalar Dawnweaver, am Grabmal.",
    ["Tsunaman, at Sun Rock Retreat, in Stonetalon Mountains."] =
        "Tsunaman, in Sonnenfels, im Steinkrallengebirge.",
    ["Optional: a lead from Stonetalon to Zoram'gar Outpost."] =
        "Optional: ein Hinweis vom Steinkrallengebirge zum Außenposten von Zoram'gar.",
    ["Je'neu Sancrea, at Zoram'gar Outpost, on Ashenvale's coast."] =
        "Je'neu Sancrea, im Außenposten von Zoram'gar, an der Küste des Eschentals.",
    ["Je'neu Sancrea, at Zoram'gar Outpost."] =
        "Je'neu Sancrea, im Außenposten von Zoram'gar.",
    ["The Earthen Ring's quests: Amongst the Ruins wakes Baron Aquanis, whose drop starts a quest with a sword among its rewards."] =
        "Die Quests des Irdenen Rings: „Inmitten der Ruinen“ weckt Baron Aquanis, dessen Beute eine Quest startet, die unter anderem ein Schwert als Belohnung bietet.",
    ["The deeps open in ruins half under water, on the coast of Zoram Strand."] =
        "Die Grotte öffnet sich in halb versunkenen Ruinen, an der Küste des Zoramstrands.",
    ["The Sapphires of Aku'Mai grow on the walls of the cave before the dungeon's door."] =
        "Die Saphire von Aku'Mai wachsen an den Wänden der Höhle vor dem Eingang des Dungeons.",
    ["The Blackfathom tide priestesses of that cave may drop a damp note: read it."] =
        "Die Blackfathom-Gezeitenpriesterinnen dieser Höhle können eine feuchte Notiz fallen lassen: Lies sie.",
    ["Back to Je'neu Sancrea, at Zoram'gar Outpost, before the dungeon."] =
        "Zurück zu Je'neu Sancrea, im Außenposten von Zoram'gar, vor dem Dungeon.",
    ["Reward: a wand, a shield or leather armor."] =
        "Belohnung: ein Zauberstab, ein Schild oder eine Lederrüstung.",
    ["Lorgus Jett walks the nooks on the west side, south of the Pool of Ask'ar."] =
        "Lorgus Jett läuft durch die Nischen auf der Westseite, südlich des Teichs von Ask'ar.",
    ["The Fathom Stone lies under the water in the middle of the Moonshrine Ruins, under the walkway before Kelris; taking its core wakes Baron Aquanis."] =
        "Der Fathom-Stein liegt unter Wasser mitten in den Mondschreinruinen, unter dem Steg vor Kelris; wenn du seinen Kern nimmst, erwacht Baron Aquanis.",
    ["Baron Aquanis may drop a Strange Water Globe: use it."] =
        "Baron Aquanis kann eine Seltsame Wasserkugel fallen lassen: Benutze sie.",
    ["Bashana Runetotem, on the Elder Rise of Thunder Bluff."] =
        "Bashana Runetotem, auf der Anhöhe der Ältesten in Donnerfels.",
    ["Borstan, the meat vendor of Orgrimmar."] =
        "Borstan, der Fleischverkäufer von Orgrimmar.",
    ["Reward: a dagger or a satchel of potions."] =
        "Belohnung: ein Dolch oder ein Ranzen voller Tränke.",
    ["Zaruk, at Hammerfall, in Arathi Highlands."] =
        "Zaruk, in Hammerfall, im Arathihochland.",
    ["Dragonmaw Rumors leads to Open the Maw, inside the site."] =
        "„Dragonmaw Rumors“ führt zu „Open the Maw“, in der Stätte.",
    ["The Deathstalker Agent hides in the hills above the Dragonmaw camp, in the Wetlands."] =
        "Der Deathstalker Agent versteckt sich in den Hügeln über dem Lager der Dragonmaw, im Sumpfland.",
    ["Thicket raptor meat, from the raptors of the site."] =
        "Thicket Raptor Meat, von den Raptoren der Stätte.",
    ["The Dragonmaw forces of the site, their thaumaturgists among them."] =
        "Die Truppen der Dragonmaw in der Stätte, darunter ihre Thaumaturgen.",
    ["The Titan relic leads to the Earthen Ring: a staff or a two-handed mace."] =
        "Das Titan Relic führt zum Irdenen Ring: ein Stab oder ein Zweihandstreitkolben.",
    ["The Deathstalker Agent, above the Dragonmaw camp."] =
        "Der Deathstalker Agent, über dem Lager der Dragonmaw.",
    ["Borstan, in Orgrimmar."] =
        "Borstan, in Orgrimmar.",
    ["Muln Earthfury, on the Skywatcher Plateau, in the north-west of Mulgore."] =
        "Muln Earthfury, auf dem Skywatcher Plateau, im Nordwesten von Mulgore.",
    ["Nogg, in his machine shop in the Valley of Honor of Orgrimmar."] =
        "Nogg, in seiner Maschinenwerkstatt im Tal der Ehre in Orgrimmar.",
    ["Sovik, beside Nogg."] =
        "Sovik, neben Nogg.",
    ["Scooty's transponder sends you straight to Gnomeregan, far in Dun Morogh, and stays yours."] =
        "Scootys Transponder schickt dich direkt nach Gnomeregan, weit weg in Dun Morogh, und bleibt in deinem Besitz.",
    ["Wait for Scooty to set up the transponder."] =
        "Warte, bis Scooty den Transponder aufgebaut hat.",
    ["The transponder leaves you by the gates of Gnomeregan, in the west of Dun Morogh."] =
        "Der Transponder setzt dich vor den Toren von Gnomeregan ab, im Westen von Dun Morogh.",
    ["Optional: an escort, turned in at Booty Bay; it rewards bracers or shoulders."] =
        "Optional: eine Eskorte, die in Beutebucht abgegeben wird; sie belohnt mit Armschienen oder Schultern.",
    ["The last boss, Mekgineer Thermaplugg, carries the code of his safe, set in the far wall of the Tinkers' Court next to the third pillar counting from the right."] =
        "Der letzte Boss, Robogenieur Thermaplugg, trägt den Code seines Tresors, der in die hintere Wand des Hofs der Tüftler eingelassen ist, neben der dritten Säule von rechts gezählt.",
    ["Scooty, in Booty Bay."] =
        "Scooty, in Beutebucht.",
    ["Nogg, in Orgrimmar."] =
        "Nogg, in Orgrimmar.",
    ["It opens Hearts of Zeal, a quest of the Scarlet Monastery."] =
        "Sie öffnet „Herzen des Eifers“, eine Quest des Scharlachroten Klosters.",
    ["Auld Stonespire, in Thunder Bluff."] =
        "Auld Stonespire, in Donnerfels.",
    ["Reward: cloth shoulders, a mail belt or a shield, and about 4,050 XP."] =
        "Belohnung: Stoffschultern, ein Kettengürtel oder ein Schild und etwa 4.050 EP.",
    ["Rau Cliffrunner, at Freewind Post, in Thousand Needles."] =
        "Rau Cliffrunner, im Freiwindposten, in Tausend Nadeln.",
    ["The kraul bats of the cave west of the bridges drop the guano."] =
        "Die Kral-Fledermäuse der Höhle westlich der Brücken lassen das Guano fallen.",
    ["Charlga may drop a small scroll: read it."] =
        "Charlga kann eine kleine Rolle fallen lassen: Lies sie.",
    ["Willix the Importer waits in a tent below Charlga's platform."] =
        "Willix der Importeur wartet in einem Zelt unterhalb der Plattform von Charlga.",
    ["Master Apothecary Faranell, in Undercity."] =
        "Apothekermeister Faranell, in Unterstadt.",
    ["It opens An Unholy Alliance, a quest of Razorfen Downs."] =
        "Sie öffnet „Eine unheilige Allianz“, eine Quest der Hügel der Klingenhauer.",
    ["Doctor Martin Felben, in the Apothecarium of Undercity."] =
        "Doktor Martin Felben, im Apothekarium von Unterstadt.",
    ["Reward: a wand or a cloak."] =
        "Belohnung: ein Zauberstab oder ein Umhang.",
    ["Melisara and Magus Wordeen Voidglare, in Tarren Mill, in Hillsbrad Foothills."] =
        "Melisara und Magus Wordeen Voidglare, in Tarrens Mühle, im Vorgebirge des Hügellands.",
    ["Tarren Mill's quests: The Grave Knight brings leather boots or mail bracers."] =
        "Die Quests von Tarrens Mühle: „The Grave Knight“ bringt Lederstiefel oder Kettenarmschienen.",
    ["Reward: a staff or mail shoulders."] =
        "Belohnung: ein Stab oder Kettenschultern.",
    ["Atrexis the Grave Knight, inside the city."] =
        "Atrexis the Grave Knight, in der Stadt.",
    ["Six cracked sentry cores, from the fragmented sentries of the city."] =
        "Sechs Cracked Sentry Cores, von den Fragmented Sentries der Stadt.",
    ["Magus Wordeen Voidglare and Melisara, in Tarren Mill."] =
        "Magus Wordeen Voidglare und Melisara, in Tarrens Mühle.",
    ["Doctor Martin Felben, in Undercity."] =
        "Doktor Martin Felben, in Unterstadt.",
    ["Dorn Plainstalker, in Thousand Needles."] =
        "Dorn Plainstalker, in Tausend Nadeln.",
    ["Optional: a chain of ten quests through Thousand Needles, Stonetalon, Ashenvale and Undercity, up to a book of the monastery; it ends with a mace or a wand and about 4,200 XP."] =
        "Optional: eine Questreihe aus zehn Quests durch Tausend Nadeln, das Steinkrallengebirge, das Eschental und Unterstadt bis zu einem Buch des Klosters; sie endet mit einem Streitkolben oder einem Zauberstab und etwa 4.200 EP.",
    ["Leap from the wooden planks over the canyon, in the west of Thousand Needles."] =
        "Spring von den Holzplanken über der Schlucht, im Westen von Tausend Nadeln.",
    ["Grenka Bloodscreech, a harpy of the west of Thousand Needles."] =
        "Grenka Blutkreischer, eine Harpyie im Westen von Tausend Nadeln.",
    ["Rok'Alim the Pounder, an elemental of the north-west of Thousand Needles."] =
        "Rok'Alim der Trommler, ein Elementar im Nordwesten von Tausend Nadeln.",
    ["Braug Dimspirit, in the east of Stonetalon Mountains."] =
        "Braug Dimspirit, im Osten des Steinkrallengebirges.",
    ["The Legacy of the Aspects, a book in the south-east of Ashenvale."] =
        "Das Vermächtnis der Aspekte, ein Buch im Südosten des Eschentals.",
    ["Braug Dimspirit, in Stonetalon."] =
        "Braug Dimspirit, im Steinkrallengebirge.",
    ["Braug Dimspirit asks a question: give him the right answer."] =
        "Braug Dimspirit stellt eine Frage: Gib ihm die richtige Antwort.",
    ["Sage Truthseeker, in Thunder Bluff."] =
        "Sage Truthseeker, in Donnerfels.",
    ["Reward: a shield or an off-hand orb, and about 3,550 XP."] =
        "Belohnung: ein Schild oder eine Kugel für die Schildhand und etwa 3.550 EP.",
    ["Parqual Fintallas, in Undercity."] =
        "Parqual Fintallas, in Unterstadt.",
    ["Reward: a sword, an off-hand cane or a necklace, and about 5,150 XP."] =
        "Belohnung: ein Schwert, ein Stock für die Schildhand oder eine Halskette und etwa 5.150 EP.",
    ["Master Apothecary Faranell, in the Apothecarium."] =
        "Apothekermeister Faranell, im Apothekarium.",
    ["Graveyard: Vorrel Sengutz lies on a table on the right of the Chamber of Atonement, by Interrogator Vishas."] =
        "Friedhof: Vorrel Sengutz liegt auf einem Tisch rechts in der Kammer der Sühne, bei Befrager Vishas.",
    ["Reward: a cloth cape or shoulders, or leather boots; the ring it asks for is in the Alterac Mountains."] =
        "Belohnung: ein Stoffcape oder Stoffschultern oder Lederstiefel; der Ring, den sie verlangt, ist im Alteracgebirge.",
    ["Every Scarlet of the monastery may drop a heart."] =
        "Jeder Scharlachrote im Kloster kann ein Herz fallen lassen.",
    ["Library: the book rests on a table, in the first side room on the left as you walk the Gallery of Treasures."] =
        "Bibliothek: Das Buch liegt auf einem Tisch, im ersten Seitenraum links, wenn du durch die Galerie der Schätze gehst.",
    ["Library: the Compendium stands on a bookcase on the left wall at the entrance of the Athenaeum."] =
        "Bibliothek: Das Kompendium steht in einem Bücherregal an der linken Wand am Eingang des Athenaeums.",
    ["Parqual Fintallas asks a question: give him the right answer."] =
        "Parqual Fintallas stellt eine Frage: Gib ihm die richtige Antwort.",
    ["Varimathras, in the Royal Quarter."] =
        "Varimathras, im Königsviertel.",
    ["Nancy Vishas, an elite, keeps the ring in a house of the Alterac Mountains."] =
        "Nancy Vishas, eine Elitegegnerin, bewahrt den Ring in einem Haus im Alteracgebirge auf.",
    ["Monika Sengutz, in Tarren Mill, in Hillsbrad Foothills."] =
        "Monika Sengutz, in Tarrens Mühle, im Vorgebirge des Hügellands.",
    ["Andrew Brownell, in Undercity."] =
        "Andrew Brownell, in Unterstadt.",
    ["Reward: a mace, a gun, a cloth robe or a leather chest."] =
        "Belohnung: ein Streitkolben, eine Schusswaffe, eine Stoffrobe oder ein Lederbrustteil.",
    ["Ambassador Malcin walks among the quilboar outside the downs."] =
        "Botschafter Malcin läuft zwischen den Stachelebern vor den Hügeln umher.",
    ["Patrick Garrett, in Undercity."] =
        "Patrick Garrett, in Unterstadt.",
    ["Dran Droffers, in the Drag of Orgrimmar."] =
        "Dran Droffers, in der Gasse von Orgrimmar.",
    ["Dran Droffers's chain goes back and forth between Orgrimmar, Kargath and Uldaman: it ends with a necklace and about 5,600 XP."] =
        "Die Questreihe von Dran Droffers pendelt zwischen Orgrimmar, Kargath und Uldaman: Sie endet mit einer Halskette und etwa 5.600 EP.",
    ["Jarkal Mossmeld, at Kargath, in the west of the Badlands."] =
        "Jarkal Mossmeld, in Kargath, im Westen des Ödlands.",
    ["The tablet lies in an ancient chest by the gates of Uldaman, in the north of the Badlands."] =
        "Die Schrifttafel liegt in einer uralten Truhe bei den Toren von Uldaman, im Norden des Ödlands.",
    ["The Shadowforge dwarves around the gates drop the power stones and the shattered necklace."] =
        "Die Zwerge der Schattenschmiede rund um die Tore lassen die Kraftsteine und die zerrissene Halskette fallen.",
    ["The Garrett family chest stands in the dig west of Uldaman's gates."] =
        "Die Familientruhe der Garretts steht in der Grabung westlich der Tore von Uldaman.",
    ["Jarkal Mossmeld, at Kargath."] =
        "Jarkal Mossmeld, in Kargath.",
    ["Dran Droffers, in Orgrimmar."] =
        "Dran Droffers, in Orgrimmar.",
    ["Magenta cap clusters grow on the cave walls, south-west of Uldaman's gates and inside."] =
        "Magenta Kappengruppen wachsen an den Höhlenwänden, südwestlich der Tore von Uldaman und drinnen.",
    ["The dungeon's door is at the back of the cave by the dig at Uldaman's gates."] =
        "Der Eingang des Dungeons liegt hinten in der Höhle bei der Grabung an den Toren von Uldaman.",
    ["A dead paladin rests just off the first great hall, down its second right-hand passage; then head out for Kargath."] =
        "Ein toter Paladin ruht gleich neben der ersten großen Halle, im zweiten Gang rechts; mach dich danach auf den Weg nach Kargath.",
    ["Enter Uldaman again"] =
        "Betritt Uldaman erneut",
    ["The topaz is in a conspicuous urn south-east of Dig Two, the ruby in a stone chest north-west of Dig Three (it calls monsters), the sapphire on Grimlok at the end of the Stone Vault; Archaedas, the last boss, in the Hall of the Crafters, drops the power source."] =
        "Der Topas ist in einer verdächtigen Urne südöstlich von Grabung Zwei, der Rubin in einer Steintruhe nordwestlich von Grabung Drei (sie ruft Monster herbei), der Saphir bei Grimlok am Ende des Steingewölbes; Archaedas, der letzte Boss, in der Halle der Handwerker, lässt die Kraftquelle fallen.",
    ["Optional: the Discs of Norgannon, behind Archaedas, tell their story; it ends in Thunder Bluff with potions or a bag."] =
        "Optional: Die Scheiben von Norgannon, hinter Archaedas, erzählen ihre Geschichte; sie endet in Donnerfels mit Tränken oder einer Tasche.",
    ["Bena Winterhoof, in Thunder Bluff."] =
        "Bena Winterhoof, in Donnerfels.",
    ["Venom bottles stand in the Witherbark trolls' camps of the south-west of the Hinterlands."] =
        "Giftflaschen stehen in den Lagern der Trolle der Witherbark im Südwesten des Hinterlands.",
    ["Optional: a chain of six quests between the Hinterlands, Tarren Mill, Durotar and the city; it ends with a shield, a mail chest or a cloth robe."] =
        "Optional: eine Questreihe aus sechs Quests zwischen dem Hinterland, Tarrens Mühle, Durotar und der Stadt; sie endet mit einem Schild, einem Kettenbrustteil oder einer Stoffrobe.",
    ["Apothecary Lydon, in Tarren Mill, in Hillsbrad Foothills."] =
        "Apotheker Lydon, in Tarrens Mühle, im Vorgebirge des Hügellands.",
    ["The Witherbark broodguards, spiders of the Hinterlands' troll camps, carry the sacs."] =
        "Die Brutwachen der Witherbark, Spinnen der Trolllager im Hinterland, tragen die Giftbeutel.",
    ["Apothecary Lydon, in Tarren Mill."] =
        "Apotheker Lydon, in Tarrens Mühle.",
    ["Master Gadrin, in Sen'jin Village, in Durotar."] =
        "Meister Gadrin, im Dorf der Sen'jin, in Durotar.",
    ["A tablet stands in the middle of the scarabs' chamber: read the spider god's name on it."] =
        "Eine Schrifttafel steht mitten in der Skarabäenkammer: Lies darauf den Namen des Spinnengottes.",
    ["Master Gadrin, in Sen'jin Village."] =
        "Meister Gadrin, im Dorf der Sen'jin.",
    ["Defeat Shadra at her altar of Shadra'Alor, in the south-west of the Hinterlands, and take her venom."] =
        "Besiege Shadra an ihrem Altar in Shadra'Alor, im Südwesten des Hinterlands, und nimm ihr Gift.",
    ["Uthel'nay, in the Valley of Spirits of Orgrimmar."] =
        "Uthel'nay, im Tal der Geister in Orgrimmar.",
    ["Vark Battlescar and Selendra, at Shadowprey Village, on the west coast of Desolace."] =
        "Vark Battlescar und Selendra, in Shadowprey Village, an der Westküste von Desolace.",
    ["Shadowprey Village's two quests: a ring, plate gauntlets or a leather belt; then Theradras's end brings a sword, a staff or a bow."] =
        "Die zwei Quests von Shadowprey Village: ein Ring, Plattenstulpen oder ein Ledergürtel; dann bringt das Ende von Theradras ein Schwert, einen Stab oder einen Bogen.",
    ["Vark Battlescar and Selendra, at Shadowprey Village."] =
        "Vark Battlescar und Selendra, in Shadowprey Village.",
    ["Uthel'nay, in Orgrimmar."] =
        "Uthel'nay, in Orgrimmar.",
    ["Fel'zerul, in Stonard, in the Swamp of Sorrows."] =
        "Fel'zerul, in Steinard, in den Sümpfen des Elends.",
    ["Fel'zerul's chain goes to the Hinterlands and back: it opens The Temple of Atal'Hakkar, a talisman and about 5,900 XP."] =
        "Die Questreihe von Fel'zerul führt ins Hinterland und zurück: Sie öffnet „Der Tempel von Atal'Hakkar“, einen Talisman und etwa 5.900 EP.",
    ["The Atal'ai artifacts lie in the ruins around the Pool of Tears, in the east of the swamp."] =
        "Die Artefakte der Atal'ai liegen in den Ruinen rund um den Tränenteich, im Osten der Sümpfe.",
    ["Fel'zerul, in Stonard."] =
        "Fel'zerul, in Steinard.",
    ["Jammal'an the Prophet: cloth leggings or a mail helm, and about 6,550 XP."] =
        "„Jammal'an der Prophet“: Stoffgamaschen oder ein Kettenhelm und etwa 6.550 EP.",
    ["Witch Doctor Uzer'i, at Camp Mojache, in Feralas."] =
        "Hexendoktor Uzer'i, im Camp Mojache, in Feralas.",
    ["Larion, at Marshal's Refuge, in Un'Goro Crater."] =
        "Larion, in Marschalls Zuflucht, im Krater von Un'Goro.",
    ["Larion's chain leads to the temple's haze; its end brings a bloodpetal zapper."] =
        "Larions Questreihe führt zum Dunst des Tempels; ihr Ende bringt einen Blutblütenschrumpfer.",
    ["The bloodpetal plants of Un'Goro."] =
        "Die Blutblütenpflanzen von Un'Goro.",
    ["Liv Rizzlefix, in Ratchet."] =
        "Liv Rizzlefix, in Ratschet.",
    ["Every Atal'ai troll of the temple may drop a fetish."] =
        "Jeder Troll der Atal'ai im Tempel kann einen Fetisch fallen lassen.",
    ["Apothecary Zinge, in the Apothecarium of Undercity."] =
        "Apothekerin Zinge, im Apothekarium von Unterstadt.",
    ["Optional: a lead from Undercity to Vivian Lagrave, at Kargath."] =
        "Optional: ein Hinweis von Unterstadt zu Vivian Lagrave, in Kargath.",
    ["Shadowmage Vivian Lagrave, at Kargath, in the west of the Badlands."] =
        "Schattenmagierin Vivian Lagrave, in Kargath, im Westen des Ödlands.",
    ["Shadowmage Vivian Lagrave, at Kargath."] =
        "Schattenmagierin Vivian Lagrave, in Kargath.",
    ["Reward: a two-handed axe, a mace or potions."] =
        "Belohnung: eine Zweihandaxt, ein Streitkolben oder Tränke.",
    ["Thunderheart, at Kargath."] =
        "Thunderheart, in Kargath.",
    ["Thunderheart's chain: Disharmony of Fire brings armor of any kind, and opens Commander Gor'shak and The Last Element."] =
        "Die Questreihe von Thunderheart: „Disharmonie des Feuers“ bringt Rüstung jeder Art und öffnet „Kommandant Gor'shak“ und „Das letzte Element“.",
    ["Hierophant Theodora Mulvadania, at Kargath."] =
        "Hierophantin Theodora Mulvadania, in Kargath.",
    ["The Rise of the Machines ends inside the depths with armor of any kind, and about 6,200 XP."] =
        "„Aufstieg der Maschinen“ endet in den Tiefen mit Rüstung jeder Art und etwa 6.200 EP.",
    ["The WANTED poster, at Kargath."] =
        "Der Aushang GESUCHT, in Kargath.",
    ["The wanted posters lead to General Angerforge, and a medallion."] =
        "Die Steckbriefe führen zu General Zornesschmied und zu einem Medaillon.",
    ["The war reavers and obsidian elementals of the Badlands drop the shards."] =
        "Die Kriegshäscher und Obsidianelementare des Ödlands lassen die Splitter fallen.",
    ["Lotwil Veriatus, in the west of the Badlands."] =
        "Lotwil Veriatus, im Westen des Ödlands.",
    ["Galamav the Marksman, at Kargath."] =
        "Galamav der Schütze, in Kargath.",
    ["Commander Gor'shak's chain leads to Thrall, the emperor and the princess: about 9,950 XP at its end, and Thrall's reward."] =
        "Die Questreihe von Kommandant Gor'shak führt zu Thrall, zum Imperator und zur Prinzessin: etwa 9.950 EP an ihrem Ende und Thralls Belohnung.",
    ["Blackrock Mountain opens in the south of the Searing Gorge; inside, the depths' door is at the bottom of the mountain."] =
        "Der Schwarzfels öffnet sich im Süden der Sengenden Schlucht; drinnen liegt der Eingang der Tiefen ganz unten im Berg.",
    ["High Interrogator Gerstahn, in a back room on the right of the Detention Block, carries the cell key; Commander Gor'shak sits in the first cell on the left of the tunnel."] =
        "Verhörmeisterin Gerstahn, in einem Hinterzimmer rechts im Gefängnistrakt, trägt den Zellenschlüssel; Kommandant Gor'shak sitzt in der ersten Zelle links im Tunnel.",
    ["Defend Gor'shak against two waves of guards."] =
        "Verteidige Gor'shak gegen zwei Wellen von Wachen.",
    ["Talk to Kharan Mighthammer, in the first cell on the left across the hallway."] =
        "Sprich mit Kharan Mighthammer, in der ersten Zelle links auf der anderen Seite des Gangs.",
    ["The Anvilrage guardsmen, wardens and footmen of the Detention Block and the halls."] =
        "Die Gardisten, Aufseher und Fußsoldaten der Zorneshämmer im Gefängnistrakt und in den Hallen.",
    ["Lord Incendius waits at the Black Anvil, in Shadowforge City: he carries the Tablet of Kurniya."] =
        "Lord Incendius wartet am Schwarzen Amboss, in der Stadt Schattenschmiede: Er trägt die Schrifttafel von Kurniya.",
    ["Golem Lord Argelmach waits in the Manufactory; his golems and constructs drop the cores and the essences."] =
        "Golemlord Argelmach wartet in der Manufaktur; seine Golems und Konstrukte lassen die Kerne und die Essenzen fallen.",
    ["Warlord Goretooth, at Kargath."] =
        "Kriegsherr Goretooth, in Kargath.",
    ["The KILL ON SIGHT poster, at Kargath."] =
        "Der Aushang SOFORT TÖTEN, in Kargath.",
    ["Thrall, in Grommash Hold, in Orgrimmar."] =
        "Thrall, in der Feste Grommash, in Orgrimmar.",
    ["The Anvilrage medics, soldiers and officers of the halls."] =
        "Die Sanitäter, Soldaten und Offiziere der Zorneshämmer in den Hallen.",
    ["Warlord Goretooth, then Lexlort, at Kargath."] =
        "Kriegsherr Goretooth, dann Lexlort, in Kargath.",
    ["Grark Lorkrub, held in the Blackrock Stronghold of the Burning Steppes."] =
        "Grark Lorkrub, gefangen in der Schwarzfelsfestung der Brennenden Steppe.",
    ["Optional: an escort in the Burning Steppes, then a third visit for General Angerforge: a medallion and about 7,750 XP."] =
        "Optional: eine Eskorte in der Brennenden Steppe, dann ein dritter Besuch für General Zornesschmied: ein Medaillon und etwa 7.750 EP.",
    ["Bind Grark Lorkrub with the shackles and lead him through Blackrock Mountain to the Searing Gorge."] =
        "Leg Grark Lorkrub die Fesseln an und führ ihn durch den Schwarzfels in die Sengende Schlucht.",
    ["Lexlort, then Warlord Goretooth, at Kargath."] =
        "Lexlort, dann Kriegsherr Goretooth, in Kargath.",
    ["Enter Blackrock Depths a third time"] =
        "Betritt die Schwarzfelstiefen ein drittes Mal",
    ["General Angerforge waits down the stairs of the West Garrison."] =
        "General Zornesschmied wartet unten an der Treppe der Westgarnison.",
    ["Galamav the Marksman, at Kargath, in the west of the Badlands."] =
        "Galamav der Schütze, in Kargath, im Westen des Ödlands.",
    ["Lexlort, at Kargath."] =
        "Lexlort, in Kargath.",
    ["Lexlort's chain: Bijou's report brings cloth gloves or a mail belt."] =
        "Lexlorts Questreihe: Bijous Bericht bringt Stoffhandschuhe oder einen Kettengürtel.",
    ["Reward: armor of any kind, for the spire's three generals and their documents."] =
        "Belohnung: Rüstung jeder Art, für die drei Generäle der Spitze und ihre Dokumente.",
    ["Blackrock Mountain opens in the south of the Searing Gorge; inside, the spire's door is at the top of the mountain."] =
        "Der Schwarzfels öffnet sich im Süden der Sengenden Schlucht; drinnen liegt der Eingang der Spitze ganz oben im Berg.",
    ["Highlord Omokk, north of Mok'Doom; War Master Voone, at the bottom of Tazz'Alaor; Overlord Wyrmthalak, the last boss, in the Chamber of Battle. The documents lie in one of their rooms, or by Urok's tribute pile."] =
        "Hochlord Omokk, nördlich von Mok'Doom; Kriegsmeister Voone, unten in Tazz'Alaor; Oberanführer Wyrmthalak, der letzte Boss, in der Kammer der Schlacht. Die Dokumente liegen in einem ihrer Räume oder bei Uroks Tributhaufen.",
    ["Galamav the Marksman, Lexlort and Warlord Goretooth, at Kargath."] =
        "Galamav der Schütze, Lexlort und Kriegsherr Goretooth, in Kargath.",
    ["A herald of your capital: Harbinger Balthazad, Warcaller Gorlach or Bluff Runner Windstrider."] =
        "Ein Herold deiner Hauptstadt: Künder Balthazad, Kriegsrufer Gorlach oder Kliffläufer Windstrider.",
    ["Optional: a lead to Camp Mojache, about 1,500 XP."] =
        "Optional: ein Hinweis zum Camp Mojache, etwa 1.500 EP.",
    ["Talo Thornhoof, at Camp Mojache, in Feralas."] =
        "Talo Thornhoof, im Camp Mojache, in Feralas.",
    ["Talo Thornhoof and Sage Korolusk, at Camp Mojache."] =
        "Talo Thornhoof und Sage Korolusk, im Camp Mojache.",
    ["Talo Thornhoof, at Camp Mojache."] =
        "Talo Thornhoof, im Camp Mojache.",
    ["Sage Korolusk, at Camp Mojache."] =
        "Sage Korolusk, im Camp Mojache.",
    ["Harbinger Balthazad, in the Valley of Honor of Orgrimmar."] =
        "Künder Balthazad, im Tal der Ehre in Orgrimmar.",
    ["High Executor Derrington, at the Bulwark, in the Western Plaguelands."] =
        "Hochexekutor Derrington, im Bollwerk, in den Westlichen Pestländern.",
    ["Burn the Scarlet command tent between Felstone Field and Dalson's Tears, and plant the Scourge banner there."] =
        "Verbrenne das Kommandozelt der Scharlachroten zwischen dem Teufelssteinfeld und Dalsons Tränen und stell dort das Banner der Geißel auf.",
    ["Apothecary Dithers, at the Bulwark."] =
        "Apotheker Dithers, im Bollwerk.",
    ["Apothecary Dithers, at the Bulwark, in the Western Plaguelands."] =
        "Apotheker Dithers, im Bollwerk, in den Westlichen Pestländern.",
    ["Alexi Barov, at the Bulwark."] =
        "Alexi Barov, im Bollwerk.",
    ["The Barov fortune: four deeds inside the school; its follow-up sends you to kill Weldon Barov in the Alliance's Chillwind Camp."] =
        "Das Vermögen der Barovs: vier Besitzurkunden in der Schule; die Folgequest schickt dich, Weldon Barov im Lager Kühlwind der Allianz zu töten.",
    ["Weldon Barov stands among the guards of Chillwind Camp, the Alliance's camp in the west of the Western Plaguelands."] =
        "Weldon Barov steht zwischen den Wachen des Lagers Kühlwind, des Lagers der Allianz im Westen der Westlichen Pestländer.",
    ["Nathanos Blightcaller, at Marris Stead, in the south-west of the Eastern Plaguelands."] =
        "Nathanos Blightcaller, in Marris Siedlung, im Südwesten der Östlichen Pestländer.",
    ["Optional: Nathanos Blightcaller's chain in the Eastern Plaguelands, up to Ramstein the Gorger inside the city: about 6,600 XP at its end."] =
        "Optional: die Questreihe von Nathanos Blightcaller in den Östlichen Pestländern bis zu Ramstein dem Verschlinger in der Stadt: etwa 6.600 EP an ihrem Ende.",
    ["Corin's Crossing, to the east: collect the living rot in ten minutes, then grind it with the mortar."] =
        "Corins Kreuzung, im Osten: Sammle die lebendige Fäulnis innerhalb von zehn Minuten und zermahle sie dann mit dem Mörser.",
    ["The plaguebats of the Eastern Plaguelands."] =
        "Die Seuchenfledermäuse der Östlichen Pestländer.",
    ["The Quel'Thalas Registry lies in the Quel'Lithien lodge, on the northern border."] =
        "Die Quel'Thalas-Registratur liegt in der Jagdhütte von Quel'Lithien, an der Nordgrenze.",
    ["Duskwing, a bat, roams the country; Borelgore walks the northern wastes."] =
        "Dämmerschwinge, eine Fledermaus, streift durch das Land; Blutschlinger zieht durch die nördliche Ödnis.",
    ["Ramstein the Gorger comes into Slaughter Square once it is cleared."] =
        "Ramstein der Verschlinger kommt auf den Schlächterplatz, sobald dieser gesäubert ist.",
    ["Nathanos Blightcaller, at Marris Stead."] =
        "Nathanos Blightcaller, in Marris Siedlung.",
}
