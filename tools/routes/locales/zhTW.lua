-- Traditional Chinese (Taiwan) guide texts: [English text] = Chinese text, one entry per phrase
-- of the guides (zone names of the titles, route intros, automatic notes, hand-written notes).
-- tools/translate_guides.lua writes Ding/Locales/Guides/zhTW/ from it; a note joining several
-- phrases is translated phrase by phrase, and Chinese phrases are joined without a space: each
-- sentence ends with its own full-width stop. Zone, town and NPC names follow the Taiwanese
-- client. Keys: the English texts of the routes (tools/routes/*.lua), the automatic notes of
-- tools/draft_guide.lua and Ding/Guides/NightElf/01_Shadowglen.lua.
return {
    -- Shadowglen (hand-written guide)
    ["Shadowglen"] =
        "幽影谷",
    ["Both quest givers stand right in front of you, at the foot of Aldrassil."] =
        "兩名任務NPC就在正前方，位於奧達希爾樹下。",
    ["Young nightsabers and thistle boars all around Aldrassil: kill everything you come across."] =
        "奧達希爾四周都是小夜刃豹和草刺野豬：見到就殺。",
    ["Tarindrella stands a little southwest of Aldrassil (57.8, 45.2)."] =
        "塔琳德拉站在奧達希爾稍偏西南處(57.8, 45.2)。",
    ["The class trainers are inside Aldrassil."] =
        "職業訓練師在奧達希爾裡面。",
    ["Gilshalan needs level 3: if you are not there yet, Ding! will remind you before the cave."] =
        "基爾沙蘭的任務需要等級3：等級不夠的話，Ding!會在進洞穴前提醒。",
    ["One single loop: mangy nightsabers and boars to the north, moss on the grells, totems to the west (54, 40)."] =
        "繞一圈即可完成：北邊打癩皮夜刃豹和野豬，劣魔身上取魔苔，西邊找圖騰(54, 40)。",
    ["Iverron waits in front of the cave, to the north (54.6, 33)."] =
        "埃沃隆在北邊的洞穴前等候(54.6, 33)。",
    ["Spiders in the cave, right behind Iverron."] =
        "蜘蛛在洞穴裡，就在埃沃隆身後。",
    ["Githyiss the Vile, at the back of the cave (56.6, 26.3), may drop a fang: use it from your bags."] =
        "洞穴深處的邪惡的基塞伊斯(56.6, 26.3)可能掉落牙齒：從背包使用。",
    ["Back to Aldrassil: everything is turned in at the same place."] =
        "返回奧達希爾：所有任務都在同一處交付。",
    ["Mushrooms on the grells, lilies north of Aldrassil (57, 37), ichor on the spiders, egg at the back of the cave."] =
        "劣魔身上取蘑菇，奧達希爾北邊採百合花(57, 37)，蜘蛛身上取膿液，洞穴深處拿卵。",
    ["Iverron, still in front of the cave."] =
        "埃沃隆，依然在洞穴前。",
    ["Tenaron is at the very top of Aldrassil: follow the ramp that winds up around the trunk."] =
        "特納隆在奧達希爾最頂端：沿著繞樹幹盤旋而上的坡道走。",
    ["Fill the phial at the moonwell, to the northeast (60, 33)."] =
        "在東北方的月井裝滿水晶瓶(60, 33)。",
    ["Porthannius, on the road out of Shadowglen."] =
        "伯薩努斯，在離開幽影谷的路上。",
    ["Head for Dolanaar"] =
        "前往多蘭納爾",
    ["Follow the road south to the inn: both open quests are turned in at Dolanaar."] =
        "沿道路往南走到旅店：手上的兩個任務都在多蘭納爾交付。",
    -- human
    ["Northshire"] =
        "北郡",
    ["Everything happens around Northshire Abbey: follow the arrow from NPC to NPC."] =
        "一切都在北郡修道院周圍進行：跟著箭頭逐一找NPC。",
    ["Elwynn Forest"] =
        "艾爾文森林",
    ["Goldshire is your base for the whole forest: inn, class trainers and quests."] =
        "閃金鎮是整座森林的據點：旅店、職業訓練師和任務都在這裡。",
    ["Westfall"] =
        "西部荒野",
    ["Head west on the Goldshire road, then to Sentinel Hill in the middle of Westfall."] =
        "沿閃金鎮的道路往西，再前往西部荒野中央的哨兵嶺。",
    ["Loch Modan"] =
        "洛克莫丹",
    ["Take the Deeprun Tram from Stormwind to Ironforge, then the road east through Dun Morogh to Thelsamar."] =
        "從暴風城搭礦道地鐵到鐵爐堡，再沿東邊道路穿過丹莫洛前往塞爾薩瑪。",
    -- dwarf_gnome
    ["Coldridge Valley"] =
        "寒脊山谷",
    ["Everything starts in Coldridge: follow the arrow from NPC to NPC."] =
        "一切從寒脊山谷開始：跟著箭頭逐一找NPC。",
    ["Dun Morogh"] =
        "丹莫洛",
    ["Leave the valley through the tunnel to the northeast: Kharanos is your base for Dun Morogh."] =
        "經東北方的隧道離開山谷：卡拉諾斯是丹莫洛的據點。",
    ["Take the road east through the South Gate tunnel to Thelsamar."] =
        "沿東邊道路穿過南門隧道，前往塞爾薩瑪。",
    ["Deeprun Tram from Ironforge to Stormwind, then the road west through Goldshire to Sentinel Hill."] =
        "從鐵爐堡搭礦道地鐵到暴風城，再沿西邊道路經閃金鎮前往哨兵嶺。",
    -- nightelf
    ["Teldrassil"] =
        "泰達希爾",
    ["Dolanaar is your base for Teldrassil: inn, class trainers and most quests."] =
        "多蘭納爾是泰達希爾的據點：旅店、職業訓練師和大部分任務都在這裡。",
    ["Darkshore"] =
        "黑海岸",
    ["Rut'theran (portal at the foot of Darnassus), then the boat to Auberdine: your base on Darkshore."] =
        "經達納蘇斯底部的傳送門前往魯瑟蘭村，再搭船到黑海岸的據點奧伯丁。",
    ["Boat from Auberdine to Menethil Harbor, then the road east through the Wetlands to Loch Modan: Thelsamar is your base."] =
        "從奧伯丁搭船到米奈希爾港，再沿東邊道路穿過濕地前往洛克莫丹：據點是塞爾薩瑪。",
    -- alliance
    ["Redridge Mountains"] =
        "赤脊山",
    ["Redridge is east of Elwynn Forest: follow the road east to Lakeshire. Night Elves: boat from Auberdine to Menethil, Ironforge, then the tram to Stormwind."] =
        "赤脊山位於艾爾文森林東邊：沿東邊道路前往湖畔鎮。夜精靈：從奧伯丁搭船到米奈希爾港，經鐵爐堡，再搭地鐵到暴風城。",
    ["Duskwood"] =
        "暮色森林",
    ["Duskwood is south of Elwynn: Darkshire, in the east of the forest, is your base."] =
        "暮色森林位於艾爾文森林南邊：據點是森林東部的夜色鎮。",
    ["Wetlands"] =
        "濕地",
    ["The Wetlands are north of Loch Modan: Menethil Harbor, on the west coast, is your base."] =
        "濕地位於洛克莫丹北邊：據點是西岸的米奈希爾港。",
    ["Ashenvale"] =
        "梣谷",
    ["Boat from Menethil to Auberdine, then the road south to Ashenvale: Astranaar is your base."] =
        "從米奈希爾港搭船到奧伯丁，再沿南邊道路前往梣谷：據點是阿斯特蘭納。",
    ["Stonetalon Mountains"] =
        "石爪山脈",
    ["The Stonetalon Mountains are west of Ashenvale."] =
        "石爪山脈位於梣谷西邊。",
    ["Back to Astranaar for the last Ashenvale quests."] =
        "返回阿斯特蘭納，完成梣谷最後的任務。",
    ["Back to Duskwood for the end of its quests: Darkshire is still your base."] =
        "返回暮色森林完成剩下的任務：據點仍是夜色鎮。",
    ["Hillsbrad Foothills"] =
        "希爾斯布萊德丘陵",
    ["From Menethil, the road north crosses Thandol Span to the Foothills: Southshore is your base."] =
        "從米奈希爾港沿北邊道路經薩多爾大橋前往丘陵：據點是南海鎮。",
    ["Thousand Needles"] =
        "千針石林",
    ["Reach Thousand Needles through Theramore and the southern Barrens, or through Feralas; the goblin camp in the east is your base."] =
        "經塞拉摩和貧瘠之地南部，或經菲拉斯前往千針石林；據點是東邊的地精營地。",
    ["Desolace"] =
        "淒涼之地",
    ["Desolace is south of the Stonetalon Mountains: the Alliance base is in the northeast of the zone."] =
        "淒涼之地位於石爪山脈南邊：聯盟據點在區域東北部。",
    ["Stranglethorn Vale"] =
        "荊棘谷",
    ["Stranglethorn Vale is south of Duskwood: Rebel Camp in the north, Booty Bay in the south."] =
        "荊棘谷位於暮色森林南邊：北有反抗軍營地，南有藏寶海灣。",
    ["Arathi Highlands"] =
        "阿拉希高地",
    ["The Arathi Highlands are north of the Wetlands, across Thandol Span."] =
        "阿拉希高地位於濕地北邊，過薩多爾大橋即達。",
    ["Dustwallow Marsh"] =
        "塵泥沼澤",
    ["Boat from Menethil to Theramore, the Alliance base on the edge of the marsh."] =
        "從米奈希爾港搭船到塞拉摩，即沼澤邊緣的聯盟據點。",
    ["Badlands"] =
        "荒蕪之地",
    ["The Badlands are southeast of Loch Modan."] =
        "荒蕪之地位於洛克莫丹東南邊。",
    ["Swamp of Sorrows"] =
        "悲傷沼澤",
    ["The Swamp of Sorrows is east of Deadwind Pass, south of Redridge."] =
        "悲傷沼澤位於逆風小徑東邊、赤脊山南邊。",
    ["Back to Stranglethorn for the end of its quests, from Booty Bay."] =
        "返回荊棘谷，從藏寶海灣出發完成剩下的任務。",
    ["Tanaris"] =
        "塔納利斯",
    ["Gadgetzan, in the north of Tanaris, is your base. Boat from Booty Bay to Ratchet, or fly from Theramore."] =
        "據點是塔納利斯北部的加基森。從藏寶海灣搭船到棘齒城，或從塞拉摩搭乘飛行坐騎前往。",
    ["Feralas"] =
        "菲拉斯",
    ["The Alliance stronghold of Feralas is on an island west of the zone."] =
        "聯盟在菲拉斯的要塞位於區域西邊的島上。",
    ["The Hinterlands"] =
        "辛特蘭",
    ["The Hinterlands are northeast of Hillsbrad Foothills: the Wildhammer aerie is in the west."] =
        "辛特蘭位於希爾斯布萊德丘陵東北邊：蠻錘矮人的鷹巢山在西部。",
    ["Searing Gorge"] =
        "灼熱峽谷",
    ["Searing Gorge is south of Loch Modan, through the Badlands."] =
        "灼熱峽谷位於洛克莫丹南邊，經荒蕪之地前往。",
    ["Blasted Lands"] =
        "詛咒之地",
    ["Fly to the Blasted Lands, south of the Swamp of Sorrows: the Alliance keep in the north of the zone is your base."] =
        "飛往悲傷沼澤南邊的詛咒之地：區域北部的聯盟要塞就是你的據點。",
    ["Un'Goro Crater"] =
        "安戈洛環形山",
    ["Un'Goro Crater opens southwest of Tanaris: take the ramp down from Gadgetzan."] =
        "安戈洛環形山位於塔納利斯西南方：從加基森出發，沿坡道往下走。",
    ["Azshara"] =
        "艾薩拉",
    ["Azshara is east of Ashenvale."] =
        "艾薩拉位於梣谷東邊。",
    ["Felwood"] =
        "費伍德森林",
    ["Felwood is north of Ashenvale: the Alliance base is in the south of the zone."] =
        "費伍德森林位於梣谷北邊：聯盟據點在區域南部。",
    ["Burning Steppes"] =
        "燃燒平原",
    ["The Burning Steppes are north of Redridge: the Alliance camp is in the east of the zone."] =
        "燃燒平原位於赤脊山北邊：聯盟營地在區域東部。",
    ["Winterspring"] =
        "冬泉谷",
    ["Winterspring is northeast of Felwood: Everlook is your base."] =
        "冬泉谷位於費伍德森林東北邊：據點是永望鎮。",
    ["Western Plaguelands"] =
        "西瘟疫之地",
    ["The Western Plaguelands are north of Hillsbrad Foothills: the Alliance camp is in the south of the zone."] =
        "西瘟疫之地位於希爾斯布萊德丘陵北邊：聯盟營地在區域南部。",
    ["Eastern Plaguelands"] =
        "東瘟疫之地",
    ["The Eastern Plaguelands continue the Western ones to the east: Light's Hope Chapel is in the east."] =
        "東瘟疫之地緊接在西瘟疫之地東邊：聖光之願禮拜堂在東部。",
    ["Silithus"] =
        "希利蘇斯",
    ["Silithus is south of Un'Goro Crater: Cenarion Hold is in the north of the zone."] =
        "希利蘇斯位於安戈洛環形山南邊：塞納里奧城堡在區域北部。",
    -- orc_troll
    ["Valley of Trials"] =
        "試煉谷",
    ["Everything happens in the Valley of Trials: follow the arrow from NPC to NPC."] =
        "一切都在試煉谷進行：跟著箭頭逐一找NPC。",
    ["Durotar"] =
        "杜洛塔",
    ["Leave the valley by the road east, then north to Razor Hill: your base for Durotar."] =
        "沿東邊道路離開山谷，再往北前往杜洛塔的據點剃刀嶺。",
    ["The Barrens"] =
        "貧瘠之地",
    ["Cross the bridge west of Razor Hill into the Barrens, then follow the road to the Crossroads: your base."] =
        "過剃刀嶺西邊的橋進入貧瘠之地，再沿道路前往據點十字路口。",
    -- tauren
    ["Camp Narache"] =
        "納拉其營地",
    ["Everything starts at Camp Narache: follow the arrow from NPC to NPC."] =
        "一切從納拉其營地開始：跟著箭頭逐一找NPC。",
    ["Mulgore"] =
        "莫高雷",
    ["Follow the road north out of Camp Narache to Bloodhoof Village: your base for Mulgore."] =
        "從納拉其營地沿北邊道路前往莫高雷的據點血蹄村。",
    ["Leave Mulgore by the road east into the Barrens, then north to the Crossroads: your base."] =
        "沿東邊道路離開莫高雷進入貧瘠之地，再往北前往據點十字路口。",
    -- undead
    ["Deathknell"] =
        "喪鐘鎮",
    ["Everything starts in Deathknell: follow the arrow from NPC to NPC."] =
        "一切從喪鐘鎮開始：跟著箭頭逐一找NPC。",
    ["Tirisfal Glades"] =
        "提里斯法林地",
    ["Leave Deathknell by the road east to Brill: your base for Tirisfal Glades."] =
        "沿東邊道路離開喪鐘鎮，前往提里斯法林地的據點布瑞爾。",
    ["Silverpine Forest"] =
        "銀松森林",
    ["From Brill, take the road west then south over the bridge into Silverpine Forest: the Sepulcher is your base."] =
        "從布瑞爾沿道路往西，再往南過橋進入銀松森林：據點是瑟伯切爾。",
    ["Zeppelin from the towers outside Undercity to Orgrimmar, then the road west and south to the Crossroads: your base for the Barrens."] =
        "從幽暗城外的飛艇塔搭飛艇到奧格瑪，再沿道路往西、往南前往貧瘠之地的據點十字路口。",
    -- horde
    ["The Barrens and Stonetalon"] =
        "貧瘠之地與石爪山脈",
    ["The Crossroads, in the middle of the Barrens, is your base; the Stonetalon Mountains are west of the Barrens."] =
        "據點是貧瘠之地中央的十字路口；石爪山脈位於貧瘠之地西邊。",
    ["Ashenvale is north of the Barrens: Splintertree Post, in the east of the forest, is your base."] =
        "梣谷位於貧瘠之地北邊：據點是森林東部的碎木崗哨。",
    ["Zeppelin from the tower outside Orgrimmar to Undercity, then the road south through Silverpine Forest to Tarren Mill: your base."] =
        "從奧格瑪外的飛艇塔搭飛艇到幽暗城，再沿南邊道路穿過銀松森林，前往據點塔倫米爾。",
    ["Zeppelin back to Orgrimmar for the higher quests of the Barrens and the Stonetalon Mountains."] =
        "搭飛艇返回奧格瑪，進行貧瘠之地和石爪山脈等級較高的任務。",
    ["Thousand Needles is south of the Barrens, down the Great Lift: Freewind Post is your base."] =
        "千針石林位於貧瘠之地南邊，搭升降梯下去即達：據點是亂風崗。",
    ["Hillsbrad, Alterac and Arathi"] =
        "希爾斯布萊德、奧特蘭克與阿拉希",
    ["Zeppelin to Undercity, then Tarren Mill again; the Alterac Mountains are north of the Foothills, the Arathi Highlands east, with Hammerfall in the east of the highlands."] =
        "搭飛艇到幽暗城，再回到塔倫米爾；奧特蘭克山脈位於丘陵北邊，阿拉希高地在東邊，落錘鎮位於高地東部。",
    ["Desolace is south of the Stonetalon Mountains: the Horde village is on the west coast."] =
        "淒涼之地位於石爪山脈南邊：部落村莊在西岸。",
    ["Zeppelin from Orgrimmar to Grom'gol, the Horde camp in the north of Stranglethorn."] =
        "從奧格瑪搭飛艇到荊棘谷北部的部落據點格羅姆高營地。",
    ["Dustwallow and Thousand Needles"] =
        "塵泥沼澤與千針石林",
    ["Zeppelin back to Orgrimmar. Dustwallow Marsh is east of the southern Barrens, with Brackenwall Village in the north of the marsh; the Shimmering Flats are in the east of Thousand Needles."] =
        "搭飛艇返回奧格瑪。塵泥沼澤位於貧瘠之地南部的東邊，蕨牆村在沼澤北部；閃光平原在千針石林東部。",
    ["Back to the Arathi Highlands: Hammerfall is in the east of the zone."] =
        "返回阿拉希高地：落錘鎮在區域東部。",
    ["Fly from Hammerfall to Kargath, in the west of the Badlands."] =
        "從落錘鎮飛往荒蕪之地西部的卡加斯。",
    ["Back to Stranglethorn for the end of its quests, from Grom'gol and Booty Bay."] =
        "返回荊棘谷，從格羅姆高營地和藏寶海灣出發完成剩下的任務。",
    ["The Swamp of Sorrows is east of Deadwind Pass: Stonard is your base."] =
        "悲傷沼澤位於逆風小徑東邊：據點是斯通納德。",
    ["Feralas is west of Thousand Needles: Camp Mojache, in the east of the zone, is your base."] =
        "菲拉斯位於千針石林西邊：據點是區域東部的莫沙徹營地。",
    ["Gadgetzan, in the north of Tanaris, is your base: the road south through Thousand Needles, or the boat from Booty Bay to Ratchet."] =
        "據點是塔納利斯北部的加基森：沿南邊道路穿過千針石林，或從藏寶海灣搭船到棘齒城。",
    ["The Hinterlands are east of Hillsbrad Foothills: the Revantusk troll village is on the east coast."] =
        "辛特蘭位於希爾斯布萊德丘陵東邊：食人妖的惡齒村在東岸。",
    ["Searing Gorge is south of the Badlands: fly to Kargath, then the road south. The Burning Steppes are south of the gorge."] =
        "灼熱峽谷位於荒蕪之地南邊：飛往卡加斯，再沿南邊道路前往。燃燒平原位於峽谷南邊。",
    ["Azshara is east of Ashenvale: Valormok, in the southwest of the zone, is your base."] =
        "艾薩拉位於梣谷東邊：據點是區域西南部的瓦羅莫克。",
    ["Felwood is north of Ashenvale: the Horde post is in the west of the zone."] =
        "費伍德森林位於梣谷北邊：部落崗哨在區域西部。",
    ["The Western Plaguelands are east of Tirisfal Glades: the Bulwark guards the border, east of Brill."] =
        "西瘟疫之地位於提里斯法林地東邊：亡靈壁壘守衛著布瑞爾東邊的邊界。",
    -- automatic notes
    ["If the starting item dropped: use it from your bags."] =
        "若掉落了開始任務的物品：從背包使用。",
    ["Human"] =
        "人類",
    ["Dwarf and Gnome"] =
        "矮人和地精",
    ["Night Elf"] =
        "夜精靈",
    ["Orc and Troll"] =
        "獸人和食人妖",
    ["Tauren"] =
        "牛頭人",
    ["Undead"] =
        "不死族",
    ["Alliance"] =
        "聯盟",
    ["Horde"] =
        "部落",
    ["From here the guide moves between zones by itself: the first step in a zone says how to get there."] =
        "從這裡開始，指南會自動在區域之間切換：每個區域的第一步會告訴你怎麼去。",
    ["Shortcut: let monsters kill you, release your spirit and come back to life at the spirit healer, then go on."] =
        "捷徑：讓怪物殺死你，釋放靈魂，在靈魂醫者處復活，然後繼續。",
    ["Finish the level on nearby monsters before moving on."] =
        "先在附近打怪升完這一級再繼續。",
    -- Ding - Leveling (Leveling routes): notes, step texts and section titles
    ["Human start"] =
        "人類起始區",
    ["Night Elf start"] =
        "夜精靈起始區",
    ["Tauren start"] =
        "牛頭人起始區",
    ["Undead start"] =
        "不死族起始區",
    -- Skyborne start (tools/routes/skyborne.lua)
    ["Skyborne start"] =
        "Skyborne起始區",
    ["Everything starts on Zephras Isle: follow the arrow from NPC to NPC."] =
        "一切從Zephras Isle開始：跟著箭頭逐一找NPC。",
    -- Ding - Leveling (Leveling routes): notes of the goal and condition steps
    -- Ding - Leveling: how each section begins (tools/routes/leveling/travel.lua)
    ["Elwynn Forest: Northshire Abbey, where every human starts."] =
        "艾爾文森林：北郡修道院，所有人類的起點。",
    ["Dun Morogh: Coldridge Valley, where dwarves and gnomes start."] =
        "丹莫洛：寒脊山谷，矮人和地精的起點。",
    ["Teldrassil: Shadowglen, where night elves start."] =
        "泰達希爾：幽影谷，夜精靈的起點。",
    ["Travel to Westfall"] =
        "前往西部荒野",
    ["Westfall: Sentinel Hill is the hub, in the middle of the zone. The first stop is the farm in the north."] =
        "西部荒野：據點是區域中央的哨兵嶺。第一站是北部的農場。",
    ["Travel to Auberdine"] =
        "前往奧伯丁",
    ["Darkshore: Auberdine, the port on the west coast."] =
        "黑海岸：奧伯丁，西岸的港口。",
    ["Travel to Thelsamar"] =
        "前往塞爾薩瑪",
    ["Loch Modan: Thelsamar, on the road in the west of the zone."] =
        "洛克莫丹：塞爾薩瑪，位於區域西部的道路上。",
    ["Travel to Redridge Mountains"] =
        "前往赤脊山",
    ["Redridge Mountains: Lakeshire is the hub, by the lake. The first stop is the western pass from Elwynn Forest."] =
        "赤脊山：據點是湖邊的湖畔鎮。第一站是從艾爾文森林進來的西側山口。",
    ["Ashenvale: Maestra's Post in the west, then Astranaar in the middle of the zone."] =
        "梣谷：先到西部的邁斯特拉崗哨，再到區域中央的阿斯特蘭納。",
    ["Travel to Menethil Harbor"] =
        "前往米奈希爾港",
    ["Wetlands: Menethil Harbor, on the west coast."] =
        "濕地：米奈希爾港，位於西岸。",
    ["Travel to Darkshire"] =
        "前往夜色鎮",
    ["Duskwood: Darkshire, in the east of the zone."] =
        "暮色森林：夜色鎮，位於區域東部。",
    ["Travel to Stonetalon Peak"] =
        "前往石爪峰",
    ["Stonetalon Mountains: Stonetalon Peak, in the far north of the zone."] =
        "石爪山脈：石爪峰，位於區域最北端。",
    ["Stormwind first, then Duskwood and Stranglethorn Vale."] =
        "先到暴風城，再前往暮色森林和荊棘谷。",
    ["Travel to Southshore"] =
        "前往南海鎮",
    ["Hillsbrad Foothills: Southshore, on the coast in the south."] =
        "希爾斯布萊德丘陵：南海鎮，位於南部海岸。",
    ["Dustwallow Marsh: Theramore Isle, off the east coast."] =
        "塵泥沼澤：塞拉摩島，位於東岸外海。",
    ["Travel to Booty Bay"] =
        "前往藏寶海灣",
    ["Stranglethorn Vale: Booty Bay, at the southern tip. The boat from Ratchet lands there."] =
        "荊棘谷：藏寶海灣，位於最南端。從棘齒城出發的船會在這裡靠岸。",
    ["Desolace: Nijel's Point, in the north-east corner, is the Alliance hub."] =
        "淒涼之地：東北角的尼耶爾前哨站是聯盟據點。",
    ["Stranglethorn Vale: Booty Bay, at the southern tip."] =
        "荊棘谷：藏寶海灣，位於最南端。",
    ["Stormwind first, then the Swamp of Sorrows."] =
        "先到暴風城，再前往悲傷沼澤。",
    ["Travel to Refuge Pointe"] =
        "前往避難谷地",
    ["Arathi Highlands: Refuge Pointe, in the middle of the zone."] =
        "阿拉希高地：避難谷地，位於區域中央。",
    ["Stormwind first, then Dustwallow Marsh: Theramore Isle."] =
        "先到暴風城，再前往塵泥沼澤：塞拉摩島。",
    ["Travel to Nijel's Point"] =
        "前往尼耶爾前哨站",
    ["Desolace: Nijel's Point, in the north-east corner."] =
        "淒涼之地：尼耶爾前哨站，位於東北角。",
    ["Ironforge first, then the Badlands."] =
        "先到鐵爐堡，再前往荒蕪之地。",
    ["Travel to Stormwind"] =
        "前往暴風城",
    ["Stormwind first, then Stranglethorn Vale."] =
        "先到暴風城，再前往荊棘谷。",
    ["Duskwood: Darkshire first, then the Swamp of Sorrows."] =
        "暮色森林：先到夜色鎮，再前往悲傷沼澤。",
    ["Travel to Gadgetzan"] =
        "前往加基森",
    ["Tanaris: Gadgetzan, in the north of the zone."] =
        "塔納利斯：加基森，位於區域北部。",
    ["Tanaris: Gadgetzan first, then Feralas: Feathermoon Stronghold."] =
        "塔納利斯：先到加基森，再前往菲拉斯：羽月要塞。",
    ["Travel to Aerie Peak"] =
        "前往鷹巢山",
    ["The Hinterlands: Aerie Peak, in the west of the zone."] =
        "辛特蘭：鷹巢山，位於區域西部。",
    ["Travel to Un'Goro Crater"] =
        "前往安戈洛環形山",
    ["Un'Goro Crater: Marshal's Refuge is the hub, in the north. The first stop is in the south-east."] =
        "安戈洛環形山：據點是北部的馬紹爾營地。第一站在東南部。",
    ["Travel to Thorium Point"] =
        "前往瑟銀哨塔",
    ["Searing Gorge: Thorium Point, in the north-west of the zone."] =
        "灼熱峽谷：瑟銀哨塔，位於區域西北部。",
    ["Travel to Nethergarde Keep"] =
        "前往守望堡",
    ["Blasted Lands: Nethergarde Keep, in the north-east, then the Burning Steppes."] =
        "詛咒之地：先到東北部的守望堡，再前往燃燒平原。",
    ["Travel to Chillwind Camp"] =
        "前往冰風崗",
    ["Western Plaguelands: Chillwind Camp, in the south of the zone."] =
        "西瘟疫之地：冰風崗，位於區域南部。",
    ["Travel to Rut'theran Village"] =
        "前往魯瑟蘭村",
    ["Teldrassil: Rut'theran Village first, then Azshara and Felwood."] =
        "泰達希爾：先到魯瑟蘭村，再前往艾薩拉和費伍德森林。",
    ["Travel to Feathermoon Stronghold"] =
        "前往羽月要塞",
    ["Feralas: Feathermoon Stronghold, on the island off the west coast."] =
        "菲拉斯：羽月要塞，位於西岸外海的島上。",
    ["Tanaris: Gadgetzan first, then Un'Goro Crater."] =
        "塔納利斯：先到加基森，再前往安戈洛環形山。",
    ["Travel to Emerald Sanctuary"] =
        "前往翡翠聖地",
    ["Felwood: Emerald Sanctuary, in the south of the zone."] =
        "費伍德森林：翡翠聖地，位於區域南部。",
    ["Ironforge first, then the Burning Steppes: Morgan's Vigil, in the east."] =
        "先到鐵爐堡，再前往燃燒平原：東部的摩根崗哨。",
    ["Travel to Ironforge"] =
        "前往鐵爐堡",
    ["Ironforge first, then the Plaguelands: Chillwind Camp and Light's Hope Chapel."] =
        "先到鐵爐堡，再前往瘟疫之地：冰風崗和聖光之願禮拜堂。",
    ["Winterspring: Everlook, in the middle of the zone."] =
        "冬泉谷：永望鎮，位於區域中央。",
    ["Travel to Silithus"] =
        "前往希利蘇斯",
    ["Silithus: Valor's Rest, in the north-east, then Cenarion Hold."] =
        "希利蘇斯：先到東北部的勇士之墓，再前往塞納里奧城堡。",
    ["Tirisfal Glades: Deathknell, where the undead rise."] =
        "提里斯法林地：喪鐘鎮，不死族甦醒之地。",
    ["Mulgore: Camp Narache, where tauren start."] =
        "莫高雷：納拉其營地，牛頭人的起點。",
    ["Durotar: the Valley of Trials, where orcs and trolls start."] =
        "杜洛塔：試煉谷，獸人和食人妖的起點。",
    ["Travel to Silverpine Forest"] =
        "前往銀松森林",
    ["Silverpine Forest: the Sepulcher is the hub, in the middle. The first stop is on the road in the north."] =
        "銀松森林：據點是中央的瑟伯切爾。第一站在北部的道路上。",
    ["Travel to Razor Hill"] =
        "前往剃刀嶺",
    ["Durotar: Razor Hill first, then the Barrens: the Crossroads, and Stonetalon Mountains."] =
        "杜洛塔：先到剃刀嶺，再前往貧瘠之地：十字路口，然後是石爪山脈。",
    ["Ashenvale: Splintertree Post, in the east of the zone. The way in is the tunnel from Stonetalon."] =
        "梣谷：碎木崗哨，位於區域東部。從石爪山脈的隧道進入。",
    ["Travel to the Undercity"] =
        "前往幽暗城",
    ["Undercity first, then Hillsbrad Foothills: Tarren Mill."] =
        "先到幽暗城，再前往希爾斯布萊德丘陵：塔倫米爾。",
    ["Thunder Bluff first, then the Barrens."] =
        "先到雷霆崖，再前往貧瘠之地。",
    ["Travel to Sun Rock Retreat"] =
        "前往烈日石居",
    ["Stonetalon Mountains: Sun Rock Retreat, in the middle of the zone."] =
        "石爪山脈：烈日石居，位於區域中央。",
    ["Travel to the Crossroads"] =
        "前往十字路口",
    ["The Barrens: the Crossroads first, then Ashenvale: Splintertree Post."] =
        "貧瘠之地：先到十字路口，再前往梣谷：碎木崗哨。",
    ["Travel to Camp Taurajo"] =
        "前往陶拉祖營地",
    ["The Barrens: Camp Taurajo first, then Thousand Needles: Freewind Post."] =
        "貧瘠之地：先到陶拉祖營地，再前往千針石林：亂風崗。",
    ["Arathi Highlands: Hammerfall, in the east of the zone."] =
        "阿拉希高地：落錘鎮，位於區域東部。",
    ["Thousand Needles: Freewind Post, on the mesas in the middle of the zone."] =
        "千針石林：亂風崗，位於區域中央的台地上。",
    ["Travel to Desolace"] =
        "前往淒涼之地",
    ["Desolace: Ghost Walker Post is the hub, in the middle of the zone."] =
        "淒涼之地：據點是區域中央的鬼旅崗哨。",
    ["Travel to Grom'gol Base Camp"] =
        "前往格羅姆高營地",
    ["Stranglethorn Vale: Grom'gol Base Camp, on the west coast. The zeppelin from Orgrimmar lands there."] =
        "荊棘谷：格羅姆高營地，位於西岸。從奧格瑪出發的飛艇會在這裡降落。",
    ["Orgrimmar first, then Dustwallow Marsh: Brackenwall Village."] =
        "先到奧格瑪，再前往塵泥沼澤：蕨牆村。",
    ["Travel to Tarren Mill"] =
        "前往塔倫米爾",
    ["Hillsbrad Foothills: Tarren Mill first, then Alterac Mountains and Arathi Highlands."] =
        "希爾斯布萊德丘陵：先到塔倫米爾，再前往奧特蘭克山脈和阿拉希高地。",
    ["Travel to the Badlands"] =
        "前往荒蕪之地",
    ["Badlands: Kargath, at the western edge, is the Horde hub."] =
        "荒蕪之地：西緣的卡加斯是部落據點。",
    ["Travel to Ratchet"] =
        "前往棘齒城",
    ["The Barrens: Ratchet first, then Stranglethorn Vale and the Swamp of Sorrows: Stonard."] =
        "貧瘠之地：先到棘齒城，再前往荊棘谷和悲傷沼澤：斯通納德。",
    ["Travel to Shadowprey Village"] =
        "前往葬影村",
    ["Desolace: Shadowprey Village, on the west coast."] =
        "淒涼之地：葬影村，位於西岸。",
    ["Travel to Brackenwall Village"] =
        "前往蕨牆村",
    ["Dustwallow Marsh: Brackenwall Village, in the north-west of the zone."] =
        "塵泥沼澤：蕨牆村，位於區域西北部。",
    ["Travel to Camp Mojache"] =
        "前往莫沙徹營地",
    ["Feralas: Camp Mojache, in the east of the zone."] =
        "菲拉斯：莫沙徹營地，位於區域東部。",
    ["Stranglethorn Vale: Grom'gol Base Camp, on the west coast."] =
        "荊棘谷：格羅姆高營地，位於西岸。",
    ["Travel to the Swamp of Sorrows"] =
        "前往悲傷沼澤",
    ["Swamp of Sorrows: Stonard is the hub, in the middle of the zone."] =
        "悲傷沼澤：據點是區域中央的斯通納德。",
    ["Travel to the Shimmering Flats"] =
        "前往閃光平原",
    ["Thousand Needles: the Shimmering Flats first, then Tanaris and Dustwallow Marsh."] =
        "千針石林：先到閃光平原，再前往塔納利斯和塵泥沼澤。",
    ["Undercity first, then the Hinterlands: Revantusk Village."] =
        "先到幽暗城，再前往辛特蘭：惡齒村。",
    ["Feralas: Camp Mojache first, then Un'Goro Crater."] =
        "菲拉斯：先到莫沙徹營地，再前往安戈洛環形山。",
    ["Stranglethorn Vale: Booty Bay first, then the Swamp of Sorrows."] =
        "荊棘谷：先到藏寶海灣，再前往悲傷沼澤。",
    ["Travel to the Blasted Lands"] =
        "前往詛咒之地",
    ["Blasted Lands: the first stop is at the northern entrance, by the Swamp of Sorrows."] =
        "詛咒之地：第一站在北側入口，靠近悲傷沼澤。",
    ["Travel to Kargath"] =
        "前往卡加斯",
    ["Badlands: Kargath first, at the western edge, then the Searing Gorge."] =
        "荒蕪之地：先到西緣的卡加斯，再前往灼熱峽谷。",
    ["Burning Steppes: Flame Crest, in the east. The way in is through Blackrock Mountain."] =
        "燃燒平原：烈焰峰，位於東部。從黑石山進入。",
    ["Travel to Valormok"] =
        "前往瓦羅莫克",
    ["Azshara: Valormok, in the west of the zone."] =
        "艾薩拉：瓦羅莫克，位於區域西部。",
    ["Travel to Bloodvenom Post"] =
        "前往血毒崗哨",
    ["Felwood: Bloodvenom Post, in the west of the zone."] =
        "費伍德森林：血毒崗哨，位於區域西部。",
    ["Undercity first, then the Plaguelands."] =
        "先到幽暗城，再前往瘟疫之地。",
    -- Ding - Leveling: notes, labels and titles of the Leveling routes, in our wording
    ["This frees room in your bags."] =
        "這能騰出背包空間。",
    ["You receive one further along the route."] =
        "路線後面會拿到一個。",
    ["Pick up anything that sells for 10 copper or more."] =
        "拾取所有能賣10銅幣以上的物品。",
    ["You'll level faster with this."] =
        "這能讓你升級更快。",
    ["The NPC is outdoors, right beside the structure."] =
        "NPC在室外，就在建築旁邊。",
    ["Skip the foes and dash into the tent."] =
        "略過敵人，直接衝進帳篷。",
    ["Foes cannot strike you from there."] =
        "敵人在那裡打不到你。",
    ["Widen the camera view."] =
        "拉遠鏡頭視野。",
    ["Recall to your bind point in Northshire Valley"] =
        "用爐石回到北郡山谷的綁定點",
    ["The NPC is indoors."] =
        "NPC在室內。",
    ["The NPC is indoors at street level."] =
        "NPC在室內，位於地面層。",
    ["The quest giver stands outdoors, not indoors."] =
        "任務NPC站在室外，不在室內。",
    ["With the coming hand-ins, this brings you to level 4."] =
        "加上接下來的交任務，這會讓你升到4級。",
    ["The NPC is indoors, on the central storey."] =
        "NPC在室內的中間樓層。",
    ["The objective is underground, in the mine shaft."] =
        "目標在地下的礦井裡。",
    ["The targets roam the mine and the area around it."] =
        "目標在礦坑內外一帶遊蕩。",
    ["Exit the mine shaft"] =
        "離開礦井",
    ["The quest giver stands outdoors at the back of the building."] =
        "任務NPC站在建築後方的室外。",
    ["The NPC is out back, at the rear of the structure."] =
        "NPC在外面，位於建築後方。",
    ["The NPC stands by the horse stalls."] =
        "NPC站在馬廄旁。",
    ["Look for wooden pails."] =
        "尋找木製水桶。",
    ["Leave it out if other players crowd the area."] =
        "如果這一帶擠滿其他玩家，就略過。",
    ["With the coming hand-ins, this gets you to level 6."] =
        "加上接下來的交任務，這會讓你升到6級。",
    ["Climb to the highest floor of the building."] =
        "爬到建築的最頂樓。",
    ["The NPC waits on the lower level, indoors."] =
        "NPC在室內的下層。",
    ["The NPC is indoors, one floor up."] =
        "NPC在室內的樓上一層。",
    ["Heal Guard Roberts using Lesser Heal (Rank 2)."] =
        "用次級治療術（等級2）治療衛兵羅伯茲。",
    ["Buff Guard Roberts with Power Word: Fortitude."] =
        "對衛兵羅伯茲施放真言術：韌。",
    ["Do it only if you can."] =
        "能做到才做。",
    ["Go into the mine"] =
        "進入礦坑",
    ["Stay on the trail through the mine"] =
        "沿著小路穿過礦坑",
    ["This one roams, so scan the surrounding area."] =
        "這個會四處走動，留意周圍一帶。",
    ["Together with the next turn-ins, this brings you to level 8."] =
        "加上接下來的交任務，這會讓你升到8級。",
    ["Die on purpose at this spot"] =
        "在這個位置故意死亡",
    ["Die to the monsters here on purpose."] =
        "故意讓這裡的怪物殺死你。",
    ["Dying costs you nothing this early."] =
        "在這麼早期死亡沒有任何損失。",
    ["This is the quickest way over."] =
        "這是過去最快的方法。",
    ["Get yourself killed, then resurrect with the spirit healer"] =
        "讓自己被殺，然後在靈魂醫者處復活",
    ["Look for little stacks of brown wood."] =
        "尋找棕色的小木柴堆。",
    ["Look around tree trunks at ground level."] =
        "在地面的樹幹周圍找。",
    ["The targets are wolves."] =
        "目標是狼。",
    ["The following step may be hard."] =
        "下一步可能很難。",
    ["One extra level makes it easier."] =
        "多升一級會比較輕鬆。",
    ["With the coming turn-ins, this gets you to level 10."] =
        "加上接下來的交任務，這會讓你升到10級。",
    ["The NPC waits outside, at the building's front."] =
        "NPC在室外，位於建築正前方。",
    ["Fly to Lakeshire"] =
        "飛往湖畔鎮",
    ["Stay on the road and watch for danger."] =
        "沿著道路走，小心危險。",
    ["Foes in this area outlevel you."] =
        "這一帶的敵人等級比你高。",
    ["Let the conversation play out."] =
        "讓對話播完。",
    ["Your targets here are gnolls."] =
        "這裡的目標是豺狼人。",
    ["Fly to Sentinel Hill"] =
        "飛往哨兵嶺",
    ["Fly to Stormwind City"] =
        "飛往暴風城",
    ["Head indoors"] =
        "進入室內",
    ["Step onto the pink rune."] =
        "站上粉紅色的符文。",
    ["Look within the tomb."] =
        "在墓穴裡面找。",
    ["The NPC stands one level over the crypt."] =
        "NPC站在地穴上方一層。",
    ["Be ready for a fight right away."] =
        "準備好立刻戰鬥。",
    ["The NPC waits indoors, a floor above the entrance."] =
        "NPC在室內，位於入口的上一層。",
    ["Head down into the Deeprun Tram station"] =
        "往下進入礦道地鐵車站",
    ["Pass through the portal to teleport."] =
        "穿過傳送門進行傳送。",
    ["Take the Deeprun Tram over to Ironforge."] =
        "搭礦道地鐵前往鐵爐堡。",
    ["The NPC stands by the wall on the central platform."] =
        "NPC站在中央月台的牆邊。",
    ["Target the Deeprun Rats with the item."] =
        "對礦道老鼠使用這個物品。",
    ["Look for little gray rodents."] =
        "尋找灰色的小老鼠。",
    ["Head to the Deeprun Tram's Ironforge platform."] =
        "前往礦道地鐵的鐵爐堡月台。",
    ["Fly to Ironforge"] =
        "飛往鐵爐堡",
    ["Stay on the trail"] =
        "沿著小路走",
    ["Steer clear of the elite yeti patrolling close by."] =
        "避開在附近巡邏的精英雪人。",
    ["The NPC is up on the summit."] =
        "NPC在山頂上。",
    ["Let the elite yeti stroll off before you go near."] =
        "等精英雪人走開再靠近。",
    ["Your objective lies in a little cavern."] =
        "目標在一個小洞穴裡。",
    ["Go quickly, time is short."] =
        "動作快，時間不多。",
    ["Go into the cavern"] =
        "進入洞穴",
    ["Head to the lower level of the cavern."] =
        "前往洞穴的下層。",
    ["Targets are in the cavern and around its entrance too."] =
        "目標在洞穴裡，入口周圍也有。",
    ["Head out of the cave"] =
        "離開洞穴",
    ["Climb the trail"] =
        "沿小路往上爬",
    ["Once in the Wetlands, head north."] =
        "進入濕地後往北走。",
    ["Leap down from the ledge."] =
        "從崖邊跳下去。",
    ["This makes Menethil Harbor quicker to get to."] =
        "這樣能更快抵達米奈希爾港。",
    ["Keep climbing the trail"] =
        "沿小路繼續往上爬",
    ["Take the trail downhill"] =
        "沿小路下坡",
    ["Fly to Menethil Harbor"] =
        "飛往米奈希爾港",
    ["Your targets are within the cavern."] =
        "目標在洞穴裡。",
    ["Without this, one quest can't be picked up."] =
        "沒有這個就無法接其中一個任務。",
    ["The NPC is past the tunnel; stay on the road."] =
        "NPC在隧道另一頭；沿著道路走。",
    ["The target is a pale bear."] =
        "目標是一隻淺色的熊。",
    ["Cross the tunnel to reach the NPC."] =
        "穿過隧道去找NPC。",
    ["Fly to Thelsamar"] =
        "飛往塞爾薩瑪",
    ["The NPC patrols a long route; look along it."] =
        "NPC沿著一條很長的路線巡邏；沿路尋找。",
    ["The targets are rat-like humanoids."] =
        "目標是像老鼠的人形生物。",
    ["Hunt spiders for it."] =
        "獵殺蜘蛛取得。",
    ["Take the road to where the trail starts"] =
        "沿著道路走到小路起點",
    ["A class quest coming up requires this."] =
        "接下來的職業任務需要這個。",
    ["Exit Stonesplinter Valley, then stay on the road"] =
        "離開碎石怪之谷，然後沿著道路走",
    ["The NPC waits on the tower's highest floor."] =
        "NPC在塔的最頂層。",
    ["Head up the incline"] =
        "走上斜坡",
    ["Dwarf and Gnome start"] =
        "矮人和地精起始區",
    ["Step back outside"] =
        "回到室外",
    ["They are rare and scattered widely."] =
        "數量稀少，分布很廣。",
    ["Pass through the tunnel, then stay on the road"] =
        "穿過隧道，然後沿著道路走",
    ["Heal Mountaineer Dolf with Lesser Heal (Rank 2)."] =
        "用次級治療術（等級2）治療巡山人多爾夫。",
    ["Buff Mountaineer Dolf with Power Word: Fortitude."] =
        "對巡山人多爾夫施放真言術：韌。",
    ["The quest wants yetis; seek them out."] =
        "任務需要雪人；去找牠們。",
    ["Look for the timber baskets."] =
        "尋找木籃。",
    ["Any spot around Brewnall Village works."] =
        "Brewnall Village周圍任何位置都可以。",
    ["Give it a few seconds."] =
        "等幾秒鐘。",
    ["Target one Large Crag Boar with it."] =
        "對一隻大峭壁野豬使用。",
    ["Use it on any Snow Leopard."] =
        "對任意一隻雪豹使用。",
    ["Target any Ice Claw Bear with the item."] =
        "對任意一隻冰爪熊使用這個物品。",
    ["Keep it as pet food for later."] =
        "留著之後當寵物食物。",
    ["Find one Ice Claw Bear and use Tame Beast on it."] =
        "找一隻冰爪熊，對牠施放馴服野獸。",
    ["Push eastward if you still need more."] =
        "如果還不夠，就繼續往東走。",
    ["Hold on to it: a Paladin task coming up uses it."] =
        "留著它：接下來的聖騎士任務會用到。",
    ["Keep to the road as it crosses the underground passages."] =
        "沿著道路穿過地下通道。",
    ["The NPC can be indoors or out."] =
        "NPC可能在室內，也可能在室外。",
    ["Take the Deeprun Tram over to Stormwind City."] =
        "搭礦道地鐵前往暴風城。",
    ["Flight master in Stormwind"] =
        "暴風城的飛行管理員",
    ["The NPC roams a wide loop; look along it."] =
        "NPC沿著一大圈路線走動；沿路尋找。",
    ["You likely gathered 10 Linen Cloth already."] =
        "你應該已經收集到10塊亞麻布了。",
    ["Narm Faulk lies dead; use the item on his body."] =
        "納姆·法奧克已經死了；對他的屍體使用這個物品。",
    ["Wait for the talking to finish"] =
        "等對話結束",
    ["Climb the big ramp"] =
        "走上大斜坡",
    ["The NPC stands high in the great tree."] =
        "NPC站在大樹的高處。",
    ["The NPC stands in an adjoining chamber."] =
        "NPC站在隔壁的房間裡。",
    ["The targets are imps."] =
        "目標是小鬼。",
    ["Look for groups of pink fungi."] =
        "尋找成叢的粉紅色蘑菇。",
    ["Mostly found beside tree trunks."] =
        "大多在樹幹旁邊。",
    ["Look for big orange blossoms."] =
        "尋找橘色的大花。",
    ["Climb to the cave's upper level."] =
        "爬到洞穴的上層。",
    ["The NPC stands at the summit of the great tree."] =
        "NPC站在大樹的頂端。",
    ["Heal Sentinel Shaya with Lesser Heal (Rank 2)."] =
        "用次級治療術（等級2）治療哨兵莎恩雅。",
    ["Buff Sentinel Shaya with Power Word: Fortitude."] =
        "對哨兵莎恩雅施放真言術：韌。",
    ["Pick up 5 Earthroot while questing."] =
        "做任務時採集5株地根草。",
    ["A class quest further on requires this."] =
        "後面的職業任務需要這個。",
    ["Look for brown clumps of roots."] =
        "尋找棕色的根團。",
    ["Kill black-furred tigers."] =
        "擊殺黑毛的老虎。",
    ["The targets are spiders with green bodies."] =
        "目標是綠色身體的蜘蛛。",
    ["Look for little brown pinecones giving off green smoke."] =
        "尋找冒著綠煙的棕色小松果。",
    ["The target is a satyr."] =
        "目標是一個薩特。",
    ["The targets are spread over several spots."] =
        "目標分散在好幾個地點。",
    ["With the coming hand-ins, this gets you to level 9."] =
        "加上接下來的交任務，這會讓你升到9級。",
    ["At this spot or a bit to the east."] =
        "在這個位置或稍微偏東。",
    ["The NPC patrols the road; look along it."] =
        "NPC沿著道路巡邏；沿路尋找。",
    ["For this quest you guard an NPC on the move."] =
        "這個任務要護送一名移動中的NPC。",
    ["If she is absent, wait for her to reappear."] =
        "如果她不在，等她重生。",
    ["Move fast: the clock is ticking on this one."] =
        "動作快：這個任務有時間限制。",
    ["Kill harpies."] =
        "擊殺鷹身人。",
    ["Step into the cavern within the trunk"] =
        "進入樹幹裡的洞穴",
    ["The spot is on the lower floor of the hollow tree."] =
        "位置在空心樹的下層。",
    ["Don't forget to train Pick Pocket."] =
        "別忘了學偷竊。",
    ["Keep it; an upcoming task asks for it."] =
        "留著它；接下來的任務會需要。",
    ["Fly to Moonglade"] =
        "飛往月光林地",
    ["Target a Webwood Lurker with it."] =
        "對一隻樹林潛伏者使用。",
    ["Aim the item at any Nightsaber Stalker."] =
        "對任意一隻夜刃捕食者使用這個物品。",
    ["The beasts are leopards with blue fur."] =
        "這些野獸是藍毛的豹。",
    ["Aim the item at one Strigid Screecher."] =
        "對一隻巨翼惡梟使用這個物品。",
    ["Target the owls here."] =
        "目標是這裡的貓頭鷹。",
    ["You need to stand close to this spot."] =
        "你需要站在這個位置附近。",
    ["Go into the hollow tree's cavern"] =
        "進入空心樹的洞穴",
    ["The target is a big gray spider."] =
        "目標是一隻灰色大蜘蛛。",
    ["Target Sethir the Ancient and use Pickpocket."] =
        "選中遠古的塞希爾，然後使用偷竊。",
    ["The target is a violet satyr."] =
        "目標是一個紫色的薩特。",
    ["The NPC waits here, then strolls out onto the big branch close by."] =
        "NPC在這裡等，然後走到附近的大樹枝上。",
    ["Fight the elementals of the swamp."] =
        "與沼澤的元素生物戰鬥。",
    ["Use Herbalism's Track Herbs to spot them."] =
        "使用草藥學的尋找草藥來找到它們。",
    ["Pick these up while questing around Teldrassil."] =
        "在泰達希爾做任務時順便採集。",
    ["Get your Herbalism skill to 15."] =
        "將草藥學技能提升到15。",
    ["Together with the next turn-ins, this brings you to level 11."] =
        "加上接下來的交任務，這會讓你升到11級。",
    ["Circle the mountain, then climb the trail"] =
        "繞過山，然後沿小路往上爬",
    ["The NPC stands on the highest level of this structure."] =
        "NPC站在這座建築的最高層。",
    ["Flight master in Auberdine"] =
        "奧伯丁的飛行管理員",
    ["Your pet will need this food shortly."] =
        "你的寵物很快就需要這些食物。",
    ["Hunt the crabs."] =
        "獵殺螃蟹。",
    ["You'll find extra ones swimming nearby as well."] =
        "附近水裡也有更多在游動。",
    ["Use the item on any Rabid Thistle Bear."] =
        "對任意一隻狂暴薊熊使用這個物品。",
    ["The targets are bears with grey fur."] =
        "目標是灰毛的熊。",
    ["Keep from damaging the creature."] =
        "不要傷害這隻生物。",
    ["Your targets sit below the water's surface."] =
        "目標在水面下。",
    ["Avoid slaying the satyrs if you can."] =
        "盡量不要殺死薩特。",
    ["You'll need this for the following quest."] =
        "下一個任務會需要這個。",
    ["Hunt down satyrs."] =
        "獵殺薩特。",
    ["Big birds that roam on foot."] =
        "用腳走動的大鳥。",
    ["Make your way to the Gates of Ironforge"] =
        "前往鐵爐堡大門",
    ["Swim to precisely this point, then from the game menu pick Support and ask to be unstuck."] =
        "游到這個確切位置，然後從遊戲選單選擇客服支援，申請脫離卡住狀態。",
    ["Stay outdoors by this building."] =
        "待在這棟建築旁的室外。",
    ["Pull the camera back for a wider view."] =
        "把鏡頭拉遠，讓視野更廣。",
    ["Turn the view so Furlbrow's Wardrobe is visible."] =
        "轉動視角，讓法布隆的櫃子出現在畫面中。",
    ["Look for beige sacks."] =
        "尋找米色的袋子。",
    ["Look beside objects and structures."] =
        "在物件和建築旁邊找。",
    ["Hunt the vultures."] =
        "獵殺禿鷲。",
    ["Many of them gather in this area."] =
        "這一帶聚集了很多。",
    ["The rest lie dotted across the zone."] =
        "其餘的零散分布在整個區域。",
    ["Kill boars for these."] =
        "擊殺野豬取得。",
    ["With the coming turn-ins, this gets you to level 15."] =
        "加上接下來的交任務，這會讓你升到15級。",
    ["Flight master at Rut'theran Village"] =
        "魯瑟蘭村的飛行管理員",
    ["Leave your pet with the stable master."] =
        "把寵物寄放在獸欄管理員那裡。",
    ["You will tame a short-term pet shortly."] =
        "你很快就要馴服一隻臨時寵物。",
    ["Here your pet picks up Claw (Rank 2)."] =
        "你的寵物在這裡學會爪擊（等級2）。",
    ["You will let it go shortly."] =
        "你很快就會放走牠。",
    ["Send your pet against a Thistle Bear."] =
        "讓你的寵物攻擊一隻薊熊。",
    ["Get your companion back from the stable master."] =
        "從獸欄管理員那裡領回你的寵物。",
    ["Release the short-term pet you tamed."] =
        "放棄你馴服的臨時寵物。",
    ["The NPC stands on the pier."] =
        "NPC站在碼頭上。",
    ["The targets are sea creatures with long necks."] =
        "目標是長脖子的海洋生物。",
    ["Head to the hilltop."] =
        "前往山丘頂端。",
    ["Wade in to use it."] =
        "走進水裡使用。",
    ["The spot is at the foot of the falls."] =
        "位置在瀑布底下。",
    ["Look for an urn of woven wicker."] =
        "尋找一個柳條編織的甕。",
    ["The target is a non-hostile ghost of a night elf woman."] =
        "目標是一個非敵對的夜精靈女性鬼魂。",
    ["Look for a figure in yellow and green garb."] =
        "尋找一個穿黃綠色服裝的人。",
    ["Go to the lowest deck of the wreck."] =
        "前往沉船的最底層甲板。",
    ["Swim in by way of a porthole."] =
        "從舷窗游進去。",
    ["Search stacks of brown crates."] =
        "搜尋成堆的棕色箱子。",
    ["The NPC stands atop the dam."] =
        "NPC站在水壩上。",
    ["The object rests by the barrier."] =
        "物品放在屏障旁邊。",
    ["Together with the next turn-ins, this brings you to level 19."] =
        "加上接下來的交任務，這會讓你升到19級。",
    ["This skips some tedious quests with a timer."] =
        "這樣能跳過一些有時間限制的繁瑣任務。",
    ["The upcoming quest may prove hard."] =
        "接下來的任務可能很難。",
    ["The targets are troggs."] =
        "目標是穴居人。",
    ["Redridge and Westfall"] =
        "赤脊山和西部荒野",
    ["Look for a big mound of brown earth."] =
        "尋找一大堆棕色的土堆。",
    ["The target patrols a long route by the road."] =
        "目標沿著道路旁一條很長的路線巡邏。",
    ["The target's route also goes far into Jangolode Mine and Gold Coast Quarry."] =
        "目標的路線也會深入詹戈洛德礦坑和Gold Coast Quarry。",
    ["It takes roughly 5 minutes to reappear."] =
        "大約5分鐘重生一次。",
    ["The target is a murloc, grey and bigger than the others."] =
        "目標是一隻魚人，灰色且比其他的大。",
    ["It roams the shoreline."] =
        "牠在海岸線一帶遊蕩。",
    ["If the NPC is absent, stay until he reappears."] =
        "如果NPC不在，就等到他重生。",
    ["Escort The Defias Traitor and keep him alive."] =
        "護送迪菲亞叛徒，保住他的性命。",
    ["The NPC is on an upper floor of the tower."] =
        "NPC在塔的上層。",
    ["Hunt the red-feathered birds."] =
        "獵殺紅色羽毛的鳥。",
    ["The targets are little winged dragons."] =
        "目標是有翅膀的小龍。",
    ["Skip Redridge Alphas; they don't carry them."] =
        "略過赤脊山突擊隊員；他們身上沒有。",
    ["Raise Lockpicking to 95"] =
        "將開鎖提升到95",
    ["Look for little gray coffers of metal."] =
        "尋找灰色的小金屬箱。",
    ["Go inside and stay on the trail"] =
        "進去後沿著小路走",
    ["Your target is a ghoul."] =
        "目標是一隻食屍鬼。",
    ["Fight undead foes."] =
        "與不死族敵人戰鬥。",
    ["The target is the dungeon's second boss."] =
        "目標是地城的第二個首領。",
    ["The target is the dungeon's last boss."] =
        "目標是地城的最後一個首領。",
    ["The objective is aboard the vessel."] =
        "目標在船上。",
    ["You'll find them all over the instance."] =
        "整個副本到處都有。",
    ["The NPC is indoors"] =
        "NPC在室內",
    ["Fight the murlocs."] =
        "與魚人戰鬥。",
    ["The spot is at the cave's mouth."] =
        "位置在洞口。",
    ["Look for the brown fungi."] =
        "尋找棕色的蘑菇。",
    ["Extra ones are below, in the side chambers."] =
        "下方的側室裡還有更多。",
    ["Gather the blue-capped fungi."] =
        "採集藍色菌傘的蘑菇。",
    ["Expect a possible ambush while you gather it."] =
        "採集時可能會遭到伏擊。",
    ["It shows up a short way off."] =
        "它會在不遠處出現。",
    ["It shows up at your feet."] =
        "它會在你腳邊出現。",
    ["Murloc packs arrive at the waterside."] =
        "成群的魚人會從水邊過來。",
    ["The attackers rush the camp."] =
        "攻擊者會衝向營地。",
    ["Engage foes one at a time."] =
        "一次只對付一個敵人。",
    ["Watch out, the landscape conceals some monsters."] =
        "小心，地形裡藏著一些怪物。",
    ["Avoid drawing several foes together."] =
        "避免同時引來多個敵人。",
    ["Stay with Prospector Remtravel and defend him."] =
        "跟著勘察員雷姆塔維爾並保護他。",
    ["He is frail and goes down fast."] =
        "他很脆弱，很快就會倒下。",
    ["Look on top of the table."] =
        "在桌子上找。",
    ["Escort Therylune and defend her."] =
        "護送瑟瑞露尼並保護她。",
    ["Escort Volcor and defend him."] =
        "護送Volcor並保護他。",
    ["Allow the foes to hit him before you join in."] =
        "先讓敵人攻擊他，你再加入戰鬥。",
    ["If it is not around, move on without it."] =
        "如果不在，就略過繼續前進。",
    ["It reappears only after a long wait."] =
        "要等很久才會重生。",
    ["Keep Kerlonian Evershade safe while he trails behind you."] =
        "克羅尼亞·恒影跟在你後面時，保護他的安全。",
    ["Keep near him; he dozes off."] =
        "待在他身邊；他會睡著。",
    ["The NPC is on the house's raised terrace."] =
        "NPC在房子的高台上。",
    ["Ashenvale and Stonetalon"] =
        "梣谷和石爪山脈",
    ["The item drops rarely."] =
        "這個物品掉落率很低。",
    ["Look for little gray sheaves of straw."] =
        "尋找灰色的小稻草束。",
    ["Lower the Ground Clutter option to 1."] =
        "將地面雜物（Ground Clutter）選項調低到1。",
    ["Find it in the game options, under System, then Graphics."] =
        "在遊戲選項的「系統」中，再到「圖形」裡找到它。",
    ["Fly to Astranaar"] =
        "飛往阿斯特蘭納",
    ["Keep to the road the whole way."] =
        "全程沿著道路走。",
    ["Pick up Claw (Rank 3) for your pet."] =
        "讓你的寵物學會爪擊（等級3）。",
    ["Tame an Ashenvale Bear with Tame Beast."] =
        "用馴服野獸馴服一隻梣谷熊。",
    ["Track down a chestnut-furred bear."] =
        "找出一隻栗色毛的熊。",
    ["Keep to the road until you reach the Barrens"] =
        "沿著道路走到貧瘠之地",
    ["Keep your distance from the Crossroads."] =
        "與十字路口保持距離。",
    ["Flight master in Ratchet"] =
        "棘齒城的飛行管理員",
    ["Look for white spheres."] =
        "尋找白色的球體。",
    ["The target is a gray furbolg."] =
        "目標是一隻灰色的熊怪。",
    ["Shrubs that glitter white."] =
        "閃著白光的灌木。",
    ["Exit Ruins of Stardust"] =
        "離開星塵廢墟",
    ["Go into Fire Scar Shrine and climb the trail"] =
        "進入Fire Scar Shrine，沿小路往上爬",
    ["The target summons protectors with Ilkrud's Guardians."] =
        "目標會施放Ilkrud's Guardians召喚守衛。",
    ["Cut off the target's spells when you can."] =
        "有機會就打斷目標的法術。",
    ["Exit Fire Scar Shrine"] =
        "離開Fire Scar Shrine",
    ["Circle the mountain on foot."] =
        "徒步繞過山。",
    ["A yellowish naga; her fins look pinkish."] =
        "一個偏黃色的納迦；她的鰭看起來帶點粉紅。",
    ["The target is rare and seldom up."] =
        "目標是稀有怪，很少出現。",
    ["The target is a naga with jade skin and rose-colored fins."] =
        "目標是一個玉色皮膚、玫瑰色鰭的納迦。",
    ["It circles the island clockwise, close to the shore."] =
        "它沿著岸邊順時針繞島移動。",
    ["She travels with a pair of guards."] =
        "她帶著兩名護衛。",
    ["Hunt naga."] =
        "獵殺納迦。",
    ["Take the passage into Stonetalon Mountains"] =
        "走通道進入石爪山脈",
    ["Look for it high on the clifftop."] =
        "在高高的懸崖頂上找。",
    ["The targets are wyverns."] =
        "目標是雙足翼龍。",
    ["Fly to Stonetalon Peak"] =
        "飛往石爪峰",
    ["Watch out and keep away from Tideress."] =
        "小心，遠離泰德雷斯。",
    ["Your prey is a green-hued creature of living water, level 27."] =
        "你的獵物是一隻綠色的活水生物，27級。",
    ["This is in the Pool of Ask'ar part of the dungeon."] =
        "這在地城的Pool of Ask'ar區域。",
    ["Look on Ghamoo-ra's north side."] =
        "在加摩拉的北側找。",
    ["Dive down into the submerged cave."] =
        "潛入水下洞穴。",
    ["Find the NPC to the southwest of Ghamoo-ra."] =
        "在加摩拉西南方找到NPC。",
    ["It is the dungeon's 4th boss."] =
        "這是地城的第4個首領。",
    ["Kill Fallenroot and Blackfathom foes."] =
        "擊殺腐根和黑暗深淵的敵人。",
    ["Fly to Talrendis Point"] =
        "飛往Talrendis Point",
    ["This trip is dangerous; move with great caution."] =
        "這段路程很危險；要非常小心。",
    ["Stay on the road and keep away from Horde NPCs."] =
        "沿著道路走，遠離部落NPC。",
    ["The Warsong Outriders riding along the road stay peaceful."] =
        "沿路騎行的戰歌偵察騎兵不會主動攻擊。",
    ["The target is a gray murloc."] =
        "目標是一隻灰色的魚人。",
    ["The target appears at this spot."] =
        "目標會在這個位置出現。",
    ["Go into Whelgar's Excavation Site"] =
        "進入維爾加挖掘場",
    ["Head out of Whelgar's Excavation Site"] =
        "離開維爾加挖掘場",
    ["The targets are raptors."] =
        "目標是迅猛龍。",
    ["Targets are both in the tomb and around it."] =
        "目標在墓穴內外都有。",
    ["The vendor stocks only a few."] =
        "商人只有少量存貨。",
    ["A quest in Duskwood will require it afterward."] =
        "之後暮色森林的任務會需要它。",
    ["Buy it now; a task in Duskwood needs it before long."] =
        "現在就買；不久後暮色森林的任務會用到。",
    ["The spot is in the crypt under the building."] =
        "位置在建築下方的地穴裡。",
    ["Duskwood and Redridge"] =
        "暮色森林和赤脊山",
    ["Flight master at Darkshire"] =
        "夜色鎮的飛行管理員",
    ["The target is a ghoul with red skin."] =
        "目標是一隻紅色皮膚的食屍鬼。",
    ["The targets are ghouls."] =
        "目標是食屍鬼。",
    ["Exit the tomb"] =
        "離開墓穴",
    ["Rob one Malformed Defias Drone with Pickpocket."] =
        "對一名醜陋的迪菲亞懶漢使用偷竊。",
    ["Use Sap on Klaven Mortwake, then open the chest."] =
        "對克拉文·摩特維克使用悶棍，然後打開箱子。",
    ["Opening it puts a harmful effect on you."] =
        "打開它會讓你中一個負面效果。",
    ["Climb the trail across the mountains"] =
        "沿小路翻越山脈",
    ["Take the trail that circles the peak"] =
        "走繞著山峰的小路",
    ["Defeat each wave of attackers."] =
        "擊敗每一波攻擊者。",
    ["Beware of foes lurking in stealth."] =
        "小心潛行中的敵人。",
    ["Target Doc Mixilpixil, then take a seat."] =
        "選中Doc Mixilpixil，然後坐下。",
    ["The target is a boar whose hide is a deeper shade of brown."] =
        "目標是一隻毛皮顏色較深的棕色野豬。",
    ["The targets are orcs."] =
        "目標是獸人。",
    ["You no longer need these; vendor or discard them."] =
        "你不再需要這些；賣掉或丟掉。",
    ["The targets are Horrors and Fiends."] =
        "目標是恐魔和捕獵者。",
    ["Don't engage Mor'Ladim, an elite undead foe at level 35."] =
        "不要招惹摩拉迪姆，他是35級的精英不死族敵人。",
    ["The target wanders near the crypt, outdoors."] =
        "目標在地穴附近的室外遊蕩。",
    ["Climb the steps and exit the tomb"] =
        "爬上階梯，離開墓穴",
    ["The target is a sword-wielding gnoll."] =
        "目標是一個持劍的豺狼人。",
    ["The target is a gnoll in a crimson robe, wielding a lengthy blade."] =
        "目標是一個穿深紅色長袍、手持長劍的豺狼人。",
    ["Beware: nearby foes join when you attack him."] =
        "注意：攻擊他時，附近的敵人會加入戰鬥。",
    ["Keep to the cave's interior when you can."] =
        "盡量待在洞穴裡面。",
    ["The following step takes place in the cave."] =
        "下一步在洞穴裡進行。",
    ["Keep Corporal Keeshan safe during the escort."] =
        "護送期間保護基沙恩下士的安全。",
    ["At the cave's mouth, draw foes to him with care."] =
        "在洞口小心地把敵人引到他身邊。",
    ["The target is the dungeon's fifth boss."] =
        "目標是地城的第五個首領。",
    ["Targets are within the wrecked vessel underwater."] =
        "目標在水下的沉船裡。",
    ["The target is a blue raptor."] =
        "目標是一隻藍色的迅猛龍。",
    ["Look for a big mound of dirt."] =
        "尋找一個大土堆。",
    ["The item may also spawn on the high ledge by Sarltooth."] =
        "物品也可能出現在薩爾圖斯旁邊的高處岩架上。",
    ["Look for a big, broad yellow urn."] =
        "尋找一個又大又寬的黃色甕。",
    ["Look for a big, tall crimson urn."] =
        "尋找一個又大又高的深紅色甕。",
    ["The target is a big stone container."] =
        "目標是一個大型石製容器。",
    ["The target is up on the boat's top deck."] =
        "目標在船的頂層甲板上。",
    ["Climb the incline at the rear."] =
        "爬上後方的斜坡。",
    ["Go to the lowest deck of the ship."] =
        "前往船的最底層甲板。",
    ["Swim in via the gap at the base."] =
        "從底部的缺口游進去。",
    ["These foes hide in stealth."] =
        "這些敵人會潛行隱藏。",
    ["Most often found in or beside water."] =
        "大多在水中或水邊。",
    ["Grab every one you spot on the way here."] =
        "來這裡的路上看到就全部撿起來。",
    ["With the coming hand-ins, this brings you to level 29."] =
        "加上接下來的交任務，這會讓你升到29級。",
    ["Take the door on the bridge, then descend the steps"] =
        "走橋上的門，然後走下階梯",
    ["The NPC is on the lower level within the bridge."] =
        "NPC在橋內部的下層。",
    ["Leap from the span and splash down below"] =
        "從橋上跳下，落入下方的水中",
    ["Look for a pale, rolled scroll."] =
        "尋找一個淺色的捲軸。",
    ["A dwarf corpse grips it."] =
        "一具矮人屍體握著它。",
    ["Fly to Refuge Pointe"] =
        "飛往避難谷地",
    ["Flight master at Southshore"] =
        "南海鎮的飛行管理員",
    ["The targets are turtles."] =
        "目標是海龜。",
    ["Head north, keeping to the riverbank."] =
        "沿著河岸往北走。",
    ["Flight master at Chillwind Camp"] =
        "冰風崗的飛行管理員",
    ["Stonetalon and Ashenvale"] =
        "石爪山脈和梣谷",
    ["Take the road, then climb the trail into Nijel's Point"] =
        "沿著道路走，再沿小路往上進入尼耶爾前哨站",
    ["Fly to Nijel's Point"] =
        "飛往尼耶爾前哨站",
    ["The quest is gray, yet the later ones in the chain award plenty of XP."] =
        "這個任務是灰色的，但任務鏈後續的任務能給很多經驗值。",
    ["Take the road until this trail"] =
        "沿著道路走到這條小路",
    ["Keep on the trail"] =
        "繼續沿著小路走",
    ["Fight the treants."] =
        "與樹人戰鬥。",
    ["Head uphill on the trail and across the passage"] =
        "沿小路上坡，穿過通道",
    ["Exit the Howling Vale by the tunnel"] =
        "從隧道離開狼嚎谷",
    ["You pick up Claw (Rank 4) here."] =
        "在這裡學會爪擊（等級4）。",
    ["Tame any Elder Ashenvale Bear with Tame Beast."] =
        "用馴服野獸馴服任意一隻老梣谷熊。",
    ["They show up lying on the ground."] =
        "它們會躺在地上。",
    ["Circle the peak, then climb the twisting dirt trail to the shrine"] =
        "繞過山峰，然後沿蜿蜒的土路爬到神殿",
    ["Circle the mountain, then stay on the trail"] =
        "繞過山，然後沿著小路走",
    ["Stand on the marked point, then apply the item."] =
        "站在標記的位置，然後使用這個物品。",
    ["Obtain Furbolg Form"] =
        "獲得熊怪形態",
    ["Walk over the span"] =
        "走過橋",
    ["The foes are gnomes."] =
        "敵人是地精。",
    ["In Gnomeregan's outer halls, not in the instance itself."] =
        "在諾姆瑞根的外圍大廳，不在副本裡面。",
    ["Take the lift down, then head north."] =
        "搭升降梯下去，然後往北走。",
    ["The NPC is atop the raised platform."] =
        "NPC在高台上。",
    ["It sits a short distance southward from Techbot."] =
        "它在Techbot南邊不遠處。",
    ["Use it on foes that are Irradiated."] =
        "對受到輻射的敵人使用。",
    ["The targets are troggs with a green glow."] =
        "目標是發著綠光的穴居人。",
    ["Inside The Hall of Gears, stick to the top tiers."] =
        "在齒輪大廳裡，待在最上層。",
    ["Take the trail southwest into The Dormitory."] =
        "沿小路往西南進入宿舍。",
    ["By the wall on The Dormitory's lower floor."] =
        "在宿舍下層的牆邊。",
    ["The target is the third boss you meet."] =
        "目標是你遇到的第三個首領。",
    ["The target sits on the raised deck beside Electrocutioner 6000."] =
        "目標在電刑器6000型旁邊的高台上。",
    ["In the Engineering Labs, on the lowest floor."] =
        "在工程實驗室的最底層。",
    ["The objective is next to Crowd Pummeler 9-60."] =
        "目標在群體打擊者9-60旁邊。",
    ["Keep to Launch Bay's top floor."] =
        "待在Launch Bay的頂層。",
    ["Look for boxy, standing devices."] =
        "尋找方形的直立裝置。",
    ["The machine you need is in the Dormitory."] =
        "你需要的機器在宿舍裡。",
    ["It can take more than one to get it."] =
        "可能需要不只一次才能拿到。",
    ["Duskwood and Stranglethorn"] =
        "暮色森林和荊棘谷",
    ["Head into Stormwind Keep"] =
        "進入暴風要塞",
    ["The NPC stands by the water's edge."] =
        "NPC站在水邊。",
    ["The targets are worgen."] =
        "目標是狼人。",
    ["Other ghouls occupy the same spawn points."] =
        "其他食屍鬼也會在相同的重生點出現。",
    ["The target can be in the house or around it."] =
        "目標可能在房子裡或房子周圍。",
    ["Just out of the mine."] =
        "就在礦坑外面。",
    ["The NPC patrols the southern route once every 20-30 minutes."] =
        "NPC每20-30分鐘沿南邊的路線巡邏一次。",
    ["A pair of foes go after him."] =
        "會有兩個敵人去攻擊他。",
    ["Saving his life unlocks a new task."] =
        "救了他會解鎖一個新任務。",
    ["Hang on to it; an upcoming quest uses it."] =
        "留著它；接下來的任務會用到。",
    ["The NPC stands in the narrow lane between houses."] =
        "NPC站在房屋之間的狹窄巷子裡。",
    ["Hillsbrad and Arathi"] =
        "希爾斯布萊德和阿拉希",
    ["Search for gray rocks standing up beside the walls."] =
        "尋找立在牆邊的灰色石頭。",
    ["Further hidden ones lurk on the high ridgelines."] =
        "高處的山脊上還藏著更多。",
    ["Some are indoors as well."] =
        "有些也在室內。",
    ["Fly to Aerie Peak"] =
        "飛往鷹巢山",
    ["The NPC is at the summit of the trail."] =
        "NPC在小路的最高處。",
    ["This spares you time further on."] =
        "這能為後面省下時間。",
    ["Flight master at Theramore"] =
        "塞拉摩的飛行管理員",
    ["This quest is buggy and may not show up."] =
        "這個任務有錯誤，可能不會出現。",
    ["Expect several foes at once."] =
        "會同時出現多個敵人。",
    ["Make Private Hendel your main target."] =
        "以士兵亨德爾為主要目標。",
    ["Steer clear of Brackenwall Village."] =
        "避開蕨牆村。",
    ["Watch out: the foes here are above your level."] =
        "小心：這裡的敵人等級比你高。",
    ["The quest starts from a small piece of metal."] =
        "這個任務由一小塊金屬開始。",
    ["Take the lift down"] =
        "搭升降梯下去",
    ["Look for a little brown tome."] =
        "尋找一本棕色的小書。",
    ["The item is held by a dwarf corpse."] =
        "物品在一具矮人屍體手上。",
    ["Flight master at Thalanaar"] =
        "薩蘭納爾的飛行管理員",
    ["Keep clear of Freewind Post."] =
        "避開亂風崗。",
    ["This spot has most of them; elsewhere they are rare."] =
        "這個位置最多；其他地方很少。",
    ["Return here as you do your other quests."] =
        "做其他任務時回到這裡。",
    ["The foes here are scorpions."] =
        "這裡的敵人是蠍子。",
    ["Look for assorted mechanical pieces."] =
        "尋找各種機械零件。",
    ["Parts lie all across the Shimmering Flats."] =
        "零件散落在整個閃光平原。",
    ["Fly to Gadgetzan"] =
        "飛往加基森",
    ["Stand on the metal grating to begin the battle."] =
        "站到金屬格柵上開始戰鬥。",
    ["Shows up once you defeat six challengers."] =
        "擊敗六名挑戰者後就會出現。",
    ["The NPC is upstairs, out on the balcony."] =
        "NPC在樓上，位於外面的陽台。",
    ["The NPC stands on the top tier of the pier."] =
        "NPC站在碼頭的最上層。",
    ["Fly to Booty Bay"] =
        "飛往藏寶海灣",
    ["If he is absent, move on without him."] =
        "如果他不在，就跳過他繼續前進。",
    ["You may come back for it another time."] =
        "你可以改天再回來處理。",
    ["These foes heal both their allies and themselves."] =
        "這些敵人會治療盟友和自己。",
    ["When the targets run out, skip ahead."] =
        "沒有目標可打時，就跳到下一步。",
    ["No rush; you may complete this afterwards."] =
        "不急；之後再完成也可以。",
    ["The objective sits up on the raised deck."] =
        "目標在高起的甲板上。",
    ["Search the riverbanks."] =
        "搜尋河岸。",
    ["Here your pet picks up Claw (Rank 5)."] =
        "你的寵物在這裡學會爪擊（等級5）。",
    ["Tame a Scorpashi Lasher with Tame Beast."] =
        "用馴服野獸馴服一隻荒土鞭尾蠍。",
    ["Head uphill into Nijel's Point"] =
        "往上坡進入尼耶爾前哨站",
    ["With the coming hand-ins, this brings you to level 36."] =
        "加上接下來交付的任務，這會讓你升到36級。",
    ["The quest starts from a little book."] =
        "這個任務由一本小書開始。",
    ["The targets are lobsters."] =
        "目標是龍蝦。",
    ["Draw him to the doorway so other foes stay out of it."] =
        "把他引到門口，免得其他敵人加入戰鬥。",
    ["Escort Dalinda Malem and keep her alive."] =
        "護送黛琳達·瑪雷姆，並保住她的性命。",
    ["The targets here are centaurs."] =
        "這裡的目標是半人馬。",
    ["Magram Pack Runners patrol with 2 hyena escorts; steer clear."] =
        "瑪格拉姆馴犬者會帶著2隻土狼護衛巡邏；避開它們。",
    ["Stay away from Ghost Walker Post."] =
        "遠離鬼旅崗哨。",
    ["Target kodos with the item."] =
        "對科多獸使用這個物品。",
    ["The kodos trail behind you."] =
        "科多獸會跟在你身後。",
    ["Lead them to Smeed Scrabblescrew, then speak with them there."] =
        "把牠們帶到斯米德·瑟卡布斯庫那裡，然後在那裡和牠們交談。",
    ["Look for pale skulls of horned beasts."] =
        "尋找有角野獸的淺色頭骨。",
    ["A lengthy grinding stretch is coming up."] =
        "接下來要打怪很長一段時間。",
    ["The targets are Sea Witches and Tidehunters."] =
        "目標是海巫和獵潮者。",
    ["Other naga compete for the same spawn points."] =
        "其他納迦也會佔用相同的重生點。",
    ["The targets are on islands and beneath the surface."] =
        "目標在島上和水面下。",
    ["This spreads out the grinding so less is left later."] =
        "這樣可以分散打怪的量，之後要打的就比較少。",
    ["Take the mountain trail to get there."] =
        "走山路過去。",
    ["Stay clear of Valley of Spears."] =
        "避開長矛谷。",
    ["Look for tan sacks by the houses."] =
        "在房子旁邊尋找棕褐色的袋子。",
    ["Some of them are not usable."] =
        "其中有些無法使用。",
    ["Basilisks compete for the same spawn points."] =
        "石化蜥蜴也會佔用相同的重生點。",
    ["They compete for spawn points with the other Kurzen foes."] =
        "他們和其他庫爾森敵人共用重生點。",
    ["A key class quest coming up requires this."] =
        "接下來一個重要的職業任務需要它。",
    ["The targets are on the cave floor."] =
        "目標在洞穴地面上。",
    ["Targets are spread across the whole cavern."] =
        "目標分佈在整個洞穴。",
    ["Hold on to it for a Searing Gorge task later."] =
        "留著它，之後灼熱峽谷的任務會用到。",
    ["Stay away from Bhag'thera."] =
        "遠離巴爾瑟拉。",
    ["The big cat you need roams in plain sight: a level 40 elite black panther."] =
        "你要找的大貓就在明處遊蕩：一隻40級精英黑豹。",
    ["The targets are in the water and along its edges."] =
        "目標在水中和岸邊。",
    ["Look for an orange tiger."] =
        "尋找一隻橙色的老虎。",
    ["Mostly found atop the hill."] =
        "大多在山丘頂上。",
    ["Steer clear of elite murlocs."] =
        "避開精英魚人。",
    ["The targets are trolls."] =
        "目標是食人妖。",
    ["With the coming hand-ins, this gets you to level 38."] =
        "加上接下來交付的任務，這會讓你升到38級。",
    ["Hunt the little winged dragonkin."] =
        "獵殺有翅膀的小型龍類。",
    ["The target is a humanoid escorted by 2 guards."] =
        "目標是一個由2名護衛隨行的人型生物。",
    ["Clear the monsters just south before you start."] =
        "開始前先清掉南邊附近的怪物。",
    ["Escort Galen Goodward and keep him alive."] =
        "護送加林·古瓦德，並保住他的性命。",
    ["Look for big blue crystals."] =
        "尋找大型藍色水晶。",
    ["Keep to the water to skip foes above your level."] =
        "待在水裡，以避開等級比你高的敵人。",
    ["Together with the next turn-ins, this brings you to level 39."] =
        "加上接下來交付的任務，這會讓你升到39級。",
    ["Hold on to it for the Whirlwind class chain."] =
        "留著它，旋風職業任務鏈會用到。",
    ["A major boost to your weapon."] =
        "武器會大幅提升。",
    ["Arathi and Alterac"] =
        "阿拉希和奧特蘭克",
    ["The target travels the road in one direction, escorted by 4 guards."] =
        "目標沿道路單向前進，有4名護衛隨行。",
    ["If she makes it to Tarren Mill, she spawns again."] =
        "如果她走到塔倫米爾，就會重新出現。",
    ["She starts her route over in Arathi Highlands."] =
        "她會從阿拉希高地重新開始她的路線。",
    ["The targets are kobolds."] =
        "目標是狗頭人。",
    ["Additional ones are in the cavern up the trail."] =
        "沿小路往上的洞穴裡還有更多。",
    ["Keep away from Hammerfall."] =
        "遠離落錘鎮。",
    ["Climb the trail to the cavern"] =
        "沿小路往上前往洞穴",
    ["The NPC stands atop the ridge."] =
        "NPC站在山脊頂上。",
    ["Escort Kinelory and keep her alive."] =
        "護送基恩洛，並保住她的性命。",
    ["The targets are ogres."] =
        "目標是食人魔。",
    ["Together with the next turn-ins, this brings you to level 40."] =
        "加上接下來交付的任務，這會讓你升到40級。",
    ["Stay clear of Refuge Point."] =
        "避開避難谷地。",
    ["A level 40 elite foe shows up shortly."] =
        "不久後會出現一個40級精英敵人。",
    ["Drink a second Nature Protection Potion mid-fight."] =
        "戰鬥中途再喝一瓶自然防護藥水。",
    ["Consume one ahead of time, so it has recharged once combat begins."] =
        "先喝一瓶，這樣戰鬥開始時冷卻就已經結束。",
    ["Get Essence of the Exile done as well."] =
        "也把「流放精華」完成。",
    ["Be sure the cooldown on the Nature Protection Potion has ended."] =
        "確認自然防護藥水的冷卻時間已結束。",
    ["Stay behind Bath'rah the Windwatcher as he walks."] =
        "『觀風者』巴斯拉走動時，跟在他後面。",
    ["This calls up Cyclonian."] =
        "這會召喚出塞克隆尼亞。",
    ["Take the trail across the peaks"] =
        "走小路翻越山峰",
    ["Take the passage to Faldir's Cove"] =
        "走通道前往Faldir's Cove",
    ["Escort Professor Phizzlethorpe and keep him alive."] =
        "護送菲茲索普教授，並保住他的性命。",
    ["The tome is bound in brown and rests in a metal kettle."] =
        "這本書是棕色封面，放在一個金屬壺裡。",
    ["The objective is on the central deck of the submerged wreck."] =
        "目標在沉船的中層甲板上。",
    ["Look for a flat beige parchment."] =
        "尋找一張平放的米色羊皮紙。",
    ["Search for a book lying open."] =
        "尋找一本攤開的書。",
    ["The target is in the ship's lowest hold."] =
        "目標在船的最底層貨艙。",
    ["Look for big gray rocks."] =
        "尋找大型灰色岩石。",
    ["They show up as dots on the minimap."] =
        "它們會在小地圖上顯示為小點。",
    ["Hold on to it, an upcoming quest uses it."] =
        "留著它，接下來的任務會用到。",
    ["Clear the raptors around before you begin."] =
        "開始前先清掉周圍的迅猛龍。",
    ["Let the conversation play out, then escort \"Stinky\" Ignatz and keep him alive."] =
        "等對話結束，再護送「Stinky」伊格納茲，並保住他的性命。",
    ["Speak with him once he gives up."] =
        "他投降後，和他交談。",
    ["Hunt the felguards."] =
        "獵殺惡魔守衛。",
    ["This is the sole spot; wait for them to reappear."] =
        "這裡是唯一的地點；等牠們重生。",
    ["The targets are felhounds."] =
        "目標是惡魔犬。",
    ["The targets are succubi."] =
        "目標是魅魔。",
    ["The spot is beside a giant skeleton."] =
        "地點在一具巨大的骨骸旁邊。",
    ["Clear out the foes around here before you start."] =
        "開始前先清掉這附近的敵人。",
    ["Target the spectral centaurs."] =
        "對幽靈半人馬使用。",
    ["The targets are brown-colored skeletons."] =
        "目標是棕色的骷髏。",
    ["Together with the next turn-ins, this brings you to level 41."] =
        "加上接下來交付的任務，這會讓你升到41級。",
    ["The target wanders inside the tent and around it."] =
        "目標在帳篷內外遊蕩。",
    ["Take the road, then descend the trail"] =
        "沿道路走，再順著小路往下",
    ["On the road, Rexxar leaves you alone."] =
        "走在道路上時，羅卡洛不會招惹你。",
    ["Cross by boat or by swimming"] =
        "搭船或游泳過去",
    ["Flight master at Feathermoon"] =
        "羽月要塞的飛行管理員",
    ["Your pet picks up Claw (Rank 6) here."] =
        "你的寵物在這裡學會爪擊（等級6）。",
    ["Tame a Scorpid Hunter with Tame Beast."] =
        "用馴服野獸馴服一隻沙漠獵食蠍。",
    ["Head into the Library wing."] =
        "進入圖書館區。",
    ["The target is the dungeon's opening boss."] =
        "目標是這個地城的第一個首領。",
    ["Head across the hall called Gallery of Treasures."] =
        "穿過名為Gallery of Treasures的大廳。",
    ["Keep an eye on the minimap until its area name reads Scarlet Monastery again."] =
        "留意小地圖，直到區域名稱再次顯示為血色修道院。",
    ["This is in the Armory wing."] =
        "這在武器庫區。",
    ["Found in the Cathedral wing."] =
        "在大教堂區。",
    ["A lengthy stretch of quests is coming up."] =
        "接下來有一長串任務。",
    ["This vendor sells no arrows or bullets."] =
        "這個商人不賣箭矢或子彈。",
    ["Get these for simple Badlands turn-ins ahead."] =
        "先拿這些，之後在荒蕪之地可以輕鬆交付。",
    ["The NPC or item sits on the rocky shelf above."] =
        "NPC或物品在上方的岩架上。",
    ["Fight the dwarves."] =
        "攻擊矮人。",
    ["Look for a timber box."] =
        "尋找一個木箱。",
    ["A cluster of them gathers here."] =
        "這裡聚集了一群。",
    ["More of them dot the surroundings."] =
        "周圍還散佈著更多。",
    ["With the coming hand-ins, this brings you to level 42."] =
        "加上接下來交付的任務，這會讓你升到42級。",
    ["Unlocks the flight point at Thorium Point."] =
        "開啟瑟銀哨塔的飛行點。",
    ["Flight master at Thorium Point"] =
        "瑟銀哨塔的飛行管理員",
    ["Take the passage out of Booty Bay"] =
        "走通道離開藏寶海灣",
    ["Take the tunnel into Booty Bay"] =
        "走隧道進入藏寶海灣",
    ["Take the trail toward the Ruins of Aboraz"] =
        "走小路前往Ruins of Aboraz",
    ["Gradually move toward the northeast."] =
        "逐步往東北移動。",
    ["The targets are goblins."] =
        "目標是地精。",
    ["Kill the witch doctors and the mystics."] =
        "殺死巫醫和秘法師。",
    ["A dark panther, elite at 40, visible rather than hidden."] =
        "一隻40級精英黑豹，沒有潛行。",
    ["Be ready: these opponents are elites at level 38."] =
        "做好準備：這些敵人是38級精英。",
    ["Saltwater Crocolisks spawn in the same places."] =
        "海鱷也在相同的地點重生。",
    ["The object is a table made of stone."] =
        "這個物件是一張石桌。",
    ["Drag him up until he breaks the surface."] =
        "把他往上拉，直到他浮出水面。",
    ["Follow the shoreline"] =
        "沿著海岸線走",
    ["The item is a brownish sheet of parchment."] =
        "這個物品是一張偏棕色的羊皮紙。",
    ["Look for a flat, white scroll lying open."] =
        "尋找一張攤開平放的白色卷軸。",
    ["If some pages are unavailable, go on without them."] =
        "如果有些書頁找不到，就跳過它們繼續。",
    ["You want Chapters I, II and III."] =
        "你需要第一章、第二章和第三章。",
    ["Collect the chunks of wood."] =
        "收集木塊。",
    ["Do not go near Stonard."] =
        "不要靠近斯通納德。",
    ["Silt Crawlers drop it more often."] =
        "淤泥蟹的掉落率較高。",
    ["Fly to Nethergarde Keep"] =
        "飛往守望堡",
    ["A timer runs on this one; don't dawdle."] =
        "這個有時間限制；不要拖延。",
    ["Hold on until Rizzle has fled."] =
        "等到瑞茲爾逃走。",
    ["Targets here are human."] =
        "這裡的目標是人類。",
    ["Dungeon runs are a fine choice here too, as you like."] =
        "喜歡的話，這時去刷地城也是不錯的選擇。",
    ["Each set of 5 handed in at Gadgetzan gives 380 xp."] =
        "在加基森每交付一組5個可獲得380點經驗值。",
    ["Hyenas also use these spawn spots."] =
        "土狼也會使用這些重生點。",
    ["Feralas and Tanaris"] =
        "菲拉斯和塔納利斯",
    ["Position yourself in its center."] =
        "站到它的中央。",
    ["Consider bringing a group for this one."] =
        "這個可以考慮找隊伍一起做。",
    ["Zones with stronger foes lie just ahead."] =
        "接下來的區域敵人更強。",
    ["The quests alone won't give you the level you need."] =
        "光靠任務無法達到你需要的等級。",
    ["Swim this way to stay out of fatigue"] =
        "往這個方向游，以避免疲勞",
    ["Hunt the crimson winged serpents."] =
        "獵殺深紅色的有翼蛇。",
    ["Slay them, then apply the item to their remains."] =
        "殺死牠們，然後對屍體使用這個物品。",
    ["Once freed, they can be killed."] =
        "被釋放後就能殺死牠們。",
    ["Win the encounter at the temple."] =
        "在神廟贏得這場戰鬥。",
    ["Take the trail to the southeast."] =
        "走小路往東南方。",
    ["Inside a big room around a central pool."] =
        "在一個大房間裡，圍繞著中央的水池。",
    ["Most of them are in Theka the Martyr's scarab chamber."] =
        "大多在『殉教者』塞卡的甲蟲房間裡。",
    ["It could take a few trips through the instance."] =
        "可能需要刷幾次副本。",
    ["Do more Zul'Farrak runs."] =
        "多刷幾次祖爾法拉克。",
    ["Keep to the road, then cross the tunnel"] =
        "沿著道路走，再穿過隧道",
    ["The robot sits in the open ground linking the cave and the tunnel."] =
        "機器人在連接洞穴和隧道的空地上。",
    ["Others lie past the tunnel."] =
        "穿過隧道後還有其他的。",
    ["Get out of the cave and use the passage beyond"] =
        "離開洞穴，再走前方的通道",
    ["Look for a big, pale egg."] =
        "尋找一顆淺色的大蛋。",
    ["Hunt gorillas."] =
        "獵殺猩猩。",
    ["Bears appear at the same spawn spots."] =
        "熊也會在相同的重生點出現。",
    ["Hunt bears."] =
        "獵殺熊。",
    ["They appear in the same spots as the apes."] =
        "牠們和猿猴在相同的地點出現。",
    ["Kill the foes near the big cage first."] =
        "先殺掉大籠子附近的敵人。",
    ["This helps with the following step."] =
        "這對下一步有幫助。",
    ["This sets Captured Sprite Darters free."] =
        "這會釋放被俘獲的小精龍。",
    ["Save as many of them as possible."] =
        "盡可能救出越多越好。",
    ["Keep 6 or more of them alive."] =
        "至少讓其中6隻存活。",
    ["If she is gone, wait until she comes back."] =
        "如果她不在，等她回來。",
    ["Go into the cavern at the trail's foot"] =
        "進入小路底端的洞穴",
    ["Getting it here speeds up Un'Goro Crater."] =
        "在這裡拿到它，可以加快安戈洛環形山的進度。",
    ["Stay clear of the elite foes."] =
        "避開精英敵人。",
    ["Gather the big plumes colored brown and ivory."] =
        "收集棕色和象牙色的大羽毛。",
    ["Drop the Ground Clutter option down to 1."] =
        "將地面雜物（Ground Clutter）選項調到1。",
    ["Hop onto the ledge here."] =
        "跳上這裡的岩架。",
    ["Monsters are unable to reach you from this spot."] =
        "怪物在這個位置無法碰到你。",
    ["Hold off until you have left combat."] =
        "等你脫離戰鬥再進行。",
    ["Other creatures use these spawn points too."] =
        "其他生物也會使用這些重生點。",
    ["If it hasn't turned up by level 49, move on."] =
        "如果到49級還沒出現，就繼續前進。",
    ["Stay on the road, then take the trail downhill"] =
        "沿著道路走，再走小路下坡",
    ["Point it at Gammerita."] =
        "對加莫里塔使用。",
    ["The quarry: a tough elite tortoise, azure-shelled."] =
        "目標：一隻強悍的精英海龜，龜殼是天藍色。",
    ["Look for little blue flasks."] =
        "尋找藍色小瓶子。",
    ["Steer around Revantusk Village."] =
        "繞開惡齒村。",
    ["Stay away from Gammerita."] =
        "遠離加莫里塔。",
    ["Kill mobs until your hearthstone is off cooldown"] =
        "打怪直到爐石冷卻完畢",
    ["The target patrols a wide loop, turning counterclockwise."] =
        "目標以逆時針方向繞著一大圈巡邏。",
    ["Watch for a pair of guards hiding in stealth."] =
        "小心兩名潛行中的護衛。",
    ["The target's spawn point is 58.9, 39.3 in Tanaris."] =
        "目標的重生點在塔納利斯的58.9, 39.3。",
    ["Head down the passage that opens on Lost Rigger Cove"] =
        "沿通往Lost Rigger Cove的通道往下走",
    ["Few kills yield this item."] =
        "這個物品的掉落率很低。",
    ["Others can be found on raised wood platforms close by."] =
        "附近高起的木平台上也有其他的。",
    ["Others are indoors too."] =
        "室內也有其他的。",
    ["Take the passage out of Lost Rigger Cove"] =
        "走通道離開Lost Rigger Cove",
    ["If the NPC is gone, hold on until it reappears."] =
        "如果NPC不在，等到它重新出現。",
    ["Search the sand mounds."] =
        "搜尋沙堆。",
    ["It competes for spawn points."] =
        "它和其他怪物共用重生點。",
    ["Stay clear of the elite tyrannosaur."] =
        "避開精英暴龍。",
    ["Every creature in Un'Goro Crater can drop it."] =
        "安戈洛環形山裡的每一種生物都可能掉落。",
    ["Gather from clumps of multicolored crystals."] =
        "從多彩的水晶叢採集。",
    ["Spawn points are shared, so pick up every one you find."] =
        "重生點是共用的，所以看到就全部撿起來。",
    ["Gathering it causes other hues to show up."] =
        "採集後會出現其他顏色的。",
    ["The targets are mobile plant monsters."] =
        "目標是會移動的植物怪。",
    ["Together with the next turn-ins, this brings you to level 50."] =
        "加上接下來交付的任務，這會讓你升到50級。",
    ["Flight master at Marshal's Refuge"] =
        "馬紹爾營地的飛行管理員",
    ["In the Maraudon Tunnels, the target is a centaur in violet armor."] =
        "在瑪拉頓隧道內，目標是一個穿紫色盔甲的半人馬。",
    ["Head into the purple wing of the Maraudon Tunnels."] =
        "進入瑪拉頓隧道的紫色區域。",
    ["Use it on the Spirit of Gelk."] =
        "對Spirit of Gelk使用。",
    ["In the Maraudon Tunnels, find the chamber joining the purple and orange areas."] =
        "在瑪拉頓隧道內，找到連接紫色和橙色區域的房間。",
    ["Target the Spirit of Kolk with the item."] =
        "對Spirit of Kolk使用這個物品。",
    ["Found in the Maraudon Tunnels, along the orange wing."] =
        "在瑪拉頓隧道內的橙色區域。",
    ["The target is beside the big pool holding orange crystals."] =
        "目標在有橙色水晶的大水池旁邊。",
    ["Target the Spirit of Magra with it."] =
        "對Spirit of Magra使用它。",
    ["Target Spirit of Veng with it."] =
        "對Spirit of Veng使用它。",
    ["In the orange area."] =
        "在橙色區域。",
    ["Use it beside the Vylestem Vines."] =
        "在維利斯塔姆藤蔓旁邊使用。",
    ["Look for stumps topped with big leaves."] =
        "尋找頂上長著大葉子的樹樁。",
    ["The spot is in Foulspore Cavern."] =
        "地點在Foulspore Cavern。",
    ["This happens in Maraudon's violet wing."] =
        "這在瑪拉頓的紫色區域進行。",
    ["Aim the item at the Spirit of Maraudos."] =
        "對Spirit of Maraudos使用這個物品。",
    ["The target is a spectral centaur holding a spear."] =
        "目標是一個手持長矛的幽靈半人馬。",
    ["Small green flasks."] =
        "綠色小瓶子。",
    ["Search the shoreline, right by the waves."] =
        "搜尋海岸線，就在浪花旁邊。",
    ["The objective is on the ship's center deck."] =
        "目標在船的中層甲板上。",
    ["Search for a parchment roll, white in color."] =
        "尋找一卷白色的羊皮紙。",
    ["Search the ship's middle or lowest deck."] =
        "搜尋船的中層或最底層甲板。",
    ["If she is absent, wait for her to come back."] =
        "如果她不在，等她回來。",
    ["Hunt down an elite raptor of level 43 whose scales look azure."] =
        "獵殺一隻43級的精英迅猛龍，鱗片呈天藍色。",
    ["The quarry is a pale tiger, an elite at 43."] =
        "目標是一隻淺色的老虎，43級精英。",
    ["It calls 2 small adds of a lesser level; neither one is elite."] =
        "它會召喚2隻等級較低的小怪；兩隻都不是精英。",
    ["When it drops to about 50% health."] =
        "當它的生命值降到約50%時。",
    ["Look underneath the bridge."] =
        "在橋下尋找。",
    ["Hunt flame and stone elementals."] =
        "獵殺火元素和石元素。",
    ["Fight elementals and golems."] =
        "攻擊元素和魔像。",
    ["Drop onto the metal catwalk at this spot"] =
        "在這裡跳到金屬走道上",
    ["Drop off the cavern's bridge at this spot"] =
        "在這裡從洞穴的橋上跳下",
    ["Go in through the second cave opening"] =
        "從第二個洞口進去",
    ["Slave Workers can drop them too."] =
        "Slave Worker也可能掉落。",
    ["Climb the trail out of the Cauldron"] =
        "沿小路往上離開大熔爐",
    ["The foes here are elite."] =
        "這裡的敵人是精英。",
    ["Do not leave this quest undone; it matters."] =
        "不要跳過這個任務；它很重要。",
    ["The spot is at the tower's upper level."] =
        "地點在塔的上層。",
    ["Beware, this foe is elite."] =
        "小心，這個敵人是精英。",
    ["Walk over the rope bridge"] =
        "走過吊橋",
    ["Hunt the elite azure saurian; it stands at level 48."] =
        "獵殺天藍色的精英蜥蜴；牠是48級。",
    ["The target wanders the trail."] =
        "目標在小路上遊蕩。",
    ["Defeat every foe close by before you begin."] =
        "開始前先打倒附近所有敵人。",
    ["Escort Dorius Stonetender and keep him safe."] =
        "護送杜里奧斯·脆石，並確保他的安全。",
    ["Keep it; a later quest calls for it."] =
        "留著它；之後的任務會用到。",
    ["Look by the lookout towers ringing the Cauldron."] =
        "在大熔爐周圍的瞭望塔附近尋找。",
    ["Climb the trail into Thorium Point"] =
        "沿小路往上進入瑟銀哨塔",
    ["Blasted Lands and Burning Steppes"] =
        "詛咒之地和燃燒平原",
    ["Prioritize these targets."] =
        "優先處理這些目標。",
    ["Hunt basilisks."] =
        "獵殺石化蜥蜴。",
    ["They appear in the same spots as the boars."] =
        "牠們和野豬在相同的地點出現。",
    ["Hunt hyenas for these."] =
        "獵殺土狼取得這些。",
    ["Scorpions spawn in the same spots."] =
        "蠍子也在相同的地點重生。",
    ["Climb the trail to Morgan's Vigil"] =
        "沿小路往上前往摩根崗哨",
    ["Flight master at Morgan's Vigil"] =
        "摩根崗哨的飛行管理員",
    ["8 different quests will ask for it."] =
        "會有8個不同的任務需要它。",
    ["You hand in 60 pieces of cloth for every quest."] =
        "每個任務要交付60塊布料。",
    ["Undead foes drop these in both Plaguelands zones, Western and Eastern."] =
        "西瘟疫之地和東瘟疫之地的不死族敵人都會掉落這些。",
    ["Keep your Argent Dawn Commission aura up."] =
        "保持銀色黎明委任徽章的效果。",
    ["Together with the next turn-ins, this brings you to level 52."] =
        "加上接下來交付的任務，這會讓你升到52級。",
    ["Azshara and Felwood"] =
        "艾薩拉和費伍德森林",
    ["A lengthy stretch of questing lies ahead."] =
        "接下來要做一長串任務。",
    ["Hand these in afterwards for experience and reputation."] =
        "之後交付這些，換取經驗值和聲望。",
    ["Raise Timbermaw Hold standing to Unfriendly"] =
        "將木喉要塞聲望提升到冷淡",
    ["Extra targets wait in the caves."] =
        "洞穴裡還有更多目標。",
    ["Stay on the trail to reach Jaedenar"] =
        "沿著小路前往加德納爾",
    ["Climb the trail into Jadefire Run"] =
        "沿小路往上進入Jadefire Run",
    ["Flight master at Talonbranch Glade"] =
        "刺枝林地的飛行管理員",
    ["Big blue plumes."] =
        "藍色的大羽毛。",
    ["Head eastward as you go."] =
        "一路往東前進。",
    ["You pick up Claw (Rank 7) here."] =
        "你在這裡學到爪擊（等級7）。",
    ["Flight master at Everlook"] =
        "永望鎮的飛行管理員",
    ["The flight master stands past the walls, outdoors."] =
        "飛行管理員在城牆外的戶外。",
    ["Tame an Angerclaw Mauler with your Tame Beast spell."] =
        "用你的馴服野獸法術馴服一隻怒爪巨熊。",
    ["Track down a plague-ridden bear with a chestnut coat."] =
        "找出一隻栗色毛皮、染上瘟疫的熊。",
    ["Feralas and Azshara"] =
        "菲拉斯和艾薩拉",
    ["Aim the item at the Strider foes."] =
        "對Strider敵人使用這個物品。",
    ["The targets are towering green giants."] =
        "目標是高大的綠色巨人。",
    ["The item strips their elite status."] =
        "這個物品會移除牠們的精英狀態。",
    ["Hunt down the elementals formed of water."] =
        "獵殺由水構成的元素。",
    ["Reveal Dire Maul on your map"] =
        "在地圖上揭露厄運之槌",
    ["Stand on the neighboring ledge, then hop into this crack in the wall"] =
        "站在旁邊的岩架上，然後跳進牆上的這道裂縫",
    ["Hop onto the ledge"] =
        "跳上岩架",
    ["Leap over at this spot"] =
        "從這裡跳過去",
    ["Leap up at this spot"] =
        "從這裡跳上去",
    ["Shay Leafrunner trails behind you; keep her alive."] =
        "沙恩·飄葉會跟在你身後；保住她的性命。",
    ["Keep near her, as she tends to stray."] =
        "待在她附近，因為她容易走散。",
    ["Finish the quest named The Videre Elixir."] =
        "完成名為「視靈藥劑」的任務。",
    ["Keep the elixir in your bags; never consume it."] =
        "把藥劑留在背包裡；絕對不要喝。",
    ["You will die from it."] =
        "你會因此死亡。",
    ["Put these items in your bank vault."] =
        "把這些物品放進你的銀行。",
    ["The quest giver waits on the hilltop."] =
        "任務發布者在山頂等候。",
    ["The targets are Myrmidons and Sirens."] =
        "目標是侍從和海妖。",
    ["Skirt the Ruins of Eldarath, then take the bridge across"] =
        "繞過Ruins of Eldarath，再走橋過去",
    ["Drop down with care"] =
        "小心地跳下去",
    ["The spot is the middle of the timber deck."] =
        "地點在木製平台的中央。",
    ["It shows up close by after a while."] =
        "過一會兒它會在附近出現。",
    ["At times it takes several minutes."] =
        "有時需要好幾分鐘。",
    ["The targets are flame elementals."] =
        "目標是火元素。",
    ["An elite foe waits on the summit; steer clear."] =
        "山頂上有一個精英敵人；避開它。",
    ["Ringo trails behind you; keep him alive."] =
        "林格會跟在你身後；保住他的性命。",
    ["Keep near him; he passes out."] =
        "待在他附近；他會昏倒。",
    ["Take the trail through the cavern"] =
        "走穿過洞穴的小路",
    ["Escort A-Me 01 and keep it alive."] =
        "護送艾米 01，並保住它的性命。",
    ["Winterspring and Felwood"] =
        "冬泉谷和費伍德森林",
    ["Go into Jaedenar"] =
        "進入加德納爾",
    ["Go to the upper floor of the cavern."] =
        "前往洞穴的上層。",
    ["Circle the gap in the ground, then take the trail downward"] =
        "繞過地上的缺口，再走小路往下",
    ["The target is deep in the cave, on its lowest floor."] =
        "目標在洞穴深處的最底層。",
    ["Search the upper and lower floors of the cavern."] =
        "搜尋洞穴的上層和下層。",
    ["The prisoner is held in a cage of yellow wood."] =
        "囚犯被關在黃色的木籠裡。",
    ["Climb the trail and exit the cavern"] =
        "沿小路往上，離開洞穴",
    ["The targets are furbolgs."] =
        "目標是熊怪。",
    ["With the coming hand-ins, this brings you to level 55."] =
        "加上接下來交付的任務，這會讓你升到55級。",
    ["A tough quest lies just ahead."] =
        "接下來是一個困難的任務。",
    ["Flee if things go badly."] =
        "情況不妙就逃跑。",
    ["The NPC is a human spirit."] =
        "NPC是一個人類的靈魂。",
    ["The targets are leafless trees that walk."] =
        "目標是會走路、沒有葉子的樹。",
    ["Slay the greenish beings of living water."] =
        "殺死綠色的活水生物。",
    ["The targets are wolves and bears."] =
        "目標是狼和熊。",
    ["The targets are 3 white furbolgs moving as one pack."] =
        "目標是3隻一起行動的白色熊怪。",
    ["The target patrols a long route beside the road."] =
        "目標沿著道路旁的一條長路線巡邏。",
    ["Move on if you have not seen it once the trail ends."] =
        "走到小路盡頭還沒看到它的話，就繼續前進。",
    ["Escort Ranshalla and guard her."] =
        "護送蘭莎爾拉並保護她。",
    ["Wait until the foes hit her before you strike."] =
        "等敵人攻擊她之後再出手。",
    ["They appear near 28.1, 35.0 in Winterspring."] =
        "牠們出現在冬泉谷的28.1, 35.0附近。",
    ["You can also do dungeons until you hit level 56."] =
        "你也可以刷地城直到56級。",
    ["Give Nafien the items in sets of 5."] =
        "每5個一組把物品交給納菲恩。",
    ["Every full set you hand over earns 50 reputation."] =
        "每交付完整的一組可獲得50點聲望。",
    ["Raise Timbermaw Hold standing to Neutral"] =
        "將木喉要塞聲望提升到中立",
    ["The NPC stands within the passage."] =
        "NPC站在通道裡。",
    ["This foe is elite."] =
        "這個敵人是精英。",
    ["Target Black Broodlings with the item."] =
        "對黑色小龍使用這個物品。",
    ["A red crystal hovers over each body."] =
        "每具屍體上方都漂浮著一顆紅色水晶。",
    ["Hunt the huge red dragons."] =
        "獵殺巨大的紅龍。",
    ["Look for gray standing stones."] =
        "尋找灰色的立石。",
    ["The target is an ogre."] =
        "目標是一個食人魔。",
    ["Watch out, its blows are strong."] =
        "小心，它的攻擊很強。",
    ["The targets are wolves and orcs."] =
        "目標是狼和獸人。",
    ["The NPC is an elderly human lady."] =
        "NPC是一位年長的人類女士。",
    ["If absent, she can be on the house's upper floor, at 52.4, 42.1 in Stormwind City."] =
        "如果不在，她可能在房子的樓上，位於暴風城的52.4, 42.1。",
    ["Walk over the rope bridge, then climb the trail"] =
        "走過吊橋，再沿小路往上",
    ["The Plaguelands"] =
        "瘟疫之地",
    ["Check each of the two floors indoors."] =
        "檢查室內的兩層樓。",
    ["Stand at the watchtower's doorway."] =
        "站在瞭望塔的門口。",
    ["An elite foe waits indoors; stay clear of it."] =
        "室內有一個精英敵人；避開它。",
    ["Spiders also appear at these spawn spots."] =
        "蜘蛛也會在這些重生點出現。",
    ["Look for a white set of bones."] =
        "尋找一副白色的骨頭。",
    ["The targets appear in several places."] =
        "目標出現在好幾個地方。",
    ["Finish Locked Away to obtain this."] =
        "完成「Locked Away」以取得它。",
    ["The target is a ghoul armed with a pitchfork."] =
        "目標是一隻拿著乾草叉的食屍鬼。",
    ["Elites roam close by; keep your distance."] =
        "精英怪在附近遊蕩；保持距離。",
    ["Search the bones of a fallen person."] =
        "搜尋一具倒下之人的遺骨。",
    ["The NPC is within the ruined home."] =
        "NPC在毀壞的房屋裡。",
    ["Search within the houses here."] =
        "搜尋這裡的房屋內部。",
    ["Look for big yellow grubs."] =
        "尋找黃色的大幼蟲。",
    ["With the coming hand-ins, this gets you to level 58."] =
        "加上接下來交付的任務，這會讓你升到58級。",
    ["Flight master at Light's Hope Chapel"] =
        "聖光之願禮拜堂的飛行管理員",
    ["Look for big rocks seeping green slime."] =
        "尋找滲出綠色黏液的大岩石。",
    ["Progress westward as you go."] =
        "一路往西推進。",
    ["Other undead compete for the same spawn points."] =
        "其他不死族也會佔用相同的重生點。",
    ["The spirits rise where those foes die."] =
        "這些敵人死亡的地方會冒出靈魂。",
    ["Go down into the tomb"] =
        "往下進入墓穴",
    ["This is below ground, on the crypt's lower floor."] =
        "這在地下，墓穴的下層。",
    ["Your character must be seated first."] =
        "你的角色必須先坐下。",
    ["Move the camera close and check which book is genuine."] =
        "把鏡頭拉近，確認哪一本書是真的。",
    ["Some books are traps that summon foes."] =
        "有些書是會召喚敵人的陷阱。",
    ["The genuine book can look two ways:"] =
        "真的書有兩種外觀：",
    ["Close to the big buildings lit in blue."] =
        "靠近亮著藍光的大型建築。",
    ["A new one may appear when one is killed."] =
        "殺死一隻後可能會出現新的。",
    ["The targets are in the ruined houses."] =
        "目標在毀壞的房屋裡。",
    ["It shows up on top of the box."] =
        "它會出現在箱子上面。",
    ["Targets are in the tower and around its base."] =
        "目標在塔內和塔底周圍。",
    ["If an elite stands on the tower's roof, hold back outside."] =
        "如果塔頂上有精英怪，就留在外面等。",
    ["Pick up Claw (Rank 8) for your pet."] =
        "為你的寵物學習爪擊（等級8）。",
    ["Tame a Winterspring Screecher with the Tame Beast spell."] =
        "用馴服野獸法術馴服一隻冬泉鳴梟。",
    ["Hunt the white owls."] =
        "獵殺白色的貓頭鷹。",
    ["Either the patriarch or the matriarch yetis work."] =
        "雪人族長或雪人女族長都可以。",
    ["Climb across the mountain to the far side"] =
        "翻過山到另一邊",
    ["Hunt the chimaeras."] =
        "獵殺奇美拉。",
    ["Target Legacki with the item."] =
        "對萊加奇使用這個物品。",
    ["Target Sprinkle with it."] =
        "對斯普琳科使用它。",
    ["Target Quixxil with it."] =
        "對奎克希爾使用它。",
    ["Flight master at Cenarion Hold"] =
        "塞納里奧城堡的飛行管理員",
    ["Watch out: killing them can summon more foes."] =
        "小心：殺死牠們可能會召喚更多敵人。",
    ["Look for fragments of rock that glow blue."] =
        "尋找發出藍光的岩石碎片。",
    ["Roam the area where the insects swarm."] =
        "在蟲群聚集的區域四處搜尋。",
    ["Hunt the gray scorpids."] =
        "獵殺灰色的蠍子。",
    ["The target is an orc wearing violet robes."] =
        "目標是一個穿著紫色長袍的獸人。",
    ["It shows up around here."] =
        "它會在這附近出現。",
    ["Hunt the yellow scorpids."] =
        "獵殺黃色的蠍子。",
    ["Target the burrowing worms."] =
        "目標是會鑽地的蠕蟲。",
    ["This number shrinks while you kill monsters."] =
        "打怪時這個數字會逐漸減少。",
    ["Bring any feathers you collect to the NPC at 64.8, 8.1."] =
        "把收集到的羽毛交給64.8, 8.1的NPC。",
    ["The NPC stands outdoors, next to the crypt."] =
        "NPC站在戶外，墓穴旁邊。",
    ["The targets are bats."] =
        "目標是蝙蝠。",
    ["Check in and around the structures."] =
        "檢查建築物內外。",
    ["With the coming hand-ins, this gets you to level 5."] =
        "加上接下來交付的任務，這會讓你升到5級。",
    ["The target is a shambling zombie."] =
        "目標是一隻蹣跚而行的殭屍。",
    ["The quest giver is an abomination."] =
        "任務給予者是一隻憎惡。",
    ["He may step off the road now and then to pick plants."] =
        "他偶爾會離開道路去採集植物。",
    ["Heal Deathguard Kel with Lesser Heal (Rank 2)."] =
        "用次級治療術（等級2）治療亡靈衛兵科爾。",
    ["Buff Deathguard Kel with Power Word: Fortitude."] =
        "為亡靈衛兵科爾施加真言術：韌。",
    ["The targets are gray, demon-like hounds."] =
        "目標是灰色、像惡魔一樣的獵犬。",
    ["The targets are zombies."] =
        "目標是殭屍。",
    ["Look for wilted violet weeds."] =
        "尋找枯萎的紫色雜草。",
    ["Walk the shoreline toward the southwest."] =
        "沿著海岸線往西南走。",
    ["If the beach ends first, move on without it."] =
        "如果海灘先走到盡頭，就放棄它，繼續前進。",
    ["Keep to the trail as it curves."] =
        "沿著彎曲的小路走。",
    ["Step into the flames."] =
        "走進火焰中。",
    ["Stay on the trail and keep climbing the steps"] =
        "沿著小路走，繼續爬上台階",
    ["Loot the gray chests built from metal."] =
        "拾取灰色的金屬箱子。",
    ["Search in and around the sunken wrecks."] =
        "在沉船殘骸內外搜尋。",
    ["The target is a troll in crimson robes."] =
        "目標是一個穿著深紅長袍的食人妖。",
    ["Look for the skull-shaped objects."] =
        "尋找骷髏形狀的物件。",
    ["The targets are clumps of purple eggs."] =
        "目標是一團團紫色的蛋。",
    ["Search close to the trunks."] =
        "在樹幹附近搜尋。",
    ["Stay on the trail, then cross the tunnel"] =
        "沿著小路走，然後穿過隧道",
    ["Traverse the passageway"] =
        "穿過通道",
    ["Fly to Orgrimmar"] =
        "飛往奧格瑪",
    ["The quest comes from a bounty sign."] =
        "任務來自一塊懸賞告示牌。",
    ["Look for an iron slab marked with a skull."] =
        "尋找一塊刻有骷髏標記的鐵板。",
    ["Use the item at the pink marking."] =
        "在粉紅色標記處使用物品。",
    ["Move gradually northwest toward Agamand Mills."] =
        "逐步往西北移動，前往阿加曼德磨坊。",
    ["The target is a skeletal caster in armor."] =
        "目標是一個穿著盔甲的骷髏施法者。",
    ["The target is a banshee."] =
        "目標是一隻女妖。",
    ["The targets are skeletons in armor."] =
        "目標是穿著盔甲的骷髏。",
    ["The targets are skeletal mages."] =
        "目標是骷髏法師。",
    ["Together with the next turn-ins, this brings you to level 13."] =
        "加上接下來交的任務，這能讓你升到13級。",
    ["The target patrols the road from Brill to The Sepulcher."] =
        "目標在布瑞爾到瑟伯切爾之間的道路上巡邏。",
    ["The target appears close to The Sepulcher, at 47.5, 39.8 in Silverpine Forest."] =
        "目標出現在瑟伯切爾附近，銀松森林47.5, 39.8。",
    ["Fight quilboars."] =
        "與野豬人戰鬥。",
    ["Look for little brown pinecones."] =
        "尋找棕色的小松果。",
    ["Hunt the black-feathered birds."] =
        "獵殺黑色羽毛的鳥。",
    ["Look for gray slabs of stone lying flat."] =
        "尋找平放在地上的灰色石板。",
    ["Do not trail after the wolf."] =
        "不要跟著那隻狼走。",
    ["Take the lift to the top of Thunder Bluff"] =
        "搭升降梯到雷霆崖頂端",
    ["Beside the forge."] =
        "在熔爐旁邊。",
    ["Take a lift down out of Thunder Bluff"] =
        "搭升降梯下去，離開雷霆崖",
    ["Aim the item at one Adult Plainstrider."] =
        "將物品對準一隻成年平原陸行鳥使用。",
    ["Target a Prairie Stalker with it."] =
        "以一隻草原捕食者為目標使用它。",
    ["Use the item on any Swoop."] =
        "對任意一隻猛鷲使用物品。",
    ["Choose an animal of level 9-10 and make it your pet with the Tame Beast spell."] =
        "選一隻9-10級的動物，用馴服野獸法術把牠收為寵物。",
    ["This pet is temporary; a lasting one comes shortly."] =
        "這隻寵物是臨時的；很快就會有永久的寵物。",
    ["Flight master at Camp Taurajo"] =
        "陶拉祖營地飛行管理員",
    ["Fly to Thunder Bluff"] =
        "飛往雷霆崖",
    ["Stick to the road and stay alert."] =
        "沿著道路走，保持警覺。",
    ["Flight master at the Crossroads"] =
        "十字路口飛行管理員",
    ["This is food for your pet."] =
        "這是給你寵物的食物。",
    ["A spirit shows up after this."] =
        "之後會出現一個靈魂。",
    ["Find one Venomtail Scorpid and use Tame Beast on it."] =
        "找一隻毒尾蠍，對牠使用馴服野獸。",
    ["Release your current pet before this."] =
        "在這之前先釋放你目前的寵物。",
    ["Here you tame a pet to keep."] =
        "在這裡馴服一隻要長期保留的寵物。",
    ["The NPC waits at the mountain's summit."] =
        "NPC在山頂等候。",
    ["Kill Water Seekers and Thornweavers."] =
        "擊殺尋水者和織棘者。",
    ["The objective is at the far end."] =
        "目標位於最遠端。",
    ["Receive Sapta Sight"] =
        "獲得Sapta Sight",
    ["The quest giver stands among the boulders."] =
        "任務給予者站在巨石之間。",
    ["This NPC is found down in the Cleft of Shadow."] =
        "這個NPC在下方的暗影裂口裡。",
    ["This clears the quest's time limit."] =
        "這會解除任務的時間限制。",
    ["Fly to Undercity"] =
        "飛往幽暗城",
    ["Orc and Troll start"] =
        "獸人和食人妖起始區",
    ["Stay out of the cave when you can."] =
        "盡可能不要進入洞穴。",
    ["The following step is out of the cave."] =
        "下一步在洞穴外面。",
    ["Look for a dark-shelled scorpion."] =
        "尋找一隻深色外殼的蠍子。",
    ["Target Lazy Peons with the item."] =
        "將物品對準懶惰的苦工使用。",
    ["The targets are dozing orcs."] =
        "目標是正在打瞌睡的獸人。",
    ["Look for cacti bearing red fruit."] =
        "尋找結著紅色果實的仙人掌。",
    ["Heal Grunt Kor'ja with the second rank of Lesser Heal."] =
        "用等級2的次級治療術治療蠻兵科雅。",
    ["Buff Grunt Kor'ja with Power Word: Fortitude."] =
        "為蠻兵科雅施加真言術：韌。",
    ["Aim the item at one Dire Mottled Boar."] =
        "將物品對準一隻可怕的雜斑野豬使用。",
    ["Use it on any Surf Crawler."] =
        "對任意一隻海浪蟹使用它。",
    ["Use it on any Armored Scorpid."] =
        "對任意一隻硬甲蠍使用它。",
    ["This leads to a quest for later levels."] =
        "這會引出一個較高等級才能做的任務。",
    ["Escort Deathstalker Erland and keep him alive."] =
        "護送亡靈哨兵埃蘭德，讓他活下來。",
    ["Hunt the wolves whose fur is jet black."] =
        "獵殺毛色漆黑的狼。",
    ["Pick one Ferocious Grizzled Bear and tame it with Tame Beast."] =
        "挑一隻兇猛的灰斑熊，用馴服野獸馴服牠。",
    ["Fly to The Sepulcher"] =
        "飛往瑟伯切爾",
    ["He has three ghouls at his side."] =
        "他身邊有三隻食屍鬼。",
    ["Hold off until one steps out, then slay it."] =
        "等到有一隻走出來，再擊殺牠。",
    ["The target shows up here sooner or later."] =
        "目標遲早會出現在這裡。",
    ["The NPC is on Undercity's upper level."] =
        "NPC在幽暗城的上層。",
    ["The NPC is in a little cave."] =
        "NPC在一個小洞穴裡。",
    ["The NPC is past the big trogg chamber, on its right side."] =
        "NPC在穿過大型穴居人房間之後的右側。",
    ["The quest giver waits in the tent."] =
        "任務給予者在帳篷裡等候。",
    ["Move on if it is absent."] =
        "如果它不在，就繼續前進。",
    ["If it isn't there, hold on until it shows up."] =
        "如果它不在那裡，就等到它出現。",
    ["Circle the mountain by its northern flank."] =
        "從北側繞過這座山。",
    ["The target is a troll."] =
        "目標是一個食人妖。",
    ["The target is a human in a crimson long coat."] =
        "目標是一個穿著深紅色長大衣的人類。",
    ["The targets are the striped zhevras."] =
        "目標是有條紋的斑馬。",
    ["Go into the water beside the rock that bubbles."] =
        "在冒泡的岩石旁邊下水。",
    ["Look for big blue fungi."] =
        "尋找大型的藍色真菌。",
    ["Up to two foes might jump you."] =
        "最多可能有兩個敵人突襲你。",
    ["Kill the purple raptors."] =
        "擊殺紫色的迅猛龍。",
    ["Targets are found across the entire Barrens."] =
        "目標遍佈整個貧瘠之地。",
    ["Slay any you come across along the way."] =
        "沿途遇到的都殺掉。",
    ["With the coming hand-ins, this gets you to level 18."] =
        "加上接下來交的任務，這能讓你升到18級。",
    ["Steal from Gamon using Pick Pocket."] =
        "用偷竊從Gamon身上偷東西。",
    ["Use it on Tazan's Satchel."] =
        "對塔贊的背包使用它。",
    ["The item is already in your inventory."] =
        "這個物品已經在你的背包裡了。",
    ["Check the upper and lower tiers of the structure."] =
        "檢查建築的上層和下層。",
    ["Escort Wizzlecrank's Shredder and keep it intact."] =
        "護送維茲克蘭克的伐木機，保持它完好無損。",
    ["Look for gray steel pails."] =
        "尋找灰色的鋼桶。",
    ["The target is a pale lion."] =
        "目標是一隻淺色的獅子。",
    ["It turns up in the area."] =
        "它會在這個區域出現。",
    ["Keep away from Sister Rathtalon."] =
        "遠離鷹女萊絲塔倫。",
    ["The target is a harpy with emerald plumage; beware, it is elite."] =
        "目標是一隻翠綠羽毛的鷹身人；小心，牠是精英。",
    ["The target circles in the air, so search around."] =
        "目標在空中盤旋，所以四處找找。",
    ["A small chest made of wood."] =
        "一個小木箱。",
    ["Polly is the target for the item."] =
        "物品的使用目標是波利。",
    ["Defeat Kolkar foes around Stagnant Oasis."] =
        "在死水綠洲周圍擊敗科卡爾敵人。",
    ["Sooner or later a yell shows up in the chat window."] =
        "聊天視窗遲早會出現一聲大喊。",
    ["Watch for his yell: I am summoned!"] =
        "留意他的大喊：「我被召喚了！」",
    ["Verog arrives after a shout dares intruders to his tent to die."] =
        "有人大喊要入侵者到他的帳篷送死之後，Verog就會出現。",
    ["Escort Kaya Flathoof and keep her safe."] =
        "護送卡雅·扁蹄，確保她的安全。",
    ["Close to the finish, 3 foes ambush you together."] =
        "快到終點時，會有3個敵人一起伏擊你。",
    ["Fly to Sun Rock Retreat"] =
        "飛往烈日石居",
    ["Gather the big, white eggs."] =
        "收集白色的大蛋。",
    ["Monsters might jump you here."] =
        "怪物可能會在這裡突襲你。",
    ["Hatchling spiders may bring a level 22 spider."] =
        "幼蛛可能會引來一隻22級的蜘蛛。",
    ["Together with the next turn-ins, this brings you to level 20."] =
        "加上接下來交的任務，這能讓你升到20級。",
    ["Look for a kodo with grey hide."] =
        "尋找一隻灰色皮膚的科多獸。",
    ["The targets are big pink lizards."] =
        "目標是粉紅色的大蜥蜴。",
    ["The targets are under the water and along the shore."] =
        "目標在水下和岸邊。",
    ["The target is a raptor."] =
        "目標是一隻迅猛龍。",
    ["Trade your Blood Shards to gain buffs."] =
        "用你的血岩碎片換取增益效果。",
    ["Trade any spare Blood Shards to him during your Barrens questing."] =
        "在貧瘠之地做任務期間，把多餘的血岩碎片都拿來跟他交換。",
    ["Ask him for the Spirit of the Wind buff"] =
        "向他要求風之魂增益效果",
    ["Hunt the winged serpents."] =
        "獵殺有翼的蛇。",
    ["Take the lift up into Thunder Bluff"] =
        "搭升降梯上到雷霆崖",
    ["The object is a vase woven from wicker."] =
        "這個物件是柳條編織的花瓶。",
    ["They appear in scattered spots."] =
        "它們出現在零散的地點。",
    ["Climb the mountainside"] =
        "爬上山坡",
    ["Descend the slope"] =
        "走下斜坡",
    ["Drop with care onto the rock, then go into the cave"] =
        "小心跳到岩石上，然後進入洞穴",
    ["The targets are oozes."] =
        "目標是軟泥怪。",
    ["Look for little green shrubs bearing violet blooms."] =
        "尋找開著紫色花朵的綠色小灌木。",
    ["A centaur flanked by two bodyguards."] =
        "一個由兩名保鏢護衛的半人馬。",
    ["Climb the trail and cross the peaks"] =
        "沿小路往上爬，越過山峰",
    ["Look for a robot shaped like a person."] =
        "尋找一個人形機器人。",
    ["The target appears right here."] =
        "目標就出現在這裡。",
    ["Take the passage and trace the lantern trail into Ashenvale"] =
        "走進通道，沿著燈籠的路線前往梣谷",
    ["Stay clear of Astranaar."] =
        "遠離阿斯特蘭納。",
    ["Exit the tunnel into Ashenvale"] =
        "出隧道進入梣谷",
    ["Flight master at Zoram'gar Outpost"] =
        "Zoram'gar Outpost飛行管理員",
    ["The NPC waits within the hut."] =
        "NPC在小屋裡等候。",
    ["Use it twice on Taskmaster Fizzule."] =
        "對監工費蘇勒使用兩次。",
    ["A short way north of here."] =
        "在這裡往北不遠處。",
    ["Target Taskmaster Fizzule and salute him."] =
        "以監工費蘇勒為目標，向他敬禮。",
    ["Rob Foreman Silixiz with Pick Pocket."] =
        "用偷竊從工頭希里克斯身上偷東西。",
    ["Open with Ambush for a bigger hit."] =
        "以伏擊開場，打出更高的傷害。",
    ["Lean on Rupture for bonus damage."] =
        "多用割裂造成額外傷害。",
    ["Eviscerate adds a burst of damage here."] =
        "剔骨在這裡能打出一波爆發傷害。",
    ["The objective is on the terrace above."] =
        "目標在上方的露台。",
    ["Use Pick Lock to open it."] =
        "用開鎖打開它。",
    ["Poison crafting needs these."] =
        "製作毒藥需要這些。",
    ["Flight master at Tarren Mill"] =
        "塔倫米爾飛行管理員",
    ["Get rid of your Touch of Zanzil."] =
        "消除你身上的贊吉爾之觸。",
    ["Pick any Gray Bear and use Tame Beast on it."] =
        "挑任意一隻灰熊，對牠使用馴服野獸。",
    ["Go into Durnholde Keep, then over the bridge"] =
        "進入敦霍爾德城堡，然後過橋",
    ["Look for it bound to the orc's leg."] =
        "它綁在那名獸人的腿上，找找看。",
    ["Together with the next turn-ins, this brings you to level 23."] =
        "加上接下來交的任務，這能讓你升到23級。",
    ["Indoors or out in the open fields."] =
        "在室內，或在外面的空地上。",
    ["It may be found outdoors too."] =
        "在戶外也可能找到。",
    ["The NPC is a little wolf."] =
        "這個NPC是一隻小狼。",
    ["He goes berserk and attacks you once the quest is handed in."] =
        "交完任務後，他會發狂並攻擊你。",
    ["A woman holding a pitchfork."] =
        "一個拿著乾草叉的女人。",
    ["The target patrols the trail between the houses."] =
        "目標在房屋之間的小路上巡邏。",
    ["The target's spawn point is 30.5, 40.6 in Hillsbrad Foothills."] =
        "目標的重生點在希爾斯布萊德丘陵30.5, 40.6。",
    ["With the coming hand-ins, this brings you to level 24."] =
        "加上接下來交的任務，這能讓你升到24級。",
    ["Tougher foes are coming up next."] =
        "接下來的敵人會更強。",
    ["Some may be in the smithy."] =
        "有些可能在鐵匠鋪裡。",
    ["The NPC is in the yard where black wolves roam."] =
        "NPC在黑狼遊蕩的院子裡。",
    ["Do this once the prisoner is free."] =
        "等囚犯獲釋後再做這個。",
    ["The tome is blue, resting on a bookshelf."] =
        "那本書是藍色的，放在書架上。",
    ["Look in the room where Fenrus is."] =
        "到芬魯斯所在的房間找找。",
    ["The target is a dinosaur with blue hide."] =
        "目標是一隻藍色皮膚的恐龍。",
    ["Look for big boulders oozing green fluid."] =
        "尋找滲出綠色液體的大石塊。",
    ["The target is a quilboar robed in red."] =
        "目標是一個穿紅袍的野豬人。",
    ["Kill Stalkers and Pathfinders."] =
        "擊殺潛獵者和探路者。",
    ["The target is a red winged serpent."] =
        "目標是一條紅色的有翼蛇。",
    ["The target roams; check the area."] =
        "目標會四處遊蕩；在這一帶找找。",
    ["Keep some range when you use the item."] =
        "使用物品時保持一點距離。",
    ["With the coming hand-ins, this gets you to level 25."] =
        "加上接下來交的任務，這能讓你升到25級。",
    ["Fly to Brackenwall Village"] =
        "飛往蕨牆村",
    ["The target is an aquatic dinosaur."] =
        "目標是一隻水生恐龍。",
    ["The target roams through the water."] =
        "目標在水中遊蕩。",
    ["The target is beneath the platform."] =
        "目標在平台下方。",
    ["The target stands atop the timber platform."] =
        "目標站在木製平台上。",
    ["Exit Windshear Crag"] =
        "離開狂風峭壁",
    ["The targets are deer."] =
        "目標是鹿。",
    ["The targets are tiny blue dragons."] =
        "目標是藍色的小龍。",
    ["Hunt the green slimes."] =
        "獵殺綠色的黏液怪。",
    ["Corrosive Sap Beasts use the same spawn points."] =
        "Corrosive Sap Beast也使用相同的重生點。",
    ["Do not engage Sentinel Amarassan."] =
        "不要與哨兵阿瑪拉珊交戰。",
    ["The quarry is a kaldorei elite, level 27."] =
        "獵物是一名27級的精英卡多雷。",
    ["Exit Stonetalon Peak"] =
        "離開石爪峰",
    ["Look for brown pinecones on the ground."] =
        "尋找地上的棕色松果。",
    ["Steer clear of the elite windstrider."] =
        "遠離精英windstrider。",
    ["Basilisks and moving tree creatures share these spawn points."] =
        "石化蜥蜴和會走動的樹木生物共用這些重生點。",
    ["Monsters are found throughout the Charred Vale."] =
        "怪物遍佈整個焦炭谷。",
    ["Take the trail toward Sun Rock Retreat"] =
        "沿著小路前往烈日石居",
    ["Stay on the trail until the Charred Vale"] =
        "沿著小路一直走到焦炭谷",
    ["The NPC is on the tower's middle floor."] =
        "NPC在塔的中間樓層。",
    ["Flight master at Splintertree Post"] =
        "碎木崗哨飛行管理員",
    ["The targets are night elves hiding in stealth."] =
        "目標是潛行中的夜精靈。",
    ["Track Hidden makes them simpler to spot."] =
        "追蹤隱藏生物能讓他們更容易被發現。",
    ["Escort Torek and guard him."] =
        "護送托雷克並保護他。",
    ["Don't let him die."] =
        "別讓他死掉。",
    ["Take the riverside trail, then climb this trail"] =
        "沿著河邊的小路走，再爬上這條小路",
    ["The target is a panther with black fur."] =
        "目標是一隻黑毛獵豹。",
    ["The target roams a wide route."] =
        "目標會在大範圍的路線上遊蕩。",
    ["The target appears close to 62.4, 50.0 in Ashenvale."] =
        "目標出現在梣谷62.4, 50.0附近。",
    ["Take the trail north into Thistlefur Hold"] =
        "沿著小路往北進入薊皮要塞",
    ["Search the brown crates built of timber."] =
        "搜查棕色的木箱。",
    ["Mostly on the cavern's upper level."] =
        "大多在洞穴的上層。",
    ["The NPC is on the cave's lowest level."] =
        "NPC在洞穴的最底層。",
    ["Escort Ruul Snowhoof and keep him alive."] =
        "護送盧爾·雪蹄，讓他活下來。",
    ["Look for a gray druid-style bear."] =
        "尋找一隻灰色、德魯伊模樣的熊。",
    ["The target is a watery being tinted a deeper green."] =
        "目標是一個帶著較深綠色調的水元素生物。",
    ["Together with the next turn-ins, this brings you to level 28."] =
        "加上接下來交的任務，這能讓你升到28級。",
    ["Steer away from Silverwind Refuge."] =
        "避開Silverwind Refuge。",
    ["Climb the trail, then return by road to Splintertree Post"] =
        "沿小路往上爬，再沿道路返回碎木崗哨",
    ["Escort Muglash and keep him safe."] =
        "護送穆格拉什，確保他的安全。",
    ["If the item isn't usable yet, hold on a moment."] =
        "如果物品還不能使用，稍等一下。",
    ["Go into the Blackfathom Deeps instance"] =
        "進入黑暗深淵副本",
    ["In Blackfathom Deeps, naga enemies drop it."] =
        "在黑暗深淵中，由納迦敵人掉落。",
    ["The targets are all over the tunnels."] =
        "目標遍佈隧道各處。",
    ["Collect the azure shards along the cavern sides in Blackfathom Deeps."] =
        "在黑暗深淵沿著洞穴兩側收集蔚藍色的碎片。",
    ["Head to the Moonshrine Ruins for this."] =
        "前往Moonshrine Ruins完成這個。",
    ["Head back to Splintertree Post"] =
        "返回碎木崗哨",
    ["Your quarry is a huge azure bird of level 31."] =
        "你的獵物是一隻31級的巨大蔚藍色鳥類。",
    ["The target circles over a wide area."] =
        "目標在大範圍區域的上空盤旋。",
    ["It appears near 78.0, 66.0 in Ashenvale."] =
        "它出現在梣谷78.0, 66.0附近。",
    ["Take a lift down to Thousand Needles, walk the road toward Freewind Post, then a lift back up"] =
        "搭升降梯下到千針石林，沿著道路走向亂風崗，再搭升降梯上去",
    ["Fly to Freewind Post"] =
        "飛往亂風崗",
    ["A pair of level 30 foes stand guard over it."] =
        "有兩個30級的敵人看守著它。",
    ["Use the teleporter to reach the Plateau"] =
        "使用傳送器前往台地",
    ["Go back to Dorn Plainstalker"] =
        "回到多恩·平原行者那裡",
    ["This won't kill you."] =
        "這不會讓你死掉。",
    ["Kill Surveyors and Diggers."] =
        "擊殺測量員和挖掘者。",
    ["Take the lift upward"] =
        "搭升降梯上去",
    ["Look for big eggs."] =
        "尋找大蛋。",
    ["Keep away from Heartrazor."] =
        "遠離撕心者。",
    ["Steelsnap is a brown hyena with 2 hyena escorts."] =
        "Steelsnap是一隻棕色土狼，身邊有2隻土狼護衛。",
    ["The target appears near 17.3, 22.2 in Thousand Needles."] =
        "目標出現在千針石林17.3, 22.2附近。",
    ["The target is a centaur, black in color."] =
        "目標是一個黑色的半人馬。",
    ["It roams a wide route."] =
        "它會在大範圍的路線上遊蕩。",
    ["Leave it out if you'd rather not hunt for it."] =
        "如果不想去找它，可以略過。",
    ["His patrol crosses this spot two times."] =
        "他的巡邏路線會經過這個地點兩次。",
    ["Expect three foes to strike."] =
        "預計會有三個敵人來襲。",
    ["Fight off the foes that come at you"] =
        "擊退衝向你的敵人",
    ["Look for thorny plants."] =
        "尋找帶刺的植物。",
    ["Hard quests are coming up."] =
        "接下來是困難的任務。",
    ["Climb the trail and cross the rope bridges"] =
        "沿小路往上爬，走過吊橋",
    ["The objective lies atop the mesa."] =
        "目標在台地頂上。",
    ["The target is a level 28 elite."] =
        "目標是28級精英。",
    ["You can defeat it alone without much trouble."] =
        "你可以不太費力地單獨打倒它。",
    ["Escort Lakota Windsong safely to the end."] =
        "護送拉克塔·風歌安全抵達終點。",
    ["On every plateau, a pair of foes spawns."] =
        "每個台地上都會出現兩個敵人。",
    ["Be ready: this opponent is an elite at level 30."] =
        "做好準備：這個對手是30級精英。",
    ["Leave it if it proves too hard."] =
        "如果太難就放棄。",
    ["Climb the road into Feralas"] =
        "沿道路往上進入菲拉斯",
    ["Should you die, come back to life at Camp Mojache."] =
        "如果你死了，就在莫沙徹營地復活。",
    ["Fly to Camp Mojache"] =
        "飛往莫沙徹營地",
    ["Get Water Sapta done as well."] =
        "也把「Water Sapta」完成。",
    ["You'll need this to pick up an upcoming quest."] =
        "接取之後的一個任務需要這個。",
    ["Leap up and take the trail behind that tree"] =
        "跳上去，走那棵樹後面的小路",
    ["Head north along the river to reach the NPC."] =
        "沿著河往北走，到達NPC那裡。",
    ["Draw foes one at a time if you can."] =
        "盡量一次只拉一個敵人。",
    ["Do not take on the whole group together."] =
        "不要同時對付整群敵人。",
    ["Descend the ramp, then stay on the trail"] =
        "走下坡道，然後沿著小路走",
    ["Climb the trail to the cave's highest level"] =
        "沿著小路爬到洞穴的最高層",
    ["When nearly dead, it calls two guards."] =
        "快死時，它會呼叫兩名守衛。",
    ["Warden Belamoore stands guard over it."] =
        "由典獄官貝拉摩爾看守。",
    ["The target is a mage of level 36."] =
        "目標是一名36級法師。",
    ["Fight Kegan, breaking her line of sight with doors and stairways."] =
        "與Kegan戰鬥，利用門和樓梯阻斷她的視線。",
    ["While Shield Guards glow, stop your melee attacks on them."] =
        "持盾守衛發光時，停止對他們的近戰攻擊。",
    ["Expect heavy damage from it."] =
        "它會造成很高的傷害。",
    ["Together with the next turn-ins, this brings you to level 32."] =
        "加上接下來交的任務，這能讓你升到32級。",
    ["Gather the big fungi."] =
        "收集大型真菌。",
    ["The targets are out in front of the cavern."] =
        "目標在洞穴前方的外面。",
    ["Flight master at Hammerfall"] =
        "落錘鎮飛行管理員",
    ["Stay away from Refuge Pointe."] =
        "遠離避難谷地。",
    ["Together with the next turn-ins, this brings you to level 33."] =
        "加上接下來交的任務，這能讓你升到33級。",
    ["Head out of the Apothecarium"] =
        "離開Apothecarium",
    ["Hive Drones compete for these spawn points."] =
        "Hive Drone也在爭搶這些重生點。",
    ["The NPC is on the building's ground level."] =
        "NPC在建築的一樓。",
    ["The quest giver is in the Dormitory."] =
        "任務給予者在宿舍裡。",
    ["Escort Kernobee to the portal at the dungeon's mouth."] =
        "護送克努比到地城入口的傳送門。",
    ["Open the gray chest built of metal."] =
        "打開灰色的金屬箱子。",
    ["Close to the north wall."] =
        "靠近北牆。",
    ["It shares a chamber with Mekgineer Thermaplugg."] =
        "它與麥克尼爾·瑟瑪普拉格在同一個房間。",
    ["Plan on killing monsters for quite some time."] =
        "準備好要打上好一陣子的怪。",
    ["Other satyrs use the same spawn points."] =
        "其他薩特也使用相同的重生點。",
    ["Take the trail toward Shadowprey Village"] =
        "沿著小路前往葬影村",
    ["Fly to Shadowprey Village"] =
        "飛往葬影村",
    ["Defeat every foe in this chamber before starting."] =
        "開始前先擊敗這個房間裡的所有敵人。",
    ["Target Burning Blade foes with the item."] =
        "將物品對準火刃敵人使用。",
    ["Wait for the foe to be badly hurt, then apply it."] =
        "等敵人受了重傷再使用它。",
    ["Look for big white clams."] =
        "尋找白色的大蛤蜊。",
    ["Flight master at Grom'gol"] =
        "格羅姆高營地飛行管理員",
    ["They appear in the same spots as the panthers."] =
        "牠們出現在與獵豹相同的地點。",
    ["Watch for Shadowmaw Panthers; they are hidden by stealth."] =
        "小心深喉獵豹；牠們處於潛行狀態。",
    ["Tigers compete for the same spawn points."] =
        "老虎也在爭搶相同的重生點。",
    ["The NPC is on the building's lowest floor"] =
        "NPC在建築的最底層",
    ["Climb the steps"] =
        "爬上台階",
    ["You won't find an ammunition seller."] =
        "這裡找不到彈藥商人。",
    ["Guard \"Stinky\" Ignatz as you escort him."] =
        "護送伊格納茲時保護好他。",
    ["Hunt the orange spiders."] =
        "獵殺橘色的蜘蛛。",
    ["Watch out: Darkfang Lurkers hide in stealth."] =
        "小心：暗牙潛伏者會潛行躲藏。",
    ["Escort Ogron, guarding him from attackers."] =
        "護送奧格隆，保護他不受攻擊。",
    ["Keep out of Theramore Isle."] =
        "不要進入塞拉摩島。",
    ["Let yourself drown for a quick trip."] =
        "讓自己溺死，可以快速移動。",
    ["Save it: the warrior's Whirlwind weapon questline asks for it."] =
        "留著它：戰士的旋風武器系列任務需要它。",
    ["Alterac and Arathi"] =
        "奧特蘭克與阿拉希",
    ["Get ready to take down an elite of level 40 shortly."] =
        "準備好，馬上要打倒一隻40級精英。",
    ["Quaff one potion right away so it is ready again later."] =
        "立刻喝一瓶藥水，這樣之後就能再次使用。",
    ["It wanders to the mouth of the cave."] =
        "它會遊蕩到洞口。",
    ["Look on the upper floor as well."] =
        "也到樓上找找。",
    ["Climb the slope, then leap the wall"] =
        "爬上斜坡，然後跳過牆",
    ["Fly to Kargath"] =
        "飛往卡加斯",
    ["Stranglethorn and Swamp of Sorrows"] =
        "荊棘谷與悲傷沼澤",
    ["Go along the shore, then climb the trail"] =
        "沿著岸邊走，然後爬上小路",
    ["Keep clear of Darkshire."] =
        "遠離夜色鎮。",
    ["Flight master at Stonard"] =
        "斯通納德飛行管理員",
    ["Look for assorted little brown items."] =
        "尋找各種棕色的小物品。",
    ["Look for purple rings made of rock."] =
        "尋找紫色的岩石環。",
    ["A guardian shows up."] =
        "會出現一個守護者。",
    ["Stay clear of Lord Azrethoc."] =
        "遠離阿茲雷索克領主。",
    ["An elite winged fiend of level 40 with brown hide."] =
        "一隻40級、棕色皮膚、有翅膀的精英惡魔。",
    ["The target wanders close by; look around."] =
        "目標在附近遊蕩；四處找找。",
    ["You can handle this alone without much trouble."] =
        "你可以不太費力地獨自應付。",
    ["A tougher foe is coming up."] =
        "接下來有個更強的敵人。",
    ["Grab the loot."] =
        "拾取戰利品。",
    ["The target is a crocodile with white scales."] =
        "目標是一隻白色鱗片的鱷魚。",
    ["The target roams a wide loop through the water."] =
        "目標在水中沿著大範圍的環狀路線遊蕩。",
    ["Accepting this starts a 2 hour countdown."] =
        "接下這個任務會開始2小時的倒數計時。",
    ["The timer keeps running while you're offline."] =
        "離線時計時器仍會繼續計時。",
    ["Take this quest only when you have time to spare."] =
        "只在有充裕時間時才接這個任務。",
    ["Watch out for a pair of stronger monsters here."] =
        "小心這裡有兩隻較強的怪物。",
    ["Look for the NPC dressed in red armor."] =
        "尋找穿著紅色盔甲的NPC。",
    ["Climb the trail to Gordunni Outpost"] =
        "沿小路往上前往戈杜尼前哨站",
    ["Beside the shining blue rings on the ground."] =
        "在地上發著藍光的圓環旁邊。",
    ["Look for earth mounds that pop up."] =
        "尋找突然冒出來的土堆。",
    ["Ones holding the quest item shine blue."] =
        "持有任務物品的會發出藍光。",
    ["Fight the tauren."] =
        "與牛頭人戰鬥。",
    ["The target is a winged green bug, level 47."] =
        "目標是一隻47級、有翅膀的綠色蟲子。",
    ["You can likely beat it at your current level."] =
        "以你目前的等級應該打得過它。",
    ["Kill bugs."] =
        "擊殺蟲子。",
    ["Extra targets lurk in the bug caverns."] =
        "蟲穴裡還潛伏著更多目標。",
    ["Stay on the road"] =
        "沿著道路走",
    ["The targets are ghosts that materialize."] =
        "目標是會現形的鬼魂。",
    ["No drops come from Stagwings and Skystormers."] =
        "Stagwings和Skystormers不會掉落。",
    ["Saves you some monster farming afterward."] =
        "能省下之後一些打怪的時間。",
    ["You need Chapter I as well as Chapter II."] =
        "你需要第一章和第二章。",
    ["It doesn't show up often."] =
        "它不常出現。",
    ["The NPC waits on the house's upper-floor terrace."] =
        "NPC在房子樓上的露台等候。",
    ["Take the road until the trail starts"] =
        "沿著道路走到小路的起點",
    ["Circle the mountain on the trail, then climb it"] =
        "沿著小路繞山，然後往上爬",
    ["Kill the crocodiles."] =
        "擊殺鱷魚。",
    ["Stay out of Swamp Talker's way."] =
        "避開Swamp Talker。",
    ["Hunt down the gray murloc; it is level 50."] =
        "獵殺那隻灰色魚人；牠是50級。",
    ["Tanaris and Dustwallow"] =
        "塔納利斯與塵泥沼澤",
    ["Watch out for foes hidden in stealth."] =
        "小心潛行中的敵人。",
    ["Look for brown eggs covered in spikes."] =
        "尋找佈滿尖刺的棕色蛋。",
    ["Buy plenty of arrows or bullets."] =
        "買足夠多的箭或子彈。",
    ["Stock up first: nobody in the Hinterlands sells arrows or bullets for level 40."] =
        "先備足補給：辛特蘭沒有人賣40級的箭或子彈。",
    ["Take the road that circles the peak, then descend the trail"] =
        "沿著環繞山峰的道路走，然後走下小路",
    ["Flight master at Revantusk Village"] =
        "惡齒村飛行管理員",
    ["A trio of enemies attacks."] =
        "會有三個敵人來攻擊。",
    ["Look for a little silver pail holding tools."] =
        "尋找一個裝著工具的銀色小桶。",
    ["The targets are big eagle-like beasts."] =
        "目標是像老鷹一樣的大型野獸。",
    ["Wolves and owlbeasts use these spawn spots as well."] =
        "狼和梟獸也使用這些重生點。",
    ["Look for crates made of wood."] =
        "尋找木箱。",
    ["The targets are wolves hidden in stealth."] =
        "目標是潛行中的狼。",
    ["Steer clear of hostile Alliance NPCs."] =
        "避開敵對的聯盟NPC。",
    ["Warning: this turns on your PvP flag."] =
        "警告：這會開啟你的PvP標記。",
    ["Head into Shadra'Alor"] =
        "進入Shadra'Alor",
    ["Get out of Shadra'Alor"] =
        "離開Shadra'Alor",
    ["Feralas and Un'Goro"] =
        "菲拉斯與安戈洛",
    ["The targets are hippogryphs."] =
        "目標是角鷹獸。",
    ["Use it on the stone giant foes."] =
        "對石巨人敵人使用它。",
    ["You have 2 hours before it disappears."] =
        "你有2小時，之後它就會消失。",
    ["Watch out: this foe is a level 50 elite."] =
        "小心：這個敵人是50級精英。",
    ["You can likely do it alone."] =
        "你應該可以單獨完成。",
    ["The NPC turns hostile and fights you."] =
        "這個NPC會轉為敵對並與你戰鬥。",
    ["The target yields at roughly 30% health."] =
        "目標在生命值約30%時會投降。",
    ["The NPC roams the trail close to Kargath."] =
        "NPC在卡加斯附近的小路上遊蕩。",
    ["The NPC gives the quest only while at this spot."] =
        "NPC只有在這個地點時才會給任務。",
    ["If the NPC is away, stay until he comes back."] =
        "如果NPC不在，就等他回來。",
    ["Burning Steppes and Azshara"] =
        "燃燒平原與艾薩拉",
    ["Pass through Blackrock Mountain into Burning Steppes"] =
        "穿過黑石山進入燃燒平原",
    ["Fly to Flame Crest"] =
        "飛往烈焰峰",
    ["It lies atop a stone slab."] =
        "它放在一塊石板上。",
    ["The following quest needs you at level 52."] =
        "下一個任務需要你達到52級。",
    ["Ammunition can't be bought here."] =
        "這裡買不到彈藥。",
    ["Flight master at Valormok"] =
        "瓦羅莫克飛行管理員",
    ["Look for a rectangular slab etched with green glyphs."] =
        "尋找一塊刻有綠色符文的長方形石板。",
    ["Look for an oblong slab carved with pink glyphs."] =
        "尋找一塊刻有粉紅色符文的長條形石板。",
    ["A rectangular slab carved with blue glyphs."] =
        "一塊刻有藍色符文的長方形石板。",
    ["Seek a carved slab of rock bearing golden glyphs."] =
        "尋找一塊刻有金色符文的石板。",
    ["The NPC is in the tower, which has several floors."] =
        "NPC在塔裡，這座塔有好幾層樓。",
    ["Felwood and Winterspring"] =
        "費伍德森林與冬泉谷",
    ["Walk west beside the river"] =
        "沿著河邊往西走",
    ["Fly to Bloodvenom Post"] =
        "飛往血毒崗哨",
    ["Together with the next turn-ins, this brings you to level 53."] =
        "加上接下來交的任務，這能讓你升到53級。",
    ["Hold on to it for a task in Un'Goro Crater later."] =
        "留著它，之後在安戈洛環形山的任務會用到。",
    ["Get onto the massive incline."] =
        "走上那道巨大的斜坡。",
    ["Watch out for elite foes here."] =
        "小心這裡的精英敵人。",
    ["Flee afterward."] =
        "之後逃離。",
    ["More than one crystal might be required."] =
        "可能需要不只一顆水晶。",
    ["The target shouts for Magus Rimtori once badly hurt."] =
        "目標受重傷時會大喊呼叫魔導師雷姆托里。",
    ["A green cat, a Corrupted Saber, appears when you use it."] =
        "使用後會出現一隻綠色的貓，也就是被腐蝕的刃豹。",
    ["Hold on until it begins to trail you."] =
        "等到牠開始跟著你。",
    ["The kitten is the green cat beside you."] =
        "小貓就是你身邊那隻綠色的貓。",
    ["Look beside Winna Hazzard."] =
        "到溫娜·哈薩德旁邊找找。",
    ["Hunt down an elite turtle of level 48 whose shell looks azure."] =
        "獵殺一隻48級、外殼呈蔚藍色的精英海龜。",
    ["The NPC wears a pale shirt and carries a lamp."] =
        "NPC穿著淺色襯衫，提著一盞燈。",
    ["Elite human foes walk patrols here; stay clear."] =
        "這裡有精英人類敵人在巡邏；遠離他們。",
    ["The NPC hides beneath the staircase."] =
        "NPC躲在樓梯下方。",
    ["You can also take it out of your bank."] =
        "你也可以從銀行取出。",
    ["The target is a ghoul armed with a hayfork."] =
        "目標是一隻拿著乾草叉的食屍鬼。",
    ["It can appear at this spot."] =
        "它可能出現在這個地點。",
    ["One last lengthy stretch of monster farming."] =
        "最後一段漫長的打怪。",
    ["Hold on to it; a task in Un'Goro Crater calls for it later."] =
        "留著它；安戈洛環形山的任務稍後需要。",
    -- Skyborne: the way off the isle
    ["Dalaran is reached through the Skyborne portal."] =
        "透過Skyborne傳送門前往達拉然。",
    ["Take the Skyborne portal to Stormwind"] =
        "搭乘Skyborne傳送門前往暴風城",
    -- Ding - Items: Cozy Sleeping Bag (hand-written guide)
    ["Cozy Sleeping Bag"] =
        "舒適的睡袋",
    ["A trail of clues on both continents, open from level 14, that ends with a bedroll worth up to 3% more experience: no fights, only objects to click."] =
        "橫跨兩塊大陸的一連串線索，14級起即可進行，終點是一個最多提供3%額外經驗的睡袋：無需戰鬥，只需點擊物品。",
    ["Westfall, west of Sentinel Hill: the burned-out remains beside the wrecked cart."] =
        "西部荒野，哨兵嶺以西：損毀馬車旁的燒焦殘骸。",
    ["The Barrens, by the road south of Camp Taurajo: the burned-out remains at the foot of the burnt tower."] =
        "貧瘠之地，陶拉祖營地以南的路邊：燒毀的塔樓腳下的燒焦殘骸。",
    ["Horde land: stay clear of the guards."] =
        "部落領地：遠離守衛。",
    ["Alliance land: stay clear of the guards."] =
        "聯盟領地：遠離守衛。",
    ["Right there: the next clue, on the remains or on the plank nailed beside them."] =
        "就在原地：下一條線索在殘骸上，或在旁邊釘著的木板上。",
    ["Path northeast of Sun Rock Retreat"] =
        "烈日石居東北方的小路",
    ["The camp is up in the hills: follow this path west."] =
        "營地在山上：沿這條小路往西走。",
    ["At the end of the path, in the abandoned camp: the bedroll lying on a crate."] =
        "小路盡頭的廢棄營地：放在箱子上的睡袋。",
    ["Optional: the wood and tinder from this reward relight the campfire beside it, a small quest the bag does not need."] =
        "可選：用這次獎勵的木頭和火絨重新點燃旁邊的營火，這是個小任務，睡袋並不需要它。",
    ["Up the hill north of the camp: a mound of fresh dirt."] =
        "營地北邊的山坡上：一堆新翻的泥土。",
    ["Loch Modan, on top of the dam: the eagle figurine on the carved stone heads facing the Wetlands."] =
        "洛克莫丹，水壩頂上：面向濕地的石雕頭像上的雄鷹雕像。",
    ["Cart against Thoradin's Wall"] =
        "靠在索拉丁之牆邊的馬車",
    ["On the Hillsbrad Foothills side: climb onto the cart, then up into the wall."] =
        "在希爾斯布萊德丘陵一側：爬上馬車，再爬進牆裡。",
    ["The messenger bag hangs on the outer face of the wall."] =
        "信使包掛在牆的外側。",
    ["The satchel just below it holds the sleeping bag."] =
        "正下方的背包裡裝著睡袋。",
    ["Use it outdoors and stay on it without moving: each minute of sleep adds 1% experience, up to 3%."] =
        "在戶外使用並站在上面不要移動：每睡一分鐘增加1%經驗，最多3%。",
    ["Try the sleeping bag"] =
        "試試睡袋",
    -- Ding - Leveling: what each trip is for (trainers, weapon masters, pets)
    ["Loot the beasts you kill on the way here"] =
        "拾取你在來路上擊殺的野獸",
    ["Learn First Aid from the trainer"] =
        "向訓練師學習急救",
    ["Learn Blacksmithing from the trainer"] =
        "向訓練師學習鍛造",
    ["Learn Mining from the trainer"] =
        "向訓練師學習採礦",
    ["Learn Cooking from the trainer"] =
        "向訓練師學習烹飪",
    ["Learn Herbalism from the trainer"] =
        "向訓練師學習草藥學",
    ["Learn Thrown at the weapon master"] =
        "向武器大師學習投擲武器",
    ["Learn Staves at the weapon master"] =
        "向武器大師學習法杖",
    ["Learn Swords at the weapon master"] =
        "向武器大師學習單手劍",
    ["Learn Maces at the weapon master"] =
        "向武器大師學習單手錘",
    ["Learn Bows at the weapon master"] =
        "向武器大師學習弓",
    ["Learn Guns at the weapon master"] =
        "向武器大師學習槍械",
    ["Learn Two-Handed Swords at the weapon master"] =
        "向武器大師學習雙手劍",
    ["Learn Two-Handed Axes at the weapon master"] =
        "向武器大師學習雙手斧",
    ["Learn Two-Handed Maces at the weapon master"] =
        "向武器大師學習雙手錘",
    ["Learn Swords and Daggers at the weapon master"] =
        "向武器大師學習單手劍和匕首",
    ["Learn Swords and Staves at the weapon master"] =
        "向武器大師學習單手劍和法杖",
    ["Learn Bows and Staves at the weapon master"] =
        "向武器大師學習弓和法杖",
    ["Learn Guns and Maces at the weapon master"] =
        "向武器大師學習槍械和單手錘",
    ["Learn Guns and Two-Handed Axes at the weapon master"] =
        "向武器大師學習槍械和雙手斧",
    ["Learn Two-Handed Swords and Staves at the weapon master"] =
        "向武器大師學習雙手劍和法杖",
    ["Learn Two-Handed Axes and Two-Handed Maces at the weapon master"] =
        "向武器大師學習雙手斧和雙手錘",
    ["Learn Two-Handed Maces and Staves at the weapon master"] =
        "向武器大師學習雙手錘和法杖",
    ["Learn Crossbows and Two-Handed Swords at the weapon master"] =
        "向武器大師學習弩和雙手劍",
    ["Learn Guns, Two-Handed Axes and Two-Handed Maces at the weapon master"] =
        "向武器大師學習槍械、雙手斧和雙手錘",
    ["Tame a pet here"] =
        "在這裡馴服一隻寵物",
    ["Tame a beast here to learn the next rank of Claw"] =
        "在這裡馴服一隻野獸，學會下一級爪擊",
    ["Head to the big cage"] =
        "前往大籠子",
    ["Visit the caged quilboar"] =
        "拜訪籠中的野豬人",
    ["Go to the corrupted moonwell"] =
        "前往被汙染的月井",
    -- Ding - Leveling: where an object or a monster target is (notes)
    ["The object is indoors."] =
        "這個物件在室內。",
    ["The object is indoors, one floor up."] =
        "這個物件在室內的樓上一層。",
    ["The object is on the lower level, indoors."] =
        "這個物件在室內的下層。",
    ["The object is on the lower level within the bridge."] =
        "這個物件在橋內部的下層。",
    ["The object is on the highest level of this structure."] =
        "這個物件在這座建築的最高層。",
    ["The object is up on the summit."] =
        "這個物件在山頂上。",
    ["The object sits on the rocky shelf above."] =
        "這個物件在上方的岩架上。",
    ["The target is indoors."] =
        "目標在室內。",
    ["The target is indoors, one floor up."] =
        "目標在室內的樓上一層。",
    ["The target is indoors at street level."] =
        "目標在室內，位於地面層。",
    ["The target is indoors, on the central storey."] =
        "目標在室內的中間樓層。",
    ["The target is on the lower level, indoors."] =
        "目標在室內的下層。",
    ["The target is on the tower's highest floor."] =
        "目標在塔的最頂層。",
    ["The target is up on the summit."] =
        "目標在山頂上。",
    ["The target is down in the Cleft of Shadow."] =
        "目標在下方的暗影裂口裡。",
    ["The target can be indoors or out."] =
        "目標可能在室內，也可能在室外。",
    ["The target patrols a long route; look along it."] =
        "目標沿著一條很長的路線巡邏；沿路尋找。",
    ["The target waits here, then strolls out onto the big branch close by."] =
        "目標在這裡等，然後走到附近的大樹枝上。",
    -- Ding - Leveling: why an item goes to the bank (notes)
    ["You need it later for \"The Legend of Stalvan\": keep it in the bank to free a bag slot."] =
        "之後的任務「斯塔文的傳說」需要它：先存進銀行，空出背包空間。",
    ["You need it later for \"Juice Delivery\": keep it in the bank to free a bag slot."] =
        "之後的任務「僵屍酒」需要它：先存進銀行，空出背包空間。",
    ["You need it later for \"The Brassbolts Brothers\": keep it in the bank to free a bag slot."] =
        "之後的任務「防撞頭盔」需要它：先存進銀行，空出背包空間。",
    ["You need it later for \"A Noble Brew\": keep it in the bank to free a bag slot."] =
        "之後的任務「名釀」需要它：先存進銀行，空出背包空間。",
    ["You need it later for \"Soothing Turtle Bisque\": keep it in the bank to free a bag slot."] =
        "之後的任務「海龜湯」需要它：先存進銀行，空出背包空間。",
    ["You need it later for \"Reassignment\": keep it in the bank to free a bag slot."] =
        "之後的任務「人事調動」需要它：先存進銀行，空出背包空間。",
    ["You need it later for \"Parts for Kravel\": keep it in the bank to free a bag slot."] =
        "之後的任務「給克拉維爾的零件」需要它：先存進銀行，空出背包空間。",
    ["You need them later for \"Goblin Sponsorship\" and \"The Hidden Key\": keep them in the bank to free bag slots."] =
        "之後的任務「地精贊助商」和「隱藏的鑰匙」需要它們：先存進銀行，空出背包空間。",
    ["You need it later for \"Chapter I\": keep it in the bank to free a bag slot."] =
        "之後的任務「荊棘谷的青山 - 第壹章」需要它：先存進銀行，空出背包空間。",
    ["You need it later for \"Chapter II\": keep it in the bank to free a bag slot."] =
        "之後的任務「荊棘谷的青山 - 第二章」需要它：先存進銀行，空出背包空間。",
    ["You need it later for \"Chapter III\": keep it in the bank to free a bag slot."] =
        "之後的任務「荊棘谷的青山 - 第三章」需要它：先存進銀行，空出背包空間。",
    ["You need it later for \"Chapter IV\": keep it in the bank to free a bag slot."] =
        "之後的任務「荊棘谷的青山 - 第四章」需要它：先存進銀行，空出背包空間。",
    ["You need it later for \"The Karnitol Shipwreck\": keep it in the bank to free a bag slot."] =
        "之後的任務「卡尼托的背包」需要它：先存進銀行，空出背包空間。",
    ["You need them later for \"Magical Analysis\" and \"Caught!\": keep them in the bank to free bag slots."] =
        "之後的任務「魔法分析」和「被鎖起來的矮人」需要它們：先存進銀行，空出背包空間。",
    ["You need it later for \"Rumors for Kravel\": keep it in the bank to free a bag slot."] =
        "之後的任務「地精的謠言」需要它：先存進銀行，空出背包空間。",
    ["You need it later for \"Ongeku\": keep it in the bank to free a bag slot."] =
        "之後的任務「盎格庫爾」需要它：先存進銀行，空出背包空間。",
    ["You need it later for \"Sunken Treasure\": keep it in the bank to free a bag slot."] =
        "之後的任務「水下寶藏」需要它：先存進銀行，空出背包空間。",
    ["You need them later for \"Back to Booty Bay\" and \"Safety First\": keep them in the bank to free bag slots."] =
        "之後的任務「返回藏寶海灣」和「安全第壹」需要它們：先存進銀行，空出背包空間。",
    ["You need them later for \"Report Back to Fizzlebub\" and \"Rhapsody's Kalimdor Kocktail\": keep them in the bank to free bag slots."] =
        "之後的任務「向菲茲巴布報告」和「拉普索迪的卡利姆多雞尾酒」需要它們：先存進銀行，空出背包空間。",
    ["You need them later for \"The Borrower\", \"Screecher Spirits\", \"The Super Egg-O-Matic\" and \"Rhapsody's Kalimdor Kocktail\": keep them in the bank to free bag slots."] =
        "之後的任務「海龜照片」、「尖嘯者的靈魂」、「超級測蛋器」和「拉普索迪的卡利姆多雞尾酒」需要它們：先存進銀行，空出背包空間。",
    ["You need them later for \"Crystals of Power\": keep them in the bank to free bag slots."] =
        "之後的任務「能量水晶」需要它們：先存進銀行，空出背包空間。",
    ["You need them later for \"Rhapsody's Tale\", \"The Super Snapper FX\", \"Whiskey Slim's Lost Grog\" and \"Favored of Elune?\": keep them in the bank to free bag slots."] =
        "之後的任務「拉普索迪的故事」、「超級攝影器FX」、「威士忌斯利姆的酒」和「月神之獸？」需要它們：先存進銀行，空出背包空間。",
    ["You need it later for \"Deliver to MacKinley\": keep it in the bank to free a bag slot."] =
        "之後的任務「給馬克基雷的貨物」需要它：先存進銀行，空出背包空間。",
    ["You need them later for \"The Bait for Lar'korwi\", \"Un'Goro Soil\", \"A Visit to Gregan\" and \"It's a Secret to Everybody\": keep them in the bank to free bag slots."] =
        "之後的任務「拉克維的誘餌」、「安戈洛的泥土」、「造訪格雷甘」和「無人知曉的秘密」需要它們：先存進銀行，空出背包空間。",
    ["You need it later for \"Rise of the Silithid\": keep it in the bank to free a bag slot."] =
        "之後的任務「異種蠍的威脅」需要它：先存進銀行，空出背包空間。",
    ["You need it later for \"A Taste of Flame\": keep it in the bank to free a bag slot."] =
        "之後的任務「烈焰精華」需要它：先存進銀行，空出背包空間。",
    ["You need them later for \"Chasing A-Me 01\" and \"Arcane Runes\": keep them in the bank to free bag slots."] =
        "之後的任務「找回A-Me 01」和「奧術符文」需要它們：先存進銀行，空出背包空間。",
    ["You need them later for \"Good Natured Emma\", \"Arcane Runes\" and \"Sprinkle's Secret Ingredient\": keep them in the bank to free bag slots."] =
        "之後的任務「善良的艾瑪」、「奧術符文」和「斯普琳科的秘密佐料」需要它們：先存進銀行，空出背包空間。",
    ["You need them later for \"The Stone Circle\", \"Felbound Ancients\", \"A Little Slime Goes a Long Way\", \"Moontouched Wildkin\" and \"Meet at the Grave\": keep them in the bank to free bag slots."] =
        "之後的任務「石環」、「被禁錮的古樹」、「遠方的軟泥怪」、「月光羽毛」和「墓地相見」需要它們：先存進銀行，空出背包空間。",
    ["You need it later for \"Return to Tymor\": keep it in the bank to free a bag slot."] =
        "之後的任務「向法師泰摩爾回復」需要它：先存進銀行，空出背包空間。",
    ["You need them later for \"Aquementas\", \"The Everlook Report\", \"Duke Nicholas Zverenhoff\" and \"Troubled Spirits of Kel'Theril\": keep them in the bank to free bag slots."] =
        "之後的任務「亞奎門塔斯」、「永望鎮報告」、「尼古拉斯·瑟倫霍夫公爵」和「凱斯利爾的怨靈」需要它們：先存進銀行，空出背包空間。",
    ["You need it later for \"Felnok Steelspring\": keep it in the bank to free a bag slot."] =
        "之後的任務「菲諾克」需要它：先存進銀行，空出背包空間。",
    ["You need it later for \"Glyphed Oaken Branch\": keep it in the bank to free a bag slot."] =
        "之後的任務「雕文橡木枝」需要它：先存進銀行，空出背包空間。",
    ["You need them later for \"The Disruption Ends\" and \"Supplies for the Crossroads\": keep them in the bank to free bag slots."] =
        "之後的任務「野豬人的頭目」和「十字路口的補給品」需要它們：先存進銀行，空出背包空間。",
    ["You need it later for \"Chen's Empty Keg\": keep it in the bank to free a bag slot."] =
        "之後的任務「老陳的空酒桶」需要它：先存進銀行，空出背包空間。",
    ["You need it later for \"Egg Hunt\": keep it in the bank to free a bag slot."] =
        "之後的任務「蠍卵」需要它：先存進銀行，空出背包空間。",
    ["You need them later for \"Souvenirs of Death\" and \"Battle of Hillsbrad\": keep them in the bank to free bag slots."] =
        "之後的任務「死亡的紀念品」和「希爾斯布萊德之戰」需要它們：先存進銀行，空出背包空間。",
    ["You need it later for \"Frostmaw\": keep it in the bank to free a bag slot."] =
        "之後的任務「霜喉雪人」需要它：先存進銀行，空出背包空間。",
    ["You need it later for \"The Swarm Grows\": keep it in the bank to free a bag slot."] =
        "之後的任務「瘋狂的蟲群」需要它：先存進銀行，空出背包空間。",
    ["You need them later for \"Martek the Exiled\" and \"Hemet Nesingwary\": keep them in the bank to free bag slots."] =
        "之後的任務「流放者馬特克」和「赫米特·奈辛瓦裏」需要它們：先存進銀行，空出背包空間。",
    ["You need it later for \"Caught!\": keep it in the bank to free a bag slot."] =
        "之後的任務「被鎖起來的矮人」需要它：先存進銀行，空出背包空間。",
    ["You need them later for \"The Black Shield\" and \"Into the Field\": keep them in the bank to free bag slots."] =
        "之後的任務「黑色盾牌」和「進入沙漠」需要它們：先存進銀行，空出背包空間。",
    ["You need them later for \"Tanaris Field Sampling\" and \"Screecher Spirits\": keep them in the bank to free bag slots."] =
        "之後的任務「塔納利斯的樣本」和「尖嘯者的靈魂」需要它們：先存進銀行，空出背包空間。",
    ["You need it later for \"Back to Booty Bay\": keep it in the bank to free a bag slot."] =
        "之後的任務「返回藏寶海灣」需要它：先存進銀行，空出背包空間。",
    ["You need them later for \"Deadmire\" and \"Safety First\": keep them in the bank to free bag slots."] =
        "之後的任務「死沼巨鱷」和「安全第壹」需要它們：先存進銀行，空出背包空間。",
    ["You need them later for \"Another Message to the Wildhammer\", \"Screecher Spirits\" and \"The Super Egg-O-Matic\": keep them in the bank to free bag slots."] =
        "之後的任務「又壹個給蠻錘部族的警告」、「尖嘯者的靈魂」和「超級測蛋器」需要它們：先存進銀行，空出背包空間。",
    ["You need it later for \"Return to Witch Doctor Uzer'i\": keep it in the bank to free a bag slot."] =
        "之後的任務「向巫醫尤克裏回復」需要它：先存進銀行，空出背包空間。",
    ["You need it later for \"The Atal'ai Exile\": keep it in the bank to free a bag slot."] =
        "之後的任務「阿塔萊流放者」需要它：先存進銀行，空出背包空間。",
    ["You need them later for \"Testing the Vessel\" and \"Report Back to Fizzlebub\": keep them in the bank to free bag slots."] =
        "之後的任務「測試容器」和「向菲茲巴布報告」需要它們：先存進銀行，空出背包空間。",
    ["You need it later for \"Return to Apothecary Zinge\": keep it in the bank to free a bag slot."] =
        "之後的任務「向藥劑師金格回報」需要它：先存進銀行，空出背包空間。",
    ["You need them later for \"The Stone Circle\" and \"Crystals of Power\": keep them in the bank to free bag slots."] =
        "之後的任務「石環」和「能量水晶」需要它們：先存進銀行，空出背包空間。",
    ["You need them later for \"Ripple Delivery\", \"Whiskey Slim's Lost Grog\" and \"Seeping Corruption\": keep them in the bank to free bag slots."] =
        "之後的任務「送回蜜酒」、「威士忌斯利姆的酒」和「墮落之水」需要它們：先存進銀行，空出背包空間。",
    ["You need them later for \"Bungle in the Jungle\", \"The Bait for Lar'korwi\" and \"It's a Secret to Everybody\": keep them in the bank to free bag slots."] =
        "之後的任務「擒蟲先擒王」、「拉克維的誘餌」和「無人知曉的秘密」需要它們：先存進銀行，空出背包空間。",
    ["You need them later for \"Delivery to Magatha\" and \"Seeping Corruption\": keep them in the bank to free bag slots."] =
        "之後的任務「瑪加薩的石版」和「墮落之水」需要它們：先存進銀行，空出背包空間。",
    ["You need it later for \"Jes'rimon's Payment to Jediga\": keep it in the bank to free a bag slot."] =
        "之後的任務「傑斯雷蒙的報酬」需要它：先存進銀行，空出背包空間。",
    ["You need it later for \"Meet at the Grave\": keep it in the bank to free a bag slot."] =
        "之後的任務「墓地相見」需要它：先存進銀行，空出背包空間。",
    ["You need them later for \"Delivery to Andron Gant\", \"A Grave Situation\" and \"Betrayed\": keep them in the bank to free bag slots."] =
        "之後的任務「安德隆·甘特的石版」、「尋找墓碑」和「叛徒」需要它們：先存進銀行，空出背包空間。",
    ["You need them later for \"The Everlook Report\" and \"Duke Nicholas Zverenhoff\": keep them in the bank to free bag slots."] =
        "之後的任務「永望鎮報告」和「尼古拉斯·瑟倫霍夫公爵」需要它們：先存進銀行，空出背包空間。",
    ["You need it later for \"Aquementas\": keep it in the bank to free a bag slot."] =
        "之後的任務「亞奎門塔斯」需要它：先存進銀行，空出背包空間。",
    -- Places of the hearthstone steps (`sethearth`): the town, as this language names it (an
    -- inn's own name: its town).
    ["Astranaar"] =
        "阿斯特蘭納",
    ["Auberdine"] =
        "奧伯丁",
    ["Bloodhoof Village"] =
        "血蹄村",
    ["Booty Bay"] =
        "藏寶海灣",
    ["Brill"] =
        "布瑞爾",
    ["Camp Mojache"] =
        "莫沙徹營地",
    ["Camp Taurajo"] =
        "陶拉祖營地",
    ["Cenarion Hold"] =
        "塞納里奧城堡",
    ["Coriella Calmbreeze"] =
        "Coriella Calmbreeze",
    ["Darkshire"] =
        "夜色鎮",
    ["Deepwater Tavern"] =
        "米奈希爾港",
    ["Dolanaar"] =
        "多蘭納爾",
    ["Donaal Downbreeze"] =
        "Donaal Downbreeze",
    ["Everlook"] =
        "永望鎮",
    ["Feathermoon Stronghold"] =
        "羽月要塞",
    ["Freewind Post"] =
        "亂風崗",
    ["Gadgetzan"] =
        "加基森",
    ["Gallows' End Tavern"] =
        "布瑞爾",
    ["Goldshire"] =
        "閃金鎮",
    ["Grom'gol"] =
        "格羅姆高營地",
    ["Hammerfall"] =
        "落錘鎮",
    ["Ironforge"] =
        "鐵爐堡",
    ["Kargath"] =
        "卡加斯",
    ["Kharanos"] =
        "卡拉諾斯",
    ["Lakeshire"] =
        "湖畔鎮",
    ["Light's Hope Chapel"] =
        "聖光之願禮拜堂",
    ["Menethil Harbor"] =
        "米奈希爾港",
    ["Nijel's Point"] =
        "尼耶爾前哨站",
    ["Orgrimmar"] =
        "奧格瑪",
    ["Ratchet"] =
        "棘齒城",
    ["Razor Hill"] =
        "剃刀嶺",
    ["Revantusk Village"] =
        "惡齒村",
    ["Sentinel Hill"] =
        "哨兵嶺",
    ["Shadowprey Village"] =
        "葬影村",
    ["Southshore"] =
        "南海鎮",
    ["Splintertree Post"] =
        "碎木崗哨",
    ["Stonard"] =
        "斯通納德",
    ["Stonetalon Peak"] =
        "石爪峰",
    ["Stormwind City"] =
        "暴風城",
    ["Stoutlager Inn"] =
        "塞爾薩瑪",
    ["Sun Rock Retreat"] =
        "烈日石居",
    ["Tarren Mill"] =
        "塔倫米爾",
    ["The Crossroads"] =
        "十字路口",
    ["The Sepulcher"] =
        "瑟伯切爾",
    ["Thelsamar"] =
        "塞爾薩瑪",
    ["Theramore"] =
        "塞拉摩",
    ["Theramore Isle"] =
        "塞拉摩島",
    ["Thunder Bluff"] =
        "雷霆崖",
    ["Thunderbrew Distillery"] =
        "卡拉諾斯",
    -- Ding! - Class quests (hand-written guides)
    ["Druid quests"] =
        "德魯伊任務",
    ["At level 10, your trainer teaches Teleport: Moonglade: the quick way to Moonglade and back, used all through this guide."] =
        "10級時，訓練師會教你「傳送：月光林地」：往返月光林地的快捷方式，本指南全程都會用到。",
    ["Denatharion, the druid trainer of the Cenarion Enclave in Darnassus, sends you to Mathrengyl next to him."] =
        "達納蘇斯塞納里奧區的德魯伊訓練師德納薩里安，會派你去找他身旁的瑪斯雷。",
    ["Mathrengyl Bearwalker, upstairs in the Cenarion Enclave."] =
        "瑪斯雷·馭熊者，在塞納里奧區樓上。",
    ["From level 10: the chain that teaches Bear Form."] =
        "10級起：學會熊形態的系列任務。",
    ["Dendrite Starblaze waits on the upper floor of the great house of Nighthaven."] =
        "德迪利特·星焰在永夜港大屋的樓上等你。",
    ["The Great Bear Spirit waits northwest of the village, up the hill path: listen to all it has to say."] =
        "巨熊之靈在村莊西北方，沿山路往上走就能找到：把牠要說的話全部聽完。",
    ["Sindrayl, the hippogryph master south of Nighthaven: take this flight path for your next trips here."] =
        "辛德拉爾，永夜港南邊的角鷹獸管理員：取得這條飛行路線，方便之後再來這裡。",
    ["Lunaclaw's cave, in the hills east of Auberdine"] =
        "月爪梟獸的洞穴，位於奧伯丁東邊的山丘",
    ["Deep in the cave, use the Cenarion Moondust by the moonkin stone: Lunaclaw appears. Defeat her, then speak to her spirit."] =
        "在洞穴深處的月夜梟獸之石旁使用塞納里奧月塵：月爪梟獸就會出現。擊敗她，然後和她的靈魂交談。",
    ["Turning this in teaches Bear Form."] =
        "交付此任務即可學會熊形態。",
    ["From level 10: the Skyborne quests of the bear spirit, on Zephras Isle."] =
        "10級起：Zephras Isle上熊之靈的Skyborne任務。",
    ["Alfina Nightgaze, the druid trainer of Dalaran, gives it."] =
        "達拉然的德魯伊訓練師Alfina Nightgaze會給這個任務。",
    ["Opens the way to Moonglade, the home of the druids."] =
        "開啟通往月光林地的道路，那裡是德魯伊的家園。",
    ["Sheldras Moontree, the druid trainer of Stormwind, in the park."] =
        "沙德拉斯·月樹，暴風城的德魯伊訓練師，在公園裡。",
    ["Five Earthroot will be needed: an herb found along the roads, picked with Herbalism or bought at the auction house."] =
        "需要五株地根草：一種長在路邊的草藥，可用草藥學採集，或在拍賣場購買。",
    ["From level 14: the chain that teaches Cure Poison."] =
        "14級起：學會消毒術的系列任務。",
    ["Fill the sampler at the mouth of the Cliffspring Falls cave, northeast of Auberdine."] =
        "在奧伯丁東北方壁泉河瀑布的洞口裝滿取樣器。",
    ["Alanndarian Nightsong, in her house in Auberdine."] =
        "奧蘭達利亞·夜歌，在她位於奧伯丁的家中。",
    ["The Lunar Fungus grows in the small caves of the hills east of Auberdine, near Lunaclaw's."] =
        "月亮菇長在奧伯丁東邊山丘的小洞穴裡，靠近月爪梟獸的洞穴。",
    ["Sickly Deer wander the woods of Darkshore: use the salve on them."] =
        "生病的鹿在黑海岸的樹林中遊蕩：對牠們使用藥膏。",
    ["Turning this in teaches Cure Poison."] =
        "交付此任務即可學會消毒術。",
    ["From level 16: the chain that teaches Aquatic Form."] =
        "16級起：學會水棲形態的系列任務。",
    ["The Shrine Bauble, a small wicker urn, lies on the bottom of Lake Elune'ara: dive around the shrine."] =
        "神殿靈珠是一個柳條編的小甕，躺在伊露恩湖的湖底：在神殿周圍潛水尋找。",
    ["Use the bauble at the Shrine of Remulos, by the lake."] =
        "在湖邊的雷姆洛斯神殿使用靈珠。",
    ["The first half of the pendant lies under the water off the north of Darkshore."] =
        "墜飾的前半塊在黑海岸北部外海的水下。",
    ["The second half lies under the water off the western coast of Westfall."] =
        "後半塊在西部荒野西岸外海的水下。",
    ["Back at the Shrine of Remulos: use a half pendant there to make it whole."] =
        "回到雷姆洛斯神殿：在那裡使用半塊墜飾，將它合而為一。",
    ["Turning this in teaches Aquatic Form."] =
        "交付此任務即可學會水棲形態。",
    ["Night Elves get it from Mathrengyl Bearwalker in Darnassus."] =
        "夜精靈向達納蘇斯的瑪斯雷·馭熊者接取。",
    ["From level 20: Forever's chain of the Great Cat Spirit, in Moonglade."] =
        "20級起：月光林地中Forever的巨豹之靈系列任務。",
    ["The Great Cat Spirit rests in the south of Moonglade."] =
        "巨豹之靈在月光林地南部歇息。",
    ["The three relics lie in the southeast of Moonglade."] =
        "三件聖物位於月光林地東南部。",
    ["The Avatar of Saeyleenan waits in the south of Moonglade."] =
        "Avatar of Saeyleenan在月光林地南部等候。",
    ["Mathrengyl Bearwalker, upstairs in the Cenarion Enclave of Darnassus."] =
        "瑪斯雷·馭熊者，在達納蘇斯塞納里奧區的樓上。",
    ["Any druid trainer of a capital gives it."] =
        "任何主城的德魯伊訓練師都會給這個任務。",
    ["From level 50: Torwa Pathfinder's chain in Un'Goro Crater, which ends in the Temple of Atal'Hakkar."] =
        "50級起：托爾瓦·尋路者在安戈洛環形山的系列任務，最後在阿塔哈卡神廟結束。",
    ["Torwa Pathfinder camps on the eastern side of the crater."] =
        "托爾瓦·尋路者在環形山東側紮營。",
    ["The Gorishi wasps of the hive in the south carry the stings; the Bloodcaps grow on red plants all over the crater."] =
        "南邊蟲巢的格里什異種蠍身上帶著毒刺；血帽長在環形山各處的紅色植物上。",
    ["Use the barb on a devilsaur: they roam the open plains of the crater."] =
        "對一隻魔暴龍使用倒鉤：牠們在環形山的開闊平原上遊蕩。",
    ["Atal'alarion, the guardian of the idol in the temple, drops the Putrid Vine."] =
        "阿塔拉利恩，神廟中神像的守護者，會掉落腐爛的藤蔓。",
    ["Hunter quests"] =
        "獵人任務",
    ["Dazalar, the hunter trainer of Dolanaar."] =
        "達札拉，多蘭納爾的獵人訓練師。",
    ["From level 10: three beasts to tame, then you can tame a pet of your own."] =
        "10級起：先馴服三隻野獸，之後就能馴服屬於自己的寵物。",
    ["Use the taming rod on a Webwood Lurker, east of Dolanaar. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "對多蘭納爾東邊的一隻樹林潛伏者使用馴獸棒。馴服後解散牠：牠會再次攻擊你，做好準備。",
    ["Use the rod on a Nightsaber Stalker, west of Dolanaar, then dismiss it the same way."] =
        "對多蘭納爾西邊的一隻夜刃捕食者使用馴獸棒，再用同樣的方式解散牠。",
    ["Use the rod on a Strigid Screecher, south of Dolanaar."] =
        "對多蘭納爾南邊的一隻巨翼惡梟使用馴獸棒。",
    ["Turning this in teaches Tame Beast: you can now keep a pet."] =
        "交付此任務即可學會馴服野獸：現在你可以擁有自己的寵物了。",
    ["Jocaste, the hunter trainer of Darnassus, upstairs."] =
        "祖卡斯特，達納蘇斯的獵人訓練師，在樓上。",
    ["Your pet can now learn new skills."] =
        "你的寵物現在可以學習新技能了。",
    ["Grif Wildheart, the hunter trainer of Kharanos."] =
        "格瑞夫，卡拉諾斯的獵人訓練師。",
    ["Use the taming rod on a Large Crag Boar, north of Kharanos. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "對卡拉諾斯北邊的一隻大峭壁野豬使用馴獸棒。馴服後解散牠：牠會再次攻擊你，做好準備。",
    ["Use the rod on a Snow Leopard, south of Kharanos, then dismiss it the same way."] =
        "對卡拉諾斯南邊的一隻雪豹使用馴獸棒，再用同樣的方式解散牠。",
    ["Use the rod on an Ice Claw Bear, in the hills south of Kharanos."] =
        "對卡拉諾斯南邊山丘上的一隻冰爪熊使用馴獸棒。",
    ["Belia Thundergranite, the pet trainer of Ironforge, in the Hall of Arms."] =
        "貝莉亞·雷岩，鐵爐堡的寵物訓練師，在武器大廳。",
    ["Josephine Carson, the hunter trainer of Goldshire."] =
        "Josephine Carson，閃金鎮的獵人訓練師。",
    ["Use the taming rod on a Rockhide Boar, in the southeast of Elwynn Forest. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "對艾爾文森林東南部的一隻石皮野豬使用馴獸棒。馴服後解散牠：牠會再次攻擊你，做好準備。",
    ["Use the rod on a Gray Forest Wolf, in the east of the forest, then dismiss it the same way."] =
        "對森林東部的一隻森林灰狼使用馴獸棒，再用同樣的方式解散牠。",
    ["Use the rod on a Young Forest Bear, in the west of the forest near Westbrook Garrison."] =
        "對森林西部西泉要塞附近的一隻小森林熊使用馴獸棒。",
    ["Isaac Chan, the pet trainer, stands next to Josephine."] =
        "寵物訓練師Isaac Chan站在Josephine旁邊。",
    ["Elayaa Easewind sends you to Quel'ana Quickgale."] =
        "Elayaa Easewind會派你去找Quel'ana Quickgale。",
    ["Use the taming rod on a Windsong Crawler. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "對一隻Windsong Crawler使用馴獸棒。馴服後解散牠：牠會再次攻擊你，做好準備。",
    ["Use the rod on an Ornery Galestrider, then dismiss it the same way."] =
        "對一隻Ornery Galestrider使用馴獸棒，再用同樣的方式解散牠。",
    ["Use the rod on a Vuldren Alpha."] =
        "對一隻Vuldren Alpha使用馴獸棒。",
    ["Quel'dora Quickgale, the pet trainer, stands next to Quel'ana."] =
        "寵物訓練師Quel'dora Quickgale站在Quel'ana旁邊。",
    ["Any hunter trainer of a capital gives it."] =
        "任何主城的獵人訓練師都會給這個任務。",
    ["From level 50: Ogtinc's chain in Azshara, which ends in the Temple of Atal'Hakkar."] =
        "50級起：奧汀克在艾薩拉的系列任務，最後在阿塔哈卡神廟結束。",
    ["Ogtinc lives up a hill path in the middle of Azshara."] =
        "奧汀克住在艾薩拉中部一條山路的上方。",
    ["The Mosshoof Coursers of northern Azshara carry the antlers; only some do."] =
        "艾薩拉北部的苔蹄快步者身上帶著鹿角；但只有部分會有。",
    ["Wavethrashers haunt the Azshara shoreline; not every one leaves a scale."] =
        "碎浪多頭蛇出沒於艾薩拉的海岸線；不是每一隻都會留下鱗片。",
    ["Morphaz, one of the green dragons of the temple, drops the tooth."] =
        "摩弗拉斯，神廟中的綠龍之一，會掉落牙齒。",
    ["Mage quests"] =
        "法師任務",
    ["Zaldimar Wefhellt, the mage trainer of Goldshire, upstairs in the inn."] =
        "札爾迪瑪·維夫希爾特，閃金鎮的法師訓練師，在旅店樓上。",
    ["From level 10: your trainer's first errand, a few minutes from Goldshire."] =
        "10級起：訓練師交給你的第一件差事，離閃金鎮只有幾分鐘路程。",
    ["Jennea Cannon, upstairs in the Wizard's Sanctum of the Mage Quarter, in Stormwind."] =
        "詹妮亞·坎農，在暴風城法師區的巫師聖殿樓上。",
    ["Stand in the water of Mirror Lake, in the west of Elwynn Forest, and use the flask there."] =
        "站在艾爾文森林西部明鏡湖的水中，在那裡使用瓶子。",
    ["Magis Sparkmantle, the mage trainer of Kharanos."] =
        "瑪濟斯·石衣，卡拉諾斯的法師訓練師。",
    ["From level 10: your trainer's first errand, in Dun Morogh."] =
        "10級起：訓練師交給你的第一件差事，在丹莫洛。",
    ["Bink, the mage trainer of Ironforge, in the Hall of Mysteries."] =
        "彬克，鐵爐堡的法師訓練師，在秘法大廳。",
    ["Bink's toolbox lies by the gates of Gnomeregan, in the west of Dun Morogh."] =
        "彬克的工具箱在丹莫洛西部的諾姆瑞根大門旁。",
    ["From level 10: the Skyborne mage quests of Zephras Isle."] =
        "10級起：Zephras Isle的Skyborne法師任務。",
    ["The wind-infused boughs lie on the ground west of the camp."] =
        "注入風之力的樹枝散落在營地西邊的地上。",
    ["Your mage trainer gives it."] =
        "你的法師訓練師會給這個任務。",
    ["From level 15: a chain in Stormwind that ends with a robe for you."] =
        "15級起：暴風城的系列任務，最後會獲得一件長袍。",
    ["The chest of coffers and the cantation lie in Jennea's tower."] =
        "一盒封靈箱和顯形卷軸在詹妮亞的塔裡。",
    ["The Blue Recluse, the inn of the Mage Quarter"] =
        "藍色隱士，法師區的旅店",
    ["Read the cantation to reveal a Rift Spawn, fight it until it is stunned, then use a coffer on it. Three hide in the inn, one of them downstairs."] =
        "閱讀顯形卷軸讓裂隙怒靈現形，與牠戰鬥直到牠昏迷，再對牠使用封靈箱。旅店裡藏著三隻，其中一隻在樓下。",
    ["The Charged Rift Gem lies in the Silver Stream Mine, in the north of Loch Modan; the linen comes from humanoids anywhere."] =
        "充能裂隙寶石在洛克莫丹北部的銀溪礦坑；亞麻布可從任何地方的人型生物身上取得。",
    ["Wynne Larson, the robe merchant of the Mage Quarter."] =
        "威恩·拉爾森，法師區的長袍商人。",
    ["Your reward: the Manaweave Robe."] =
        "獎勵：法紋長袍。",
    ["From level 26: a chain that ends with a second robe."] =
        "26級起：最後會獲得第二件長袍的系列任務。",
    ["High Sorcerer Andromath, at the top of the Wizard's Sanctum."] =
        "高階巫士安多瑪斯，在巫師聖殿頂層。",
    ["The book lies in the Tower of Ilgalar, in the east of Redridge Mountains."] =
        "那本書在赤脊山東部的伊爾加拉之塔裡。",
    ["The spiders of the western woods of Duskwood carry the silk."] =
        "暮色森林西部樹林的蜘蛛身上帶著蛛絲。",
    ["Your reward: the Astral Knot Garment."] =
        "獎勵：星結之衣。",
    ["Your capital's mage trainer gives it."] =
        "你主城的法師訓練師會給這個任務。",
    ["From level 30: Tabetha's quests in Dustwallow Marsh, which end with a mage's wand."] =
        "30級起：塔貝薩在塵泥沼澤的任務，最後會獲得一把法師魔杖。",
    ["Tabetha lives on her farm in the south of Dustwallow Marsh."] =
        "塔貝薩住在塵泥沼澤南部她的農場上。",
    ["Magus Tirth, at the Shimmering Flats of Thousand Needles, near the race track."] =
        "魔導師提爾斯，在千針石林的閃光平原，靠近賽道。",
    ["\"Plucky\" Johnson, the chicken by the tent: beckon to him with the emote so he turns back into a man, then ask him for the phrase."] =
        "大膽的約翰森是帳篷旁的那隻雞：用招手表情對他招手，讓他變回人形，再向他詢問那句口訣。",
    ["Tabetha gives it too."] =
        "塔貝薩也會給這個任務。",
    ["The Witherbark trolls of eastern Arathi Highlands carry the totem sticks."] =
        "阿拉希高地東部的枯木食人妖身上帶著圖騰棒。",
    ["Use the stick on the central stone of the Circle of Outer Binding, in Arathi Highlands; clear its guards first. The Jade is a gem found while mining, or at the auction house."] =
        "在阿拉希高地外環禁錮法陣的中央石頭上使用圖騰棒；先清掉它的守衛。翡翠是一種採礦時可獲得的寶石，拍賣場也買得到。",
    ["The book lies in the Library of the Scarlet Monastery."] =
        "那本書在血色修道院的圖書館裡。",
    ["Your reward: a mage's wand."] =
        "獎勵：一把法師魔杖。",
    ["From level 35: Tabetha's second chain, which goes through Uldaman."] =
        "35級起：塔貝薩的第二個系列任務，途經奧達曼。",
    ["The Burning Blade summoners of Mannoroc Coven, in southern Desolace, carry the orb."] =
        "淒涼之地南部瑪諾洛克集會所的火刃召喚師身上帶著寶珠。",
    ["Right there: Tabetha frees the demon of the orb; defeat it."] =
        "就在原地：塔貝薩會釋放寶珠中的惡魔；擊敗它。",
    ["The Obsidian Sentinel of Uldaman holds the power source."] =
        "奧達曼的黑曜石哨兵持有能量源。",
    ["Right there: destroy the mana surges as they appear around Tabetha."] =
        "就在原地：法力怒靈出現在塔貝薩周圍時，將它們摧毀。",
    ["From level 40: Tabetha's task in Zul'Farrak."] =
        "40級起：塔貝薩在祖爾法拉克的任務。",
    ["Hydromancer Velratha, by the sacred pool of Zul'Farrak, drops the tiara."] =
        "祖爾法拉克聖池旁的水占師維蕾薩會掉落頭冠。",
    ["Your capital's master mage gives it."] =
        "你主城的法師大師會給這個任務。",
    ["From level 50: Archmage Xylem's chain in Azshara, which ends in the Temple of Atal'Hakkar."] =
        "50級起：大法師克希雷姆在艾薩拉的系列任務，最後在阿塔哈卡神廟結束。",
    ["Sanath Lim-yo, at the foot of Archmage Xylem's tower in Azshara: talk to him to be sent up to the archmage."] =
        "薩納斯，在艾薩拉大法師克希雷姆的塔下：和他交談，他會把你送上去見大法師。",
    ["The blood elves of the ruins in northeastern Azshara carry the dust."] =
        "艾薩拉東北部廢墟的血精靈身上帶著粉塵。",
    ["The Spitelash sirens of the western shore of Azshara carry the coral."] =
        "艾薩拉西岸的惡鞭海妖身上帶著珊瑚。",
    ["Morphaz, one of the green dragons of the temple, drops the shard."] =
        "摩弗拉斯，神廟中的綠龍之一，會掉落碎片。",
    ["From level 60: Lorekeeper Lydros' quest, inside Dire Maul."] =
        "60級起：博學者萊德羅斯的任務，在厄運之槌內。",
    ["Hydrospawn, a water elemental of Dire Maul, drops the essence."] =
        "海多斯博恩，厄運之槌的一隻水元素，會掉落精華。",
    ["Paladin quests"] =
        "聖騎士任務",
    ["Brother Wilhelm, the paladin trainer of Goldshire, sends you to Stormwind."] =
        "威爾海姆修士，閃金鎮的聖騎士訓練師，會派你前往暴風城。",
    ["Duthorian Rall, in the Cathedral of Light."] =
        "達索瑞恩·拉爾，在聖光大教堂。",
    ["From level 12: the chain that teaches Redemption."] =
        "12級起：學會救贖的系列任務。",
    ["Read the Tome of Divinity from your bags to start the next quest."] =
        "從背包閱讀聖潔之書，接取下一個任務。",
    ["Stephanie Turner, a poor woman of Old Town."] =
        "斯蒂芬妮·特納，舊城區的一位窮苦婦人。",
    ["She needs Linen Cloth: humanoids carry it everywhere."] =
        "她需要亞麻布：各地的人型生物身上都有。",
    ["Gazin Tenorm, in the Cathedral of Light."] =
        "傑生·坦諾姆，在聖光大教堂。",
    ["Henze Faulk lies lifeless in the east of Elwynn Forest: use the Symbol of Life on him."] =
        "亨茲·法奧克毫無生氣地躺在艾爾文森林東部：對他使用生命符記。",
    ["The Defias around Henze carry the script."] =
        "亨茲周圍的迪菲亞身上帶著手稿。",
    ["Turning this in teaches Redemption."] =
        "交付此任務即可學會救贖。",
    ["Azar Stronghammer, the paladin trainer of Kharanos, sends you to Ironforge."] =
        "阿札爾·戰錘，卡拉諾斯的聖騎士訓練師，會派你前往鐵爐堡。",
    ["Tiza Battleforge, in the Mystic Ward of Ironforge."] =
        "蒂薩·熱爐，在鐵爐堡的秘法區。",
    ["John Turner, a poor man who walks the streets of Ironforge."] =
        "約翰·特納，一位在鐵爐堡街頭走動的窮人。",
    ["He needs Linen Cloth: humanoids carry it everywhere."] =
        "他需要亞麻布：各地的人型生物身上都有。",
    ["Muiredon Battleforge, beside Tiza."] =
        "穆里頓·熱爐，在蒂薩旁邊。",
    ["Narm Faulk lies lifeless in the east of Dun Morogh: use the Symbol of Life on him."] =
        "納姆·法奧克毫無生氣地躺在丹莫洛東部：對他使用生命符記。",
    ["The Dark Iron spies around Narm carry the script."] =
        "納姆周圍的黑鐵間諜身上帶著手稿。",
    ["From level 20: the Tome of Valor, then the Test of Righteousness, which ends with Verigan's Fist, a two-handed mace."] =
        "20級起：先是「勇氣之書」，再是「正義試煉」，最後獲得雙手錘維里甘之拳。",
    ["Read the Tome of Valor from your bags to start the next quest."] =
        "從背包閱讀勇氣之書，接取下一個任務。",
    ["Duthorian Rall, in the Cathedral of Light of Stormwind."] =
        "達索瑞恩·拉爾，在暴風城的聖光大教堂。",
    ["Daphne Stilwell, at her house in the south of Westfall. Take her quest only when ready: three waves of Defias attack, then more."] =
        "達芙妮·斯迪威爾，在西部荒野南部她的房子。準備好再接她的任務：迪菲亞會發動三波攻擊，之後還有更多。",
    ["Stay by Daphne until the last wave falls; a friend helps."] =
        "待在達芙妮身邊，直到最後一波敵人倒下；找個朋友幫忙會有幫助。",
    ["Jordan Stilwell, outside the gates of Ironforge."] =
        "喬丹·斯迪威爾，在鐵爐堡大門外。",
    ["Four items: the lumber from the Deadmines, the hammer from Shadowfang Keep, the ore from Loch Modan and the Kor Gem from Darkshore."] =
        "四件物品：死亡礦坑的木材、影牙城堡的鐵錘、洛克莫丹的礦石，以及黑海岸的科爾寶石。",
    ["Bailor Stonehand, in Thelsamar."] =
        "白洛爾·石手，在塞爾薩瑪。",
    ["The ore lies in a crate by a tree stump, in the northeast of Loch Modan."] =
        "礦石在洛克莫丹東北部一個樹樁旁的箱子裡。",
    ["Thundris Windweaver, in Auberdine."] =
        "桑迪斯·織風，在奧伯丁。",
    ["The naga of the Blackfathom Deeps entrance, under the water of Zoram Strand in Ashenvale, carry the corrupted gem. They are elite: bring a group."] =
        "黑暗深淵入口的納迦，位於梣谷佐拉姆海岸的水下，身上帶著被污染的寶石。牠們是精英：請組隊前往。",
    ["The goblin woodcarvers of the Deadmines carry the lumber."] =
        "死亡礦坑的哥布林木匠身上帶著木材。",
    ["Jordan's hammer lies in the stables of Shadowfang Keep."] =
        "喬丹的鐵錘在影牙城堡的馬廄裡。",
    ["Your reward: Verigan's Fist."] =
        "獎勵：維里甘之拳。",
    ["Delgren the Purifier, at Maestra's Post in Ashenvale."] =
        "『淨化者』德爾葛蘭，在梣谷的邁斯特拉崗哨。",
    ["From level 22: Forever's paladin chain of Delgren the Purifier."] =
        "22級起：Forever的『淨化者』德爾葛蘭聖騎士系列任務。",
    ["Katherine the Pure, in the Cathedral of Light of Stormwind."] =
        "純潔的凱薩琳，在暴風城的聖光大教堂。",
    ["Ursula Deline, the warlock trainer of the Mage Quarter."] =
        "厄蘇拉·德林，法師區的術士訓練師。",
    ["The Blackrock orcs of Redridge Mountains carry the summoner's salt."] =
        "赤脊山的黑石獸人身上帶著召喚師之鹽。",
    ["The demons of Demon Fall Canyon, in the southeast of Ashenvale, carry the motes."] =
        "梣谷東南部魔隕峽谷的惡魔身上帶著微粒。",
    ["Bring them to the Spear of Mannoroth, in the canyon."] =
        "把它們帶到峽谷裡的瑪諾洛斯之矛。",
    ["From level 40: the quest of your warhorse."] =
        "40級起：你的戰馬任務。",
    ["Turning this in teaches Summon Warhorse."] =
        "交付此任務即可學會召喚戰馬。",
    ["Lord Grayson Shadowbreaker, in the Cathedral of Light."] =
        "格雷森·破影者領主，在聖光大教堂。",
    ["From level 50: the chain of the Mightstone, which ends in the Temple of Atal'Hakkar."] =
        "50級起：力量之石的系列任務，最後在阿塔哈卡神廟結束。",
    ["Commander Ashlam Valorfist, at Chillwind Camp in the Western Plaguelands."] =
        "指揮官阿胥拉姆·瓦羅菲斯特，在西瘟疫之地的冰風崗。",
    ["The skeletons of the fields of Andorhal carry the scourgestones."] =
        "安多哈爾田野上的骷髏身上帶著天譴石。",
    ["High Priest Thel'danis walks around Chillwind Camp."] =
        "高階牧師賽爾鄧尼斯在冰風崗一帶走動。",
    ["The six troll bosses of the temple's upper ring each drop one feather: Gasher, Zul'Lor, Mijan, Hukku, Zolo and Loro."] =
        "神廟上層環形區域的六個食人妖首領各掉落一根羽毛：加什爾、祖羅爾、米杉、胡庫、祖羅和洛若爾。",
    ["From level 60: the long chain of your charger. It asks for about 200 gold and goes through Stratholme, Dire Maul and Scholomance."] =
        "60級起：你的戰駒的漫長系列任務。需要約200金，並途經斯坦索姆、厄運之槌和通靈學院。",
    ["High Priest Rohan, in the Mystic Ward of Ironforge: the sacrifice he asks for is gold."] =
        "高階牧師洛漢，在鐵爐堡的秘法區：他要求的犧牲是金幣。",
    ["Use the censer on the Terrordale Spirits, in the northwest of the Eastern Plaguelands."] =
        "對東瘟疫之地西北部的恐懼谷的靈魂使用香爐。",
    ["Grimand Elmore, in the Dwarven District of Stormwind."] =
        "格瑞曼德·艾爾默，在暴風城的矮人區。",
    ["Grimand wants gold, Arthas' Tears (a herb), Runecloth, an Arcanite Bar, and holy water from the supply crates of Stratholme."] =
        "格瑞曼德需要金幣、阿薩斯之淚（一種草藥）、符文布、一塊奧金錠，以及斯坦索姆補給木箱裡的聖水。",
    ["Merideth Carlson, the horse breeder of Southshore, makes the horse feed."] =
        "梅麗德絲·卡爾森，南海鎮的養馬人，會製作馬飼料。",
    ["The Enriched Manna Biscuits are sold by the Argent Dawn's quartermasters."] =
        "可口的魔法點心由銀色黎明的軍需官出售。",
    ["The Ancient Equine Spirit waits in western Dire Maul, past Tendris Warpwood."] =
        "上古聖馬之魂在厄運之槌西區，位於特迪斯·扭木後方。",
    ["An Azerothian Diamond and a Pristine Black Diamond: found while mining and on monsters of the Plaguelands, or at the auction house."] =
        "一顆艾澤拉斯鑽石和一顆原始黑鑽石：採礦時或從瘟疫之地的怪物身上可以取得，也可在拍賣場購買。",
    ["In Scholomance, use the Divination Scryer to call Death Knight Darkreaver, defeat him, then use the charger's soul on his fallen mount."] =
        "在通靈學院中，使用預言水晶球召喚死亡騎士達克雷爾，擊敗他，再對他倒下的坐騎使用戰駒的靈魂。",
    ["Your reward: Summon Charger, your epic mount."] =
        "獎勵：召喚戰駒，你的史詩坐騎。",
    ["Priest quests"] =
        "牧師任務",
    ["Priestess Anetta, the priest trainer of Northshire Abbey."] =
        "女牧師安妮塔，北郡修道院的牧師訓練師。",
    ["From level 5: heal a wounded guard, and get your first robe."] =
        "5級起：治療一名受傷的衛兵，並獲得你的第一件長袍。",
    ["Priestess Josetta, the priest trainer of Goldshire."] =
        "女牧師潔塞塔，閃金鎮的牧師訓練師。",
    ["Guard Roberts lies wounded east of Goldshire: heal him with Lesser Heal, then give him Power Word: Fortitude."] =
        "衛兵羅伯茲受傷躺在閃金鎮東邊：用次級治療術治療他，再對他施放真言術：韌。",
    ["Branstock Khalder, the priest trainer of Coldridge Valley."] =
        "布蘭斯托克·卡德爾，寒脊山谷的牧師訓練師。",
    ["From level 5: heal a wounded mountaineer, and get your first robe."] =
        "5級起：治療一名受傷的巡山人，並獲得你的第一件長袍。",
    ["Maxan Anvol, the priest trainer of Kharanos."] =
        "馬克薩恩·安沃爾，卡拉諾斯的牧師訓練師。",
    ["Mountaineer Dolf lies wounded near Kharanos: heal him with Lesser Heal, then give him Power Word: Fortitude."] =
        "巡山人多爾夫受傷躺在卡拉諾斯附近：用次級治療術治療他，再對他施放真言術：韌。",
    ["Shanda, the priest trainer of Aldrassil, in Shadowglen."] =
        "珊達，幽影谷奧達希爾的牧師訓練師。",
    ["From level 5: heal a wounded sentinel, and get your first robe."] =
        "5級起：治療一名受傷的哨兵，並獲得你的第一件長袍。",
    ["Laurna Morninglight, the priest trainer of Dolanaar."] =
        "勞爾娜·晨光，多蘭納爾的牧師訓練師。",
    ["Sentinel Shaya lies wounded south of Dolanaar: heal her with Lesser Heal, then give her Power Word: Fortitude."] =
        "哨兵莎恩雅受傷躺在多蘭納爾南邊：用次級治療術治療她，再對她施放真言術：韌。",
    ["From level 10: the quest that teaches Desperate Prayer."] =
        "10級起：學會絕望禱言的任務。",
    ["High Priestess Laurena, in the Cathedral of Light of Stormwind."] =
        "高階牧師勞瑞娜，在暴風城的聖光大教堂。",
    ["Priestess Josetta gives it too."] =
        "女牧師潔塞塔也會給這個任務。",
    ["From level 10: Forever's quest of Divine Grace, for Humans."] =
        "10級起：Forever的「Divine Grace」任務，限人類。",
    ["From level 10: Forever's quest of Confounding Flash, for Gnomes."] =
        "10級起：Forever的「Confounding Flash」任務，限地精。",
    ["High Priestess Mims, in the Mystic Ward of Ironforge."] =
        "High Priestess Mims，在鐵爐堡的秘法區。",
    ["From level 10: the quest that teaches Starshards."] =
        "10級起：學會星辰碎片的任務。",
    ["Priestess Alathea, in the Temple of the Moon of Darnassus."] =
        "女祭司阿蘭希雅，在達納蘇斯的月神殿。",
    ["From level 20: the quest that teaches Feedback."] =
        "20級起：學會回饋的任務。",
    ["High Priest Rohan, in the Mystic Ward of Ironforge."] =
        "高階牧師洛漢，在鐵爐堡的秘法區。",
    ["From level 20: the quest that teaches Fear Ward."] =
        "20級起：學會防護恐懼結界的任務。",
    ["From level 20: Forever's second Gnome priest quest."] =
        "20級起：Forever的第二個地精牧師任務。",
    ["From level 20: the quest that teaches Elune's Grace."] =
        "20級起：學會伊露恩的恩典的任務。",
    ["Any priest trainer of a capital gives it."] =
        "任何主城的牧師訓練師都會給這個任務。",
    ["The Mosshoof Coursers of northern Azshara carry the glands; only some do."] =
        "艾薩拉北部的苔蹄快步者身上帶著腺體；但只有部分會有。",
    ["The undead of the Western Plaguelands and the Zanzil zombies of Stranglethorn carry the ichor."] =
        "西瘟疫之地的不死生物和荊棘谷的贊吉爾殭屍身上帶著腐液。",
    ["Morphaz, one of the green dragons of the temple, carries the blood."] =
        "摩弗拉斯，神廟中的綠龍之一，身上帶著血液。",
    ["Greta Mosshoof, at the Emerald Sanctuary in Felwood."] =
        "格雷塔·苔蹄，在費伍德森林的翡翠聖地。",
    ["Rogue quests"] =
        "盜賊任務",
    ["Hogral Bakkan, the rogue trainer of Kharanos."] =
        "霍格拉爾·巴坎，卡拉諾斯的盜賊訓練師。",
    ["From level 10: a first errand for the rogues of Ironforge."] =
        "10級起：為鐵爐堡盜賊跑的第一趟差事。",
    ["Hulfdan Blackbeard, in the Forlorn Cavern of Ironforge."] =
        "霍夫丹·黑鬚，在鐵爐堡的荒棄的洞穴。",
    ["Onin MacHammar stands on a platform in the west of Dun Morogh, near Gnomeregan."] =
        "奧寧·雨錘站在丹莫洛西部靠近諾姆瑞根的一座平台上。",
    ["Learn Pick Lock at your trainer, then practice on lockboxes until your skill reaches 75."] =
        "向訓練師學習開鎖，再拿帶鎖箱練習，直到技能達到75。",
    ["From level 16: Pick Lock opens the chests and boxes of the quests to come."] =
        "16級起：開鎖可以打開後續任務中的寶箱和箱子。",
    ["Master Mathias Shaw, on the top floor of SI:7's headquarters, in Old Town."] =
        "馬迪亞斯·肖爾，在舊城區軍情七處總部的頂樓。",
    ["From level 20: the chain that teaches your poisons."] =
        "20級起：學會毒藥的系列任務。",
    ["Agent Kearnen watches from a hill in the southeast of Westfall."] =
        "密探吉爾妮在西部荒野東南部的一座山丘上監視。",
    ["Pick the Defias Tower Key from the pocket of a Malformed Defias Drone, by the tower; then, upstairs, sap Klaven Mortwake before you open the chest."] =
        "從塔樓旁的醜陋的迪菲亞懶漢口袋裡偷取迪菲亞塔樓鑰匙；接著到樓上，先對克拉文·摩特維克使用悶棍，再打開箱子。",
    ["The chest leaves a sickness on you: that is the next quest."] =
        "箱子會讓你染上疾病：這就是下一個任務。",
    ["Doc Mixilpixil works in the cellar of SI:7's headquarters."] =
        "道克·米希匹克斯在軍情七處總部的地下室工作。",
    ["Lie down in front of him (the emote) so he can examine you."] =
        "在他面前躺下（表情動作），讓他為你檢查。",
    ["Turning this in teaches your poisons."] =
        "交付此任務即可學會毒藥。",
    ["Myrokos Silentform, at Ravenholdt Manor in the Alterac Mountains: the way in is a cave in the north of Hillsbrad Foothills."] =
        "麥洛克斯，在奧特蘭克山脈的拉文霍德莊園：入口是希爾斯布萊德丘陵北部的一個洞穴。",
    ["From level 24: Forever's Syndicate quests, at Ravenholdt Manor."] =
        "24級起：Forever的辛迪加任務，在拉文霍德莊園。",
    ["Lord Tomas is hiding in the east of Hillsbrad Foothills."] =
        "Lord Tomas躲在希爾斯布萊德丘陵東部。",
    ["Any rogue trainer of a capital gives it."] =
        "任何主城的盜賊訓練師都會給這個任務。",
    ["From level 50: Lord Jorach Ravenholdt's chain, which ends in the Temple of Atal'Hakkar."] =
        "50級起：喬拉齊·拉文霍德領主的系列任務，最後在阿塔哈卡神廟結束。",
    ["Lord Jorach Ravenholdt, in Ravenholdt Manor."] =
        "喬拉齊·拉文霍德領主，在拉文霍德莊園。",
    ["The Timbermaw shamans of northern Azshara carry the bag."] =
        "艾薩拉北部的木喉薩滿身上帶著袋子。",
    ["Archmage Xylem, at the top of his tower in Azshara: Sanath Lim-yo, at its foot, sends you up."] =
        "大法師克希雷姆，在他位於艾薩拉的塔頂：塔下的薩納斯會送你上去。",
    ["The Forest Oozes of northeastern Azshara carry the fragments."] =
        "艾薩拉東北部的森林軟泥怪身上帶著碎片。",
    ["Morphaz, one of the green dragons of the temple, drops the key."] =
        "摩弗拉斯，神廟中的綠龍之一，會掉落鑰匙。",
    ["Shaman quests"] =
        "薩滿任務",
    ["Teo Hammerstorm, the shaman trainer of Coldridge Valley."] =
        "Teo Hammerstorm，寒脊山谷的薩滿訓練師。",
    ["From level 4: the Call of Earth, your first totem."] =
        "4級起：「大地的召喚」，你的第一個圖騰。",
    ["The Frostmane trolls south of the valley carry the pendant."] =
        "山谷南邊的霜鬃食人妖身上帶著墜飾。",
    ["On the hill west of the valley: drink the Earth Sapta to see the Minor Manifestation of Earth."] =
        "在山谷西邊的山丘上：喝下大地靈契，就能看見小型大地之靈體。",
    ["Turning this in teaches your first earth totem."] =
        "交付此任務即可學會你的第一個大地圖騰。",
    ["Ingrid Dunwald in Kharanos, or Eldrun Stormbreaker in Ironforge."] =
        "卡拉諾斯的Ingrid Dunwald，或鐵爐堡的Eldrun Stormbreaker。",
    ["From level 10: the Call of Fire, your first fire totem."] =
        "10級起：「火焰的召喚」，你的第一個火焰圖騰。",
    ["Bruegs Kindleborn, in the far east of Dun Morogh, by the road to Loch Modan."] =
        "Bruegs Kindleborn，在丹莫洛最東邊，通往洛克莫丹的路旁。",
    ["Braldir Ashmantle, on a hill in the southwest of Loch Modan."] =
        "Braldir Ashmantle，在洛克莫丹西南部的一座山丘上。",
    ["The Tunnel Rat geomancers of Loch Modan carry the Fire Tar; the Stonesplinter seers of the south carry the pouches."] =
        "洛克莫丹的坑道鼠地卜師身上帶著火焰焦油；南部的碎石怪先知身上帶著袋子。",
    ["Right by Braldir: call the Minor Manifestation of Fire at the brazier, then defeat it for its ember."] =
        "就在Braldir旁邊：在火盆召喚小型火焰之靈體，擊敗它取得餘燼。",
    ["Light the Brazier of the Dormant Flame with the ember."] =
        "用餘燼點燃眠炎火盆。",
    ["Bruegs Kindleborn, in the far east of Dun Morogh."] =
        "Bruegs Kindleborn，在丹莫洛最東邊。",
    ["Turning this in teaches your first fire totem."] =
        "交付此任務即可學會你的第一個火焰圖騰。",
    ["Eldrun Stormbreaker, the shaman trainer of Ironforge."] =
        "Eldrun Stormbreaker，鐵爐堡的薩滿訓練師。",
    ["From level 20: the Call of Water, your first water totem."] =
        "20級起：「水之召喚」，你的第一個水之圖騰。",
    ["Norric Lochthane, by the dam in the north of Loch Modan."] =
        "Norric Lochthane，在洛克莫丹北部的水壩旁。",
    ["Hervdana Saegrund, in the southeast of the Wetlands."] =
        "Hervdana Saegrund，在濕地東南部。",
    ["Fill the waterskin where Hervdana's quest says: DingDB does not hold this place yet."] =
        "依照Hervdana任務所說的地點裝滿水囊：DingDB尚未收錄這個地點。",
    ["At the Forgotten Shrine of Westfall: call the corrupt manifestation of water, then defeat it for its bracers."] =
        "在西部荒野的遺忘神殿：召喚墮落的水之靈體，擊敗它取得護腕。",
    ["The Minor Manifestation of Water rises beside the shrine."] =
        "小型水之靈體會在神殿旁出現。",
    ["Turning this in teaches your first water totem."] =
        "交付此任務即可學會你的第一個水之圖騰。",
    ["From level 30: the Call of Air, your first air totem."] =
        "30級起：「空氣的召喚」，你的第一個空氣圖騰。",
    ["Veyric Thunderhame, in the north of Arathi Highlands."] =
        "Veyric Thunderhame，在阿拉希高地北部。",
    ["Turning this in teaches your first air totem."] =
        "交付此任務即可學會你的第一個空氣圖騰。",
    ["From level 30: Veyric Thunderhame's elemental quests, to level 40."] =
        "30級起：Veyric Thunderhame的元素任務，直到40級。",
    ["Four twisted totems: from the Stonevault troggs of the Badlands, the Maraudine centaurs of Desolace, the Lost Ones of the Swamp of Sorrows and the Mirefin murlocs of Dustwallow Marsh."] =
        "四個扭曲的圖騰：分別來自荒蕪之地的石窟穴居人、淒涼之地的瑪洛迪半人馬、悲傷沼澤的失落者，以及塵泥沼澤的沼鰭魚人。",
    ["Charlga Razorflank, the crone of Razorfen Kraul, carries the note."] =
        "卡爾加·刺肋，剃刀沼澤的老巫婆，身上帶著便箋。",
    ["The Ravaging Tempests of western Thousand Needles carry the eye."] =
        "千針石林西部的Ravaging Tempest身上帶著眼睛。",
    ["Bath'rah the Windwatcher, in the hills of the Alterac Mountains."] =
        "『觀風者』巴斯拉，在奧特蘭克山脈的山丘上。",
    ["Warlock quests"] =
        "術士任務",
    ["Drusilla La Salle, the warlock trainer of Northshire Abbey."] =
        "杜希拉·拉薩雷，北郡修道院的術士訓練師。",
    ["Your trainer's first errand, around Northshire Abbey."] =
        "訓練師交給你的第一件差事，在北郡修道院周圍。",
    ["The stolen books lie in the kobold camp east of the abbey."] =
        "被偷的書在修道院東邊的狗頭人營地。",
    ["Alamar Grimm, the warlock trainer of Coldridge Valley."] =
        "阿拉瑪爾·格里姆，寒脊山谷的術士訓練師。",
    ["Your trainer's first errand, around Coldridge Valley."] =
        "訓練師交給你的第一件差事，在寒脊山谷周圍。",
    ["The Frostmane novices of the troll cave in the south of the valley carry the charm."] =
        "山谷南部食人妖洞穴裡的霜鬃食人妖新兵身上帶著護符。",
    ["Remen Marcot, in the inn of Goldshire, sends you to Stormwind."] =
        "雷門·瑪考特，在閃金鎮的旅店，會派你前往暴風城。",
    ["Lago Blackwrench, in the Forlorn Cavern of Ironforge, sends you to Stormwind."] =
        "拉戈·黑鉗，在鐵爐堡的荒棄的洞穴，會派你前往暴風城。",
    ["Gakin the Darkbinder, in the cellar of the Slaughtered Lamb, in the Mage Quarter of Stormwind."] =
        "『黑暗縛靈師』加金，在暴風城法師區已宰的羔羊的地下室。",
    ["From level 10: the chain that teaches Summon Voidwalker."] =
        "10級起：學會召喚虛無行者的系列任務。",
    ["Surena Caledon hides in a house of the Brackwell Pumpkin Patch, in the east of Elwynn Forest."] =
        "蘇倫娜·凱爾東躲在艾爾文森林東部布拉克威爾南瓜田的一棟房子裡。",
    ["Down the stairs of the Slaughtered Lamb's crypt: use the choker on the summoning circle, then defeat the voidwalker."] =
        "沿著已宰的羔羊地穴的樓梯往下走：在召喚法陣上使用項圈，然後擊敗虛無行者。",
    ["Turning this in teaches Summon Voidwalker."] =
        "交付此任務即可學會召喚虛無行者。",
    ["Gakin the Darkbinder, in the cellar of the Slaughtered Lamb."] =
        "『黑暗縛靈師』加金，在已宰的羔羊的地下室。",
    ["From level 20: the chain that teaches Summon Succubus."] =
        "20級起：學會召喚魅魔的系列任務。",
    ["Takar the Seer, north of Camp Taurajo in the Barrens: Horde land, stay clear of the guards."] =
        "『先知』塔卡爾，在貧瘠之地的陶拉祖營地北邊：部落領地，遠離守衛。",
    ["The Heartswood grows in the north of Ashenvale, near the Horde's lumber camp."] =
        "同心樹長在梣谷北部，靠近部落的伐木場。",
    ["In the Slaughtered Lamb's crypt again: use the heartswood core on the summoning circle, then defeat the succubus."] =
        "再次來到已宰的羔羊的地穴：在召喚法陣上使用同心樹之核，然後擊敗魅魔。",
    ["Turning this in teaches Summon Succubus."] =
        "交付此任務即可學會召喚魅魔。",
    ["From level 30: the chain that teaches Summon Felhunter."] =
        "30級起：學會召喚惡魔獵犬的系列任務。",
    ["Strahad Farsan, in Ratchet."] =
        "斯坦哈德·法爾杉，在棘齒城。",
    ["Krom Stoutarm, in the Hall of Explorers of Ironforge."] =
        "克羅姆·粗臂，在鐵爐堡的探險者大廳。",
    ["The moldy tome lies in the southwest of Hillsbrad Foothills; the tattered manuscript, in a damaged chest of western Thousand Needles."] =
        "發黴的書籍在希爾斯布萊德丘陵西南部；破損的手稿則在千針石林西部的一個破損的箱子裡。",
    ["The Dragonmaw orcs of the Wetlands carry the rod."] =
        "濕地的龍喉獸人身上帶著魔棒。",
    ["Right by Strahad: use the tome on the summoning circle, then defeat the felhunter."] =
        "就在斯坦哈德旁邊：在召喚法陣上使用書籍，然後擊敗惡魔獵犬。",
    ["Turning this in teaches Summon Felhunter."] =
        "交付此任務即可學會召喚惡魔獵犬。",
    ["Demisette Cloyce, in the Slaughtered Lamb of Stormwind."] =
        "德米賽特·克勞斯，在暴風城的已宰的羔羊。",
    ["From level 40: the quest of your felsteed."] =
        "40級起：你的地獄戰馬任務。",
    ["Turning this in teaches Summon Felsteed."] =
        "交付此任務即可學會召喚地獄戰馬。",
    ["Niby the Almighty and Impsy wait in a small camp of central Felwood."] =
        "萬能的尼比和伊普斯在費伍德森林中部的一個小營地等候。",
    ["From level 50: the demonic quests of Niby and Impsy, in Felwood."] =
        "50級起：尼比和伊普斯在費伍德森林的惡魔任務。",
    ["Felcloth drops from demons and satyrs, Azshara's above all; the auction house sells it too."] =
        "惡魔布由惡魔和薩特掉落，尤其是艾薩拉的；拍賣場也有賣。",
    ["The Irontree treants of northern Felwood carry the rotting wood; the oozes of the Bloodvenom river, the essence."] =
        "費伍德森林北部的鐵木樹人身上帶著腐爛的木頭；血毒河的軟泥怪則帶著精華。",
    ["Three essences: from the satyrs of Jaedenar in Felwood, the Legashi satyrs of Azshara, and the felguards by the Dark Portal in the Blasted Lands."] =
        "三種精華：分別來自費伍德森林加德納爾的薩特、艾薩拉的雷加斯薩特，以及詛咒之地黑暗之門旁的惡魔守衛。",
    ["North of the camp, by the remains of Kroshius: use the item Impsy gives you to wake him, then defeat him."] =
        "營地北邊，克羅蘇斯的遺骸旁：使用伊普斯給你的物品喚醒他，然後擊敗他。",
    ["Spackle Thornberry, the demon trainer of the Slaughtered Lamb."] =
        "斯巴克爾，已宰的羔羊的惡魔訓練師。",
    ["From level 60: the long chain of your dreadsteed. It asks for costly materials and goes through Scholomance and Dire Maul."] =
        "60級起：你的恐懼戰馬的漫長系列任務。需要昂貴的材料，並途經通靈學院和厄運之槌。",
    ["Mor'zul Bloodbringer, in the west of the Burning Steppes."] =
        "莫蘇爾·召血者，在燃燒平原西部。",
    ["The owlbeasts of Winterspring carry the blood."] =
        "冬泉谷的梟獸身上帶著血液。",
    ["Gorzeeki Wildeyes, right by Mor'zul."] =
        "戈瑟奇·邪眼，就在莫蘇爾旁邊。",
    ["Mor'zul gives these three."] =
        "這三個任務由莫蘇爾給予。",
    ["These three ask for an alchemist's elixir, an enchanter's shard with ore of the Burning Steppes, and scales of black dragonkin: make them, find them, or buy them at the auction house."] =
        "這三個任務需要一瓶鍊金師的藥劑、一塊附魔師的碎片加上燃燒平原的礦石，以及黑龍的鱗片：自己製作、自己尋找，或在拍賣場購買。",
    ["An Arcanite Bar: an alchemist makes it, or the auction house sells it."] =
        "一塊奧金錠：由鍊金師製作，或在拍賣場購買。",
    ["Lord Banehollow, in the shrine of Jaedenar, in Felwood."] =
        "貝恩霍勒領主，在費伍德森林加德納爾的神殿裡。",
    ["Ulathek hides in Jaedenar too: defeat him for his heart."] =
        "烏拉泰克也躲在加德納爾：擊敗他取得他的心臟。",
    ["Ur'dan sells the stardust, right by Lord Banehollow."] =
        "烏爾丹出售星塵，就在貝恩霍勒領主旁邊。",
    ["In the alchemy lab of Scholomance, use the imp in a jar and let it do its work."] =
        "在通靈學院的鍊金實驗室使用瓶中的小鬼，讓牠完成工作。",
    ["In Dire Maul, summon the Xorothian Dreadsteed with the ritual items and defeat it; then speak to its spirit."] =
        "在厄運之槌中，用儀式物品召喚克索諾斯恐懼戰馬並擊敗它；然後和它的靈魂交談。",
    ["Your reward: Summon Dreadsteed, your epic mount."] =
        "獎勵：召喚恐懼戰馬，你的史詩坐騎。",
    ["Warrior quests"] =
        "戰士任務",
    ["Lyria Du Lac, the warrior trainer of Goldshire."] =
        "里瑞亞·杜拉克，閃金鎮的戰士訓練師。",
    ["From level 10: the chain that teaches Defensive Stance."] =
        "10級起：學會防禦姿態的系列任務。",
    ["Harry Burlguard, in the tavern of Old Town, in Stormwind."] =
        "哈里·伯加德，在暴風城舊城區的酒館。",
    ["Bartleby, a drunk in the same tavern: he attacks as soon as you take his quest."] =
        "巴托比，同一間酒館裡的醉漢：你一接下他的任務，他就會攻擊你。",
    ["Turning this in teaches Defensive Stance."] =
        "交付此任務即可學會防禦姿態。",
    ["Granis Swiftaxe, the warrior trainer of Kharanos."] =
        "格蘭尼斯·快斧，卡拉諾斯的戰士訓練師。",
    ["Muren Stormpike, upstairs in the Hall of Arms of Ironforge."] =
        "穆倫·雷矛，在鐵爐堡武器大廳的樓上。",
    ["Vejrek waits in a Frostmane hut in the west of Dun Morogh."] =
        "維吉雷克在丹莫洛西部的一間霜鬃食人妖小屋裡。",
    ["Kyra Windblade, the warrior trainer of Dolanaar."] =
        "凱拉·風刃，多蘭納爾的戰士訓練師。",
    ["Elanaria, on the Warrior's Terrace of Darnassus."] =
        "艾蘭娜瑞，在達納蘇斯的戰士區。",
    ["Vorlus Vilehoof roams with the satyrs southwest of Dolanaar."] =
        "沃魯斯·邪蹄和薩特一起在多蘭納爾西南方遊蕩。",
    ["Seena Skybreaker, the warrior trainer of Zephras Isle."] =
        "Seena Skybreaker，Zephras Isle的戰士訓練師。",
    ["From level 10: the Skyborne warrior quest of Zephras Isle."] =
        "10級起：Zephras Isle的Skyborne戰士任務。",
    ["Zaal Stormshield carries the bulwark, in the north of the isle."] =
        "Zaal Stormshield身上帶著壁壘，位於島嶼北部。",
    ["Your capital's warrior trainer gives it."] =
        "你主城的戰士訓練師會給這個任務。",
    ["From level 30: the chain that teaches Berserker Stance."] =
        "30級起：學會狂暴姿態的系列任務。",
    ["Klannoc Macleod, on Fray Island, off the coast of the Barrens."] =
        "克蘭諾克·馬克雷德，在貧瘠之地外海的勇士島。",
    ["Step on the grate of the arena: six fighters come one at a time, then Big Will."] =
        "踏上競技場的格柵：六名鬥士會一次一個上場，接著是比格維爾。",
    ["Turning this in teaches Berserker Stance."] =
        "交付此任務即可學會狂暴姿態。",
    ["From level 30: Bath'rah's chain, which ends with a Whirlwind weapon of your choice."] =
        "30級起：巴斯拉的系列任務，最後可自選一把旋風武器。",
    ["Eight Liferoot: an herb, picked with Herbalism or bought at the auction house."] =
        "八株活根草：一種草藥，可用草藥學採集，或在拍賣場購買。",
    ["The Drywhisker kobolds of eastern Arathi Highlands carry the three charms."] =
        "阿拉希高地東部的枯鬚狗頭人身上帶著三個符咒。",
    ["At Bath'rah's cauldron, right by him: put the three charms in it."] =
        "在巴斯拉身旁的大鍋：把三個符咒放進去。",
    ["The Bloodscalp trolls of northern Stranglethorn carry the tusks."] =
        "荊棘谷北部的血頂食人妖身上帶著獠牙。",
    ["Follow Bath'rah to the summoning, then defeat Cyclonian for its heart: a strong foe, bring help."] =
        "跟著巴斯拉前往召喚地點，然後擊敗塞克隆尼亞取得它的心臟：這是個強敵，請找幫手。",
    ["Your reward: a Whirlwind weapon of your choice."] =
        "獎勵：自選一把旋風武器。",
    ["From level 50: the Fallen Hero's chain, which ends in the Temple of Atal'Hakkar."] =
        "50級起：英雄之魂的系列任務，最後在阿塔哈卡神廟結束。",
    ["The Fallen Hero of the Horde, a spirit in the west of the Swamp of Sorrows."] =
        "部落英雄的靈魂，一個位於悲傷沼澤西部的亡魂。",
    ["The Helboars of the Blasted Lands."] =
        "詛咒之地的地獄野豬。",
    ["The Shadowsworn of the Blasted Lands, by the Dark Portal; they come back quickly."] =
        "詛咒之地黑暗之門旁的影誓；他們很快就會重生。",
    ["Gennia Runetotem, the druid trainer of Bloodhoof Village, sends you to Thunder Bluff."] =
        "根妮亞·符文圖騰，血蹄村的德魯伊訓練師，會派你前往雷霆崖。",
    ["Turak Runetotem, in the Elder Rise of Thunder Bluff."] =
        "圖拉克·符文圖騰，在雷霆崖的長者高地。",
    ["Faustron, the wind rider master southwest of Nighthaven: take this flight path for your next trips here."] =
        "法斯托恩，永夜港西南方的雙足飛龍管理員：取得這條飛行路線，方便之後再來這裡。",
    ["Lunaclaw's spot, west of Camp Taurajo in the Barrens"] =
        "月爪梟獸的所在地，位於貧瘠之地陶拉祖營地以西",
    ["Use the Cenarion Lunardust by the moonkin stone: Lunaclaw appears. Defeat her, then speak to her spirit."] =
        "在月夜梟獸之石旁使用塞納里奧銀塵：月爪梟獸就會出現。擊敗她，然後和她的靈魂交談。",
    ["Muln Earthfury gives it, in the northwest of Mulgore."] =
        "莫高雷西北部的Muln Earthfury會給這個任務。",
    ["Fill the sampler in the bubbling pool at the top of Dreadmist Peak: three acolytes attack right after, so clear the top first or bring help."] =
        "在鬼霧峰頂的冒泡池子裡裝滿取樣器：之後會立刻有三名侍僧攻擊你，所以先清理山頂，或找人幫忙。",
    ["Tonga Runetotem, just south of the Crossroads."] =
        "圖加·符文圖騰，就在十字路口南邊。",
    ["The kodos of the northern Barrens carry the Kodo Horns."] =
        "貧瘠之地北部的科多獸身上帶著科多獸角。",
    ["Sickly Gazelles graze in the north of the Barrens: use the salve on them."] =
        "生病的瞪羚在貧瘠之地北部吃草：對牠們使用藥膏。",
    ["The first half of the pendant lies under the water in the far north of the Barrens."] =
        "墜飾的前半塊在貧瘠之地最北端的水下。",
    ["The second half lies under the water off the coast of Silverpine Forest."] =
        "後半塊在銀松森林海岸外的水下。",
    ["Turak Runetotem gives it, in the Elder Rise of Thunder Bluff."] =
        "雷霆崖長者高地的圖拉克·符文圖騰會給這個任務。",
    ["Thotar, the hunter trainer of Razor Hill."] =
        "索塔爾，剃刀嶺的獵人訓練師。",
    ["Use the taming rod on a Dire Mottled Boar, south of Razor Hill. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "對剃刀嶺南邊的一隻可怕的雜斑野豬使用馴獸棒。馴服後解散牠：牠會再次攻擊你，做好準備。",
    ["Use the rod on a Surf Crawler, on the southern shore of Durotar, then dismiss it the same way."] =
        "對杜洛塔南岸的一隻海浪蟹使用馴獸棒，再用同樣的方式解散牠。",
    ["Use the rod on an Armored Scorpid, northwest of Razor Hill."] =
        "對剃刀嶺西北方的一隻硬甲蠍使用馴獸棒。",
    ["Ormak Grimshot, the hunter trainer of Orgrimmar, in the Valley of Honor."] =
        "奧瑪克，奧格瑪的獵人訓練師，在榮譽谷。",
    ["Yaw Sharpmane, the hunter trainer of Bloodhoof Village."] =
        "雅文·刺鬃，血蹄村的獵人訓練師。",
    ["Use the taming rod on an Adult Plainstrider, north of the village. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "對村莊北邊的一隻成年平原陸行鳥使用馴獸棒。馴服後解散牠：牠會再次攻擊你，做好準備。",
    ["Use the rod on a Prairie Stalker, southeast of the village, then dismiss it the same way."] =
        "對村莊東南方的一隻草原捕食者使用馴獸棒，再用同樣的方式解散牠。",
    ["Use the rod on a Swoop, in the plains north of the village."] =
        "對村莊北邊平原上的一隻猛鷲使用馴獸棒。",
    ["Holt Thunderhorn, the hunter trainer of Thunder Bluff, on the Hunter Rise."] =
        "浩特·雷角，雷霆崖的獵人訓練師，在獵人高地。",
    ["Uthel'nay, the mage trainer of Orgrimmar, in the Valley of Spirits."] =
        "尤塞爾奈，奧格瑪的法師訓練師，在精神谷。",
    ["From level 10: your trainer's first errand, in Durotar."] =
        "10級起：訓練師交給你的第一件差事，在杜洛塔。",
    ["Un'Thuwa, the mage trainer of Sen'jin Village."] =
        "安蘇瓦，森金村的法師訓練師。",
    ["The Ju-Ju Heaps stand on the Echo Isles, off the southern coast."] =
        "魂能骨堆位於南岸外海的回音群島上。",
    ["Cain Firesong, the mage trainer of Brill."] =
        "凱恩·火歌，布瑞爾的法師訓練師。",
    ["From level 10: your trainer's first errand, in Tirisfal Glades."] =
        "10級起：訓練師交給你的第一件差事，在提里斯法林地。",
    ["Anastasia Hartwell, the mage trainer of the Undercity, in the Magic Quarter."] =
        "安娜斯塔西婭·哈特威爾，幽暗城的法師訓練師，在魔法區。",
    ["The snapdragons grow by the farm of the Balnirs, in the east of Tirisfal Glades."] =
        "金魚草長在提里斯法林地東部的巴尼爾農場旁。",
    ["From level 15: a chain in the Undercity that ends with a robe for you."] =
        "15級起：幽暗城的系列任務，最後會獲得一件長袍。",
    ["The chest of coffers and the cantation lie beside Anastasia."] =
        "一盒封靈箱和顯形卷軸就在安娜斯塔西婭旁邊。",
    ["The alchemist shop of the Undercity"] =
        "幽暗城的鍊金術商店",
    ["Read the cantation to reveal a Rift Spawn, fight it until it is stunned, then use a coffer on it."] =
        "閱讀顯形卷軸讓裂隙怒靈現形，與牠戰鬥直到牠昏迷，再對牠使用封靈箱。",
    ["The Dalaran mages of Ambermill, in Silverpine Forest, carry the mana gems; the linen comes from humanoids anywhere."] =
        "銀松森林安伯米爾的達拉然法師身上帶著法力寶石；亞麻布可從任何地方的人型生物身上取得。",
    ["Josef Gregorian, the tailor of the Undercity's Rogues' Quarter."] =
        "喬瑟夫·格里高利，幽暗城盜賊區的裁縫。",
    ["Your reward: the Spellfire Robes."] =
        "獎勵：魔焰長袍。",
    ["Deino, the mage trainer of Orgrimmar, in the Valley of Spirits."] =
        "迪諾，奧格瑪的法師訓練師，在精神谷。",
    ["Fill the flask at the waterfall of Xavian, in eastern Ashenvale: take the path up from the south."] =
        "在梣谷東部的薩維亞瀑布裝滿瓶子：從南邊的小路上去。",
    ["The Laughing Sisters, nymphs of the woods of central Ashenvale, carry the hair."] =
        "歡笑之女是梣谷中部樹林的仙女，身上帶著頭髮。",
    ["Kil'hala, the tailor of the Crossroads."] =
        "基爾哈拉，十字路口的裁縫。",
    ["Your reward: the Nether-lace Garment."] =
        "獎勵：虛靈長袍。",
    ["Shadow Priest Sarvis, at the start of Deathknell."] =
        "暗影牧師薩維斯，在喪鐘鎮的起點。",
    ["The Forsaken paladin's story, a chain added by Forever, starts in Deathknell."] =
        "被遺忘者聖騎士的故事是Forever新增的系列任務，從喪鐘鎮開始。",
    ["Aramis Hammerhand, the paladin trainer of Deathknell."] =
        "Aramis Hammerhand，喪鐘鎮的聖騎士訓練師。",
    ["Shari Stilwell, the paladin trainer of Brill."] =
        "Shari Stilwell，布瑞爾的聖騎士訓練師。",
    ["Breton Samuels, at the outpost in the west of Tirisfal Glades."] =
        "Breton Samuels，在提里斯法林地西部的前哨站。",
    ["Jorin Croge, a few steps away."] =
        "Jorin Croge，就在幾步之外。",
    ["The Vile Fin murlocs of the western coast."] =
        "西岸的邪鰭魚人。",
    ["The lumber piles lie on the western coast, south of the murlocs."] =
        "木柴堆在西岸，魚人的南邊。",
    ["Danitha Morr, at the outpost."] =
        "Danitha Morr，在前哨站。",
    ["The Tarnished gather on the western coast; Rudolph Gelhardt, their paladin, carries the head the quest asks for."] =
        "Tarnished聚集在西岸；他們的聖騎士Rudolph Gelhardt身上帶著任務要求的頭顱。",
    ["Lady Sylvanas Windrunner, in the Royal Quarter of the Undercity."] =
        "希瓦娜斯·風行者，在幽暗城的皇家區。",
    ["Danitha Morr, at the outpost in the west of Tirisfal Glades."] =
        "Danitha Morr，在提里斯法林地西部的前哨站。",
    ["From level 12: the lessons in divinity, the next chapter of the Forsaken paladin's story."] =
        "12級起：神性課程，被遺忘者聖騎士故事的下一章。",
    ["Tanis Alderwood, in the Undercity."] =
        "Tanis Alderwood，在幽暗城。",
    ["Tanis needs Linen Cloth: humanoids carry it everywhere."] =
        "Tanis需要亞麻布：各地的人型生物身上都有。",
    ["Deathguard Billmuth, at the outpost."] =
        "Deathguard Billmuth，在前哨站。",
    ["Deathguard Falgan, in the east of Tirisfal Glades, near the Scarlet watch post."] =
        "Deathguard Falgan，在提里斯法林地東部，靠近血色十字軍崗哨。",
    ["The Scarlet zealots and friars of the watch post carry the attack plans."] =
        "崗哨的血色狂熱者和血色苦行修士身上帶著進攻計畫。",
    ["From level 18: the story goes on in Silverpine Forest, around a moonsilver blade."] =
        "18級起：故事在銀松森林繼續，圍繞著一把月銀之刃。",
    ["Trevan Rol, at the Sepulcher."] =
        "Trevan Rol，在瑟伯切爾。",
    ["Deathguard Baldren, at the Sepulcher."] =
        "Deathguard Baldren，在瑟伯切爾。",
    ["The charred remains lie in the east of Silverpine Forest, facing Fenris Isle."] =
        "燒焦的遺骸在銀松森林東部，面向芬里斯島。",
    ["Lumina Windsinger, held in Fenris Keep."] =
        "Lumina Windsinger，被關在芬里斯城堡。",
    ["The Rot Hide gnolls of Fenris Isle carry the key."] =
        "芬里斯島的腐皮豺狼人身上帶著鑰匙。",
    ["Lumina Windsinger waits again at the Sepulcher."] =
        "Lumina Windsinger再次在瑟伯切爾等候。",
    ["Old Fire-Eye prowls the south of Silverpine Forest."] =
        "Old Fire-Eye在銀松森林南部徘徊。",
    ["Ott, the weaponsmith of Tarren Mill."] =
        "奧特，塔倫米爾的武器鑄造師。",
    ["Ulric Frostveil, at Zoram'gar Outpost on the coast of Ashenvale."] =
        "Ulric Frostveil，在梣谷海岸的Zoram'gar Outpost。",
    ["From level 20: Ulric Frostveil's quest of the Kor Gem, in Ashenvale."] =
        "20級起：Ulric Frostveil在梣谷的科爾寶石任務。",
    ["The naga of the Blackfathom Deeps entrance, under the water of Zoram Strand, carry the corrupted gem. They are elite: bring a group."] =
        "黑暗深淵入口的納迦，位於佐拉姆海岸的水下，身上帶著被污染的寶石。牠們是精英：請組隊前往。",
    ["Ken'jai, the priest trainer of the Valley of Trials."] =
        "肯傑，試煉谷的牧師訓練師。",
    ["From level 5: heal a wounded grunt, and get your first robe."] =
        "5級起：治療一名受傷的蠻兵，並獲得你的第一件長袍。",
    ["Tai'jin, the priest trainer of Razor Hill."] =
        "泰金，剃刀嶺的牧師訓練師。",
    ["Grunt Kor'ja lies wounded south of Razor Hill: heal her with Lesser Heal, then give her Power Word: Fortitude."] =
        "蠻兵科雅受傷躺在剃刀嶺南邊：用次級治療術治療她，再對她施放真言術：韌。",
    ["Dark Cleric Duesten, the priest trainer of Deathknell."] =
        "黑暗教士杜斯滕，喪鐘鎮的牧師訓練師。",
    ["From level 5: heal a wounded deathguard, and get your first robe."] =
        "5級起：治療一名受傷的亡靈衛兵，並獲得你的第一件長袍。",
    ["Dark Cleric Beryl, the priest trainer of Brill."] =
        "黑暗教士貝里爾，布瑞爾的牧師訓練師。",
    ["Deathguard Kel lies wounded north of Brill: heal him with Lesser Heal, then give him Power Word: Fortitude."] =
        "亡靈衛兵科爾受傷躺在布瑞爾北邊：用次級治療術治療他，再對他施放真言術：韌。",
    ["From level 10: the quest that teaches Hex of Weakness."] =
        "10級起：學會虛弱妖術的任務。",
    ["Ur'kyo, the priest trainer of Orgrimmar, in the Valley of Spirits."] =
        "烏爾庫，奧格瑪的牧師訓練師，在精神谷。",
    ["Aelthalyste, the priest trainer of the Undercity, in the War Quarter."] =
        "艾薩萊斯特，幽暗城的牧師訓練師，在軍事區。",
    ["From level 10: the quest that teaches Touch of Weakness."] =
        "10級起：學會虛弱之觸的任務。",
    ["From level 20: the quest that teaches Shadowguard."] =
        "20級起：學會暗影守衛的任務。",
    ["From level 20: the quest that teaches Devouring Plague."] =
        "20級起：學會噬靈瘟疫的任務。",
    ["Learn Pick Lock at your trainer, then practice on lockboxes until your skill reaches 75: Gallywix's lockbox, at 20, needs it."] =
        "向訓練師學習開鎖，再拿帶鎖箱練習，直到技能達到75：20級時要開的加里維克斯的帶鎖箱需要它。",
    ["Shenthul, in a tent of the Cleft of Shadow, in Orgrimmar."] =
        "申蘇爾，在奧格瑪暗影裂口的一頂帳篷裡。",
    ["Shenthul greets you with a hand sign: answer it with the salute emote."] =
        "申蘇爾會用手勢向你打招呼：用敬禮表情回應他。",
    ["By the Venture Co. tower in the far north of the Barrens: target Taskmaster Fizzule, fire the flare gun twice, then salute him."] =
        "在貧瘠之地最北端的風險投資公司塔樓旁：選中監工費蘇勒，發射兩次信號槍，然後向他敬禮。",
    ["In the tower: pick Silixiz's key from his pocket, kill the guards floor by floor, Gallywix at the top, then open his lockbox."] =
        "在塔樓裡：從希里克斯的口袋偷取他的鑰匙，逐層擊殺守衛，頂層是加里維克斯，然後打開他的帶鎖箱。",
    ["The lockbox leaves a sickness on you: Shenthul sends you to be cured."] =
        "帶鎖箱會讓你染上疾病：申蘇爾會派你去治療。",
    ["Serge Hinott, the alchemist of Tarren Mill."] =
        "瑟爾格·希諾特，塔倫米爾的鍊金術師。",
    ["Stay by Serge while he prepares the cure."] =
        "在瑟爾格調製解藥時待在他身邊。",
    ["Canaga Earthcaller, in the Valley of Trials."] =
        "坎納甘·地鳴，在試煉谷。",
    ["The Felstalkers of the valley carry the hooves."] =
        "山谷裡的惡魔捕獵者身上帶著蹄子。",
    ["Up the hill path south of the valley: drink the Earth Sapta to see the Minor Manifestation of Earth."] =
        "沿山谷南邊的山路往上走：喝下大地靈契，就能看見小型大地之靈體。",
    ["Seer Ravenfeather, in Camp Narache."] =
        "先知鴉羽，在納拉其營地。",
    ["The Bristleback shamans east of the camp carry the salve."] =
        "營地東邊的刺背薩滿身上帶著藥膏。",
    ["On the hill south of the camp: drink the Earth Sapta to see the Minor Manifestation of Earth."] =
        "在營地南邊的山丘上：喝下大地靈契，就能看見小型大地之靈體。",
    ["Windshaper Boro, on Zephras Isle."] =
        "Windshaper Boro，在Zephras Isle。",
    ["Drink the Earth Sapta to see the Minor Manifestation of Earth, east of Boro."] =
        "喝下大地靈契，就能看見Boro東邊的小型大地之靈體。",
    ["Swart, the shaman trainer of Razor Hill."] =
        "斯瓦特，剃刀嶺的薩滿訓練師。",
    ["Narm Skychaser, the shaman trainer of Bloodhoof Village."] =
        "納姆·逐星，血蹄村的薩滿訓練師。",
    ["Kranal Fiss, at the Far Watch Post on the border of the Barrens."] =
        "卡納爾·菲斯，在貧瘠之地邊界的前沿哨所。",
    ["Telf Joolam, on top of a mountain in the west of Durotar."] =
        "泰爾夫·祖拉姆，在杜洛塔西部的一座山頂上。",
    ["The Razormane of the northern Barrens carry the Fire Tar; the Burning Blade cultists of the cave north of Razor Hill carry the pouches."] =
        "貧瘠之地北部的鋼鬃野豬人身上帶著火焰焦油；剃刀嶺北邊洞穴裡的火刃祭司身上帶著袋子。",
    ["Right by Telf: drink the Fire Sapta, then defeat the Minor Manifestation of Fire for its ember."] =
        "就在泰爾夫旁邊：喝下火焰靈契，然後擊敗小型火焰之靈體取得餘燼。",
    ["Sessaria Skystride, on Zephras Isle."] =
        "Sessaria Skystride，在Zephras Isle。",
    ["Olariaan Swiftburn, in the south of the isle."] =
        "Olariaan Swiftburn，在島嶼南部。",
    ["Skypriest Faladiel carries the heart."] =
        "Skypriest Faladiel身上帶著心臟。",
    ["Kuramaa, the spirit of mischief, carries the mask."] =
        "惡作劇之靈Kuramaa身上帶著面具。",
    ["Light the Brazier of Offering by Olariaan, then the Brazier of Eternal Flame by Sessaria."] =
        "點燃Olariaan旁邊的Brazier of Offering，再點燃Sessaria旁邊的Brazier of Eternal Flame。",
    ["Searn Firewarder, in the Valley of Wisdom of Orgrimmar."] =
        "希爾恩·火衛，在奧格瑪的智慧谷。",
    ["Xanis Flameweaver, on the Elder Rise of Thunder Bluff."] =
        "薩尼斯·織火，在雷霆崖的長者高地。",
    ["Islen Waterseer, by the coast east of the Barrens."] =
        "水之先知伊斯倫，在貧瘠之地東邊的海岸旁。",
    ["Brine, in the south of the Barrens."] =
        "布瑞恩，在貧瘠之地南部。",
    ["Fill the waterskin at the quilboar watering hole, right by Brine."] =
        "在布瑞恩旁邊的野豬人水坑裝滿水囊。",
    ["Fill it at the Spring Well of Tarren Mill, in Hillsbrad Foothills."] =
        "在希爾斯布萊德丘陵塔倫米爾的靈魂之井裝滿它。",
    ["Fill it at the ruins of the Stardust Fountain, in the south of Ashenvale."] =
        "在梣谷南部的星塵噴泉廢墟裝滿它。",
    ["By the Brazier of Everfount, in the lake of Silverpine Forest: use the brazier's water, then defeat the corrupt manifestation for its bracers."] =
        "在銀松森林湖中的永泉火盆旁：使用火盆的水，然後擊敗墮落的靈體取得護腕。",
    ["The Minor Manifestation of Water rises beside the brazier."] =
        "小型水之靈體會在火盆旁出現。",
    ["Prate Cloudseer, on a mesa in the middle of Thousand Needles."] =
        "普拉特·雲眼，在千針石林中央的一座石台上。",
    ["Rau Cliffrunner, at Freewind Post."] =
        "勞恩·峭壁行者，在亂風崗。",
    ["From level 33: Forever's elemental quests of Rau Cliffrunner, in Thousand Needles."] =
        "33級起：Forever在千針石林的勞恩·峭壁行者元素任務。",
    ["Beram Skychaser in Thunder Bluff, or Sagorne Creststrider in Orgrimmar."] =
        "雷霆崖的博拉姆·逐星，或奧格瑪的薩格尼。",
    ["From level 50: Bath'rah the Windwatcher's chain, which ends in the Temple of Atal'Hakkar."] =
        "50級起：『觀風者』巴斯拉的系列任務，最後在阿塔哈卡神廟結束。",
    ["One Elemental Earth, Fire, Water and Air: elementals drop them, or the auction house sells them."] =
        "元素之土、元素火焰、元素之水和元素空氣各一個：由元素生物掉落，或在拍賣場購買。",
    ["The spiders and the bears of the Western Plaguelands carry the eyes and the claws."] =
        "西瘟疫之地的蜘蛛和熊身上帶著眼睛和爪子。",
    ["Ruzan, in the Valley of Trials."] =
        "魯贊，在試煉谷。",
    ["Your trainer's first errand, in the Valley of Trials."] =
        "訓練師交給你的第一件差事，在試煉谷。",
    ["The Vile Familiars of the cave south of the valley carry the heads."] =
        "山谷南邊洞穴裡的邪靈劣魔身上帶著頭顱。",
    ["Zureetha Fargaze, beside Ruzan."] =
        "祖雷薩，在魯贊旁邊。",
    ["Venya Marthand, in Deathknell."] =
        "溫雅·瑪山德，在喪鐘鎮。",
    ["Your trainer's first errand, in Deathknell."] =
        "訓練師交給你的第一件差事，在喪鐘鎮。",
    ["The Rattlecage Skeletons east of Deathknell carry the skulls."] =
        "喪鐘鎮東邊的斷骨骷髏身上帶著頭骨。",
    ["Ophek, in Razor Hill, sends you to Orgrimmar."] =
        "奧菲克，在剃刀嶺，會派你前往奧格瑪。",
    ["Gan'rul Bloodeye, in the Cleft of Shadow of Orgrimmar."] =
        "甘盧爾·血眼，在奧格瑪的暗影裂口。",
    ["The Tablet of Verga lies in the Burning Blade stash at the back of Skull Rock, in the north of Durotar."] =
        "維爾加石板在杜洛塔北部骷髏石深處的火刃藏匿處。",
    ["Right by Gan'rul: use the glyphs on the summoning circle, then defeat the voidwalker."] =
        "就在甘盧爾旁邊：在召喚法陣上使用雕文，然後擊敗虛無行者。",
    ["Ageron Kargal, in Brill, sends you to the Undercity."] =
        "埃格隆·卡加爾，在布瑞爾，會派你前往幽暗城。",
    ["Carendin Halgar, in the Magic Quarter of the Undercity."] =
        "凱倫丁·哈加爾，在幽暗城的魔法區。",
    ["Egalin's Grimoire lies in Perrine's chest, in the house south of Brill."] =
        "埃加林的魔典在布瑞爾南邊房子裡的派瑞恩的箱子中。",
    ["Right by Carendin: use the runes on the summoning circle, then defeat the voidwalker."] =
        "就在凱倫丁旁邊：在召喚法陣上使用符文，然後擊敗虛無行者。",
    ["Cazul, in the Cleft of Shadow."] =
        "卡祖爾，在暗影裂口。",
    ["Zankaja, in the Valley of Spirits of Orgrimmar."] =
        "贊卡沙，在奧格瑪的精神谷。",
    ["Gazrog, at the Crossroads."] =
        "加茲羅格，在十字路口。",
    ["Ken'zigla, at the camp of Malaka'jin in the far south of Stonetalon Mountains."] =
        "肯茲格拉，在石爪山脈最南端的瑪拉卡金營地。",
    ["Grunt Logmar, by the road north of Camp Taurajo."] =
        "蠻兵勞格瑪，在陶拉祖營地北邊的路旁。",
    ["Grunt Dogran is held by the Kolkar in the Barrens: give him the draught."] =
        "蠻兵多格蘭被貧瘠之地的科卡爾抓住了：把傷藥交給他。",
    ["Right by Gan'rul: use Dogran's pendant on the summoning circle, then defeat the succubus."] =
        "就在甘盧爾旁邊：在召喚法陣上使用多格蘭的墜飾，然後擊敗魅魔。",
    ["Jorah Annison, in the Magic Quarter of the Undercity."] =
        "約拉·安尼森，在幽暗城的魔法區。",
    ["The Dragonmaw orcs of the Wetlands carry the rod: Alliance land, stay clear of the guards."] =
        "濕地的龍喉獸人身上帶著魔棒：聯盟領地，遠離守衛。",
    ["Zevrost, the warlock trainer of the Cleft of Shadow."] =
        "澤弗洛斯特，暗影裂口的術士訓練師。",
    ["Kurgul, the demon trainer of the Cleft of Shadow."] =
        "庫古爾，暗影裂口的惡魔訓練師。",
    ["Your warrior trainer, in Razor Hill or Bloodhoof Village, sends you to Uzzek."] =
        "你在剃刀嶺或血蹄村的戰士訓練師會派你去找猶塞克。",
    ["Uzzek, at the Far Watch Post on the border of the Barrens."] =
        "猶塞克，在貧瘠之地邊界的前沿哨所。",
    ["From level 10: the quest that teaches Defensive Stance."] =
        "10級起：學會防禦姿態的任務。",
    ["The Thunder Lizards of the north of Durotar carry the scales."] =
        "杜洛塔北部的雷霆蜥蜴身上帶著鱗片。",
    ["Thun'grim Firegaze, on a hill east of the Crossroads."] =
        "索恩格瑞姆·火眼，在十字路口東邊的一座山丘上。",
    ["The steel bars lie in the Razormane camp below the hill."] =
        "鋼錠在山丘下方的鋼鬃營地裡。",
    ["Austil de Mon, the warrior trainer of Brill."] =
        "奧斯蒂爾·德·蒙，布瑞爾的戰士訓練師。",
    ["Deathguard Dillinger, in Brill."] =
        "亡靈衛兵迪林格爾，在布瑞爾。",
    ["Open the mausoleum north of Brill: Ulag the Cleaver comes out."] =
        "打開布瑞爾北邊的陵墓：『斬擊者』奧拉格就會出來。",
    ["Coleman Farthing, in the inn of Brill."] =
        "庫勒曼·法席恩，在布瑞爾的旅店。",
    ["The four heirlooms lie in the crypt of the Agamand Mills, in the northwest of Tirisfal Glades."] =
        "四件傳家寶在提里斯法林地西北部阿加曼德磨坊的地穴裡。",
    -- Ding! - Dungeon quests (hand-written guides)
    ["The Hall of Thanes"] =
        "領主大廳",
    ["Afadra Dunwall and Thom Filch, in the west of Ironforge."] =
        "Afadra Dunwall和Thom Filch，在鐵爐堡西部。",
    ["Two quests of the hall: a leather belt or mail bracers, cloth gloves or an off-hand tome."] =
        "大廳的兩個任務：一條皮甲腰帶或一副鎖甲護腕，一雙布甲手套或一本副手書。",
    ["The Dark Iron spies of the east of Dun Morogh may drop a Dark Iron map: read it."] =
        "丹莫洛東部的黑鐵間諜可能掉落一張黑鐵地圖：閱讀它。",
    ["The Dark Iron map opens Old Ironforge Incursion: a gun, a wand or a two-handed mace."] =
        "黑鐵地圖會開啟「Old Ironforge Incursion」：一把槍、一根魔杖或一把雙手錘。",
    ["Earthseer Farsen, in the east of Dun Morogh."] =
        "Earthseer Farsen，在丹莫洛東部。",
    ["Enter the Hall of Thanes"] =
        "進入領主大廳",
    ["The hall lies beneath Old Ironforge, in the west of the city."] =
        "大廳位於舊鐵爐堡的下方，在城市西部。",
    ["Kill the enraged apparitions and the tormented souls of the hall, then put the spirit of Anvilmar to rest."] =
        "擊殺大廳裡的狂怒亡魂和痛苦的靈魂，然後讓安威瑪之靈安息。",
    ["The dwarven heirlooms lie around the hall."] =
        "矮人傳家寶散落在大廳各處。",
    ["The Treaty of Understanding lies in the hall: take it, then read it."] =
        "Treaty of Understanding在大廳裡：拿起它，然後閱讀它。",
    ["Durgen Dirgehammer carries the head the quest asks for."] =
        "Durgen Dirgehammer身上帶著任務要求的頭顱。",
    ["Afadra Dunwall and Thom Filch, in Ironforge."] =
        "Afadra Dunwall和Thom Filch，在鐵爐堡。",
    ["King Magni Bronzebeard, in the High Seat of Ironforge."] =
        "國王麥格尼·銅鬚，在鐵爐堡的王座廳。",
    ["King Magni Bronzebeard."] =
        "國王麥格尼·銅鬚。",
    ["Wailing Caverns"] =
        "哀嚎洞穴",
    ["Mebok Mizzyrix, in Ratchet."] =
        "麥伯克·米希瑞克斯，在棘齒城。",
    ["Raptor Horns opens Smart Drinks, a quest of the caverns."] =
        "「迅猛龍角」會開啟「智慧飲料」，這是洞穴裡的任務。",
    ["Crane Operator Bigglefuzz, on the docks of Ratchet."] =
        "起重機操作員比戈弗茲，在棘齒城的碼頭上。",
    ["The sunscale raptors roam the plains between the Crossroads and Ratchet."] =
        "赤鱗迅猛龍在十字路口和棘齒城之間的平原上遊蕩。",
    ["Nalpak and Ebru stand in a cave on the caverns' hill: climb the hill from the east, follow the trail and drop onto the rock ledge."] =
        "納爾派克和厄布魯站在洞穴所在山丘上的一個山洞裡：從東邊爬上山丘，沿著小路走，再跳到岩架上。",
    ["Two quests of the deviate creatures; their rewards include a bag, leather leggings, mail gauntlets or a wand."] =
        "兩個關於變異生物的任務；獎勵包括一個背包、皮甲腿甲、鎖甲護手或一根魔杖。",
    ["Mad Magglish, a goblin who stays hidden, walks the caves around the dungeon's door."] =
        "瘋狂的馬格利什是一個隱身的哥布林，在地城入口周圍的洞穴裡走動。",
    ["Enter Wailing Caverns"] =
        "進入哀嚎洞穴",
    ["The mouth of the caverns opens on the hill above the Lushwater Oasis."] =
        "洞穴的入口位於甜水綠洲上方的山丘上。",
    ["Every deviate creature drops hides: raptors, lashers and snakes, from the first halls on."] =
        "每種變異生物都會掉落皮革：迅猛龍、鞭笞者和蛇，從最初的大廳開始就有。",
    ["The ectoplasms, living oozes of the caverns, drop the essence."] =
        "軟漿怪是洞穴裡活生生的軟泥，會掉落香精。",
    ["Ravagers and vipers fill the first halls; shamblers and dreadfangs come further in."] =
        "最初的大廳裡滿是劫毀者和飛蛇；蹣跚者和尖牙風蛇則在更深處。",
    ["Mutanus the Devourer may drop the Glowing Shard: he appears after the Disciple of Naralex's ritual, which starts once the four Fanglords are dead."] =
        "『吞噬者』穆坦努斯可能掉落發光的碎片：他會在納拉雷克斯的信徒舉行儀式後出現，而儀式要等四位尖牙領主都死後才會開始。",
    ["Nalpak and Ebru, in their cave on the caverns' hill."] =
        "納爾派克和厄布魯，在洞穴所在山丘上他們的山洞裡。",
    ["Mebok Mizzyrix and Crane Operator Bigglefuzz, in Ratchet."] =
        "麥伯克·米希瑞克斯和起重機操作員比戈弗茲，在棘齒城。",
    ["Sputtervalve, in Ratchet, knows what the shard is."] =
        "棘齒城的斯布特瓦夫知道這塊碎片是什麼。",
    ["Falla Sagewind, on top of the caverns' hill."] =
        "菲拉·古風，在洞穴所在山丘的頂上。",
    ["Mathrengyl Bearwalker, in the Cenarion Enclave of Darnassus."] =
        "瑪斯雷·馭熊者，在達納蘇斯的塞納里奧區。",
    ["The Deadmines"] =
        "死亡礦坑",
    ["Wilder Thistlenettle, in the Dwarven District of Stormwind."] =
        "維爾德·薊草，在暴風城的矮人區。",
    ["Two quests of the mine under Moonbrook; their rewards include a two-handed axe and cloth, leather or mail armor."] =
        "月溪鎮地下礦坑的兩個任務；獎勵包括一把雙手斧，以及布甲、皮甲或鎖甲護甲。",
    ["Shoni the Shilent, in the Dwarven District."] =
        "沉默的舒尼，在矮人區。",
    ["Reward: armor of leather or mail, or a wand."] =
        "獎勵：皮甲或鎖甲護甲，或一根魔杖。",
    ["Gryan Stoutmantle, in the tower of Sentinel Hill, in Westfall."] =
        "格里安·斯托曼，在西部荒野哨兵嶺的塔樓裡。",
    ["A long chain of six quests between Westfall, Redridge and Stormwind: it leads to VanCleef, whose head brings mail leggings, a leather tunic or a staff."] =
        "在西部荒野、赤脊山和暴風城之間的六個任務組成的長系列任務：最後要對付范克里夫，他的頭顱可換得鎖甲腿甲、一件皮甲外衣或一把法杖。",
    ["Alba Fairmoon, south-west of Sentinel Hill."] =
        "Alba Fairmoon，在哨兵嶺西南方。",
    ["A quest of the mine under Moonbrook, ended at the Deadmines' exit."] =
        "月溪鎮地下礦坑的任務，在死亡礦坑的出口交付。",
    ["Wiley the Black, in the inn of Lakeshire, in Redridge."] =
        "黑衣威利，在赤脊山湖畔鎮的旅店。",
    ["Gryan Stoutmantle, at Sentinel Hill."] =
        "格里安·斯托曼，在哨兵嶺。",
    ["Master Mathias Shaw, in the SI:7 house of Old Town, in Stormwind."] =
        "馬迪亞斯·肖爾，在暴風城舊城區的軍情七處。",
    ["The Defias Messenger walks the road to Moonbrook; he carries the message."] =
        "迪菲亞信差走在通往月溪鎮的路上；他身上帶著那封信。",
    ["Follow the Defias Traitor to Moonbrook; Defias attack on the way."] =
        "跟著迪菲亞叛徒前往月溪鎮；途中迪菲亞會發動攻擊。",
    ["Scout Riell, at the top of the Sentinel Hill tower."] =
        "斥候瑞爾，在哨兵嶺塔樓的頂端。",
    ["Reward: a weapon of your choice."] =
        "獎勵：自選一把武器。",
    ["Go down into the mine under Moonbrook"] =
        "下到月溪鎮地下的礦坑",
    ["The mine opens inside a house in the middle of Moonbrook."] =
        "礦坑入口在月溪鎮中央的一棟房子裡。",
    ["Foreman Thistlenettle and the undead miners roam the mine's tunnels, before the dungeon's door."] =
        "工頭希斯耐特和不死礦工在礦坑的坑道中遊蕩，位於地城入口之前。",
    ["Plant the explosives by the forge hidden in the Deadmines."] =
        "在死亡礦坑裡隱藏的熔爐旁安放炸藥。",
    ["Every Defias of the dungeon may drop a bandana."] =
        "地城裡的每個迪菲亞都可能掉落面罩。",
    ["Sneed's Shredder, the second boss, in the goblins' lumber cave, drops the Gnoam Sprecklesprocket."] =
        "第二個首領斯尼德的伐木機在哥布林的伐木洞穴裡，會掉落小型高能發動機。",
    ["Edwin VanCleef, the last boss, waits on the deck of the Defias ship at the end of the cave."] =
        "最後一個首領艾德溫·范克里夫在洞穴盡頭的迪菲亞船隻甲板上等著。",
    ["VanCleef drops a letter: read it to take its quest."] =
        "范克里夫會掉落一封信：閱讀它即可接取任務。",
    ["Alba Fairmoon waits at the Deadmines' exit, on the coast south-west of Moonbrook."] =
        "Alba Fairmoon在死亡礦坑的出口等候，位於月溪鎮西南方的海岸。",
    ["Use her detonator, then tell her."] =
        "使用她的引爆器，然後告訴她。",
    ["Gryan Stoutmantle and Scout Riell, in the Sentinel Hill tower."] =
        "格里安·斯托曼和斥候瑞爾，在哨兵嶺的塔樓裡。",
    ["Baros Alexston, in the City Hall of the Cathedral Square."] =
        "巴洛斯·艾力克斯頓，在教堂廣場的城市大廳。",
    ["Bazil Thredd leads to the Stockade's riots."] =
        "「巴吉爾·特雷德」會引向監獄的暴動。",
    ["Warden Thelwater, at the door of the Stockade, in Stormwind."] =
        "典獄官塞爾沃特，在暴風城監獄的門口。",
    ["Ruins of Lordaeron"] =
        "羅德隆廢墟",
    ["Enter the Ruins of Lordaeron"] =
        "進入羅德隆廢墟",
    ["The ruins rise above Undercity, in Tirisfal Glades: Horde land, keep your guard up."] =
        "廢墟位於提里斯法林地的幽暗城上方：部落領地，保持警戒。",
    ["The undead of the ruins may drop a bloodied insignia: read it."] =
        "廢墟裡的不死生物可能掉落一枚染血的徽記：閱讀它。",
    ["Reward: leather leggings or mail armor."] =
        "獎勵：皮甲腿甲或鎖甲護甲。",
    ["Ten insignias, from the undead of the ruins."] =
        "十枚徽記，從廢墟裡的不死生物身上取得。",
    ["The Crest of Lordaeron lies in the ruins: take it, then read it."] =
        "Crest of Lordaeron在廢墟裡：拿起它，然後閱讀它。",
    ["Reward: a small sack of gems."] =
        "獎勵：一小袋寶石。",
    ["Edward Heartweaver's last letter lies in the ruins: read it."] =
        "Edward Heartweaver的最後一封信在廢墟裡：閱讀它。",
    ["General Marcus Jonathan, at the gate of Stormwind."] =
        "馬庫斯·喬納森將軍，在暴風城大門。",
    ["Lady Dena Kennedy, in Stormwind."] =
        "戴娜·甘迺迪女士，在暴風城。",
    ["Orphan Matron Nightingale, at the orphanage of Stormwind."] =
        "孤兒監護員南丁格爾，在暴風城的孤兒院。",
    ["Blackfathom Deeps"] =
        "黑暗深淵",
    ["Argos Nightwhisper, in Stormwind."] =
        "阿茍斯·夜語，在暴風城。",
    ["Optional: a lead to Auberdine, worth about 1,450 XP once there."] =
        "可選：一條前往奧伯丁的線索，抵達後約可獲得1,450經驗值。",
    ["Gerrig Bonegrip, in the Forlorn Cavern of Ironforge."] =
        "葛利·硬骨，在鐵爐堡的荒棄的洞穴。",
    ["Reward: a ring."] =
        "獎勵：一枚戒指。",
    ["Gershala Nightwhisper, in Auberdine, in Darkshore."] =
        "戈沙拉·夜語，在黑海岸的奧伯丁。",
    ["Gershala Nightwhisper, in Auberdine."] =
        "戈沙拉·夜語，在奧伯丁。",
    ["Reward: cloth, leather or mail armor."] =
        "獎勵：布甲、皮甲或鎖甲護甲。",
    ["Argent Guard Manados and Dawnwatcher Shaedlass, in Darnassus."] =
        "銀色黎明守衛瑪納杜斯和哨兵山德拉斯，在達納蘇斯。",
    ["Two quests of the Argent Dawn: the second leads to Twilight Lord Kelris and a wand, a shield or leather armor."] =
        "銀色黎明的兩個任務：第二個任務會帶你去找暮光領主克爾里斯，並獲得一根魔杖、一面盾牌或皮甲護甲。",
    ["Enter Blackfathom Deeps"] =
        "進入黑暗深淵",
    ["The deeps open in ruins half under water, on the coast of Ashenvale's Zoram Strand."] =
        "深淵的入口在半淹於水中的廢墟裡，位於梣谷佐拉姆海岸的岸邊。",
    ["The Blackfathom and Fallenroot creatures carry the brain stems, from the cave before the dungeon's door on."] =
        "黑暗深淵和腐根的生物身上帶著腦幹，從地城入口前的洞穴開始就有。",
    ["The manuscript lies in a chest under the water, by Ghamoo-ra, the first boss, in the Pool of Ask'ar."] =
        "手稿在水下的一個箱子裡，就在第一個首領加摩拉旁邊，位於Pool of Ask'ar。",
    ["Argent Guard Thaelrid waits in an underwater cave south-west of the Pool of Ask'ar."] =
        "銀色黎明守衛塞爾瑞德在Pool of Ask'ar西南方的一個水下洞穴裡等候。",
    ["Every Twilight cultist of the deeps may drop a pendant."] =
        "深淵裡的每個暮光教徒都可能掉落墜飾。",
    ["Twilight Lord Kelris, the fourth boss, holds the Moonshrine Sanctum."] =
        "第四個首領暮光領主克爾里斯佔據著Moonshrine Sanctum。",
    ["Argent Guard Manados, in Darnassus."] =
        "銀色黎明守衛瑪納杜斯，在達納蘇斯。",
    ["Dawnwatcher Selgorm, beside him in Darnassus."] =
        "哨兵塞爾高姆，在達納蘇斯，就在他旁邊。",
    ["The Stockade"] =
        "監獄",
    ["Motley Garmason, at Dun Modr, in the north of the Wetlands."] =
        "莫特雷·加瑪森，在濕地北部的丹莫德。",
    ["Far north in the Wetlands: it opens The Fury Runs Deep, whose reward is a two-handed mace or a leather belt."] =
        "在濕地的最北邊：它會開啟「卡姆·深怒」，獎勵是一把雙手錘或一條皮甲腰帶。",
    ["The Dark Iron dwarves camp around Dun Modr."] =
        "黑鐵矮人在丹莫德周圍紮營。",
    ["Guard Berton, in Lakeshire, in Redridge."] =
        "衛兵伯爾頓，在赤脊山的湖畔鎮。",
    ["Reward: a staff, a sword or a two-handed mace."] =
        "獎勵：一把法杖、一把劍或一把雙手錘。",
    ["Councilman Millstipe, in the town hall of Darkshire, in Duskwood."] =
        "議員米爾斯泰普，在暮色森林夜色鎮的鎮公所。",
    ["Nikova Raskol, in Old Town, in Stormwind."] =
        "尼科瓦·拉斯克，在暴風城的舊城區。",
    ["Warden Thelwater, at the door of the Stockade."] =
        "典獄官塞爾沃特，在監獄門口。",
    ["Warden Thelwater asks for Bazil Thredd's head."] =
        "典獄官塞爾沃特要求巴基爾·斯瑞德的頭顱。",
    ["Enter the Stockade"] =
        "進入監獄",
    ["The prison's door is by Warden Thelwater, in Stormwind."] =
        "監獄的大門就在暴風城的典獄官塞爾沃特旁邊。",
    ["Targorr the Dread, the first boss, sits in a cell near the start."] =
        "第一個首領可怕的塔高爾坐在入口附近的一間牢房裡。",
    ["Kam Deepfury: go north, then east; he waits in the second small cell on the left."] =
        "卡姆·深怒：先往北，再往東；他在左手邊第二間小牢房裡。",
    ["Bazil Thredd waits at the end of the east corridor."] =
        "巴基爾·斯瑞德在東側走廊的盡頭。",
    ["Dextren Ward waits at the end of the west corridor."] =
        "迪克斯特·瓦德在西側走廊的盡頭。",
    ["The prisoners, convicts and insurgents fill every cell; the Defias among them drop the bandanas."] =
        "每間牢房都擠滿了囚犯、罪犯和叛軍；其中的迪菲亞會掉落面罩。",
    ["Optional: nine more quests in Stormwind; the last brings a ring and about 3,750 XP."] =
        "可選：在暴風城還有九個任務；最後一個可獲得一枚戒指和約3,750經驗值。",
    ["Baros Alexston, in the City Hall."] =
        "巴洛斯·艾力克斯頓，在城市大廳。",
    ["Master Mathias Shaw, in the SI:7 house of Old Town."] =
        "馬迪亞斯·肖爾，在舊城區的軍情七處。",
    ["Elling Trias, in the cheese shop of the Trade District."] =
        "伊林·提亞斯，在貿易區的乳酪店。",
    ["Tyrion, near Stormwind Keep."] =
        "泰里恩，在暴風要塞附近。",
    ["Three silk cloth, and two of Clara's fresh apples, from a basket north-west of Goldshire, in Elwynn Forest."] =
        "三塊絲綢，以及兩顆克拉拉的新鮮蘋果，蘋果在艾爾文森林閃金鎮西北方的一個籃子裡。",
    ["Wait in the garden by Stormwind Keep until Lord Gregor Lescovar and Marzon the Silent Blade have talked, then defeat both."] =
        "在暴風要塞旁的花園等候，直到葛瑞格·萊斯科瓦領主和『沉默之刃』馬爾松談完話，然後擊敗他們兩人。",
    ["Elling Trias, in the cheese shop."] =
        "伊林·提亞斯，在乳酪店。",
    ["Master Mathias Shaw, in the SI:7 house."] =
        "馬迪亞斯·肖爾，在軍情七處。",
    ["Lady Katrana Prestor, beside the king in Stormwind Keep."] =
        "卡特拉娜·普瑞斯托女士，在暴風要塞的國王身旁。",
    ["Nikova Raskol, in Old Town."] =
        "尼科瓦·拉斯克，在舊城區。",
    ["Guard Berton, in Lakeshire."] =
        "衛兵伯爾頓，在湖畔鎮。",
    ["Councilman Millstipe, in Darkshire."] =
        "議員米爾斯泰普，在夜色鎮。",
    ["Motley Garmason, at Dun Modr."] =
        "莫特雷·加瑪森，在丹莫德。",
    ["Excavation Site: Wetlands"] =
        "挖掘場：濕地",
    ["James Halloran, the tanner of Menethil Harbor, in the Wetlands."] =
        "詹姆士·哈洛倫，濕地米奈希爾港的製皮匠。",
    ["Caitlin Grassman, in Menethil Harbor."] =
        "凱特林·格拉斯曼，在米奈希爾港。",
    ["Optional: the guide does not know yet who ends this search; its follow-up brings a satchel of potions."] =
        "可選：指南還不知道這個搜尋任務要向誰交付；後續任務可獲得一袋藥水。",
    ["Rethiel the Greenwarden, in the middle of the Wetlands."] =
        "『綠色守衛者』雷希耶爾，在濕地中部。",
    ["Reward: an axe, and about 3,200 XP."] =
        "獎勵：一把斧頭，以及約3,200經驗值。",
    ["Dorin Songblade, the armorer of Lakeshire, in Redridge."] =
        "多林·桑布雷德，赤脊山湖畔鎮的護甲商。",
    ["Optional: the guide does not know yet who ends this search."] =
        "可選：指南還不知道這個搜尋任務要向誰交付。",
    ["Enter the Excavation Site"] =
        "進入挖掘場",
    ["The excavation site opens by the dig in the middle of the Wetlands."] =
        "挖掘場的入口在濕地中部的挖掘地旁。",
    ["Four thicket raptor hides, from the raptors of the site."] =
        "四張灌木迅猛龍皮，從挖掘場的迅猛龍身上取得。",
    ["A Highland Horror carries the root core."] =
        "一隻Highland Horror身上帶著根核。",
    ["Ardin Grassman, somewhere in the site."] =
        "Ardin Grassman，在挖掘場的某處。",
    ["Daewyn, somewhere in the site."] =
        "Daewyn，在挖掘場的某處。",
    ["The relic guardians may drop a Titan relic: read it."] =
        "聖物守護者可能掉落一件泰坦聖物：閱讀它。",
    ["The Titan relic leads to Ironforge's explorers: a staff or a two-handed mace."] =
        "泰坦聖物會引你去找鐵爐堡的探險家：一把法杖或一把雙手錘。",
    ["Prospector Whelgar, at his excavation camp in the Wetlands."] =
        "勘察員維爾加，在濕地他的挖掘營地。",
    ["Rethiel the Greenwarden."] =
        "『綠色守衛者』雷希耶爾。",
    ["James Halloran, in Menethil Harbor."] =
        "詹姆士·哈洛倫，在米奈希爾港。",
    ["Dorin Songblade, in Lakeshire."] =
        "多林·桑布雷德，在湖畔鎮。",
    ["High Explorer Magellas, in the Hall of Explorers of Ironforge."] =
        "資深探險家麥格拉斯，在鐵爐堡的探險者大廳。",
    ["Gnomeregan"] =
        "諾姆瑞根",
    ["Shoni the Shilent, in the Dwarven District of Stormwind."] =
        "沉默的舒尼，在暴風城的矮人區。",
    ["Reward: cloth or leather gloves, or an axe."] =
        "獎勵：布甲或皮甲手套，或一把斧頭。",
    ["Brother Sarno, in the Cathedral of Light."] =
        "薩爾努修士，在聖光大教堂。",
    ["Optional: a lead to Tinkmaster Overspark in Ironforge."] =
        "可選：一條前往鐵爐堡找技工大師歐沃斯巴克的線索。",
    ["Tinkmaster Overspark, in Tinker Town, in Ironforge."] =
        "技工大師歐沃斯巴克，在鐵爐堡的地精區。",
    ["Tinkmaster Overspark, in Tinker Town."] =
        "技工大師歐沃斯巴克，在地精區。",
    ["Master Mechanic Castpipe, Klockmort Spannerspan and High Tinker Mekkatorque, in Tinker Town."] =
        "大技師卡斯派普、科羅莫特·鋼尺和高等技工梅卡托克，在地精區。",
    ["Tinker Town's quests: Data Rescue brings a two-handed mace or a cloak, The Grand Betrayal cloth, leather or mail armor."] =
        "地精區的任務：「搶救數據」可獲得一把雙手錘或一件披風，「大叛徒」可獲得布甲、皮甲或鎖甲護甲。",
    ["Gnoarn, in Tinker Town."] =
        "諾恩，在地精區。",
    ["Ozzie Togglevolt, in Kharanos, in Dun Morogh."] =
        "奧齊·電環，在丹莫洛的卡拉諾斯。",
    ["Use the empty phial on the irradiated troggs that roam the gates of Gnomeregan."] =
        "對在諾姆瑞根大門附近遊蕩的輻射穴居人使用空瓶。",
    ["Back to Ozzie Togglevolt, in Kharanos."] =
        "回到卡拉諾斯找奧齊·電環。",
    ["Enter Gnomeregan"] =
        "進入諾姆瑞根",
    ["The gates of Gnomeregan stand in the west of Dun Morogh."] =
        "諾姆瑞根的大門位於丹莫洛西部。",
    ["Techbot, the first boss, waits just inside: he drops the memory core."] =
        "第一個首領尖端機器人就在入口內側：他會掉落記憶體核心。",
    ["The tall, square machines of the city hold the artificials; every mechanical creature may drop the guts."] =
        "城裡高大的方形機器裡有基礎模組；每個機械生物都可能掉落機械內膽。",
    ["Use the heavy phial on a living irradiated slime, in the lower Hall of Gears; the fallout does not last long."] =
        "在齒輪大廳下層，對一隻活著的輻射泥漿怪使用沉重的瓶子；輻射塵不會維持太久。",
    ["The addled leper gnomes drop the white card; the four Matrix Punchographs, from A to D, turn it yellow, blue, red, then prismatic: A on the way in, B at the bottom of the Dormitory, C on the Launch Bay's platform (Electrocutioner 6000's key opens it), D in the lower Engineering Labs."] =
        "混亂的麻瘋地精會掉落白色卡片；四台矩陣式打孔電腦從A到D，會依序把它變成黃色、藍色、紅色，最後變成彩色：A在進來的路上，B在宿舍底層，C在發射台的平台上（用電刑器6000型的鑰匙打開），D在工程實驗室的下層。",
    ["Kernobee, a gnome held inside the city."] =
        "克努比，一個被關在城裡的地精。",
    ["Optional: an escort, turned in at Booty Bay, far away; it rewards bracers or shoulders."] =
        "可選：一個護送任務，要到遠方的藏寶海灣交付；獎勵是護腕或護肩。",
    ["Lead Kernobee to the Clean Zone, by the dungeon's back door."] =
        "帶著克努比前往地城後門旁的清潔區。",
    ["The Dark Iron agents may drop a grimy ring: use it."] =
        "黑鐵密探可能掉落一枚髒兮兮的戒指：使用它。",
    ["Put it in the Sparklematic 5200, a cleaning machine of the city."] =
        "把它放進超級清潔器5200型，這是城裡的一台清潔機器。",
    ["Mekgineer Thermaplugg, the last boss, waits in the Tinkers' Court."] =
        "最後一個首領麥克尼爾·瑟瑪普拉格在技工議會等著。",
    ["Ozzie Togglevolt, in Kharanos."] =
        "奧齊·電環，在卡拉諾斯。",
    ["Tinker Town, in Ironforge."] =
        "鐵爐堡的地精區。",
    ["Talvash del Kissel, in the Mystic Ward of Ironforge."] =
        "塔瓦斯德·基瑟爾，在鐵爐堡的秘法區。",
    ["A gold ring, for a silver bar, a moss agate and 30 silver."] =
        "一枚金戒指，需要一塊銀錠、一顆綠瑪瑙和30銀幣。",
    ["A silver bar and a moss agate: from mining, or the auction house."] =
        "一塊銀錠和一顆綠瑪瑙：可透過採礦取得，或在拍賣場購買。",
    ["Scooty, the goblin engineer of Booty Bay, in Stranglethorn Vale."] =
        "斯庫提，荊棘谷藏寶海灣的哥布林工程師。",
    ["Razorfen Kraul"] =
        "剃刀沼澤",
    ["Veyric Thunderhame, in the north-east of Arathi Highlands."] =
        "Veyric Thunderhame，在阿拉希高地東北部。",
    ["Shamans: Charlga Razorflank carries the note this quest asks for."] =
        "薩滿：卡爾加·刺肋身上帶著這個任務要求的便箋。",
    ["Reward: a small container of gems."] =
        "獎勵：一個裝著寶石的小容器。",
    ["Take the crate with holes and the owner's manual beside Mebok, and read the manual."] =
        "拿起麥伯克旁邊的開孔的箱子和訓練手冊，然後閱讀手冊。",
    ["The journal lies by a body in the north-west of Thousand Needles, below the Great Lift: read it."] =
        "日記在千針石林西北部升降梯下方的一具屍體旁：閱讀它。",
    ["Henrig Lonebrow's journal opens The Crone of the Kraul: cloth shoulders, mail belt or a shield."] =
        "亨里格·獨眉的日記會開啟「卡爾加·刺肋」：布甲護肩、鎖甲腰帶或一面盾牌。",
    ["Falfindel Waywarder, at Thalanaar, on the eastern edge of Feralas."] =
        "法芬德爾，在菲拉斯東部邊緣的薩蘭納爾。",
    ["Enter Razorfen Kraul"] =
        "進入剃刀沼澤",
    ["The kraul's thorny mound rises in the far south of the Barrens."] =
        "剃刀沼澤長滿荊棘的土丘聳立在貧瘠之地的最南端。",
    ["Past Overlord Ramtusk, open the crate to call the gopher and use the stick on it: it digs up the tubers."] =
        "越過拉姆塔斯主宰後，打開箱子叫出地鼠，再對牠使用指揮棒：牠會挖出藍葉薯。",
    ["Charlga Razorflank, the last boss, holds the top of the kraul."] =
        "最後一個首領卡爾加·刺肋佔據著剃刀沼澤的頂端。",
    ["Heralath Fallowbrook lies in the tent on the left, below Charlga Razorflank's platform."] =
        "赫爾拉斯·靜水躺在卡爾加·刺肋平台下方左側的帳篷裡。",
    ["Reward: boots of leather or mail, or a cloak."] =
        "獎勵：皮甲或鎖甲靴子，或一件披風。",
    ["Willix the Importer waits beside Heralath's tent."] =
        "進口商威利克斯在赫爾拉斯的帳篷旁等候。",
    ["Reward: a ring of your choice."] =
        "獎勵：自選一枚戒指。",
    ["Lead Willix back to the entrance; quilboar attack on the way."] =
        "帶威利克斯回到入口；途中野豬人會發動攻擊。",
    ["Every Razorfen quilboar may drop Treshala's pendant."] =
        "每個剃刀沼澤野豬人都可能掉落塔莎拉的墜飾。",
    ["Falfindel Waywarder, at Thalanaar."] =
        "法芬德爾，在薩蘭納爾。",
    ["Treshala Fallowbrook, in Darnassus."] =
        "塔莎拉·靜水，在達納蘇斯。",
    ["Veyric Thunderhame, in Arathi Highlands."] =
        "Veyric Thunderhame，在阿拉希高地。",
    ["City of Dalaran"] =
        "達拉然城",
    ["Shylamiir, the herbalism trainer of Stormwind, and High Sorcerer Andromath, in the Mage Quarter."] =
        "暴風城的草藥學訓練師莎拉米爾，以及高階巫士安多瑪斯，在法師區。",
    ["Two quests of the city from Stormwind: the blossom brings a cloak or a mail belt."] =
        "從暴風城接取的兩個城內任務：花朵任務可獲得一件披風或一條鎖甲腰帶。",
    ["Emissary Jacques, in Hillsbrad Foothills."] =
        "Emissary Jacques，在希爾斯布萊德丘陵。",
    ["The Image of Archmage Modera, by the walls of Dalaran, at the eastern edge of Silverpine Forest."] =
        "Image of Archmage Modera，在銀松森林東部邊緣的達拉然城牆旁。",
    ["The Image of Archmage Modera."] =
        "Image of Archmage Modera。",
    ["Archmage Modera's quests: a pendant or an off-hand rod, and an introduction to the Kirin Tor."] =
        "Archmage Modera的任務：一個墜飾或一根副手魔棒，以及向祈倫托引薦你。",
    ["Enter the City of Dalaran"] =
        "進入達拉然城",
    ["The city lies under its dome, in the west of the Alterac Mountains."] =
        "這座城市位於奧特蘭克山脈西部，籠罩在它的穹頂之下。",
    ["Eight seeking remnants, eight saturated remnants and eight mana echoes, inside the city."] =
        "八個搜尋殘影、八個飽和殘影和八個法力回聲，在城內。",
    ["The arcane mote, inside the city."] =
        "奧術微粒，在城內。",
    ["A fel infused blossom, inside the city."] =
        "一朵注入邪能的花朵，在城內。",
    ["The mana elemental, inside the city."] =
        "法力元素，在城內。",
    ["Archmage Celindra, in the City of Dalaran."] =
        "Archmage Celindra，在達拉然城。",
    ["The Image of Archmage Modera, by the walls of Dalaran."] =
        "Image of Archmage Modera，在達拉然城牆旁。",
    ["Shylamiir and High Sorcerer Andromath, in Stormwind."] =
        "莎拉米爾和高階巫士安多瑪斯，在暴風城。",
    ["Scarlet Monastery"] =
        "血色修道院",
    ["Brother Crowley, in the Cathedral of Light of Stormwind."] =
        "克羅雷修士，在暴風城的聖光大教堂。",
    ["Optional: a lead to Brother Anton in Desolace."] =
        "可選：一條前往淒涼之地找安東修士的線索。",
    ["Librarian Mae Paledust, in the Hall of Explorers of Ironforge."] =
        "圖書館員麥伊·蒼塵，在鐵爐堡的探險者大廳。",
    ["Reward: a necklace, and about 3,550 XP."] =
        "獎勵：一條項鍊，以及約3,550經驗值。",
    ["Brother Anton, at Nijel's Point, in Desolace."] =
        "安東修士，在淒涼之地的尼耶爾前哨站。",
    ["Brother Anton, at Nijel's Point."] =
        "安東修士，在尼耶爾前哨站。",
    ["Down the Scarlet Path, in Desolace then Southshore, opens In the Name of the Light: a weapon or an off-hand orb, and about 4,700 XP."] =
        "「血色之路」先在淒涼之地、再到南海鎮進行，會開啟「以聖光之名」：一把武器或一顆副手寶珠，以及約4,700經驗值。",
    ["The undead ravagers roam the south-east of Desolace."] =
        "亡靈劫毀者在淒涼之地東南部遊蕩。",
    ["Raleigh the Devout, in the inn of Southshore, in Hillsbrad Foothills."] =
        "虔誠的萊雷恩，在希爾斯布萊德丘陵南海鎮的旅店。",
    ["Magus Olvek, in the west of the Alterac Mountains."] =
        "Magus Olvek，在奧特蘭克山脈西部。",
    ["About 3,200 XP."] =
        "約3,200經驗值。",
    ["Enter the Scarlet Monastery"] =
        "進入血色修道院",
    ["The monastery stands in the far east of Tirisfal Glades; its four wings, Graveyard, Library, Armory and Cathedral, each have their own door."] =
        "修道院位於提里斯法林地的最東邊；它的四個區域：墓地、圖書館、武器庫和大教堂，各有各的入口。",
    ["Magus Olvek's book lies somewhere in the monastery."] =
        "Magus Olvek的書在修道院裡的某處。",
    ["Library: the book lies on the floor under a window, on the left of the room after the Gallery of Treasures."] =
        "圖書館區：那本書在珍寶迴廊之後那個房間左側的窗戶下方地板上。",
    ["Houndmaster Loksey, the Library's first boss; Herod, the Armory's only boss; Scarlet Commander Mograine and High Inquisitor Whitemane, at the end of the Cathedral. Arcanist Doan's chest, at the end of the Library, holds the Scarlet Key that opens the Armory and the Cathedral."] =
        "馴犬者洛克希是圖書館區的第一個首領；赫洛德是武器庫區唯一的首領；血色十字軍指揮官莫格萊尼和高等審判官懷特邁恩在大教堂區的盡頭。秘法師杜安的箱子位於圖書館區的盡頭，裡面有能打開武器庫和大教堂的血色十字軍鑰匙。",
    ["Magus Olvek, in the Alterac Mountains."] =
        "Magus Olvek，在奧特蘭克山脈。",
    ["Raleigh the Devout, in Southshore."] =
        "虔誠的萊雷恩，在南海鎮。",
    ["Librarian Mae Paledust, in Ironforge."] =
        "圖書館員麥伊·蒼塵，在鐵爐堡。",
    ["Razorfen Downs"] =
        "剃刀高地",
    ["Archbishop Benedictus, in the Cathedral of Light of Stormwind."] =
        "大主教本尼迪塔斯，在暴風城的聖光大教堂。",
    ["Reward: a sword or a talisman, and about 4,300 XP."] =
        "獎勵：一把劍或一個護符，以及約4,300經驗值。",
    ["Myriam Moonsinger, outside Razorfen Downs, in the far south of the Barrens."] =
        "麥雷姆·月歌，在貧瘠之地最南端的剃刀高地外面。",
    ["About 3,450 XP, without entering the downs."] =
        "約3,450經驗值，不必進入剃刀高地。",
    ["The Razorfen battleguards, thornweavers and Death's Head cultists guard the slopes before the downs."] =
        "剃刀沼澤護衛者、織棘者和亡首教徒守著剃刀高地前的山坡。",
    ["Myriam Moonsinger."] =
        "麥雷姆·月歌。",
    ["Enter Razorfen Downs"] =
        "進入剃刀高地",
    ["The downs' entrance is by Myriam Moonsinger, at the foot of the great thorn mound."] =
        "剃刀高地的入口在麥雷姆·月歌旁邊，位於巨大荊棘土丘的山腳下。",
    ["Belnistrasz waits in the Holding Pen, on the north side of the Murder Pens; taking his second quest starts his ritual at once."] =
        "貝尼斯特拉茲在屠殺圍欄北側的拘留圍欄裡等候；接下他的第二個任務後，他的儀式會立刻開始。",
    ["Belnistrasz's ritual: a ring, and about 4,250 XP."] =
        "貝尼斯特拉茲的儀式：一枚戒指，以及約4,250經驗值。",
    ["Defend Belnistrasz while he works: waves of quilboar and undead come. Then use his brazier, in the same room."] =
        "在貝尼斯特拉茲施法時保護他：一波波的野豬人和不死生物會來襲。然後使用同一個房間裡他的火盆。",
    ["Amnennar the Coldbringer, the last boss, waits at the top of the Spiral of Thorns."] =
        "最後一個首領『寒冰使者』亞門納爾在荊棘螺旋的頂端等著。",
    ["Archbishop Benedictus, in Stormwind."] =
        "大主教本尼迪塔斯，在暴風城。",
    ["Uldaman"] =
        "奧達曼",
    ["Prospector Stormpike, in the Hall of Explorers of Ironforge."] =
        "勘察員雷矛，在鐵爐堡的探險者大廳。",
    ["The Lost Dwarves leads to the Hidden Chamber: a two-handed axe or a lodestar, and about 3,900 XP."] =
        "「失蹤的矮人」會引向「密室」：一把雙手斧或一枚探險者聯盟徽章，以及約3,900經驗值。",
    ["Krom Stoutarm, in the Hall of Explorers."] =
        "克羅姆·粗臂，在探險者大廳。",
    ["About 3,600 XP for a chest at Uldaman's gates."] =
        "找到奧達曼大門處的一個箱子，約可獲得3,600經驗值。",
    ["Prospector Ironband, at his excavation site in the south-east of Loch Modan."] =
        "勘察員基恩薩·鐵環，在洛克莫丹東南部他的挖掘場。",
    ["Find Agmond leads to Agmond's Fate: gloves of cloth, leather or mail."] =
        "「尋找阿戈莫德」會引向「阿戈莫德的命運」：布甲、皮甲或鎖甲手套。",
    ["Ghak Healtouch, in Thelsamar."] =
        "加克，在塞爾薩瑪。",
    ["It opens Uldaman Reagent Run: restorative potions and about 3,450 XP."] =
        "它會開啟「奧達曼的蘑菇」：恢復藥水，以及約3,450經驗值。",
    ["Rigglefuzz, in the middle of the Badlands."] =
        "里格弗茲，在荒蕪之地中部。",
    ["Reward: leather or mail bracers, cloth boots or a shield."] =
        "獎勵：皮甲或鎖甲護腕、布甲靴子或一面盾牌。",
    ["Theldurin the Lost, in the south of the Badlands."] =
        "『迷失者』塞爾杜林，在荒蕪之地南部。",
    ["Reward: a cloth robe."] =
        "獎勵：一件布甲長袍。",
    ["A crumpled map lies on the ground in the north of the Badlands."] =
        "一張皺巴巴的地圖掉在荒蕪之地北部的地上。",
    ["A long chain of nine quests between the Badlands and Ironforge: it ends inside Uldaman with the Lost Tablets of Will, a medal and about 5,850 XP."] =
        "在荒蕪之地和鐵爐堡之間的九個任務組成的長系列任務：最後在奧達曼內以「意誌石板」結束，可獲得一枚勳章和約5,850經驗值。",
    ["Prospector Ryedol, a short walk south of the map."] =
        "勘察員雷杜爾，在地圖南邊不遠處。",
    ["A battered dwarven skeleton lies in the middle of the Badlands."] =
        "一具殘破的矮人骸骨躺在荒蕪之地中部。",
    ["Murdaloc and the Stonevault troggs camp just south of the skeleton."] =
        "莫達洛克和石窟穴居人就在骸骨南邊紮營。",
    ["The buzzards and crag coyotes of the Badlands drop the gizzards and fangs."] =
        "荒蕪之地的禿鷲和峭壁山狗會掉落胃囊和牙齒。",
    ["Hammertoe Grez, by the gates of Uldaman, in the north of the Badlands."] =
        "鐵趾格雷茲，在荒蕪之地北部的奧達曼大門旁。",
    ["Magregan Deepshadow, a Shadowforge dwarf by the gates, carries the amulet; the tablet lies in an ancient chest close by."] =
        "馬格雷甘·深影是大門旁的一個暗爐矮人，身上帶著護符；石板就在附近的一個古老的箱子裡。",
    ["The Shadowforge dwarves around the gates drop the power stones."] =
        "大門周圍的暗爐矮人會掉落能量石。",
    ["The Shadowforge dwarves may also drop a shattered necklace: use it."] =
        "暗爐矮人也可能掉落破碎的項鏈：使用它。",
    ["Hammertoe Grez."] =
        "鐵趾格雷茲。",
    ["Prospector Ryedol."] =
        "勘察員雷杜爾。",
    ["Theldurin the Lost."] =
        "『迷失者』塞爾杜林。",
    ["Prospector Ironband, in Loch Modan."] =
        "勘察員基恩薩·鐵環，在洛克莫丹。",
    ["Historian Karnik, in the Hall of Explorers of Ironforge."] =
        "史學家卡尼克，在鐵爐堡的探險者大廳。",
    ["Advisor Belgrum, in the Hall of Explorers."] =
        "顧問貝爾格拉姆，在探險者大廳。",
    ["Historian Karnik."] =
        "史學家卡尼克。",
    ["Talvash's chain ends inside Uldaman with a necklace and about 5,600 XP."] =
        "塔瓦斯德的系列任務最後在奧達曼內結束，可獲得一條項鍊和約5,600經驗值。",
    ["Five silver bars: from mining, or the auction house."] =
        "五塊銀錠：可透過採礦取得，或在拍賣場購買。",
    ["Ambassador Infernus walks with the Dark Iron dwarves south of Uldaman's gates."] =
        "因弗努斯大使和黑鐵矮人一起在奧達曼大門南邊走動。",
    ["Krom Stoutarm's chest stands in the dig south-west of Uldaman's gates."] =
        "克羅姆·粗臂的箱子在奧達曼大門西南方的挖掘場裡。",
    ["Carved stone urns lie around the dig and inside Uldaman."] =
        "雕紋石罐散落在挖掘場周圍和奧達曼內部。",
    ["Magenta cap clusters grow on the cave walls, south-west of the gates and inside."] =
        "紫色蘑菇長在大門西南方以及內部的洞壁上。",
    ["Advisor Belgrum, in the Hall of Explorers of Ironforge."] =
        "顧問貝爾格拉姆，在鐵爐堡的探險者大廳。",
    ["Enter Uldaman"] =
        "進入奧達曼",
    ["The dungeon's door is at the back of the cave by Hammertoe Grez's dig."] =
        "地城入口在鐵趾格雷茲挖掘場旁那個洞穴的深處。",
    ["A dead paladin rests just off the first great hall, down its second right-hand passage."] =
        "一位死去的聖騎士就在第一個大廳旁邊，沿著它右手邊的第二條通道下去。",
    ["Baelog, the first boss, in Dig Two: the left corridor, then the room to the south."] =
        "第一個首領巴爾洛戈在第二挖掘區：走左邊的走廊，再進入南邊的房間。",
    ["The Tablet of Will stands against a wall of Dig Three."] =
        "意志石板靠在第三挖掘區的一面牆邊。",
    ["The Gni'kiv Medallion lies in Baelog's chest, Revelosh drops the Shaft of Tsol: join them into the Staff of Prehistoria, use it in the Map Chamber, then step into Ironaya's room."] =
        "尼基夫徽章在巴爾洛戈的箱子裡，魯維羅什會掉落索爾之杖：把它們組合成史前法杖，在地圖室使用它，然後走進艾隆納亞的房間。",
    ["The topaz is in a conspicuous urn south-east of Dig Two, the ruby in a stone chest north-west of Dig Three (it calls monsters), the sapphire on Grimlok at the end of the Stone Vault."] =
        "黃寶石在第二挖掘區東南方一個顯眼的罐子裡，紅寶石在第三挖掘區西北方的一個石箱裡（會引來怪物），藍寶石在石窟盡頭的格瑞姆洛克身上。",
    ["Use Talvash's phial at his scrying bowl, in the dungeon."] =
        "在地城裡塔瓦斯德的占卜碗旁使用他的瓶子。",
    ["Archaedas, the last boss, guards the Hall of the Crafters: he drops the power source."] =
        "最後一個首領阿札達斯守衛著工匠大廳：他會掉落能量源。",
    ["The Discs of Norgannon, in the room behind Archaedas."] =
        "諾甘農圓盤，在阿札達斯後方的房間裡。",
    ["Optional: the Discs of Norgannon, behind Archaedas, tell their story; it ends in Ironforge with potions or a bag."] =
        "可選：阿札達斯後方的諾甘農圓盤會講述它們的故事；最後在鐵爐堡結束，可獲得藥水或一個背包。",
    ["Prospector Stormpike and Krom Stoutarm, in the Hall of Explorers of Ironforge."] =
        "勘察員雷矛和克羅姆·粗臂，在鐵爐堡的探險者大廳。",
    ["Talvash del Kissel, in the Mystic Ward."] =
        "塔瓦斯德·基瑟爾，在秘法區。",
    ["High Explorer Magellas, in the Hall of Explorers."] =
        "資深探險家麥格拉斯，在探險者大廳。",
    ["Dinita Stonemantle, in Ironforge."] =
        "丁尼塔·石衣，在鐵爐堡。",
    ["Zul'Farrak"] =
        "祖爾法拉克",
    ["Gryphon Master Talonaxe, at Aerie Peak, in the Hinterlands."] =
        "獅鷲獸管理員沙拉克·鷹斧，在辛特蘭的鷹巢山。",
    ["Optional: a chain of seven quests between the Hinterlands, the Blasted Lands and the city; the last one, an elite fight to the top of Jintha'Alor, brings a mace or leather leggings."] =
        "可選：在辛特蘭、詛咒之地和這座城市之間的七個系列任務；最後一個任務要一路與精英戰鬥直到辛薩羅的頂端，可獲得一把錘或皮甲腿甲。",
    ["The Witherbark cages stand in the troll camps of the south-west of the Hinterlands."] =
        "枯木食人妖的牢籠位於辛特蘭西南部的食人妖營地裡。",
    ["Search the Altar of Zul, in the middle of the trolls' ruins in the south of the Hinterlands."] =
        "搜查祖爾祭壇，它位於辛特蘭南部食人妖廢墟的中央。",
    ["Thadius Grimshade, at the top of Nethergarde Keep, in the Blasted Lands."] =
        "薩迪斯·格希德，在詛咒之地守望堡的頂端。",
    ["Your mage trainer, in a capital."] =
        "你的法師訓練師，在主城。",
    ["Tabetha, in her house in the middle of Dustwallow Marsh."] =
        "塔貝薩，在塵泥沼澤中部她的房子裡。",
    ["Reward: a staff or plate shoulders."] =
        "獎勵：一把法杖或鎧甲護肩。",
    ["Wizzle Brassbolts, at the racetrack of the Shimmering Flats, in Thousand Needles."] =
        "維茲爾·銅栓，在千針石林閃光平原的賽道旁。",
    ["Reward: a carrot on a stick, which makes your mount faster."] =
        "獎勵：棍子上的胡蘿蔔，能讓你的坐騎跑得更快。",
    ["Tran'rek, Trenton Lighthammer and Chief Engineer Bilgewhizzle, in Gadgetzan, in Tanaris."] =
        "特蘭雷克、特倫頓·輕錘和首席工程師比格維茲，在塔納利斯的加基森。",
    ["Gadgetzan's quests: the Divino-matic Rod brings a ring or a leather helm; the other two, about 3,900 XP each."] =
        "加基森的任務：「探水棒」可獲得一枚戒指或一頂皮甲頭盔；另外兩個任務各約3,900經驗值。",
    ["Yeh'kinya, at Steamwheedle Port, on the east coast of Tanaris."] =
        "葉基亞，在塔納利斯東岸的熱砂港。",
    ["It opens The Prophecy of Mosh'aru, about 5,250 XP."] =
        "它會開啟「摩沙魯的預言」，約5,250經驗值。",
    ["Kill the vale screechers of Feralas and use Yeh'kinya's bramble on their bodies."] =
        "擊殺菲拉斯的山谷尖嘯者，再對牠們的屍體使用葉基亞的樹枝。",
    ["Yeh'kinya, at Steamwheedle Port."] =
        "葉基亞，在熱砂港。",
    ["Enter Zul'Farrak"] =
        "進入祖爾法拉克",
    ["The city's gate is in the north-west of Tanaris."] =
        "這座城市的大門在塔納利斯西北部。",
    ["The scarabs drop the shells; most of them crowd Theka the Martyr's chamber."] =
        "聖甲蟲會掉落甲殼；牠們大多聚集在『殉教者』塞卡的房間裡。",
    ["Theka the Martyr, the second boss, in the scarabs' room to the north, holds the first tablet; Hydromancer Velratha, by the pool to the south-east, the second."] =
        "第二個首領『殉教者』塞卡在北邊聖甲蟲的房間裡，持有第一塊石板；水占師維蕾薩在東南方的水池旁，持有第二塊。",
    ["Hydromancer Velratha also wears the Tiara of the Deep."] =
        "水占師維蕾薩也戴著深淵皇冠。",
    ["Gahz'rilla rises from the pool when its gong is struck with the Mallet of Zul'Farrak, made in the Hinterlands: one of the group needs it."] =
        "用祖爾法拉克之槌敲響水池的銅鑼，加茲瑞拉就會從水池中出現；這把槌子要在辛特蘭製作：隊伍中需要有一個人帶著它。",
    ["Nekrum Gutchewer joins the fight at the top of the pyramid, when the prisoners are freed."] =
        "囚犯被釋放後，耐克魯姆會在金字塔頂端加入戰鬥。",
    ["Sergeant Bly, one of the prisoners at the top of the pyramid: free them, defend them, then he turns on you."] =
        "布萊中士是金字塔頂端的囚犯之一：釋放他們、保護他們，之後他會轉而攻擊你。",
    ["Every troll of the city may drop a troll temper; it can take more than one run."] =
        "城裡的每個食人妖都可能掉落食人妖調和劑；可能需要刷不只一次。",
    ["Tran'rek, Trenton Lighthammer and Chief Engineer Bilgewhizzle, in Gadgetzan."] =
        "特蘭雷克、特倫頓·輕錘和首席工程師比格維茲，在加基森。",
    ["Optional: an egg in the Hinterlands; it opens The God Hakkar, a quest of the Temple of Atal'Hakkar."] =
        "可選：辛特蘭的一顆蛋；它會開啟「神靈哈卡」，這是阿塔哈卡神廟的任務。",
    ["Wizzle Brassbolts, at the Shimmering Flats."] =
        "維茲爾·銅栓，在閃光平原。",
    ["Tabetha, in Dustwallow Marsh."] =
        "塔貝薩，在塵泥沼澤。",
    ["Thadius Grimshade, in Nethergarde Keep."] =
        "薩迪斯·格希德，在守望堡。",
    ["Wait while Thadius Grimshade performs his divination."] =
        "在薩迪斯·格希德進行占卜時等候。",
    ["Gryphon Master Talonaxe, at Aerie Peak."] =
        "獅鷲獸管理員沙拉克·鷹斧，在鷹巢山。",
    ["Vile Priestess Hexx, at the top of Jintha'Alor, carries the key to Sharpbeak's cage: elite trolls all the way up."] =
        "辛薩羅頂端的邪惡祭司海克斯身上帶著沙普比克籠子的鑰匙：一路上都是精英食人妖。",
    ["The Ancient Egg lies at the top of Jintha'Alor too."] =
        "遠古之卵也在辛薩羅的頂端。",
    ["Gryphon Master Talonaxe."] =
        "獅鷲獸管理員沙拉克·鷹斧。",
    ["Maraudon"] =
        "瑪拉頓",
    ["Archmage Tervosh, in his tower in Theramore, in Dustwallow Marsh."] =
        "大法師特沃許，在塵泥沼澤塞拉摩他的塔裡。",
    ["Reward: a pendant of your choice."] =
        "獎勵：自選一個墜飾。",
    ["Talendria and Keeper Marandis, at Nijel's Point, in the north of Desolace."] =
        "塔琳德莉亞和守護者瑪蘭迪斯，在淒涼之地北部的尼耶爾前哨站。",
    ["Nijel's Point's two quests: a ring, plate gauntlets or a leather belt; then Theradras's end brings a sword, a staff or a bow."] =
        "尼耶爾前哨站的兩個任務：一枚戒指、鎧甲護手或一條皮甲腰帶；之後擊敗瑟萊德絲可獲得一把劍、一把法杖或一把弓。",
    ["Willow, in the middle of Desolace."] =
        "維洛，在淒涼之地中部。",
    ["Reward: cloth, leather, mail or plate armor."] =
        "獎勵：布甲、皮甲、鎖甲或鎧甲護甲。",
    ["The Centaur Pariah, an outcast in the south of Desolace."] =
        "半人馬賤民，淒涼之地南部的一個流亡者。",
    ["About 5,450 XP."] =
        "約5,450經驗值。",
    ["Cavindra, on the path to Maraudon, in the west of Desolace."] =
        "凱雯德拉，在淒涼之地西部通往瑪拉頓的路上。",
    ["Legends of Maraudon leads to the Scepter of Celebras, a shortcut into the inner falls."] =
        "「瑪拉頓的傳說」會引向「塞雷布拉斯節杖」，這是通往內部瀑布的捷徑。",
    ["Enter Maraudon"] =
        "進入瑪拉頓",
    ["Maraudon's caves open in the west of Desolace; inside, an orange and a purple wing lead down to the inner falls."] =
        "瑪拉頓的洞穴入口在淒涼之地西部；進去後，橙色區域和紫色區域都通往下方的內部瀑布。",
    ["The Shadowshard elementals of the outer caves drop the fragments."] =
        "外圍洞穴的裂影元素會掉落殘片。",
    ["Fill the vial at the orange crystal pool, in the caves before the Orange wing; in the wing, use it on the stumps with red tops: the Noxxious scions come out."] =
        "在橙色區域前的洞穴裡，於橙色水晶池裝滿水瓶；進入該區域後，對頂端是紅色的樹樁使用它：諾克賽恩幼體就會出現。",
    ["Every creature of Maraudon may drop a crystal carving."] =
        "瑪拉頓的每個生物都可能掉落水晶雕像。",
    ["Use the Amulet of Spirits on the Spirit of Veng, who walks the Orange wing, then kill Veng; then on the Spirit of Maraudos in the Purple wing's grotto, then kill Maraudos. Join the two gems."] =
        "對在橙色區域走動的溫格之靈使用靈魂墜飾，然後擊殺溫格；接著對紫色區域洞室裡的瑪勞杜斯之靈使用，然後擊殺瑪拉多斯。將兩顆寶石合而為一。",
    ["Noxxion, the Orange wing's first boss, drops the rod; Lord Vyletongue, in a small room north of his seat in the Purple wing, the diamond."] =
        "橙色區域的第一個首領諾克賽恩會掉落魔棒；維利塔恩領主在紫色區域他座位北邊的小房間裡，會掉落鑽石。",
    ["Kill Celebras the Cursed, on the island of the Poison Falls: Celebras the Redeemed appears."] =
        "擊殺毒性瀑布島上的被詛咒的塞雷布拉斯：贖罪的塞雷布拉斯就會出現。",
    ["Follow Celebras to his stone and wait for his incantation."] =
        "跟著塞雷布拉斯走到他的石頭旁，等他完成咒語。",
    ["Celebras the Redeemed, by his stone."] =
        "贖罪的塞雷布拉斯，在他的石頭旁。",
    ["Princess Theradras, the last boss, waits at the end of Zaetar's Grave, south and down the waterfall."] =
        "最後一個首領瑟萊德絲公主在札爾塔之墓的盡頭，往南沿著瀑布而下。",
    ["Zaetar's Spirit appears in the middle of Theradras's room."] =
        "札爾塔的靈魂會出現在瑟萊德絲房間的中央。",
    ["About 6,100 XP; the seed goes to Moonglade."] =
        "約6,100經驗值；種子要送到月光林地。",
    ["The Centaur Pariah, in the south of Desolace."] =
        "半人馬賤民，在淒涼之地南部。",
    ["Talendria and Keeper Marandis, at Nijel's Point."] =
        "塔琳德莉亞和守護者瑪蘭迪斯，在尼耶爾前哨站。",
    ["Archmage Tervosh, in Theramore."] =
        "大法師特沃許，在塞拉摩。",
    ["Keeper Remulos, at the Shrine of Remulos, in Moonglade."] =
        "守護者雷姆洛斯，在月光林地的雷姆洛斯神殿。",
    ["The Temple of Atal'Hakkar"] =
        "阿塔哈卡神廟",
    ["Brohann Caskbelly, in the Dwarven District of Stormwind."] =
        "布羅哈恩·鐵桶，在暴風城的矮人區。",
    ["Optional: a chain of eight quests from Stormwind to the Hinterlands, Tanaris and Feralas; it opens Into the Temple of Atal'Hakkar, a talisman and about 7,100 XP."] =
        "可選：從暴風城到辛特蘭、塔納利斯和菲拉斯的八個系列任務；它會開啟「進入阿塔哈卡神廟」，可獲得一個護符和約7,100經驗值。",
    ["Find the temple: the ruins in the Pool of Tears, in the east of the Swamp of Sorrows."] =
        "找到神廟：在悲傷沼澤東部淚水之池中的廢墟。",
    ["Brohann Caskbelly, in Stormwind."] =
        "布羅哈恩·鐵桶，在暴風城。",
    ["Falstad Wildhammer, at Aerie Peak, in the Hinterlands."] =
        "弗斯塔德·蠻錘，在辛特蘭的鷹巢山。",
    ["Rhapsody Shindigger, on the road east of Aerie Peak."] =
        "拉普索迪·鐵鏟，在鷹巢山東邊的路上。",
    ["The Atal'ai Exile, in the south of the Hinterlands."] =
        "阿塔萊流放者，在辛特蘭南部。",
    ["Reward: cloth leggings or a mail helm, and about 6,550 XP."] =
        "獎勵：布甲腿甲或一頂鎖甲頭盔，以及約6,550經驗值。",
    ["Muigin, at Marshal's Refuge, in Un'Goro Crater."] =
        "莫爾金，在安戈洛環形山的馬紹爾營地。",
    ["Muigin's chain leads to the temple's haze."] =
        "莫爾金的系列任務會引向神廟裡的霧氣。",
    ["The bloodpetal plants of Un'Goro drop the petals."] =
        "安戈洛的血瓣花植物會掉落花瓣。",
    ["Gregan Brewspewer, in the north of Feralas."] =
        "格雷甘·山酒，在菲拉斯北部。",
    ["Angelas Moonbreeze, at Feathermoon Stronghold, in Feralas."] =
        "安吉拉斯·月風，在菲拉斯的羽月要塞。",
    ["Marvon's chain opens two quests of the temple; one rewards a Hakkari urn."] =
        "瑪爾馮的系列任務會開啟神廟的兩個任務；其中一個的獎勵是哈卡萊骨灰。",
    ["Groddoc and ironfur livers in Feralas, roc gizzards in Tanaris."] =
        "菲拉斯的格羅多克猩猩肝臟和鐵鬃熊肝臟，塔納利斯的大鵬砂囊。",
    ["Marvon Rivetseeker, in Tanaris, south of Gadgetzan."] =
        "瑪爾馮·瑞文斯克，在塔納利斯，加基森南邊。",
    ["Marvon's chest, in his old workshop in Ratchet, holds the stone circle."] =
        "瑪爾馮在棘齒城舊工作室裡的箱子中有石環。",
    ["Marvon Rivetseeker, in Tanaris."] =
        "瑪爾馮·瑞文斯克，在塔納利斯。",
    ["Yeh'kinya, at Steamwheedle Port, in Tanaris."] =
        "葉基亞，在塔納利斯的熱砂港。",
    ["The Ancient Egg lies at the top of Jintha'Alor, in the Hinterlands, among elite trolls."] =
        "遠古之卵在辛特蘭辛薩羅的頂端，周圍都是精英食人妖。",
    ["Reward: a plate helm, a cloth circlet or a dagger, and about 7,900 XP."] =
        "獎勵：一頂鎧甲頭盔、一個布甲頭環或一把匕首，以及約7,900經驗值。",
    ["Rhapsody Shindigger, in the Hinterlands."] =
        "拉普索迪·鐵鏟，在辛特蘭。",
    ["The Atal'ai tablets lie in the ruins around the Pool of Tears, and inside the temple."] =
        "阿塔萊石板散落在淚水之池周圍的廢墟中，神廟內部也有。",
    ["Enter the Temple of Atal'Hakkar"] =
        "進入阿塔哈卡神廟",
    ["The temple lies sunken in the Pool of Tears, in the east of the Swamp of Sorrows: swim down to the ruins' stairs."] =
        "神廟沉在悲傷沼澤東部的淚水之池中：游到下方廢墟的階梯處。",
    ["The murk worms, deep lurkers and oozes of the temple drop the haze."] =
        "神廟裡的黑暗蟲、深淵潛伏者和軟泥怪會掉落阿塔萊之霧。",
    ["Hall of Serpents: use the six statues in this order: south, north, south-west, south-east, north-west, north-east; Atal'alarion appears. The Idol of Hakkar stands in the middle of the Pit of Refuse."] =
        "群蛇大廳：依照以下順序使用六座雕像：南、北、西南、東南、西北、東北；阿塔拉利恩就會出現。哈卡塑像位於垃圾坑的中央。",
    ["Climb the stairs of the Pit of Refuse: the Altar of Hakkar waits up there."] =
        "爬上垃圾坑的階梯：哈卡祭壇就在上面。",
    ["Kill the six troll elites on the balconies first: Jammal'an's barrier falls; he waits south-east of the Pit of Sacrifice."] =
        "先擊殺陽台上的六個精英食人妖：迦瑪蘭的屏障就會消失；他在獻祭之坑的東南方。",
    ["The Shade of Eranikus, at the end of the south path, may drop his essence: use it."] =
        "南邊通道盡頭的伊蘭尼庫斯的陰影可能掉落他的精華：使用它。",
    ["The Essence Font, in the north-east corner of his room."] =
        "精華之泉，在他房間的東北角。",
    ["Use the Oathstone of Ysera's Dragonflight it gives you."] =
        "使用它給你的伊瑟拉巨龍軍團的誓言石。",
    ["Keep the Chained Essence of Eranikus, the font's reward: Itharius asks for it."] =
        "留著被禁錮的伊蘭尼庫斯精華，這是精華之泉的獎勵：伊薩里奧斯會要它。",
    ["Use the Egg of Hakkar by the skeleton in the Sanctum of the Fallen God, south-west: Hakkari bloodkeepers come, their blood puts out the four eternal flames, then the Avatar of Hakkar comes; his essence fills the egg."] =
        "在西南方墮落之神聖殿的骸骨旁使用哈卡之卵：哈卡萊護血者會出現，用他們的血熄滅四道永恆之火，接著哈卡的化身就會出現；他的精華會裝滿這顆卵。",
    ["Itharius, a green dragon in the south-west of the Swamp of Sorrows."] =
        "伊薩里奧斯，悲傷沼澤西南部的一隻綠龍。",
    ["The Atal'ai Exile, in the Hinterlands."] =
        "阿塔萊流放者，在辛特蘭。",
    ["The beasts of Un'Goro drop the bloodpetal sprouts."] =
        "安戈洛的野獸會掉落血瓣花苗。",
    ["Umbranse the Spiritspeaker, in the east of Winterspring."] =
        "『靈語者』昂布蘭希，在冬泉谷東部。",
    ["Blackrock Depths"] =
        "黑石深淵",
    ["Royal Historian Archesonus, in the Hall of Explorers of Ironforge."] =
        "皇家歷史學家阿克瑟努斯，在鐵爐堡的探險者大廳。",
    ["The royal historian's chain leads to Kharan Mighthammer, then to the emperor and the princess: King Magni's reward and about 9,650 XP at its end."] =
        "皇家歷史學家的系列任務會引向卡蘭·巨錘，接著是大帝和公主：最後可獲得麥格尼國王的獎勵和約9,650經驗值。",
    ["Listen to the royal historian."] =
        "聆聽皇家歷史學家的講述。",
    ["Ragnar Thunderbrew, in Kharanos, in Dun Morogh."] =
        "拉格納·雷酒，在丹莫洛的卡拉諾斯。",
    ["Reward: a two-handed axe or a mace, or dark dwarven lager."] =
        "獎勵：一把雙手斧或一把錘，或矮人黑啤酒。",
    ["Kalaran Windblade, in the middle of the Searing Gorge."] =
        "卡拉然·溫布雷，在灼熱峽谷中部。",
    ["Optional: ten quests in the Searing Gorge before A Taste of Flame, which brings a cloth cape or sash or leather shoulders."] =
        "可選：在「烈焰精華」之前要先在灼熱峽谷完成十個任務，「烈焰精華」可獲得一件布甲披風或飾帶，或皮甲護肩。",
    ["Listen to Kalaran Windblade's story."] =
        "聆聽卡拉然·溫布雷的故事。",
    ["The fire elementals of the Searing Gorge drop the hearts of flame; the golems, the oil."] =
        "灼熱峽谷的火元素會掉落烈焰之心；魔像則掉落油。",
    ["The Dark Iron dwarves of the gorge carry the thorium plated daggers."] =
        "峽谷的黑鐵矮人身上帶著瑟銀匕首。",
    ["The Twilight cultists of the gorge carry the symbols of Ragnaros."] =
        "峽谷的暮光教徒身上帶著拉格納羅斯符記。",
    ["Listen to Kalaran Windblade."] =
        "聆聽卡拉然·溫布雷的話。",
    ["Use the Torch of Retribution beside Kalaran."] =
        "在卡拉然旁邊使用懲戒火炬。",
    ["Squire Maltrake, beside Kalaran."] =
        "侍衛瑪特拉克，在卡拉然旁邊。",
    ["Light the four sentry braziers on the Dark Iron watchtowers of the gorge."] =
        "點燃峽谷中黑鐵瞭望塔上的四個崗哨火盆。",
    ["The Hoard of the Black Dragonflight, beside Squire Maltrake."] =
        "黑龍軍團的財寶，在侍衛瑪特拉克旁邊。",
    ["The ghost of Franclorn Forgewright, inside Blackrock Mountain, by the way down to the depths."] =
        "弗蘭克羅恩·鑄鐵的鬼魂，在黑石山內部通往深淵的路旁。",
    ["Franclorn's quest brings the Shadowforge Key, which opens doors of the depths."] =
        "弗蘭克羅恩的任務可獲得影爐鑰匙，能打開黑石深淵裡的門。",
    ["Use the Thaurissan relic in the ruins of Thaurissan, in the middle of the Burning Steppes."] =
        "在燃燒平原中部的索瑞森廢墟使用索瑞森聖物。",
    ["Yuka Screwspigot and Maxwort Uberglint, at Flame Crest, in the north of the Burning Steppes."] =
        "尤卡·斯庫比格特和麥克斯沃特·尤柏格林，在燃燒平原北部的烈焰峰。",
    ["Flame Crest's two quests: Ribbly's head brings leather shoulders, cloth boots or mail armor."] =
        "烈焰峰的兩個任務：雷布里的頭顱可換得皮甲護肩、布甲靴子或鎖甲護甲。",
    ["Jalinda Sprig and Oralius, at Morgan's Vigil, in the east of the Burning Steppes."] =
        "加琳達和奧拉留斯，在燃燒平原東部的摩根崗哨。",
    ["Morgan's Vigil's quests: Incendius! brings armor of any kind, The Good Stuff a fanny pack of loot."] =
        "摩根崗哨的任務：「伊森迪奧斯！」可獲得任意類型的護甲，「好東西」可獲得一個裝著戰利品的背包。",
    ["Cyrus Therepentous, in the far east of the Burning Steppes."] =
        "塞勒斯·薩雷芬圖斯，在燃燒平原的最東邊。",
    ["A frenzied black drake of the steppes drops the molt; then talk to Cyrus."] =
        "燃燒平原的狂亂的黑龍會掉落黑龍皮；然後和塞勒斯交談。",
    ["Helendis Riverhorn, at Morgan's Vigil."] =
        "赫林迪斯·河角，在摩根崗哨。",
    ["Optional: eight quests between the steppes, Lakeshire and Stormwind before Marshal Windsor, whose Jail Break! brings a sword or a dagger among its rewards, and about 7,750 XP."] =
        "可選：在燃燒平原、湖畔鎮和暴風城之間的八個任務，之後才輪到溫德索爾元帥，他的「沖破牢籠！」獎勵中包括一把劍或一把匕首，以及約7,750經驗值。",
    ["The black dragonkin of the steppes' north."] =
        "燃燒平原北部的黑龍族。",
    ["Magistrate Solomon, in the town hall of Lakeshire, in Redridge."] =
        "所羅門鎮長，在赤脊山湖畔鎮的鎮公所。",
    ["Highlord Bolvar Fordragon, in Stormwind Keep."] =
        "大領主伯瓦爾·弗塔根，在暴風要塞。",
    ["Talk to Lady Katrana Prestor, beside the king."] =
        "和國王身旁的卡特拉娜·普瑞斯托女士交談。",
    ["Magistrate Solomon, in Lakeshire."] =
        "所羅門鎮長，在湖畔鎮。",
    ["Marshal Maxwell, at Morgan's Vigil."] =
        "麥克斯韋爾元帥，在摩根崗哨。",
    ["Talk to Ragged John, at Flame Crest."] =
        "和烈焰峰的狼狽不堪的約翰交談。",
    ["Royal Historian Archesonus, in Ironforge."] =
        "皇家歷史學家阿克瑟努斯，在鐵爐堡。",
    ["Overmaster Pyron walks the bottom of Blackrock Mountain, before the depths' door."] =
        "征服者派隆在黑石山底部、黑石深淵的入口前走動。",
    ["Enter Blackrock Depths"] =
        "進入黑石深淵",
    ["Blackrock Mountain opens in the west of the Burning Steppes; inside, the depths' door is at the bottom of the mountain."] =
        "黑石山的入口在燃燒平原西部；進去後，黑石深淵的入口在山的底部。",
    ["High Interrogator Gerstahn, in a back room on the right of the Detention Block, carries the cell key; Kharan Mighthammer sits in the second cell on the right of the tunnel."] =
        "審訊官格斯塔恩在禁閉區右側的後室裡，身上帶著牢房鑰匙；卡蘭·巨錘坐在隧道右側的第二間牢房裡。",
    ["Let Kharan tell his story."] =
        "讓卡蘭講述他的故事。",
    ["Marshal Windsor, two cells further."] =
        "溫德索爾元帥，再過去兩間牢房。",
    ["The Anvilrage dwarves of the first rooms may drop a crumpled note: read it."] =
        "最初幾個房間的鐵怒矮人可能掉落弄皺的便箋：閱讀它。",
    ["Marshal Windsor, in his cell."] =
        "溫德索爾元帥，在他的牢房裡。",
    ["Fineous Darkvire, in the lower Hall of Crafting, carries Ironfel; the Monument of Franclorn Forgewright stands at the dead end past the Shrine of Thaurissan."] =
        "弗諾斯·達克維爾在工藝大廳下層，身上帶著鐵膽之錘；弗蘭克羅恩·鑄鐵的紀念碑位於索瑞森神殿後方的死路盡頭。",
    ["The Monument of Franclorn Forgewright."] =
        "弗蘭克羅恩·鑄鐵的紀念碑。",
    ["Bael'Gar waits at the end of the Dark Iron Highway: use Cyrus's molt on his body."] =
        "貝爾加在黑鐵大道的盡頭：對他的屍體使用塞勒斯的黑龍皮。",
    ["General Angerforge, down the stairs of the West Garrison, and Golem Lord Argelmach, in the Manufactory, carry Windsor's lost information."] =
        "西部要塞樓梯下方的安格弗將軍，以及製造廠裡的魔像領主阿格曼奇，身上帶著溫德索爾遺失的情報。",
    ["Free Marshal Windsor and follow him through the Detention Block and the Halls of the Law."] =
        "釋放溫德索爾元帥，跟著他穿過禁閉區和法律大廳。",
    ["Mistress Nagmara, in the Grim Guzzler tavern."] =
        "娜瑪拉小姐，在黑鐵酒吧。",
    ["Optional: Mistress Nagmara's love potion needs herbs, silver veins of giants and water of Un'Goro's hot springs; it brings cloth bracers or a leather belt."] =
        "可選：娜瑪拉小姐的愛情藥水需要草藥、巨人的銀礦和安戈洛溫泉的水；可獲得布甲護腕或一條皮甲腰帶。",
    ["Ribbly Screwspigot sits at the bottom of the Grim Guzzler: talk to him, then fight him."] =
        "雷布里·斯庫比格特坐在黑鐵酒吧的底層：先和他交談，再與他戰鬥。",
    ["Break the three Thunderbrew lager kegs in a side room of the lower Grim Guzzler: Hurley Blackbreath comes."] =
        "打破黑鐵酒吧下層側室裡的三個雷霆啤酒桶：霍爾雷·黑鬚就會出現。",
    ["The relic coffer keys drop from the dwarves; the twelve coffers of the Black Vault call Watchman Doomgrip, who opens the Heart's vault."] =
        "古物寶庫鑰匙由矮人掉落；打開黑色寶庫裡的十二個古物寶庫會引來衛兵杜格瑞普，他會打開放著山脈之心的寶庫。",
    ["The Anvilrage dwarves drop the fanny packs."] =
        "鐵怒矮人會掉落黑鐵挎包。",
    ["King Magni Bronzebeard, in Ironforge."] =
        "國王麥格尼·銅鬚，在鐵爐堡。",
    ["Jalinda Sprig, at Morgan's Vigil."] =
        "加琳達，在摩根崗哨。",
    ["Gromsblood, from herbalism or the auction house; giant silver veins from the giants of Azshara; the vial filled at the Golakka Hot Springs of Un'Goro Crater."] =
        "格羅姆之血：用草藥學採集或在拍賣場購買；巨型銀礦：來自艾薩拉的巨人；瓶子：在安戈洛環形山的葛拉卡溫泉裝滿。",
    ["Enter Blackrock Depths again"] =
        "再次進入黑石深淵",
    ["Lord Incendius waits at the Black Anvil, in Shadowforge City."] =
        "伊森迪奧斯領主在影爐城的黑鐵砧旁等著。",
    ["Mistress Nagmara, in the Grim Guzzler."] =
        "娜瑪拉小姐，在黑鐵酒吧。",
    ["Emperor Dagran Thaurissan, the last boss, sits in the Imperial Seat: keep Princess Moira alive while you fight him."] =
        "最後一個首領達格蘭·索瑞森大帝坐在帝王之座：與他戰鬥時要讓茉艾拉公主活著。",
    ["Princess Moira Bronzebeard, in the Imperial Seat."] =
        "茉艾拉·銅鬚公主，在帝王之座。",
    ["Yuka Screwspigot and Maxwort Uberglint, at Flame Crest."] =
        "尤卡·斯庫比格特和麥克斯沃特·尤柏格林，在烈焰峰。",
    ["Cyrus Therepentous, in the far east of the steppes."] =
        "塞勒斯·薩雷芬圖斯，在燃燒平原的最東邊。",
    ["Jalinda Sprig and Oralius, at Morgan's Vigil."] =
        "加琳達和奧拉留斯，在摩根崗哨。",
    ["Marshal Maxwell."] =
        "麥克斯韋爾元帥。",
    ["Ragnar Thunderbrew, in Kharanos."] =
        "拉格納·雷酒，在卡拉諾斯。",
    ["Blackrock Spire"] =
        "黑石塔",
    ["Prospector Ironboot, at Steamwheedle Port, in Tanaris."] =
        "勘察員鐵靴，在塔納利斯的熱砂港。",
    ["Yeh'kinya's chain from Zul'Farrak and the sunken temple goes on: two tablets in the Eastern Plaguelands, two inside the spire, then a cloak."] =
        "葉基亞從祖爾法拉克和沉沒的神廟延續下來的系列任務：東瘟疫之地有兩塊石板，黑石塔內有兩塊，最後可獲得一件披風。",
    ["The third and fourth tablets lie in the troll ruins of the north of the Eastern Plaguelands."] =
        "第三塊和第四塊石板在東瘟疫之地北部的食人妖廢墟裡。",
    ["Prospector Ironboot, at Steamwheedle Port."] =
        "勘察員鐵靴，在熱砂港。",
    ["Kibler, at Flame Crest, in the north of the Burning Steppes."] =
        "基布雷爾，在燃燒平原北部的烈焰峰。",
    ["Kibler's two quests: a worg pup or a smolderweb spider, pets that follow you."] =
        "基布雷爾的兩個任務：一隻小座狼或一隻煙網蜘蛛，都是會跟著你的寵物。",
    ["Ragged John, at Flame Crest."] =
        "狼狽不堪的約翰，在烈焰峰。",
    ["Reward: Ragged John's neverending cup, and about 9,950 XP."] =
        "獎勵：約翰的無盡之杯，以及約9,950經驗值。",
    ["Helendis Riverhorn, at Morgan's Vigil, in the east of the Burning Steppes."] =
        "赫林迪斯·河角，在燃燒平原東部的摩根崗哨。",
    ["Reward: a cloth robe, a leather jerkin or a mail breastplate."] =
        "獎勵：一件布甲長袍、一件皮甲短上衣或一件鎖甲胸甲。",
    ["Enter Blackrock Spire"] =
        "進入黑石塔",
    ["Blackrock Mountain opens in the west of the Burning Steppes; inside, the spire's door is at the top of the mountain."] =
        "黑石山的入口在燃燒平原西部；進去後，黑石塔的入口在山的頂部。",
    ["Warosh, a troll who walks near the spire's entrance."] =
        "瓦羅什，一個在黑石塔入口附近走動的食人妖。",
    ["Reward: a charm, after a fight with Urok Doomhowl."] =
        "獎勵：一個護身符，要先和烏洛克打一場。",
    ["Vaelan, a Scarshield infiltrator, stands up the ramp near the spire's entrance."] =
        "裂盾滲透者維埃蘭站在黑石塔入口附近的斜坡上方。",
    ["Optional: the Seal of Ascension, the key to the Upper Spire, a raid of ten; its last part is in Dustwallow Marsh."] =
        "可選：晉升印章是黑石塔上層的鑰匙，那是一個十人團隊副本；任務的最後一部分在塵泥沼澤。",
    ["Bijou hides down in the trench after Hordemar City's second bridge."] =
        "比修躲在Hordemar City第二座橋之後的溝渠底下。",
    ["Bijou's chain leads to Maxwell's Mission: armor of any kind, after a second visit."] =
        "比修的系列任務會引向「麥克斯韋爾的任務」：第二次進入後可獲得任意類型的護甲。",
    ["Her belongings lie in a chest on the bottom tier of Hordemar City; it can also stand as far as the Skitterweb Tunnels."] =
        "她的裝置在Hordemar City最底層的一個箱子裡；箱子也可能出現在遠至蛛網隧道的地方。",
    ["Back to Bijou."] =
        "回去找比修。",
    ["The fifth tablet hangs on a wall of Shadow Hunter Vosh'gajin's room, the sixth on a wall of War Master Voone's room."] =
        "第五塊石板掛在暗影獵手沃許加斯房間的牆上，第六塊掛在指揮官沃恩房間的牆上。",
    ["Take the Roughshod Pike from a weapon rack on the left wall after Hordemar City's second bridge, join it to Highlord Omokk's head, and use it on the skull pile up the ramp past Mother Smolderweb: ogres come, then Urok Doomhowl."] =
        "過了Hordemar City的第二座橋後，從左側牆邊的武器架拿取尖銳長矛，與歐莫克大王的頭顱組合，然後在煙網蛛后之後斜坡上方的頭骨堆上使用：食人魔會出現，接著是烏洛克。",
    ["The spire spider eggs lie in the upper Skitterweb Tunnels."] =
        "尖塔蜘蛛卵在蛛網隧道上層。",
    ["Use the empty cage on a Bloodaxe worg pup, in Halycon's room."] =
        "在哈雷肯的房間裡，對一隻小血斧座狼使用空籠子。",
    ["Halycon, the worgs' mother, holds Halycon's Lair."] =
        "座狼之母哈雷肯盤據在哈雷肯的巢穴。",
    ["The Scarshield dwarves drop the unadorned seal; Highlord Omokk, north of Mok'Doom, may drop the Spirestone gem, War Master Voone, at the bottom of Tazz'Alaor, the Smolderthorn gem, and Overlord Wyrmthalak, the last boss, the Bloodaxe gem."] =
        "裂盾矮人會掉落原始晉升印章；Mok'Doom北邊的歐莫克大王可能掉落尖石寶鑽，Tazz'Alaor底部的指揮官沃恩可能掉落燃棘寶鑽，最後一個首領維姆薩拉克主宰可能掉落血斧寶鑽。",
    ["Vaelan, near the entrance."] =
        "維埃蘭，在入口附近。",
    ["Warosh, near the entrance."] =
        "瓦羅什，在入口附近。",
    ["Let Mother Smolderweb poison you and do not cure it: the poison must last until Ragged John, at Flame Crest."] =
        "讓煙網蛛后對你下毒，而且不要解毒：毒必須一直持續到你見到烈焰峰的狼狽不堪的約翰。",
    ["Enter Blackrock Spire again"] =
        "再次進入黑石塔",
    ["Highlord Omokk, north of Mok'Doom; War Master Voone, at the bottom of Tazz'Alaor; Overlord Wyrmthalak, the last boss, in the Chamber of Battle."] =
        "歐莫克大王在Mok'Doom北邊；指揮官沃恩在Tazz'Alaor底部；最後一個首領維姆薩拉克主宰在戰鬥大廳。",
    ["Kibler and Ragged John, at Flame Crest."] =
        "基布雷爾和狼狽不堪的約翰，在烈焰峰。",
    ["Helendis Riverhorn and Marshal Maxwell, at Morgan's Vigil."] =
        "赫林迪斯·河角和麥克斯韋爾元帥，在摩根崗哨。",
    ["Beat Emberstrife, a dragon of the Wyrmbog in Dustwallow Marsh, until his will breaks, then place the seal before him."] =
        "擊打塵泥沼澤巨龍沼澤的巨龍艾博斯塔夫，直到他的意志崩潰，然後把印章放在他面前。",
    ["Vaelan, near the spire's entrance."] =
        "維埃蘭，在黑石塔入口附近。",
    ["Yeh'kinya, beside him."] =
        "葉基亞，在他旁邊。",
    ["Dire Maul"] =
        "厄運之槌",
    ["A herald of your capital: Crier Goodman in Stormwind, Courier Hammerfall in Ironforge, Herald Moonstalker in Darnassus."] =
        "你主城的傳令者：暴風城的公告員古德曼、鐵爐堡的信差考雷·落錘、達納蘇斯的赫拉德·月行者。",
    ["Optional: a lead to Feathermoon Stronghold, about 1,500 XP."] =
        "可選：一條前往羽月要塞的線索，約1,500經驗值。",
    ["Latronicus Moonspear, at Feathermoon Stronghold, in Feralas."] =
        "拉托尼庫斯·月矛，在菲拉斯的羽月要塞。",
    ["Latronicus Moonspear and Scholar Runethorn, at Feathermoon Stronghold."] =
        "拉托尼庫斯·月矛和學者盧索恩·紋角，在羽月要塞。",
    ["Lethtendris's Web brings a dagger; Elven Legends, about 8,300 XP for a search in the library."] =
        "「蕾瑟塔蒂絲的網」可獲得一把匕首；「精靈的傳說」只需在圖書館裡搜尋，約8,300經驗值。",
    ["Azj'Tordin, at Lariss Pavilion, in the east of Feralas."] =
        "埃斯托爾迪，在菲拉斯東部的拉瑞斯小亭。",
    ["Reward: a two-handed sword or leather boots; Pusillin also drops the Crescent Key, which opens the west and north wings."] =
        "獎勵：一把雙手劍或皮甲靴子；普希林還會掉落月牙鑰匙，能打開西區和北區。",
    ["Rabine Saturna, in Nighthaven, in Moonglade."] =
        "拉比恩·薩圖納，在月光林地的永夜港。",
    ["Optional: a reliquary in Silithus for Rabine Saturna in Moonglade, then a shard of the Felvine: a shield or an off-hand lexicon."] =
        "可選：替月光林地的拉比恩·薩圖納取得希利蘇斯的一個聖物匣，接著是魔藤的碎片：一面盾牌或一本副手辭典。",
    ["The Reliquary of Purity lies in the ruins of Southwind Village, in Silithus."] =
        "淨化之匣在希利蘇斯南風村的廢墟裡。",
    ["Rabine Saturna, in Nighthaven."] =
        "拉比恩·薩圖納，在永夜港。",
    ["Enter Dire Maul"] =
        "進入厄運之槌",
    ["The ruins of Dire Maul stand in the middle of Feralas; the east, west and north wings each have their own door."] =
        "厄運之槌的廢墟位於菲拉斯中部；東區、西區和北區各有各的入口。",
    ["East: talk to Pusillin each time he stops; he runs five times, then fights on a small platform up a ramp and drops the book."] =
        "東區：普希林每次停下來時都和他交談；他會逃跑五次，然後在斜坡上方的小平台上戰鬥，並掉落那本書。",
    ["East: Lethtendris waits on the upper level of the room left of the ramps between the Hidden Reach and the Warpwood Quarter."] =
        "東區：蕾瑟塔蒂絲在隱秘之地和扭木區之間、斜坡左邊那個房間的上層等著。",
    ["East: kill Zevrim Thornhoof, then Ironbark the Redeemed, in the Conservatory, opens the door to Alzzin the Wildshaper; after Alzzin, use the reliquary by the twisted vine."] =
        "東區：擊殺瑟雷姆·刺蹄，然後溫室裡的贖罪的埃隆巴克會打開通往『狂野變形者』奧茲恩的門；擊敗奧茲恩後，在扭曲的藤蔓旁使用聖物匣。",
    ["West: the Shen'dralar Ancient stands above the platform over Tendris Warpwood."] =
        "西區：辛德拉古靈站在特迪斯·扭木上方那座平台的更高處。",
    ["About 9,950 XP; its treasure, a chest in the library, brings a two-handed mace, a mail helm or leather boots."] =
        "約9,950經驗值；它的寶藏是圖書館裡的一個箱子，可獲得一把雙手錘、一頂鎖甲頭盔或皮甲靴子。",
    ["West: destroy the five pylons of the Capital Gardens, the Court of the Highborne and the Prison; Immol'thar waits in the Prison, behind Tendris (the Crescent Key opens it); Prince Tortheldrin, under the entry platform of the Athenaeum."] =
        "西區：摧毀首都花園、精靈貴族庭院和監獄裡的五座水晶塔；伊莫塔爾在特迪斯後方的監獄裡（用月牙鑰匙打開）；托塞德林王子在藏書殿入口平台的下方。",
    ["West: the treasure is a big stone chest under the ramp of the Athenaeum."] =
        "西區：寶藏是藏書殿斜坡下方的一個大石箱。",
    ["West: through the Conservatory Door (the Crescent Key opens it), the remains lie by a dead elf and a bookcase, in the north of the Athenaeum."] =
        "西區：穿過溫室之門（用月牙鑰匙打開），遺骸在藏書殿北部，一具精靈屍體和一個書架旁邊。",
    ["North: Knot Thimblejack is chained in the north-east corner of the Halls of Destruction."] =
        "北區：諾特·希姆加克被鎖在毀滅大廳的東北角。",
    ["About 6,600 XP for a key the Gordok guards carry."] =
        "用戈多克衛兵身上帶著的一把鑰匙，換取約6,600經驗值。",
    ["Optional: the Gordok Ogre Suit needs runecloth, rugged leather and rune threads."] =
        "可選：「戈多克食人魔裝」需要符文布、硬甲皮和符文線。",
    ["North: the Gordok guards Mol'dar, Slip'kik and Fengus, and Captain Kromcrush, carry the shackle key."] =
        "北區：戈多克衛兵摩爾達、斯里基克和芬古斯，以及克羅卡斯，身上帶著鐐銬鑰匙。",
    ["Knot Thimblejack."] =
        "諾特·希姆加克。",
    ["North: the ogre tannin lies up the ramp above Knot, in the north-west corner: one per group."] =
        "北區：巨魔鞣酸在諾特上方斜坡的西北角：每個隊伍只有一份。",
    ["North: Captain Kromcrush, once King Gordok is dead."] =
        "北區：戈多克大王死後，找克羅卡斯。",
    ["Optional, after a tribute run (King Gordok dead, his guards alive): gloves of any kind."] =
        "可選，需完成一次貢品路線（戈多克大王死亡，他的衛兵都活著）：任意類型的手套。",
    ["The Gauntlet of Gordok Might lies in the Prince's chest, in the Athenaeum of the west wing."] =
        "戈多克力量護手在西區藏書殿的王子的箱子裡。",
    ["North: Stomper Kreeg, after a tribute run."] =
        "北區：完成貢品路線後，找踐踏者克雷格。",
    ["Azj'Tordin, at Lariss Pavilion."] =
        "埃斯托爾迪，在拉瑞斯小亭。",
    ["Latronicus Moonspear, at Feathermoon Stronghold."] =
        "拉托尼庫斯·月矛，在羽月要塞。",
    ["Scholar Runethorn, at Feathermoon Stronghold."] =
        "學者盧索恩·紋角，在羽月要塞。",
    ["Scholomance"] =
        "通靈學院",
    ["Commander Ashlam Valorfist, at Chillwind Camp, in the Western Plaguelands."] =
        "指揮官阿胥拉姆·瓦羅菲斯特，在西瘟疫之地的冰風崗。",
    ["Optional: the chain of the Skeleton Key, which opens Scholomance's door: one key per group is enough. It goes through the Plaguelands, Gadgetzan and Un'Goro."] =
        "可選：骷髏鑰匙的系列任務，這把鑰匙能打開通靈學院的大門：每個隊伍有一把就夠了。任務途經瘟疫之地、加基森和安戈洛。",
    ["The skeletal flayers and slavering ghouls of Sorrow Hill, in the south of the Western Plaguelands."] =
        "西瘟疫之地南部Sorrow Hill的骷髏撕掠者和被奴役的食屍鬼。",
    ["Mark the four watchtowers of Andorhal with the beacon torch, standing in each doorway."] =
        "站在安多哈爾四座哨塔的門口，用信號火炬標記每一座哨塔。",
    ["Alchemist Arbington, at Chillwind Camp."] =
        "鍊金師阿爾比頓，在冰風崗。",
    ["The undead of the Western Plaguelands drop the skeletal fragments."] =
        "西瘟疫之地的不死生物會掉落骸骨碎片。",
    ["Krinkle Goodsteel, in Gadgetzan, in Tanaris: bring 15 gold."] =
        "克林科·古德斯迪爾，在塔納利斯的加基森：帶15金幣過去。",
    ["Bring two thorium bars to the top of Fire Plume Ridge, in Un'Goro Crater, and use the mold by the lava lake."] =
        "帶兩塊瑟銀錠到安戈洛環形山的火羽山山頂，在熔岩湖旁使用模具。",
    ["Araj the Summoner stands in the middle of Andorhal."] =
        "『召喚者』阿拉基站在安多哈爾的中央。",
    ["Betina Bigglezink, at Light's Hope Chapel, in the Eastern Plaguelands."] =
        "貝蒂娜·比格辛克，在東瘟疫之地的聖光之願禮拜堂。",
    ["About 6,200 XP; a hatchling may drop a scale that starts another quest."] =
        "約6,200經驗值；幼龍可能掉落一片龍鱗，可接取另一個任務。",
    ["Weldon Barov, at Chillwind Camp."] =
        "維爾頓·巴羅夫，在冰風崗。",
    ["The Barov fortune: four deeds inside the school; its follow-up sends you to kill Alexi Barov in the Horde's Bulwark."] =
        "巴羅夫家族的寶藏：學院內的四張地契；後續任務會派你去部落的亡靈壁壘擊殺阿萊克斯·巴羅夫。",
    ["Eva Sarkhoff, in Caer Darrow, on the island of Darrowmere Lake."] =
        "艾瓦·薩克霍夫，在達隆米爾湖島上的凱爾達隆。",
    ["Eva Sarkhoff's chain: three parts inside the school, then Kirtonos the Herald and a sword or an off-hand item among its rewards."] =
        "艾瓦·薩克霍夫的系列任務：學院內有三個部分，然後是傳令官基爾圖諾斯，獎勵中包括一把劍或一件副手物品。",
    ["Enter Scholomance"] =
        "進入通靈學院",
    ["The school stands on the island of Caer Darrow, in Darrowmere Lake, in the south-east of the Western Plaguelands."] =
        "學院位於西瘟疫之地東南部達隆米爾湖中的凱爾達隆島上。",
    ["The deeds: Southshore's on a table north-east of the Reliquary; Tarren Mill's on a table on the left at the entry of the Great Ossuary; Brill's on a ledge south-west of the Laboratory; Caer Darrow's on a table east of the Barov Family Vault."] =
        "地契：南海鎮地契在聖物室東北方的桌上；塔倫米爾地契在屍骨儲藏所入口左側的桌上；布瑞爾地契在實驗室西南方的壁架上；凱爾達隆地契在巴羅夫家族寶庫東邊的桌上。",
    ["The plagued hatchlings fill a room of the Great Ossuary."] =
        "瘟疫幼龍擠滿了屍骨儲藏所的一個房間。",
    ["A hatchling may drop a healthy dragon scale: use it."] =
        "幼龍可能掉落健康的龍鱗：使用它。",
    ["Doctor Theolen Krastinov, in the east of the upper Headmaster's Study: kill him, then burn the two piles of remains, to the north and the south-east of his room."] =
        "瑟爾林·卡斯迪諾夫教授在院長書房上層的東側：擊殺他，然後燒掉他房間北邊和東南邊的兩堆遺體。",
    ["Eva Sarkhoff, in Caer Darrow."] =
        "艾瓦·薩克霍夫，在凱爾達隆。",
    ["Enter Scholomance again"] =
        "再次進入通靈學院",
    ["Jandice Barov waits in the north-east of the room down the stairs, on the right of the second big room."] =
        "詹迪斯·巴羅夫在第二個大房間右側、樓梯下方那個房間的東北角。",
    ["Rattlegore, at the bottom of the Great Ossuary, drops the Viewing Room key; put the Blood of Innocents in the brazier on the balcony on the right of the Chamber of Summoning: Kirtonos the Herald comes."] =
        "屍骨儲藏所底部的血骨傀儡會掉落觀察室鑰匙；把無辜者之血放進召喚之廳右側陽台上的火盆：傳令官基爾圖諾斯就會出現。",
    ["Betina Bigglezink, at Light's Hope Chapel."] =
        "貝蒂娜·比格辛克，在聖光之願禮拜堂。",
    ["Optional: an assassination in the other side's camp, among its guards; it brings the Barov Peasant Caller."] =
        "可選：在敵對陣營的營地裡、在守衛環伺之下進行暗殺；可獲得巴羅夫管家鈴。",
    ["Alexi Barov stands among the guards of the Bulwark, the Horde's camp in the north of the Western Plaguelands."] =
        "阿萊克斯·巴羅夫站在亡靈壁壘的守衛之中，那是部落位於西瘟疫之地北部的營地。",
    ["Magistrate Marduke, in Caer Darrow."] =
        "馬杜克鎮長，在凱爾達隆。",
    ["Optional: a chain through Stromgarde, Light's Hope and the Baron's room of Stratholme, back to the school's last boss; it brings a sword, a dagger, a cloth crown or a shield and about 9,950 XP."] =
        "可選：途經激流堡、聖光之願和斯坦索姆男爵房間的系列任務，最後回到學院的最後一個首領；可獲得一把劍、一把匕首、一頂布甲王冠或一面盾牌，以及約9,950經驗值。",
    ["The Keepsake of Remembrance lies in the ruins of Stromgarde, in Arathi Highlands."] =
        "巫妖生前的遺物在阿拉希高地激流堡的廢墟裡。",
    ["Leonid Barthalomew the Revered, at Light's Hope Chapel."] =
        "可敬的萊尼德·巴薩羅梅，在聖光之願禮拜堂。",
    ["Stratholme: place the keepsake on the unholy ground of Baron Rivendare's room."] =
        "斯坦索姆：把遺物放在瑞文戴爾男爵房間的邪惡之地上。",
    ["Ras Frostwhisper waits in the Laboratory: use the Soulbound Keepsake on him."] =
        "萊斯·霜語在實驗室裡：對他使用禁錮靈魂的遺物。",
    ["Stratholme"] =
        "斯坦索姆",
    ["Smokey LaRue and Leonid Barthalomew the Revered, at Light's Hope Chapel, in the east of the Eastern Plaguelands."] =
        "煙鬼拉魯恩和可敬的萊尼德·巴薩羅梅，在東瘟疫之地東部的聖光之願禮拜堂。",
    ["Smokey LaRue's tobacco brings a lighter (a trinket); Leonid's holy water, a cloth crown, a ring or potions."] =
        "煙鬼拉魯恩的煙草任務可獲得一個打火器（飾品）；萊尼德的聖水任務可獲得一頂布甲王冠、一枚戒指或藥水。",
    ["Betina's flesh samples open The Active Agent: a choice of two trinkets."] =
        "貝蒂娜的肉塊樣本任務會開啟「活躍的探子」：可從兩件飾品中選擇一件。",
    ["Duke Nicholas Zverenhoff, at Light's Hope Chapel."] =
        "尼古拉斯·瑟倫霍夫公爵，在聖光之願禮拜堂。",
    ["Duke Nicholas's chain leads to Balnazzar, then Baron Rivendare, then the Argent Hold: a sword, a staff or a shield."] =
        "尼古拉斯公爵的系列任務會依序引向巴納札爾、瑞文戴爾男爵，最後是銀色黎明寶箱：一把劍、一把法杖或一面盾牌。",
    ["Caretaker Alen, at Light's Hope Chapel."] =
        "護理者奧林，在聖光之願禮拜堂。",
    ["Egan's restless souls bring about 8,300 XP."] =
        "伊根的永不安息的靈魂任務約可獲得8,300經驗值。",
    ["Tirion Fordring, in his hut by the lake on the western edge of the Eastern Plaguelands."] =
        "提里恩·弗丁，在東瘟疫之地西緣湖邊他的小屋裡。",
    ["Optional: Tirion Fordring's long chain across both Plaguelands and Caer Darrow; its painting hangs in the city, and its end, In Dreams, brings armor, a warhammer or jewelry and about 9,950 XP."] =
        "可選：提里恩·弗丁橫跨東西瘟疫之地和凱爾達隆的漫長系列任務；其中要找的畫掛在城內，最後的「在夢中」可獲得護甲、一把戰錘或首飾，以及約9,950經驗值。",
    ["The plaguehounds, plaguebats and carrion grubs of the Eastern Plaguelands."] =
        "東瘟疫之地的瘟疫犬、瘟疫蝙蝠和食腐蟲。",
    ["Listen to Tirion Fordring."] =
        "聆聽提里恩·弗丁的話。",
    ["Taelan's hammer lies in the Undercroft, at the southern end of the Eastern Plaguelands."] =
        "泰蘭之錘在東瘟疫之地最南端的Undercroft裡。",
    ["The Symbol of Lost Honor lies in Northdale, in the north-east of the Eastern Plaguelands."] =
        "失落榮耀的象徵在東瘟疫之地東北部的北谷。",
    ["Artist Renfray, in Caer Darrow, in the Western Plaguelands."] =
        "畫家瑞弗蕾，在西瘟疫之地的凱爾達隆。",
    ["Egan, by the road to Stratholme's gate, in the north-west of the Eastern Plaguelands."] =
        "伊根，在東瘟疫之地西北部通往斯坦索姆大門的路旁。",
    ["Enter Stratholme"] =
        "進入斯坦索姆",
    ["The city's main gate, in the north of the Eastern Plaguelands, opens on the Scarlet side."] =
        "城市的正門位於東瘟疫之地北部，通往血色十字軍那一側。",
    ["King's Square: take the box of tobacco in Ezra Grimm's smoke shop; Ezra Grimm comes for it."] =
        "國王廣場：拿走弗拉斯·希亞比菸草店裡的那盒煙草；弗拉斯·希亞比會過來搶。",
    ["The supply crates along the city's walls hold the holy water; some call monsters."] =
        "沿著城牆的補給木箱裡有聖水；有些會引來怪物。",
    ["Every creature of the city may drop a flesh sample."] =
        "城裡的每個生物都可能掉落瘟疫肉塊。",
    ["Use Egan's blaster on the spectral citizens, then again on the restless souls that break free."] =
        "對幽靈市民使用伊根的衝擊器，然後對掙脫出來的永不安息的靈魂再用一次。",
    ["Archivist Galford waits near the end of the Scarlet Bastion: kill him and burn the book on his table."] =
        "檔案管理員加爾福特在血色十字軍堡壘的盡頭附近：擊殺他，然後燒掉他桌上的書。",
    ["The painting hangs in Galford's room."] =
        "畫作掛在加爾福特的房間裡。",
    ["Balnazzar, at the end of the Scarlet Bastion, drops his head: use it."] =
        "血色十字軍堡壘盡頭的巴納札爾會掉落他的頭顱：使用它。",
    ["Aurius waits in a chapel by the service entrance, the other gate of the city."] =
        "奧里克斯在後門旁的一座禮拜堂裡等候，後門是這座城市的另一個入口。",
    ["Optional: Aurius's medallion makes him join the fight against Baron Rivendare: a choice of two trinkets."] =
        "可選：奧里克斯的獎章能讓他加入對抗瑞文戴爾男爵的戰鬥：可從兩件飾品中選擇一件。",
    ["The medallion lies in Malor's strongbox, in Malor the Zealous's room of the Hall of Lights: the Scarlet Key, or a rogue, opens the Bastion's door."] =
        "獎章在光明大廳狂熱的瑪洛爾房間裡的瑪洛爾的保險箱中：血色十字軍鑰匙或盜賊能打開堡壘的門。",
    ["Aurius, in his chapel."] =
        "奧里克斯，在他的禮拜堂裡。",
    ["Smokey LaRue and Leonid Barthalomew the Revered, at Light's Hope Chapel."] =
        "煙鬼拉魯恩和可敬的萊尼德·巴薩羅梅，在聖光之願禮拜堂。",
    ["Enter Stratholme by the service entrance"] =
        "從後門進入斯坦索姆",
    ["The service entrance, east of the main gate, opens on the side of Baron Rivendare."] =
        "後門位於正門東邊，通往瑞文戴爾男爵那一側。",
    ["The new Scourge data lies in one of the three ziggurats of the Gauntlet."] =
        "新的天譴軍團檔案在街巷三座通靈塔中的其中一座。",
    ["Baron Rivendare waits downstairs in the building of Slaughter Square."] =
        "瑞文戴爾男爵在屠殺廣場那棟建築的樓下。",
    ["Aurius appears in the Baron's room and fights at your side."] =
        "奧里克斯會出現在男爵的房間，並與你並肩作戰。",
    ["Lord Maxwell Tyrosus, inside Light's Hope Chapel."] =
        "麥克斯韋爾·泰羅索斯領主，在聖光之願禮拜堂內。",
    ["Open the Argent Hold, inside the chapel."] =
        "打開禮拜堂內的銀色黎明寶箱。",
    ["Egan, by the road to Stratholme."] =
        "伊根，在通往斯坦索姆的路旁。",
    ["Tirion Fordring, in his hut."] =
        "提里恩·弗丁，在他的小屋裡。",
    ["Myranda the Hag, at Uther's Tomb, in the Western Plaguelands."] =
        "巫女米蘭達，在西瘟疫之地的烏瑟之墓。",
    ["Under Myranda's Scarlet illusion, walk into Hearthglen and give Tirion's gift to Highlord Taelan Fordring."] =
        "在米蘭達施加的血色十字軍幻象下，走進壁爐谷，把提里恩的禮物交給大領主泰蘭·弗丁。",
    ["Lead Taelan Fordring out of Hearthglen; the Scarlet give chase."] =
        "帶泰蘭·弗丁離開壁爐谷；血色十字軍會追擊。",
    ["Tirion Fordring."] =
        "提里恩·弗丁。",
    ["Ragefire Chasm"] =
        "怒焰裂谷",
    ["Rahauro, on the Elder Rise of Thunder Bluff."] =
        "拉哈羅，在雷霆崖的長者高地。",
    ["The lost satchel's quest ends with bracers of cloth, leather or mail."] =
        "遺失背包的任務最後可獲得布甲、皮甲或鎖甲護腕。",
    ["Varimathras, beside Sylvanas in the Royal Quarter of Undercity."] =
        "瓦里瑪薩斯，在幽暗城皇家區的希瓦娜斯旁邊。",
    ["Optional: given in Undercity, a zeppelin ride each way. Rewards leggings of cloth, leather or mail."] =
        "可選：在幽暗城接取，來回各要搭一次飛艇。獎勵布甲、皮甲或鎖甲腿甲。",
    ["Thrall, in Grommash Hold, in the Valley of Wisdom."] =
        "索爾，在智慧谷的Grommash Hold。",
    ["Thrall's chain of four quests ends with a weapon of your choice."] =
        "索爾的四個系列任務最後可自選一把武器。",
    ["The Burning Blade cultists of the Cleft of Shadow carry the insignia."] =
        "暗影裂口的火刃祭司身上帶著徽章。",
    ["Talk to Neeru Fireblade, in the Darkbriar Lodge of the Cleft of Shadow."] =
        "和暗影裂口暗木小屋裡的尼爾魯·火刃交談。",
    ["Neeru Fireblade also asks for the heart of the chasm's beast."] =
        "尼爾魯·火刃還要裂谷中那頭野獸的心臟。",
    ["Back to Thrall, in Grommash Hold."] =
        "回到Grommash Hold找索爾。",
    ["Enter Ragefire Chasm"] =
        "進入怒焰裂谷",
    ["The entrance is a cave in the Cleft of Shadow, in the middle of Orgrimmar."] =
        "入口是奧格瑪中部暗影裂口的一個洞穴。",
    ["Ragefire troggs and their shamans fill the first caves."] =
        "最初的幾個洞穴裡滿是怒焰穴居人和牠們的薩滿。",
    ["Maur Grimtotem's body lies in a small cave on the right, past the big trogg cave."] =
        "瑪爾·恐怖圖騰的屍體在穿過穴居人大洞穴後右側的一個小洞穴裡。",
    ["The Searing Blade cultists and warlocks carry both books."] =
        "燃刃信徒和燃刃術士身上帶著這兩本書。",
    ["Taragaman the Hungerer, the chasm's second boss, guards a lava cave."] =
        "裂谷的第二個首領『飢餓者』塔拉加曼守衛著一個熔岩洞穴。",
    ["Jergosh the Invoker is the third boss; Bazzalan waits at the very end of the chasm."] =
        "『塑能師』耶戈什是第三個首領；巴札蘭在裂谷的最深處。",
    ["Thrall, in Grommash Hold."] =
        "索爾，在Grommash Hold。",
    ["Neeru Fireblade, in the Cleft of Shadow."] =
        "尼爾魯·火刃，在暗影裂口。",
    ["Your reward: an axe, a mace, a dagger or a staff of Orgrimmar."] =
        "獎勵：一把奧格瑪的斧、錘、匕首或法杖。",
    ["Varimathras, in the Royal Quarter of Undercity."] =
        "瓦里瑪薩斯，在幽暗城的皇家區。",
    ["Tonga Runetotem, at the Crossroads."] =
        "圖加·符文圖騰，在十字路口。",
    ["Tonga's three oases open Leaders of the Fang, the caverns' main quest: a weapon of your choice."] =
        "圖加的三個綠洲任務會開啟「尖牙德魯伊」，這是洞穴的主要任務：可自選一把武器。",
    ["The Forgotten Pools lie north-west of the Crossroads, north of the caverns' hill."] =
        "遺忘之池位於十字路口西北方、洞穴所在山丘的北邊。",
    ["The Stagnant Oasis lies south-east of the Crossroads: use the bubbling fissure in its water."] =
        "死水綠洲位於十字路口東南方：使用水中冒泡的裂縫。",
    ["The snapjaw turtles of the Lushwater Oasis, at the foot of the caverns' hill."] =
        "甜水綠洲的鉗嘴龜，在洞穴所在山丘的山腳下。",
    ["Apothecary Zamah, in the Pools of Vision under the Spirit Rise."] =
        "藥劑師札瑪，在靈魂高地下方的預見之池。",
    ["Reward: a piece of cloth, leather or mail armor."] =
        "獎勵：一件布甲、皮甲或鎖甲護甲。",
    ["Arch Druid Hamuul Runetotem, on the Elder Rise."] =
        "大德魯伊哈繆爾·符文圖騰，在長者高地。",
    ["Nara Wildmane, on the Elder Rise."] =
        "納拉·蠻鬃，在長者高地。",
    ["Serpentbloom: small green shrubs with violet flowers, in the caves before the door and inside."] =
        "毒蛇花：開著紫色花朵的綠色小灌木，長在入口前的洞穴和地城內部。",
    ["The four Fanglords each drop a gem: Lady Anacondra and Lord Cobrahn first, then Lord Pythas, and Lord Serpentis last."] =
        "四位尖牙領主各掉落一顆寶石：先是安娜科德拉和考布萊恩領主，接著是皮薩斯領主，最後是瑟芬迪斯領主。",
    ["Nara Wildmane, on the Elder Rise of Thunder Bluff."] =
        "納拉·蠻鬃，在雷霆崖的長者高地。",
    ["Your reward: a staff, a mace or a sword."] =
        "獎勵：一把法杖、一把錘或一把劍。",
    ["Apothecary Zamah, in the Pools of Vision."] =
        "藥劑師札瑪，在預見之池。",
    ["Tabitha Heartweaver, at the Sepulcher, in Silverpine Forest."] =
        "Tabitha Heartweaver，在銀松森林的瑟伯切爾。",
    ["Reward: a dagger or cloth cuffs."] =
        "獎勵：一把匕首或布甲護腕。",
    ["Deathguard Kristof, in Brill, in Tirisfal Glades."] =
        "Deathguard Kristof，在提里斯法林地的布瑞爾。",
    ["Reward: a two-handed axe or a staff."] =
        "獎勵：一把雙手斧或一把法杖。",
    ["Morbin Lightbane, in Undercity."] =
        "Morbin Lightbane，在幽暗城。",
    ["Reward: leather armor or a mace."] =
        "獎勵：皮甲護甲或一把錘。",
    ["Theodore Griffs, in Undercity."] =
        "薩多雷·格雷夫，在幽暗城。",
    ["Reward: cloth gloves or a sword."] =
        "獎勵：布甲手套或一把劍。",
    ["The ruins rise above Undercity, in Tirisfal Glades."] =
        "廢墟位於提里斯法林地的幽暗城上方。",
    ["Look for Edward Heartweaver in the ruins."] =
        "在廢墟裡尋找Edward Heartweaver。",
    ["Twenty-five intact limbs, from the undead of the ruins."] =
        "二十五個完整的肢體，從廢墟裡的不死生物身上取得。",
    ["Rath'mael waits in the ruins."] =
        "Rath'mael在廢墟裡等著。",
    ["Witherfang carries the highly toxic strain."] =
        "Witherfang身上帶著劇毒菌株。",
    ["The Baron may drop an abominable head: read it."] =
        "The Baron可能掉落一顆憎惡的頭顱：閱讀它。",
    ["Oran Snakewrithe, in Undercity."] =
        "奧蘭·蛇繞，在幽暗城。",
    ["Master Apothecary Faranell, in the Apothecarium of Undercity."] =
        "大藥劑師法拉尼爾，在幽暗城的鍊金房。",
    ["Optional: Faranell's Unending Torment goes on in Undercity; its last part has a two-handed sword among its rewards."] =
        "可選：法拉尼爾的「Unending Torment」會在幽暗城繼續；最後一部分的獎勵中包括一把雙手劍。",
    ["A toxic skullcap from Tawny Grisette in the Trade Quarter, blisterweed near the herbalism trainer, and an essence of agony from the poison vendor of the Rogues' Quarter."] =
        "向貿易區的塔文·格瑞斯特取得一株劇毒黃芩，在草藥學訓練師附近取得水泡草，再向盜賊區的毒藥商人取得一份痛苦精華。",
    ["Inject the hissing serum into the system above Othmar's body."] =
        "把嘶嘶作響的血清注入Othmar屍體上方的裝置。",
    ["Bring the Baron's head to Othmar's body, the unfinished abomination."] =
        "把The Baron的頭顱帶到Othmar的屍體旁，那是一具未完成的憎惡。",
    ["Master Apothecary Faranell."] =
        "大藥劑師法拉尼爾。",
    ["Deathguard Kristof, in Brill."] =
        "Deathguard Kristof，在布瑞爾。",
    ["Tabitha Heartweaver, at the Sepulcher."] =
        "Tabitha Heartweaver，在瑟伯切爾。",
    ["Shadowfang Keep"] =
        "影牙城堡",
    ["Keeper Bel'dugur, in Undercity."] =
        "看守者貝爾杜加，在幽暗城。",
    ["Dalar Dawnweaver, at the Sepulcher, in Silverpine Forest."] =
        "達拉爾·道恩維沃爾，在銀松森林的瑟伯切爾。",
    ["Reward: a ring and about 3,300 XP."] =
        "獎勵：一枚戒指和約3,300經驗值。",
    ["High Executor Hadrec, at the Sepulcher."] =
        "高級執行官哈德瑞克，在瑟伯切爾。",
    ["Reward: shoulders of cloth, leather or mail."] =
        "獎勵：布甲、皮甲或鎖甲護肩。",
    ["Enter Shadowfang Keep"] =
        "進入影牙城堡",
    ["The keep stands south of the Sepulcher."] =
        "城堡位於瑟伯切爾南邊。",
    ["Deathstalker Vincent lies in the courtyard: Deathstalker Adamant, freed after Rethilgore, opens its door."] =
        "亡靈哨兵文森特躺在庭院裡：擊敗雷希戈爾後被釋放的亡靈哨兵阿達曼特會打開庭院的門。",
    ["The Book of Ur, a blue book, stands on a bookshelf on the left of Fenrus the Devourer's room."] =
        "烏爾之書是一本藍色的書，放在『吞噬者』芬魯斯房間左側的書架上。",
    ["Archmage Arugal, the last boss, waits at the top of the keep."] =
        "最後一個首領大法師阿魯高在城堡頂端等著。",
    ["Dalar Dawnweaver, at the Sepulcher."] =
        "達拉爾·道恩維沃爾，在瑟伯切爾。",
    ["Tsunaman, at Sun Rock Retreat, in Stonetalon Mountains."] =
        "蘇納曼，在石爪山脈的烈日石居。",
    ["Optional: a lead from Stonetalon to Zoram'gar Outpost."] =
        "可選：一條從石爪山前往Zoram'gar Outpost的線索。",
    ["Je'neu Sancrea, at Zoram'gar Outpost, on Ashenvale's coast."] =
        "耶努薩克雷，在梣谷海岸的Zoram'gar Outpost。",
    ["Je'neu Sancrea, at Zoram'gar Outpost."] =
        "耶努薩克雷，在Zoram'gar Outpost。",
    ["The Earthen Ring's quests: Amongst the Ruins wakes Baron Aquanis, whose drop starts a quest with a sword among its rewards."] =
        "陶土議會的任務：「廢墟之間」會喚醒阿奎尼斯男爵，他掉落的物品會開啟一個任務，獎勵中包括一把劍。",
    ["The deeps open in ruins half under water, on the coast of Zoram Strand."] =
        "深淵的入口在半淹於水中的廢墟裡，位於佐拉姆海岸的岸邊。",
    ["The Sapphires of Aku'Mai grow on the walls of the cave before the dungeon's door."] =
        "阿庫麥爾藍寶石長在地城入口前那個洞穴的牆上。",
    ["The Blackfathom tide priestesses of that cave may drop a damp note: read it."] =
        "那個洞穴裡的黑暗深淵海潮祭司可能掉落潮濕的便箋：閱讀它。",
    ["Back to Je'neu Sancrea, at Zoram'gar Outpost, before the dungeon."] =
        "進入地城前，先回Zoram'gar Outpost找耶努薩克雷。",
    ["Reward: a wand, a shield or leather armor."] =
        "獎勵：一根魔杖、一面盾牌或皮甲護甲。",
    ["Lorgus Jett walks the nooks on the west side, south of the Pool of Ask'ar."] =
        "洛古斯·傑特在Pool of Ask'ar南邊、西側的角落裡走動。",
    ["The Fathom Stone lies under the water in the middle of the Moonshrine Ruins, under the walkway before Kelris; taking its core wakes Baron Aquanis."] =
        "深淵之石在Moonshrine Ruins中央的水下，就在通往克爾里斯的走道下方；拿走它的核心會喚醒阿奎尼斯男爵。",
    ["Baron Aquanis may drop a Strange Water Globe: use it."] =
        "阿奎尼斯男爵可能掉落奇怪的水球：使用它。",
    ["Bashana Runetotem, on the Elder Rise of Thunder Bluff."] =
        "巴珊娜·符文圖騰，在雷霆崖的長者高地。",
    ["Borstan, the meat vendor of Orgrimmar."] =
        "博斯坦，奧格瑪的肉商。",
    ["Reward: a dagger or a satchel of potions."] =
        "獎勵：一把匕首或一袋藥水。",
    ["Zaruk, at Hammerfall, in Arathi Highlands."] =
        "薩魯克，在阿拉希高地的落錘鎮。",
    ["Dragonmaw Rumors leads to Open the Maw, inside the site."] =
        "「Dragonmaw Rumors」會引向挖掘場內的「Open the Maw」。",
    ["The Deathstalker Agent hides in the hills above the Dragonmaw camp, in the Wetlands."] =
        "亡靈衛兵密探躲在濕地龍喉營地上方的山丘上。",
    ["Thicket raptor meat, from the raptors of the site."] =
        "灌木迅猛龍肉，從挖掘場的迅猛龍身上取得。",
    ["The Dragonmaw forces of the site, their thaumaturgists among them."] =
        "挖掘場的龍喉部隊，包括他們的奇術師。",
    ["The Titan relic leads to the Earthen Ring: a staff or a two-handed mace."] =
        "泰坦聖物會引你去找陶土議會：一把法杖或一把雙手錘。",
    ["The Deathstalker Agent, above the Dragonmaw camp."] =
        "亡靈衛兵密探，在龍喉營地上方。",
    ["Borstan, in Orgrimmar."] =
        "博斯坦，在奧格瑪。",
    ["Muln Earthfury, on the Skywatcher Plateau, in the north-west of Mulgore."] =
        "Muln Earthfury，在莫高雷西北部的Skywatcher Plateau。",
    ["Nogg, in his machine shop in the Valley of Honor of Orgrimmar."] =
        "諾格，在奧格瑪榮譽谷他的機械工坊裡。",
    ["Sovik, beside Nogg."] =
        "索維克，在諾格旁邊。",
    ["Scooty's transponder sends you straight to Gnomeregan, far in Dun Morogh, and stays yours."] =
        "斯庫提的傳送器會把你直接送到遠在丹莫洛的諾姆瑞根，而且傳送器會一直歸你所有。",
    ["Wait for Scooty to set up the transponder."] =
        "等斯庫提架設好傳送器。",
    ["The transponder leaves you by the gates of Gnomeregan, in the west of Dun Morogh."] =
        "傳送器會把你送到丹莫洛西部的諾姆瑞根大門旁。",
    ["Optional: an escort, turned in at Booty Bay; it rewards bracers or shoulders."] =
        "可選：一個護送任務，要到藏寶海灣交付；獎勵是護腕或護肩。",
    ["The last boss, Mekgineer Thermaplugg, carries the code of his safe, set in the far wall of the Tinkers' Court next to the third pillar counting from the right."] =
        "最後一個首領麥克尼爾·瑟瑪普拉格身上帶著他保險箱的密碼；保險箱嵌在技工議會最裡面的牆上，在從右邊數來第三根柱子旁。",
    ["Scooty, in Booty Bay."] =
        "斯庫提，在藏寶海灣。",
    ["Nogg, in Orgrimmar."] =
        "諾格，在奧格瑪。",
    ["It opens Hearts of Zeal, a quest of the Scarlet Monastery."] =
        "它會開啟「狂熱之心」，這是血色修道院的任務。",
    ["Auld Stonespire, in Thunder Bluff."] =
        "奧爾德·石塔，在雷霆崖。",
    ["Reward: cloth shoulders, a mail belt or a shield, and about 4,050 XP."] =
        "獎勵：布甲護肩、一條鎖甲腰帶或一面盾牌，以及約4,050經驗值。",
    ["Rau Cliffrunner, at Freewind Post, in Thousand Needles."] =
        "勞恩·峭壁行者，在千針石林的亂風崗。",
    ["The kraul bats of the cave west of the bridges drop the guano."] =
        "橋西邊洞穴裡的沼澤蝙蝠會掉落糞便。",
    ["Charlga may drop a small scroll: read it."] =
        "卡爾加可能掉落小卷軸：閱讀它。",
    ["Willix the Importer waits in a tent below Charlga's platform."] =
        "進口商威利克斯在卡爾加平台下方的一頂帳篷裡等候。",
    ["Master Apothecary Faranell, in Undercity."] =
        "大藥劑師法拉尼爾，在幽暗城。",
    ["It opens An Unholy Alliance, a quest of Razorfen Downs."] =
        "它會開啟「邪惡的盟友」，這是剃刀高地的任務。",
    ["Doctor Martin Felben, in the Apothecarium of Undercity."] =
        "馬丁·費爾本醫生，在幽暗城的鍊金房。",
    ["Reward: a wand or a cloak."] =
        "獎勵：一根魔杖或一件披風。",
    ["Melisara and Magus Wordeen Voidglare, in Tarren Mill, in Hillsbrad Foothills."] =
        "梅里薩拉和魔導師沃迪恩·虛無之光，在希爾斯布萊德丘陵的塔倫米爾。",
    ["Tarren Mill's quests: The Grave Knight brings leather boots or mail bracers."] =
        "塔倫米爾的任務：「The Grave Knight」可獲得皮甲靴子或鎖甲護腕。",
    ["Reward: a staff or mail shoulders."] =
        "獎勵：一把法杖或鎖甲護肩。",
    ["Atrexis the Grave Knight, inside the city."] =
        "Atrexis the Grave Knight，在城內。",
    ["Six cracked sentry cores, from the fragmented sentries of the city."] =
        "六個破裂的哨兵核心，從城內破碎的哨兵身上取得。",
    ["Magus Wordeen Voidglare and Melisara, in Tarren Mill."] =
        "魔導師沃迪恩·虛無之光和梅里薩拉，在塔倫米爾。",
    ["Doctor Martin Felben, in Undercity."] =
        "馬丁·費爾本醫生，在幽暗城。",
    ["Dorn Plainstalker, in Thousand Needles."] =
        "多恩·平原行者，在千針石林。",
    ["Optional: a chain of ten quests through Thousand Needles, Stonetalon, Ashenvale and Undercity, up to a book of the monastery; it ends with a mace or a wand and about 4,200 XP."] =
        "可選：途經千針石林、石爪山、梣谷和幽暗城的十個系列任務，最後要找修道院裡的一本書；完成可獲得一把錘或一根魔杖，以及約4,200經驗值。",
    ["Leap from the wooden planks over the canyon, in the west of Thousand Needles."] =
        "在千針石林西部，從峽谷上方的木板跳下去。",
    ["Grenka Bloodscreech, a harpy of the west of Thousand Needles."] =
        "格林卡·血嘯，千針石林西部的一隻鷹身人。",
    ["Rok'Alim the Pounder, an elemental of the north-west of Thousand Needles."] =
        "羅卡里姆，千針石林西北部的一個元素生物。",
    ["Braug Dimspirit, in the east of Stonetalon Mountains."] =
        "布勞格·幽魂，在石爪山脈東部。",
    ["The Legacy of the Aspects, a book in the south-east of Ashenvale."] =
        "守護巨龍的遺產，梣谷東南部的一本書。",
    ["Braug Dimspirit, in Stonetalon."] =
        "布勞格·幽魂，在石爪山。",
    ["Braug Dimspirit asks a question: give him the right answer."] =
        "布勞格·幽魂會問你一個問題：給他正確的答案。",
    ["Sage Truthseeker, in Thunder Bluff."] =
        "賢者圖希克，在雷霆崖。",
    ["Reward: a shield or an off-hand orb, and about 3,550 XP."] =
        "獎勵：一面盾牌或一顆副手寶珠，以及約3,550經驗值。",
    ["Parqual Fintallas, in Undercity."] =
        "帕科瓦·芬塔拉斯，在幽暗城。",
    ["Reward: a sword, an off-hand cane or a necklace, and about 5,150 XP."] =
        "獎勵：一把劍、一根副手手杖或一條項鍊，以及約5,150經驗值。",
    ["Master Apothecary Faranell, in the Apothecarium."] =
        "大藥劑師法拉尼爾，在鍊金房。",
    ["Graveyard: Vorrel Sengutz lies on a table on the right of the Chamber of Atonement, by Interrogator Vishas."] =
        "墓地區：沃瑞爾·森古斯躺在贖罪之廳右側的一張桌子上，就在審訊員韋沙斯旁邊。",
    ["Reward: a cloth cape or shoulders, or leather boots; the ring it asks for is in the Alterac Mountains."] =
        "獎勵：一件布甲披風或護肩，或皮甲靴子；任務要求的戒指在奧特蘭克山脈。",
    ["Every Scarlet of the monastery may drop a heart."] =
        "修道院裡的每個血色十字軍都可能掉落一顆心臟。",
    ["Library: the book rests on a table, in the first side room on the left as you walk the Gallery of Treasures."] =
        "圖書館區：沿著珍寶迴廊走時，左邊第一個側室的桌上放著那本書。",
    ["Library: the Compendium stands on a bookcase on the left wall at the entrance of the Athenaeum."] =
        "圖書館區：墮落者綱要放在藏書殿入口左側牆邊的書架上。",
    ["Parqual Fintallas asks a question: give him the right answer."] =
        "帕科瓦·芬塔拉斯會問你一個問題：給他正確的答案。",
    ["Varimathras, in the Royal Quarter."] =
        "瓦里瑪薩斯，在皇家區。",
    ["Nancy Vishas, an elite, keeps the ring in a house of the Alterac Mountains."] =
        "精英敵人南茜·韋沙斯在奧特蘭克山脈的一棟房子裡保管著那枚戒指。",
    ["Monika Sengutz, in Tarren Mill, in Hillsbrad Foothills."] =
        "莫尼卡·森古斯，在希爾斯布萊德丘陵的塔倫米爾。",
    ["Andrew Brownell, in Undercity."] =
        "安德魯·布隆奈爾，在幽暗城。",
    ["Reward: a mace, a gun, a cloth robe or a leather chest."] =
        "獎勵：一把錘、一把槍、一件布甲長袍或一件皮甲胸甲。",
    ["Ambassador Malcin walks among the quilboar outside the downs."] =
        "瑪克林大使在剃刀高地外的野豬人之間走動。",
    ["Patrick Garrett, in Undercity."] =
        "派翠克·加勒特，在幽暗城。",
    ["Dran Droffers, in the Drag of Orgrimmar."] =
        "德蘭·杜佛斯，在奧格瑪的暗巷區。",
    ["Dran Droffers's chain goes back and forth between Orgrimmar, Kargath and Uldaman: it ends with a necklace and about 5,600 XP."] =
        "德蘭·杜佛斯的系列任務會在奧格瑪、卡加斯和奧達曼之間來回奔波：最後可獲得一條項鍊和約5,600經驗值。",
    ["Jarkal Mossmeld, at Kargath, in the west of the Badlands."] =
        "加卡爾，在荒蕪之地西部的卡加斯。",
    ["The tablet lies in an ancient chest by the gates of Uldaman, in the north of the Badlands."] =
        "石板在荒蕪之地北部奧達曼大門旁的一個古老的箱子裡。",
    ["The Shadowforge dwarves around the gates drop the power stones and the shattered necklace."] =
        "大門周圍的暗爐矮人會掉落能量石和破碎的項鏈。",
    ["The Garrett family chest stands in the dig west of Uldaman's gates."] =
        "加勒特家族的箱子在奧達曼大門西邊的挖掘場裡。",
    ["Jarkal Mossmeld, at Kargath."] =
        "加卡爾，在卡加斯。",
    ["Dran Droffers, in Orgrimmar."] =
        "德蘭·杜佛斯，在奧格瑪。",
    ["Magenta cap clusters grow on the cave walls, south-west of Uldaman's gates and inside."] =
        "紫色蘑菇長在奧達曼大門西南方以及內部的洞壁上。",
    ["The dungeon's door is at the back of the cave by the dig at Uldaman's gates."] =
        "地城入口在奧達曼大門處挖掘場旁那個洞穴的深處。",
    ["A dead paladin rests just off the first great hall, down its second right-hand passage; then head out for Kargath."] =
        "一位死去的聖騎士就在第一個大廳旁邊，沿著它右手邊的第二條通道下去；然後動身前往卡加斯。",
    ["Enter Uldaman again"] =
        "再次進入奧達曼",
    ["The topaz is in a conspicuous urn south-east of Dig Two, the ruby in a stone chest north-west of Dig Three (it calls monsters), the sapphire on Grimlok at the end of the Stone Vault; Archaedas, the last boss, in the Hall of the Crafters, drops the power source."] =
        "黃寶石在第二挖掘區東南方一個顯眼的罐子裡，紅寶石在第三挖掘區西北方的一個石箱裡（會引來怪物），藍寶石在石窟盡頭的格瑞姆洛克身上；最後一個首領阿札達斯在工匠大廳，會掉落能量源。",
    ["Optional: the Discs of Norgannon, behind Archaedas, tell their story; it ends in Thunder Bluff with potions or a bag."] =
        "可選：阿札達斯後方的諾甘農圓盤會講述它們的故事；最後在雷霆崖結束，可獲得藥水或一個背包。",
    ["Bena Winterhoof, in Thunder Bluff."] =
        "貝娜·冰蹄，在雷霆崖。",
    ["Venom bottles stand in the Witherbark trolls' camps of the south-west of the Hinterlands."] =
        "毒液瓶放在辛特蘭西南部的枯木食人妖營地裡。",
    ["Optional: a chain of six quests between the Hinterlands, Tarren Mill, Durotar and the city; it ends with a shield, a mail chest or a cloth robe."] =
        "可選：在辛特蘭、塔倫米爾、杜洛塔和這座城市之間的六個系列任務；最後可獲得一面盾牌、一件鎖甲胸甲或一件布甲長袍。",
    ["Apothecary Lydon, in Tarren Mill, in Hillsbrad Foothills."] =
        "藥劑師林度恩，在希爾斯布萊德丘陵的塔倫米爾。",
    ["The Witherbark broodguards, spiders of the Hinterlands' troll camps, carry the sacs."] =
        "枯木巢穴守衛是辛特蘭食人妖營地裡的蜘蛛，身上帶著毒囊。",
    ["Apothecary Lydon, in Tarren Mill."] =
        "藥劑師林度恩，在塔倫米爾。",
    ["Master Gadrin, in Sen'jin Village, in Durotar."] =
        "加德林大師，在杜洛塔的森金村。",
    ["A tablet stands in the middle of the scarabs' chamber: read the spider god's name on it."] =
        "聖甲蟲房間的中央立著一塊石板：讀出上面蜘蛛之神的名字。",
    ["Master Gadrin, in Sen'jin Village."] =
        "加德林大師，在森金村。",
    ["Defeat Shadra at her altar of Shadra'Alor, in the south-west of the Hinterlands, and take her venom."] =
        "在辛特蘭西南部Shadra'Alor的祭壇擊敗沙德拉，取得她的毒液。",
    ["Uthel'nay, in the Valley of Spirits of Orgrimmar."] =
        "尤塞爾奈，在奧格瑪的精神谷。",
    ["Vark Battlescar and Selendra, at Shadowprey Village, on the west coast of Desolace."] =
        "瓦克·戰痕和瑟琳德拉，在淒涼之地西岸的葬影村。",
    ["Shadowprey Village's two quests: a ring, plate gauntlets or a leather belt; then Theradras's end brings a sword, a staff or a bow."] =
        "葬影村的兩個任務：一枚戒指、鎧甲護手或一條皮甲腰帶；之後擊敗瑟萊德絲可獲得一把劍、一把法杖或一把弓。",
    ["Vark Battlescar and Selendra, at Shadowprey Village."] =
        "瓦克·戰痕和瑟琳德拉，在葬影村。",
    ["Uthel'nay, in Orgrimmar."] =
        "尤塞爾奈，在奧格瑪。",
    ["Fel'zerul, in Stonard, in the Swamp of Sorrows."] =
        "費澤盧爾，在悲傷沼澤的斯通納德。",
    ["Fel'zerul's chain goes to the Hinterlands and back: it opens The Temple of Atal'Hakkar, a talisman and about 5,900 XP."] =
        "費澤盧爾的系列任務要往返辛特蘭一趟：它會開啟「阿塔哈卡神廟」，可獲得一個護符和約5,900經驗值。",
    ["The Atal'ai artifacts lie in the ruins around the Pool of Tears, in the east of the swamp."] =
        "阿塔萊神器散落在沼澤東部淚水之池周圍的廢墟中。",
    ["Fel'zerul, in Stonard."] =
        "費澤盧爾，在斯通納德。",
    ["Jammal'an the Prophet: cloth leggings or a mail helm, and about 6,550 XP."] =
        "「預言者迦瑪蘭」：布甲腿甲或一頂鎖甲頭盔，以及約6,550經驗值。",
    ["Witch Doctor Uzer'i, at Camp Mojache, in Feralas."] =
        "巫醫尤克里，在菲拉斯的莫沙徹營地。",
    ["Larion, at Marshal's Refuge, in Un'Goro Crater."] =
        "拉里安，在安戈洛環形山的馬紹爾營地。",
    ["Larion's chain leads to the temple's haze; its end brings a bloodpetal zapper."] =
        "拉里安的系列任務會引向神廟裡的霧氣；最後可獲得血瓣花除草器。",
    ["The bloodpetal plants of Un'Goro."] =
        "安戈洛的血瓣花植物。",
    ["Liv Rizzlefix, in Ratchet."] =
        "莉芙·雷茲菲克斯，在棘齒城。",
    ["Every Atal'ai troll of the temple may drop a fetish."] =
        "神廟裡的每個阿塔萊食人妖都可能掉落神像。",
    ["Apothecary Zinge, in the Apothecarium of Undercity."] =
        "藥劑師金格，在幽暗城的鍊金房。",
    ["Optional: a lead from Undercity to Vivian Lagrave, at Kargath."] =
        "可選：一條從幽暗城前往卡加斯找薇薇安·拉格雷的線索。",
    ["Shadowmage Vivian Lagrave, at Kargath, in the west of the Badlands."] =
        "暗影法師薇薇安·拉格雷，在荒蕪之地西部的卡加斯。",
    ["Shadowmage Vivian Lagrave, at Kargath."] =
        "暗影法師薇薇安·拉格雷，在卡加斯。",
    ["Reward: a two-handed axe, a mace or potions."] =
        "獎勵：一把雙手斧、一把錘或藥水。",
    ["Thunderheart, at Kargath."] =
        "桑德哈特，在卡加斯。",
    ["Thunderheart's chain: Disharmony of Fire brings armor of any kind, and opens Commander Gor'shak and The Last Element."] =
        "桑德哈特的系列任務：「不和諧的火焰」可獲得任意類型的護甲，並開啟「指揮官哥沙克」和「最後的元素」。",
    ["Hierophant Theodora Mulvadania, at Kargath."] =
        "祭師塞朵拉·穆瓦丹尼，在卡加斯。",
    ["The Rise of the Machines ends inside the depths with armor of any kind, and about 6,200 XP."] =
        "「機器的崛起」最後在黑石深淵內結束，可獲得任意類型的護甲，以及約6,200經驗值。",
    ["The WANTED poster, at Kargath."] =
        "卡加斯的懸賞告示。",
    ["The wanted posters lead to General Angerforge, and a medallion."] =
        "懸賞告示會引向安格弗將軍，並可獲得一枚徽章。",
    ["The war reavers and obsidian elementals of the Badlands drop the shards."] =
        "荒蕪之地的戰爭搶奪者和黑曜石元素會掉落碎片。",
    ["Lotwil Veriatus, in the west of the Badlands."] =
        "魯特維爾·沃拉圖斯，在荒蕪之地西部。",
    ["Galamav the Marksman, at Kargath."] =
        "『神射手』賈拉瑪弗，在卡加斯。",
    ["Commander Gor'shak's chain leads to Thrall, the emperor and the princess: about 9,950 XP at its end, and Thrall's reward."] =
        "指揮官哥沙克的系列任務會引向索爾、大帝和公主：最後可獲得約9,950經驗值和索爾的獎勵。",
    ["Blackrock Mountain opens in the south of the Searing Gorge; inside, the depths' door is at the bottom of the mountain."] =
        "黑石山的入口在灼熱峽谷南部；進去後，黑石深淵的入口在山的底部。",
    ["High Interrogator Gerstahn, in a back room on the right of the Detention Block, carries the cell key; Commander Gor'shak sits in the first cell on the left of the tunnel."] =
        "審訊官格斯塔恩在禁閉區右側的後室裡，身上帶著牢房鑰匙；指揮官哥沙克坐在隧道左側的第一間牢房裡。",
    ["Defend Gor'shak against two waves of guards."] =
        "保護哥沙克，擋下兩波守衛。",
    ["Talk to Kharan Mighthammer, in the first cell on the left across the hallway."] =
        "和走廊對面左側第一間牢房裡的卡蘭·巨錘交談。",
    ["The Anvilrage guardsmen, wardens and footmen of the Detention Block and the halls."] =
        "禁閉區和各大廳裡的鐵怒衛士、鐵怒衛兵和鐵怒步卒。",
    ["Lord Incendius waits at the Black Anvil, in Shadowforge City: he carries the Tablet of Kurniya."] =
        "伊森迪奧斯領主在影爐城的黑鐵砧旁：他身上帶著庫爾尼亞石板。",
    ["Golem Lord Argelmach waits in the Manufactory; his golems and constructs drop the cores and the essences."] =
        "魔像領主阿格曼奇在製造廠裡；他的魔像和構造體會掉落核心和精華。",
    ["Warlord Goretooth, at Kargath."] =
        "督軍高圖斯，在卡加斯。",
    ["The KILL ON SIGHT poster, at Kargath."] =
        "卡加斯的「格殺勿論」告示。",
    ["Thrall, in Grommash Hold, in Orgrimmar."] =
        "索爾，在奧格瑪的Grommash Hold。",
    ["The Anvilrage medics, soldiers and officers of the halls."] =
        "各大廳裡的鐵怒醫師、鐵怒士兵和鐵怒軍官。",
    ["Warlord Goretooth, then Lexlort, at Kargath."] =
        "先找督軍高圖斯，再找雷克斯洛特，都在卡加斯。",
    ["Grark Lorkrub, held in the Blackrock Stronghold of the Burning Steppes."] =
        "格拉克·洛克魯布，被關在燃燒平原的黑石要塞。",
    ["Optional: an escort in the Burning Steppes, then a third visit for General Angerforge: a medallion and about 7,750 XP."] =
        "可選：在燃燒平原的一個護送任務，之後第三次進入地城擊殺安格弗將軍：可獲得一枚徽章和約7,750經驗值。",
    ["Bind Grark Lorkrub with the shackles and lead him through Blackrock Mountain to the Searing Gorge."] =
        "用鐐銬綁住格拉克·洛克魯布，帶著他穿過黑石山前往灼熱峽谷。",
    ["Lexlort, then Warlord Goretooth, at Kargath."] =
        "先找雷克斯洛特，再找督軍高圖斯，都在卡加斯。",
    ["Enter Blackrock Depths a third time"] =
        "第三次進入黑石深淵",
    ["General Angerforge waits down the stairs of the West Garrison."] =
        "安格弗將軍在西部要塞的樓梯下方。",
    ["Galamav the Marksman, at Kargath, in the west of the Badlands."] =
        "『神射手』賈拉瑪弗，在荒蕪之地西部的卡加斯。",
    ["Lexlort, at Kargath."] =
        "雷克斯洛特，在卡加斯。",
    ["Lexlort's chain: Bijou's report brings cloth gloves or a mail belt."] =
        "雷克斯洛特的系列任務：比修的報告可換得布甲手套或一條鎖甲腰帶。",
    ["Reward: armor of any kind, for the spire's three generals and their documents."] =
        "獎勵：任意類型的護甲，需要擊敗黑石塔的三名將領並取得他們的文件。",
    ["Blackrock Mountain opens in the south of the Searing Gorge; inside, the spire's door is at the top of the mountain."] =
        "黑石山的入口在灼熱峽谷南部；進去後，黑石塔的入口在山的頂部。",
    ["Highlord Omokk, north of Mok'Doom; War Master Voone, at the bottom of Tazz'Alaor; Overlord Wyrmthalak, the last boss, in the Chamber of Battle. The documents lie in one of their rooms, or by Urok's tribute pile."] =
        "歐莫克大王在Mok'Doom北邊；指揮官沃恩在Tazz'Alaor底部；最後一個首領維姆薩拉克主宰在戰鬥大廳。文件在他們其中一人的房間裡，或在烏洛克的貢品堆旁。",
    ["Galamav the Marksman, Lexlort and Warlord Goretooth, at Kargath."] =
        "『神射手』賈拉瑪弗、雷克斯洛特和督軍高圖斯，在卡加斯。",
    ["A herald of your capital: Harbinger Balthazad, Warcaller Gorlach or Bluff Runner Windstrider."] =
        "你主城的傳令者：預言者巴薩札德、公告員高拉克或雷霆崖信差斯塔德爾。",
    ["Optional: a lead to Camp Mojache, about 1,500 XP."] =
        "可選：一條前往莫沙徹營地的線索，約1,500經驗值。",
    ["Talo Thornhoof, at Camp Mojache, in Feralas."] =
        "塔羅·刺蹄，在菲拉斯的莫沙徹營地。",
    ["Talo Thornhoof and Sage Korolusk, at Camp Mojache."] =
        "塔羅·刺蹄和先知科魯拉克，在莫沙徹營地。",
    ["Talo Thornhoof, at Camp Mojache."] =
        "塔羅·刺蹄，在莫沙徹營地。",
    ["Sage Korolusk, at Camp Mojache."] =
        "先知科魯拉克，在莫沙徹營地。",
    ["Harbinger Balthazad, in the Valley of Honor of Orgrimmar."] =
        "預言者巴薩札德，在奧格瑪的榮譽谷。",
    ["High Executor Derrington, at the Bulwark, in the Western Plaguelands."] =
        "高級執行官德靈頓，在西瘟疫之地的亡靈壁壘。",
    ["Burn the Scarlet command tent between Felstone Field and Dalson's Tears, and plant the Scourge banner there."] =
        "燒掉費爾斯通農場和達爾松之淚之間的血色十字軍指揮帳篷，並在那裡插上天譴軍團旌旗。",
    ["Apothecary Dithers, at the Bulwark."] =
        "藥劑師迪瑟斯，在亡靈壁壘。",
    ["Apothecary Dithers, at the Bulwark, in the Western Plaguelands."] =
        "藥劑師迪瑟斯，在西瘟疫之地的亡靈壁壘。",
    ["Alexi Barov, at the Bulwark."] =
        "阿萊克斯·巴羅夫，在亡靈壁壘。",
    ["The Barov fortune: four deeds inside the school; its follow-up sends you to kill Weldon Barov in the Alliance's Chillwind Camp."] =
        "巴羅夫家族的寶藏：學院內的四張地契；後續任務會派你去聯盟的冰風崗擊殺維爾頓·巴羅夫。",
    ["Weldon Barov stands among the guards of Chillwind Camp, the Alliance's camp in the west of the Western Plaguelands."] =
        "維爾頓·巴羅夫站在冰風崗的守衛之中，那是聯盟位於西瘟疫之地西部的營地。",
    ["Nathanos Blightcaller, at Marris Stead, in the south-west of the Eastern Plaguelands."] =
        "納薩諾斯·凋零者，在東瘟疫之地西南部的瑪瑞斯農場。",
    ["Optional: Nathanos Blightcaller's chain in the Eastern Plaguelands, up to Ramstein the Gorger inside the city: about 6,600 XP at its end."] =
        "可選：納薩諾斯·凋零者在東瘟疫之地的系列任務，最後要對付城內的『暴食者』拉姆斯登：結束時約可獲得6,600經驗值。",
    ["Corin's Crossing, to the east: collect the living rot in ten minutes, then grind it with the mortar."] =
        "東邊的考林路口：在十分鐘內收集生命腐質，然後用研缽把它磨碎。",
    ["The plaguebats of the Eastern Plaguelands."] =
        "東瘟疫之地的瘟疫蝙蝠。",
    ["The Quel'Thalas Registry lies in the Quel'Lithien lodge, on the northern border."] =
        "奎爾薩拉斯名冊在北方邊境的奎爾林斯小屋裡。",
    ["Duskwing, a bat, roams the country; Borelgore walks the northern wastes."] =
        "暗翼蝠是一隻在這片土地上遊蕩的蝙蝠；淤血蟲則在北方的荒地上走動。",
    ["Ramstein the Gorger comes into Slaughter Square once it is cleared."] =
        "屠殺廣場清空後，『暴食者』拉姆斯登就會進入廣場。",
    ["Nathanos Blightcaller, at Marris Stead."] =
        "納薩諾斯·凋零者，在瑪瑞斯農場。",
}
