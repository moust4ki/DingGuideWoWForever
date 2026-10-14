-- Simplified Chinese guide texts: [English text] = Simplified Chinese text, one entry per
-- phrase of the guides (zone names of the titles, route intros, automatic notes, hand-written notes).
-- tools/translate_guides.lua writes Ding/Locales/Guides/zhCN/ from it; a note joining several
-- phrases is translated phrase by phrase, the phrases joined without a space (each one ends
-- with its own full-width punctuation). Place names follow the Simplified Chinese client.
-- Keys: the English texts of the routes (tools/routes/*.lua), the automatic notes of
-- tools/draft_guide.lua and Ding/Guides/NightElf/01_Shadowglen.lua (same keys as frFR.lua).
return {
    -- Shadowglen (hand-written guide)
    ["Shadowglen"] =
        "幽影谷",
    ["Both quest givers stand right in front of you, at the foot of Aldrassil."] =
        "两位任务发布者就在正前方的奥达希尔脚下。",
    ["Young nightsabers and thistle boars all around Aldrassil: kill everything you come across."] =
        "奥达希尔四周都是夜刃豹幼崽和草刺野猪：见到就杀。",
    ["Tarindrella stands a little southwest of Aldrassil (57.8, 45.2)."] =
        "塔琳德拉站在奥达希尔西南不远处 (57.8, 45.2)。",
    ["The class trainers are inside Aldrassil."] =
        "职业训练师都在奥达希尔里面。",
    ["Gilshalan needs level 3: if you are not there yet, Ding! will remind you before the cave."] =
        "基尔沙兰的任务需要3级：等级不够的话，Ding!会在进洞前提醒。",
    ["One single loop: mangy nightsabers and boars to the north, moss on the grells, totems to the west (54, 40)."] =
        "一圈搞定：北边打癞皮夜刃豹和野猪，劣魔身上取魔苔，西边找图腾 (54, 40)。",
    ["Iverron waits in front of the cave, to the north (54.6, 33)."] =
        "埃沃隆在北边的洞口等候 (54.6, 33)。",
    ["Spiders in the cave, right behind Iverron."] =
        "蜘蛛在洞里，就在埃沃隆身后。",
    ["Githyiss the Vile, at the back of the cave (56.6, 26.3), may drop a fang: use it from your bags."] =
        "邪恶的基塞伊斯在洞穴深处 (56.6, 26.3)，可能掉落一颗尖牙：在背包中使用。",
    ["Back to Aldrassil: everything is turned in at the same place."] =
        "返回奥达希尔：所有任务都在同一处交付。",
    ["Mushrooms on the grells, lilies north of Aldrassil (57, 37), ichor on the spiders, egg at the back of the cave."] =
        "劣魔身上取蘑菇，奥达希尔北边采百合花 (57, 37)，蜘蛛身上取脓液，洞穴深处拿蜘蛛卵。",
    ["Iverron, still in front of the cave."] =
        "埃沃隆，仍在洞口。",
    ["Tenaron is at the very top of Aldrassil: follow the ramp that winds up around the trunk."] =
        "特纳隆在奥达希尔顶端：沿着绕树干盘旋而上的坡道走。",
    ["Fill the phial at the moonwell, to the northeast (60, 33)."] =
        "在东北边的月亮井装满水晶瓶 (60, 33)。",
    ["Porthannius, on the road out of Shadowglen."] =
        "伯萨努斯，在离开幽影谷的路上。",
    ["Head for Dolanaar"] =
        "前往多兰纳尔",
    ["Follow the road south to the inn: both open quests are turned in at Dolanaar."] =
        "沿路向南到旅店：两个进行中的任务都在多兰纳尔交付。",
    -- human
    ["Northshire"] =
        "北郡",
    ["Everything happens around Northshire Abbey: follow the arrow from NPC to NPC."] =
        "全程都在北郡修道院周围：跟随箭头逐个找NPC。",
    ["Elwynn Forest"] =
        "艾尔文森林",
    ["Goldshire is your base for the whole forest: inn, class trainers and quests."] =
        "闪金镇是整片森林的据点：旅店、职业训练师和任务都在这里。",
    ["Westfall"] =
        "西部荒野",
    ["Head west on the Goldshire road, then to Sentinel Hill in the middle of Westfall."] =
        "沿闪金镇的道路向西，再前往西部荒野中部的哨兵岭。",
    ["Loch Modan"] =
        "洛克莫丹",
    ["Take the Deeprun Tram from Stormwind to Ironforge, then the road east through Dun Morogh to Thelsamar."] =
        "在暴风城乘坐矿道地铁到铁炉堡，再沿东边的道路穿过丹莫罗到塞尔萨玛。",
    -- dwarf_gnome
    ["Coldridge Valley"] =
        "寒脊山谷",
    ["Everything starts in Coldridge: follow the arrow from NPC to NPC."] =
        "一切从寒脊山谷开始：跟随箭头逐个找NPC。",
    ["Dun Morogh"] =
        "丹莫罗",
    ["Leave the valley through the tunnel to the northeast: Kharanos is your base for Dun Morogh."] =
        "从东北的隧道离开山谷：卡拉诺斯是丹莫罗的据点。",
    ["Take the road east through the South Gate tunnel to Thelsamar."] =
        "沿东边的道路穿过南门隧道到塞尔萨玛。",
    ["Deeprun Tram from Ironforge to Stormwind, then the road west through Goldshire to Sentinel Hill."] =
        "从铁炉堡乘坐矿道地铁到暴风城，再沿西边的道路经闪金镇到哨兵岭。",
    -- nightelf
    ["Teldrassil"] =
        "泰达希尔",
    ["Dolanaar is your base for Teldrassil: inn, class trainers and most quests."] =
        "多兰纳尔是泰达希尔的据点：旅店、职业训练师和大部分任务都在这里。",
    ["Darkshore"] =
        "黑海岸",
    ["Rut'theran (portal at the foot of Darnassus), then the boat to Auberdine: your base on Darkshore."] =
        "前往鲁瑟兰村（达纳苏斯脚下的传送门），再坐船到奥伯丁：这是黑海岸的据点。",
    ["Boat from Auberdine to Menethil Harbor, then the road east through the Wetlands to Loch Modan: Thelsamar is your base."] =
        "从奥伯丁坐船到米奈希尔港，再沿东边的道路穿过湿地到洛克莫丹：塞尔萨玛是据点。",
    -- alliance
    ["Redridge Mountains"] =
        "赤脊山",
    ["Redridge is east of Elwynn Forest: follow the road east to Lakeshire. Night Elves: boat from Auberdine to Menethil, Ironforge, then the tram to Stormwind."] =
        "赤脊山在艾尔文森林以东：沿东边的道路到湖畔镇。暗夜精灵：从奥伯丁坐船到米奈希尔港，经铁炉堡，再乘地铁到暴风城。",
    ["Duskwood"] =
        "暮色森林",
    ["Duskwood is south of Elwynn: Darkshire, in the east of the forest, is your base."] =
        "暮色森林在艾尔文森林以南：森林东部的夜色镇是据点。",
    ["Wetlands"] =
        "湿地",
    ["The Wetlands are north of Loch Modan: Menethil Harbor, on the west coast, is your base."] =
        "湿地在洛克莫丹以北：西海岸的米奈希尔港是据点。",
    ["Ashenvale"] =
        "灰谷",
    ["Boat from Menethil to Auberdine, then the road south to Ashenvale: Astranaar is your base."] =
        "从米奈希尔港坐船到奥伯丁，再沿南边的道路到灰谷：阿斯特兰纳是据点。",
    ["Stonetalon Mountains"] =
        "石爪山脉",
    ["The Stonetalon Mountains are west of Ashenvale."] =
        "石爪山脉在灰谷以西。",
    ["Back to Astranaar for the last Ashenvale quests."] =
        "返回阿斯特兰纳，完成灰谷最后的任务。",
    ["Back to Duskwood for the end of its quests: Darkshire is still your base."] =
        "返回暮色森林完成剩余任务：据点仍是夜色镇。",
    ["Hillsbrad Foothills"] =
        "希尔斯布莱德丘陵",
    ["From Menethil, the road north crosses Thandol Span to the Foothills: Southshore is your base."] =
        "从米奈希尔港沿北边的道路跨过萨多尔大桥到丘陵：南海镇是据点。",
    ["Thousand Needles"] =
        "千针石林",
    ["Reach Thousand Needles through Theramore and the southern Barrens, or through Feralas; the goblin camp in the east is your base."] =
        "经塞拉摩和贫瘠之地南部，或经菲拉斯前往千针石林；东部的地精营地是据点。",
    ["Desolace"] =
        "凄凉之地",
    ["Desolace is south of the Stonetalon Mountains: the Alliance base is in the northeast of the zone."] =
        "凄凉之地在石爪山脉以南：联盟据点在该区域东北部。",
    ["Stranglethorn Vale"] =
        "荆棘谷",
    ["Stranglethorn Vale is south of Duskwood: Rebel Camp in the north, Booty Bay in the south."] =
        "荆棘谷在暮色森林以南：北部有反抗军营地，南部有藏宝海湾。",
    ["Arathi Highlands"] =
        "阿拉希高地",
    ["The Arathi Highlands are north of the Wetlands, across Thandol Span."] =
        "阿拉希高地在湿地以北，跨过萨多尔大桥即到。",
    ["Dustwallow Marsh"] =
        "尘泥沼泽",
    ["Boat from Menethil to Theramore, the Alliance base on the edge of the marsh."] =
        "从米奈希尔港坐船到沼泽边缘的联盟据点塞拉摩。",
    ["Badlands"] =
        "荒芜之地",
    ["The Badlands are southeast of Loch Modan."] =
        "荒芜之地在洛克莫丹东南。",
    ["Swamp of Sorrows"] =
        "悲伤沼泽",
    ["The Swamp of Sorrows is east of Deadwind Pass, south of Redridge."] =
        "悲伤沼泽在逆风小径以东、赤脊山以南。",
    ["Back to Stranglethorn for the end of its quests, from Booty Bay."] =
        "返回荆棘谷，从藏宝海湾出发完成剩余任务。",
    ["Tanaris"] =
        "塔纳利斯",
    ["Gadgetzan, in the north of Tanaris, is your base. Boat from Booty Bay to Ratchet, or fly from Theramore."] =
        "塔纳利斯北部的加基森是据点。从藏宝海湾坐船到棘齿城，或从塞拉摩飞过去。",
    ["Feralas"] =
        "菲拉斯",
    ["The Alliance stronghold of Feralas is on an island west of the zone."] =
        "菲拉斯的联盟要塞在该区域西边的岛上。",
    ["The Hinterlands"] =
        "辛特兰",
    ["The Hinterlands are northeast of Hillsbrad Foothills: the Wildhammer aerie is in the west."] =
        "辛特兰在希尔斯布莱德丘陵东北：蛮锤矮人的鹰巢山在西部。",
    ["Searing Gorge"] =
        "灼热峡谷",
    ["Searing Gorge is south of Loch Modan, through the Badlands."] =
        "灼热峡谷在洛克莫丹以南，需穿过荒芜之地。",
    ["Blasted Lands"] =
        "诅咒之地",
    ["Fly to the Blasted Lands, south of the Swamp of Sorrows: the Alliance keep in the north of the zone is your base."] =
        "飞往悲伤沼泽以南的诅咒之地：该区域北部的联盟要塞就是你的据点。",
    ["Un'Goro Crater"] =
        "安戈洛环形山",
    ["Un'Goro Crater opens southwest of Tanaris: take the ramp down from Gadgetzan."] =
        "安戈洛环形山位于塔纳利斯西南：从加基森出发沿坡道下去。",
    ["Azshara"] =
        "艾萨拉",
    ["Azshara is east of Ashenvale."] =
        "艾萨拉在灰谷以东。",
    ["Felwood"] =
        "费伍德森林",
    ["Felwood is north of Ashenvale: the Alliance base is in the south of the zone."] =
        "费伍德森林在灰谷以北：联盟据点在该区域南部。",
    ["Burning Steppes"] =
        "燃烧平原",
    ["The Burning Steppes are north of Redridge: the Alliance camp is in the east of the zone."] =
        "燃烧平原在赤脊山以北：联盟营地在该区域东部。",
    ["Winterspring"] =
        "冬泉谷",
    ["Winterspring is northeast of Felwood: Everlook is your base."] =
        "冬泉谷在费伍德森林东北：永望镇是据点。",
    ["Western Plaguelands"] =
        "西瘟疫之地",
    ["The Western Plaguelands are north of Hillsbrad Foothills: the Alliance camp is in the south of the zone."] =
        "西瘟疫之地在希尔斯布莱德丘陵以北：联盟营地在该区域南部。",
    ["Eastern Plaguelands"] =
        "东瘟疫之地",
    ["The Eastern Plaguelands continue the Western ones to the east: Light's Hope Chapel is in the east."] =
        "东瘟疫之地紧邻西瘟疫之地东侧：圣光之愿礼拜堂在东部。",
    ["Silithus"] =
        "希利苏斯",
    ["Silithus is south of Un'Goro Crater: Cenarion Hold is in the north of the zone."] =
        "希利苏斯在安戈洛环形山以南：塞纳里奥要塞在该区域北部。",
    -- orc_troll
    ["Valley of Trials"] =
        "试炼谷",
    ["Everything happens in the Valley of Trials: follow the arrow from NPC to NPC."] =
        "全程都在试炼谷：跟随箭头逐个找NPC。",
    ["Durotar"] =
        "杜隆塔尔",
    ["Leave the valley by the road east, then north to Razor Hill: your base for Durotar."] =
        "沿东边的道路离开山谷，再向北到剃刀岭：这是杜隆塔尔的据点。",
    ["The Barrens"] =
        "贫瘠之地",
    ["Cross the bridge west of Razor Hill into the Barrens, then follow the road to the Crossroads: your base."] =
        "过剃刀岭西边的桥进入贫瘠之地，再沿路到十字路口：这是据点。",
    -- tauren
    ["Camp Narache"] =
        "纳拉其营地",
    ["Everything starts at Camp Narache: follow the arrow from NPC to NPC."] =
        "一切从纳拉其营地开始：跟随箭头逐个找NPC。",
    ["Mulgore"] =
        "莫高雷",
    ["Follow the road north out of Camp Narache to Bloodhoof Village: your base for Mulgore."] =
        "从纳拉其营地沿北边的道路到血蹄村：这是莫高雷的据点。",
    ["Leave Mulgore by the road east into the Barrens, then north to the Crossroads: your base."] =
        "沿东边的道路离开莫高雷进入贫瘠之地，再向北到十字路口：这是据点。",
    -- undead
    ["Deathknell"] =
        "丧钟镇",
    ["Everything starts in Deathknell: follow the arrow from NPC to NPC."] =
        "一切从丧钟镇开始：跟随箭头逐个找NPC。",
    ["Tirisfal Glades"] =
        "提瑞斯法林地",
    ["Leave Deathknell by the road east to Brill: your base for Tirisfal Glades."] =
        "沿东边的道路离开丧钟镇到布瑞尔：这是提瑞斯法林地的据点。",
    ["Silverpine Forest"] =
        "银松森林",
    ["From Brill, take the road west then south over the bridge into Silverpine Forest: the Sepulcher is your base."] =
        "从布瑞尔沿道路向西，再向南过桥进入银松森林：瑟伯切尔是据点。",
    ["Zeppelin from the towers outside Undercity to Orgrimmar, then the road west and south to the Crossroads: your base for the Barrens."] =
        "在幽暗城外的飞艇塔乘飞艇到奥格瑞玛，再向西、向南到十字路口：这是贫瘠之地的据点。",
    -- horde
    ["The Barrens and Stonetalon"] =
        "贫瘠之地和石爪山脉",
    ["The Crossroads, in the middle of the Barrens, is your base; the Stonetalon Mountains are west of the Barrens."] =
        "贫瘠之地中部的十字路口是据点；石爪山脉在贫瘠之地以西。",
    ["Ashenvale is north of the Barrens: Splintertree Post, in the east of the forest, is your base."] =
        "灰谷在贫瘠之地以北：森林东部的碎木岗哨是据点。",
    ["Zeppelin from the tower outside Orgrimmar to Undercity, then the road south through Silverpine Forest to Tarren Mill: your base."] =
        "在奥格瑞玛外的飞艇塔乘飞艇到幽暗城，再沿南边的道路穿过银松森林到塔伦米尔：这是据点。",
    ["Zeppelin back to Orgrimmar for the higher quests of the Barrens and the Stonetalon Mountains."] =
        "乘飞艇返回奥格瑞玛，做贫瘠之地和石爪山脉等级更高的任务。",
    ["Thousand Needles is south of the Barrens, down the Great Lift: Freewind Post is your base."] =
        "千针石林在贫瘠之地以南，乘升降梯下去：乱风岗是据点。",
    ["Hillsbrad, Alterac and Arathi"] =
        "希尔斯布莱德、奥特兰克和阿拉希",
    ["Zeppelin to Undercity, then Tarren Mill again; the Alterac Mountains are north of the Foothills, the Arathi Highlands east, with Hammerfall in the east of the highlands."] =
        "乘飞艇到幽暗城，再次前往塔伦米尔；奥特兰克山脉在丘陵以北，阿拉希高地在丘陵以东，落锤镇在高地东部。",
    ["Desolace is south of the Stonetalon Mountains: the Horde village is on the west coast."] =
        "凄凉之地在石爪山脉以南：部落村庄在西海岸。",
    ["Zeppelin from Orgrimmar to Grom'gol, the Horde camp in the north of Stranglethorn."] =
        "从奥格瑞玛乘飞艇到荆棘谷北部的部落营地格罗姆高。",
    ["Dustwallow and Thousand Needles"] =
        "尘泥沼泽和千针石林",
    ["Zeppelin back to Orgrimmar. Dustwallow Marsh is east of the southern Barrens, with Brackenwall Village in the north of the marsh; the Shimmering Flats are in the east of Thousand Needles."] =
        "乘飞艇返回奥格瑞玛。尘泥沼泽在贫瘠之地南部以东，蕨墙村在沼泽北部；闪光平原在千针石林东部。",
    ["Back to the Arathi Highlands: Hammerfall is in the east of the zone."] =
        "返回阿拉希高地：落锤镇在该区域东部。",
    ["Fly from Hammerfall to Kargath, in the west of the Badlands."] =
        "从落锤镇飞往荒芜之地西部的卡加斯。",
    ["Back to Stranglethorn for the end of its quests, from Grom'gol and Booty Bay."] =
        "返回荆棘谷，从格罗姆高和藏宝海湾出发完成剩余任务。",
    ["The Swamp of Sorrows is east of Deadwind Pass: Stonard is your base."] =
        "悲伤沼泽在逆风小径以东：斯通纳德是据点。",
    ["Feralas is west of Thousand Needles: Camp Mojache, in the east of the zone, is your base."] =
        "菲拉斯在千针石林以西：该区域东部的莫沙彻营地是据点。",
    ["Gadgetzan, in the north of Tanaris, is your base: the road south through Thousand Needles, or the boat from Booty Bay to Ratchet."] =
        "塔纳利斯北部的加基森是据点：沿南边的道路穿过千针石林，或从藏宝海湾坐船到棘齿城。",
    ["The Hinterlands are east of Hillsbrad Foothills: the Revantusk troll village is on the east coast."] =
        "辛特兰在希尔斯布莱德丘陵以东：巨魔村庄恶齿村在东海岸。",
    ["Searing Gorge is south of the Badlands: fly to Kargath, then the road south. The Burning Steppes are south of the gorge."] =
        "灼热峡谷在荒芜之地以南：飞往卡加斯，再沿南边的道路走。燃烧平原在峡谷以南。",
    ["Azshara is east of Ashenvale: Valormok, in the southwest of the zone, is your base."] =
        "艾萨拉在灰谷以东：该区域西南部的瓦罗莫克是据点。",
    ["Felwood is north of Ashenvale: the Horde post is in the west of the zone."] =
        "费伍德森林在灰谷以北：部落哨站在该区域西部。",
    ["The Western Plaguelands are east of Tirisfal Glades: the Bulwark guards the border, east of Brill."] =
        "西瘟疫之地在提瑞斯法林地以东：亡灵壁垒在布瑞尔以东守卫边境。",
    -- automatic notes
    ["If the starting item dropped: use it from your bags."] =
        "如果掉落了任务起始物品：在背包中使用。",
    ["Human"] =
        "人类",
    ["Dwarf and Gnome"] =
        "矮人和侏儒",
    ["Night Elf"] =
        "暗夜精灵",
    ["Orc and Troll"] =
        "兽人和巨魔",
    ["Tauren"] =
        "牛头人",
    ["Undead"] =
        "亡灵",
    ["Alliance"] =
        "联盟",
    ["Horde"] =
        "部落",
    ["From here the guide moves between zones by itself: the first step in a zone says how to get there."] =
        "从这里开始，指南会自动在区域之间切换：每个区域的第一步会告诉你怎么去。",
    ["Shortcut: let monsters kill you, release your spirit and come back to life at the spirit healer, then go on."] =
        "捷径：让怪物杀死你，释放灵魂，在灵魂医者处复活，然后继续。",
    ["Finish the level on nearby monsters before moving on."] =
        "先在附近打怪升完这一级再继续。",
    -- Ding - Leveling (Leveling routes): notes, step texts and section titles
    ["Human start"] =
        "人类起始",
    ["Night Elf start"] =
        "暗夜精灵起始",
    ["Tauren start"] =
        "牛头人起始",
    ["Undead start"] =
        "亡灵起始",
    -- Skyborne start (tools/routes/skyborne.lua)
    ["Skyborne start"] =
        "Skyborne起始",
    ["Everything starts on Zephras Isle: follow the arrow from NPC to NPC."] =
        "一切从Zephras Isle开始：跟随箭头逐个找NPC。",
    -- Ding - Leveling (Leveling routes): notes of the goal and condition steps
    -- Ding - Leveling: how each section begins (tools/routes/leveling/travel.lua)
    ["Elwynn Forest: Northshire Abbey, where every human starts."] =
        "艾尔文森林：北郡修道院，所有人类的起点。",
    ["Dun Morogh: Coldridge Valley, where dwarves and gnomes start."] =
        "丹莫罗：寒脊山谷，矮人和侏儒的起点。",
    ["Teldrassil: Shadowglen, where night elves start."] =
        "泰达希尔：幽影谷，暗夜精灵的起点。",
    ["Travel to Westfall"] =
        "前往西部荒野",
    ["Westfall: Sentinel Hill is the hub, in the middle of the zone. The first stop is the farm in the north."] =
        "西部荒野：哨兵岭是据点，在该区域中部。第一站是北部的农场。",
    ["Travel to Auberdine"] =
        "前往奥伯丁",
    ["Darkshore: Auberdine, the port on the west coast."] =
        "黑海岸：奥伯丁，西海岸的港口。",
    ["Travel to Thelsamar"] =
        "前往塞尔萨玛",
    ["Loch Modan: Thelsamar, on the road in the west of the zone."] =
        "洛克莫丹：塞尔萨玛，在该区域西部的道路上。",
    ["Travel to Redridge Mountains"] =
        "前往赤脊山",
    ["Redridge Mountains: Lakeshire is the hub, by the lake. The first stop is the western pass from Elwynn Forest."] =
        "赤脊山：湖畔镇是据点，在湖边。第一站是从艾尔文森林进来的西部山口。",
    ["Ashenvale: Maestra's Post in the west, then Astranaar in the middle of the zone."] =
        "灰谷：先到西部的迈斯特拉岗哨，再到该区域中部的阿斯特兰纳。",
    ["Travel to Menethil Harbor"] =
        "前往米奈希尔港",
    ["Wetlands: Menethil Harbor, on the west coast."] =
        "湿地：米奈希尔港，在西海岸。",
    ["Travel to Darkshire"] =
        "前往夜色镇",
    ["Duskwood: Darkshire, in the east of the zone."] =
        "暮色森林：夜色镇，在该区域东部。",
    ["Travel to Stonetalon Peak"] =
        "前往石爪峰",
    ["Stonetalon Mountains: Stonetalon Peak, in the far north of the zone."] =
        "石爪山脉：石爪峰，在该区域最北端。",
    ["Stormwind first, then Duskwood and Stranglethorn Vale."] =
        "先到暴风城，再到暮色森林和荆棘谷。",
    ["Travel to Southshore"] =
        "前往南海镇",
    ["Hillsbrad Foothills: Southshore, on the coast in the south."] =
        "希尔斯布莱德丘陵：南海镇，在南部海岸。",
    ["Dustwallow Marsh: Theramore Isle, off the east coast."] =
        "尘泥沼泽：塞拉摩岛，在东海岸外。",
    ["Travel to Booty Bay"] =
        "前往藏宝海湾",
    ["Stranglethorn Vale: Booty Bay, at the southern tip. The boat from Ratchet lands there."] =
        "荆棘谷：藏宝海湾，在最南端。从棘齿城出发的船在那里靠岸。",
    ["Desolace: Nijel's Point, in the north-east corner, is the Alliance hub."] =
        "凄凉之地：尼耶尔前哨站，在东北角，是联盟据点。",
    ["Stranglethorn Vale: Booty Bay, at the southern tip."] =
        "荆棘谷：藏宝海湾，在最南端。",
    ["Stormwind first, then the Swamp of Sorrows."] =
        "先到暴风城，再到悲伤沼泽。",
    ["Travel to Refuge Pointe"] =
        "前往避难谷地",
    ["Arathi Highlands: Refuge Pointe, in the middle of the zone."] =
        "阿拉希高地：避难谷地，在该区域中部。",
    ["Stormwind first, then Dustwallow Marsh: Theramore Isle."] =
        "先到暴风城，再到尘泥沼泽：塞拉摩岛。",
    ["Travel to Nijel's Point"] =
        "前往尼耶尔前哨站",
    ["Desolace: Nijel's Point, in the north-east corner."] =
        "凄凉之地：尼耶尔前哨站，在东北角。",
    ["Ironforge first, then the Badlands."] =
        "先到铁炉堡，再到荒芜之地。",
    ["Travel to Stormwind"] =
        "前往暴风城",
    ["Stormwind first, then Stranglethorn Vale."] =
        "先到暴风城，再到荆棘谷。",
    ["Duskwood: Darkshire first, then the Swamp of Sorrows."] =
        "暮色森林：先到夜色镇，再到悲伤沼泽。",
    ["Travel to Gadgetzan"] =
        "前往加基森",
    ["Tanaris: Gadgetzan, in the north of the zone."] =
        "塔纳利斯：加基森，在该区域北部。",
    ["Tanaris: Gadgetzan first, then Feralas: Feathermoon Stronghold."] =
        "塔纳利斯：先到加基森，再到菲拉斯：羽月要塞。",
    ["Travel to Aerie Peak"] =
        "前往鹰巢山",
    ["The Hinterlands: Aerie Peak, in the west of the zone."] =
        "辛特兰：鹰巢山，在该区域西部。",
    ["Travel to Un'Goro Crater"] =
        "前往安戈洛环形山",
    ["Un'Goro Crater: Marshal's Refuge is the hub, in the north. The first stop is in the south-east."] =
        "安戈洛环形山：马绍尔营地是据点，在北部。第一站在东南部。",
    ["Travel to Thorium Point"] =
        "前往瑟银哨塔",
    ["Searing Gorge: Thorium Point, in the north-west of the zone."] =
        "灼热峡谷：瑟银哨塔，在该区域西北部。",
    ["Travel to Nethergarde Keep"] =
        "前往守望堡",
    ["Blasted Lands: Nethergarde Keep, in the north-east, then the Burning Steppes."] =
        "诅咒之地：守望堡，在东北部，之后前往燃烧平原。",
    ["Travel to Chillwind Camp"] =
        "前往冰风岗",
    ["Western Plaguelands: Chillwind Camp, in the south of the zone."] =
        "西瘟疫之地：冰风岗，在该区域南部。",
    ["Travel to Rut'theran Village"] =
        "前往鲁瑟兰村",
    ["Teldrassil: Rut'theran Village first, then Azshara and Felwood."] =
        "泰达希尔：先到鲁瑟兰村，再到艾萨拉和费伍德森林。",
    ["Travel to Feathermoon Stronghold"] =
        "前往羽月要塞",
    ["Feralas: Feathermoon Stronghold, on the island off the west coast."] =
        "菲拉斯：羽月要塞，在西海岸外的岛上。",
    ["Tanaris: Gadgetzan first, then Un'Goro Crater."] =
        "塔纳利斯：先到加基森，再到安戈洛环形山。",
    ["Travel to Emerald Sanctuary"] =
        "前往翡翠圣地",
    ["Felwood: Emerald Sanctuary, in the south of the zone."] =
        "费伍德森林：翡翠圣地，在该区域南部。",
    ["Ironforge first, then the Burning Steppes: Morgan's Vigil, in the east."] =
        "先到铁炉堡，再到燃烧平原：摩根的岗哨，在东部。",
    ["Travel to Ironforge"] =
        "前往铁炉堡",
    ["Ironforge first, then the Plaguelands: Chillwind Camp and Light's Hope Chapel."] =
        "先到铁炉堡，再到瘟疫之地：冰风岗和圣光之愿礼拜堂。",
    ["Winterspring: Everlook, in the middle of the zone."] =
        "冬泉谷：永望镇，在该区域中部。",
    ["Travel to Silithus"] =
        "前往希利苏斯",
    ["Silithus: Valor's Rest, in the north-east, then Cenarion Hold."] =
        "希利苏斯：勇士之墓，在东北部，之后前往塞纳里奥要塞。",
    ["Tirisfal Glades: Deathknell, where the undead rise."] =
        "提瑞斯法林地：丧钟镇，亡灵在这里苏醒。",
    ["Mulgore: Camp Narache, where tauren start."] =
        "莫高雷：纳拉其营地，牛头人的起点。",
    ["Durotar: the Valley of Trials, where orcs and trolls start."] =
        "杜隆塔尔：试炼谷，兽人和巨魔的起点。",
    ["Travel to Silverpine Forest"] =
        "前往银松森林",
    ["Silverpine Forest: the Sepulcher is the hub, in the middle. The first stop is on the road in the north."] =
        "银松森林：瑟伯切尔是据点，在中部。第一站在北部的道路上。",
    ["Travel to Razor Hill"] =
        "前往剃刀岭",
    ["Durotar: Razor Hill first, then the Barrens: the Crossroads, and Stonetalon Mountains."] =
        "杜隆塔尔：先到剃刀岭，再到贫瘠之地：十字路口，然后是石爪山脉。",
    ["Ashenvale: Splintertree Post, in the east of the zone. The way in is the tunnel from Stonetalon."] =
        "灰谷：碎木岗哨，在该区域东部。入口是从石爪山脉过来的隧道。",
    ["Travel to the Undercity"] =
        "前往幽暗城",
    ["Undercity first, then Hillsbrad Foothills: Tarren Mill."] =
        "先到幽暗城，再到希尔斯布莱德丘陵：塔伦米尔。",
    ["Thunder Bluff first, then the Barrens."] =
        "先到雷霆崖，再到贫瘠之地。",
    ["Travel to Sun Rock Retreat"] =
        "前往烈日石居",
    ["Stonetalon Mountains: Sun Rock Retreat, in the middle of the zone."] =
        "石爪山脉：烈日石居，在该区域中部。",
    ["Travel to the Crossroads"] =
        "前往十字路口",
    ["The Barrens: the Crossroads first, then Ashenvale: Splintertree Post."] =
        "贫瘠之地：先到十字路口，再到灰谷：碎木岗哨。",
    ["Travel to Camp Taurajo"] =
        "前往陶拉祖营地",
    ["The Barrens: Camp Taurajo first, then Thousand Needles: Freewind Post."] =
        "贫瘠之地：先到陶拉祖营地，再到千针石林：乱风岗。",
    ["Arathi Highlands: Hammerfall, in the east of the zone."] =
        "阿拉希高地：落锤镇，在该区域东部。",
    ["Thousand Needles: Freewind Post, on the mesas in the middle of the zone."] =
        "千针石林：乱风岗，在该区域中部的台地上。",
    ["Travel to Desolace"] =
        "前往凄凉之地",
    ["Desolace: Ghost Walker Post is the hub, in the middle of the zone."] =
        "凄凉之地：幽灵岗哨是据点，在该区域中部。",
    ["Travel to Grom'gol Base Camp"] =
        "前往格罗姆高营地",
    ["Stranglethorn Vale: Grom'gol Base Camp, on the west coast. The zeppelin from Orgrimmar lands there."] =
        "荆棘谷：格罗姆高营地，在西海岸。从奥格瑞玛出发的飞艇在那里降落。",
    ["Orgrimmar first, then Dustwallow Marsh: Brackenwall Village."] =
        "先到奥格瑞玛，再到尘泥沼泽：蕨墙村。",
    ["Travel to Tarren Mill"] =
        "前往塔伦米尔",
    ["Hillsbrad Foothills: Tarren Mill first, then Alterac Mountains and Arathi Highlands."] =
        "希尔斯布莱德丘陵：先到塔伦米尔，再到奥特兰克山脉和阿拉希高地。",
    ["Travel to the Badlands"] =
        "前往荒芜之地",
    ["Badlands: Kargath, at the western edge, is the Horde hub."] =
        "荒芜之地：卡加斯，在西部边缘，是部落据点。",
    ["Travel to Ratchet"] =
        "前往棘齿城",
    ["The Barrens: Ratchet first, then Stranglethorn Vale and the Swamp of Sorrows: Stonard."] =
        "贫瘠之地：先到棘齿城，再到荆棘谷和悲伤沼泽：斯通纳德。",
    ["Travel to Shadowprey Village"] =
        "前往葬影村",
    ["Desolace: Shadowprey Village, on the west coast."] =
        "凄凉之地：葬影村，在西海岸。",
    ["Travel to Brackenwall Village"] =
        "前往蕨墙村",
    ["Dustwallow Marsh: Brackenwall Village, in the north-west of the zone."] =
        "尘泥沼泽：蕨墙村，在该区域西北部。",
    ["Travel to Camp Mojache"] =
        "前往莫沙彻营地",
    ["Feralas: Camp Mojache, in the east of the zone."] =
        "菲拉斯：莫沙彻营地，在该区域东部。",
    ["Stranglethorn Vale: Grom'gol Base Camp, on the west coast."] =
        "荆棘谷：格罗姆高营地，在西海岸。",
    ["Travel to the Swamp of Sorrows"] =
        "前往悲伤沼泽",
    ["Swamp of Sorrows: Stonard is the hub, in the middle of the zone."] =
        "悲伤沼泽：斯通纳德是据点，在该区域中部。",
    ["Travel to the Shimmering Flats"] =
        "前往闪光平原",
    ["Thousand Needles: the Shimmering Flats first, then Tanaris and Dustwallow Marsh."] =
        "千针石林：先到闪光平原，再到塔纳利斯和尘泥沼泽。",
    ["Undercity first, then the Hinterlands: Revantusk Village."] =
        "先到幽暗城，再到辛特兰：恶齿村。",
    ["Feralas: Camp Mojache first, then Un'Goro Crater."] =
        "菲拉斯：先到莫沙彻营地，再到安戈洛环形山。",
    ["Stranglethorn Vale: Booty Bay first, then the Swamp of Sorrows."] =
        "荆棘谷：先到藏宝海湾，再到悲伤沼泽。",
    ["Travel to the Blasted Lands"] =
        "前往诅咒之地",
    ["Blasted Lands: the first stop is at the northern entrance, by the Swamp of Sorrows."] =
        "诅咒之地：第一站在北部入口，靠近悲伤沼泽。",
    ["Travel to Kargath"] =
        "前往卡加斯",
    ["Badlands: Kargath first, at the western edge, then the Searing Gorge."] =
        "荒芜之地：先到西部边缘的卡加斯，再到灼热峡谷。",
    ["Burning Steppes: Flame Crest, in the east. The way in is through Blackrock Mountain."] =
        "燃烧平原：烈焰峰，在东部。要穿过黑石山进入。",
    ["Travel to Valormok"] =
        "前往瓦罗莫克",
    ["Azshara: Valormok, in the west of the zone."] =
        "艾萨拉：瓦罗莫克，在该区域西部。",
    ["Travel to Bloodvenom Post"] =
        "前往血毒岗哨",
    ["Felwood: Bloodvenom Post, in the west of the zone."] =
        "费伍德森林：血毒岗哨，在该区域西部。",
    ["Undercity first, then the Plaguelands."] =
        "先到幽暗城，再到瘟疫之地。",
    -- Ding - Leveling: notes, labels and titles of the Leveling routes, in our wording
    ["This frees room in your bags."] =
        "这样可以腾出背包空间。",
    ["You receive one further along the route."] =
        "路线后面会得到一个。",
    ["Pick up anything that sells for 10 copper or more."] =
        "拾取所有能卖10铜币或以上的物品。",
    ["You'll level faster with this."] =
        "这样升级更快。",
    ["The NPC is outdoors, right beside the structure."] =
        "NPC在室外，就在建筑物旁边。",
    ["Skip the foes and dash into the tent."] =
        "避开敌人，直接冲进帐篷。",
    ["Foes cannot strike you from there."] =
        "敌人在那里打不到你。",
    ["Widen the camera view."] =
        "把镜头拉远。",
    ["Recall to your bind point in Northshire Valley"] =
        "使用炉石返回北郡山谷",
    ["The NPC is indoors."] =
        "NPC在室内。",
    ["The NPC is indoors at street level."] =
        "NPC在室内，与街道同层。",
    ["The quest giver stands outdoors, not indoors."] =
        "任务发布者在室外，不在室内。",
    ["With the coming hand-ins, this brings you to level 4."] =
        "加上接下来的交任务，这能让你升到4级。",
    ["The NPC is indoors, on the central storey."] =
        "NPC在室内中间那层。",
    ["The objective is underground, in the mine shaft."] =
        "目标在地下的矿井里。",
    ["The targets roam the mine and the area around it."] =
        "目标在矿洞内及周围区域游荡。",
    ["Exit the mine shaft"] =
        "离开矿井",
    ["The quest giver stands outdoors at the back of the building."] =
        "任务发布者在建筑物后面的室外。",
    ["The NPC is out back, at the rear of the structure."] =
        "NPC在建筑物后方的室外。",
    ["The NPC stands by the horse stalls."] =
        "NPC站在马厩旁。",
    ["Look for wooden pails."] =
        "寻找木桶。",
    ["Leave it out if other players crowd the area."] =
        "如果这里玩家太多，就跳过它。",
    ["With the coming hand-ins, this gets you to level 6."] =
        "加上接下来的交任务，这能让你升到6级。",
    ["Climb to the highest floor of the building."] =
        "爬到建筑物的顶层。",
    ["The NPC waits on the lower level, indoors."] =
        "NPC在室内下层。",
    ["The NPC is indoors, one floor up."] =
        "NPC在室内楼上一层。",
    ["Heal Guard Roberts using Lesser Heal (Rank 2)."] =
        "用次级治疗术（等级2）治疗Guard Roberts。",
    ["Buff Guard Roberts with Power Word: Fortitude."] =
        "给Guard Roberts施加真言术：韧。",
    ["Do it only if you can."] =
        "能做到才做。",
    ["Go into the mine"] =
        "进入矿洞",
    ["Stay on the trail through the mine"] =
        "沿小路穿过矿洞",
    ["This one roams, so scan the surrounding area."] =
        "它会四处游荡，在周围找找。",
    ["Together with the next turn-ins, this brings you to level 8."] =
        "加上接下来的交任务，这能让你升到8级。",
    ["Die on purpose at this spot"] =
        "在这里故意死亡",
    ["Die to the monsters here on purpose."] =
        "故意让这里的怪物杀死你。",
    ["Dying costs you nothing this early."] =
        "这么早死亡没有任何损失。",
    ["This is the quickest way over."] =
        "这是最快的过去方式。",
    ["Get yourself killed, then resurrect with the spirit healer"] =
        "让自己被杀，然后在灵魂医者处复活",
    ["Look for little stacks of brown wood."] =
        "寻找棕色的小木堆。",
    ["Look around tree trunks at ground level."] =
        "在树干底部的地面附近找。",
    ["The targets are wolves."] =
        "目标是狼。",
    ["The following step may be hard."] =
        "下一步可能很难。",
    ["One extra level makes it easier."] =
        "多升一级会更轻松。",
    ["With the coming turn-ins, this gets you to level 10."] =
        "加上接下来的交任务，这能让你升到10级。",
    ["The NPC waits outside, at the building's front."] =
        "NPC在建筑物正面的室外。",
    ["Fly to Lakeshire"] =
        "飞往湖畔镇",
    ["Stay on the road and watch for danger."] =
        "沿道路走，注意危险。",
    ["Foes in this area outlevel you."] =
        "这里的敌人等级比你高。",
    ["Let the conversation play out."] =
        "等对话结束。",
    ["Your targets here are gnolls."] =
        "这里的目标是豺狼人。",
    ["Fly to Sentinel Hill"] =
        "飞往哨兵岭",
    ["Fly to Stormwind City"] =
        "飞往暴风城",
    ["Head indoors"] =
        "进入室内",
    ["Step onto the pink rune."] =
        "站到粉色符文上。",
    ["Look within the tomb."] =
        "在陵墓里找。",
    ["The NPC stands one level over the crypt."] =
        "NPC在墓穴上面一层。",
    ["Be ready for a fight right away."] =
        "准备好马上战斗。",
    ["The NPC waits indoors, a floor above the entrance."] =
        "NPC在室内，入口上面一层。",
    ["Head down into the Deeprun Tram station"] =
        "下到矿道地铁站",
    ["Pass through the portal to teleport."] =
        "穿过传送门进行传送。",
    ["Take the Deeprun Tram over to Ironforge."] =
        "乘坐矿道地铁前往铁炉堡。",
    ["The NPC stands by the wall on the central platform."] =
        "NPC站在中间站台的墙边。",
    ["Target the Deeprun Rats with the item."] =
        "对矿道老鼠使用该物品。",
    ["Look for little gray rodents."] =
        "寻找灰色的小老鼠。",
    ["Head to the Deeprun Tram's Ironforge platform."] =
        "前往矿道地铁的铁炉堡站台。",
    ["Fly to Ironforge"] =
        "飞往铁炉堡",
    ["Stay on the trail"] =
        "沿小路走",
    ["Steer clear of the elite yeti patrolling close by."] =
        "避开在附近巡逻的精英雪人。",
    ["The NPC is up on the summit."] =
        "NPC在山顶上。",
    ["Let the elite yeti stroll off before you go near."] =
        "等精英雪人走开再靠近。",
    ["Your objective lies in a little cavern."] =
        "目标在一个小洞穴里。",
    ["Go quickly, time is short."] =
        "动作要快，时间不多。",
    ["Go into the cavern"] =
        "进入洞穴",
    ["Head to the lower level of the cavern."] =
        "前往洞穴下层。",
    ["Targets are in the cavern and around its entrance too."] =
        "目标在洞穴里，洞口周围也有。",
    ["Head out of the cave"] =
        "离开洞穴",
    ["Climb the trail"] =
        "沿小路往上爬",
    ["Once in the Wetlands, head north."] =
        "到湿地后向北走。",
    ["Leap down from the ledge."] =
        "从岩架上跳下去。",
    ["This makes Menethil Harbor quicker to get to."] =
        "这样去米奈希尔港更快。",
    ["Keep climbing the trail"] =
        "继续沿小路往上爬",
    ["Take the trail downhill"] =
        "沿小路下山",
    ["Fly to Menethil Harbor"] =
        "飞往米奈希尔港",
    ["Your targets are within the cavern."] =
        "目标在洞穴里。",
    ["Without this, one quest can't be picked up."] =
        "不做这个，有一个任务就接不到。",
    ["The NPC is past the tunnel; stay on the road."] =
        "NPC在隧道另一头；沿道路走。",
    ["The target is a pale bear."] =
        "目标是一只浅色的熊。",
    ["Cross the tunnel to reach the NPC."] =
        "穿过隧道找到NPC。",
    ["Fly to Thelsamar"] =
        "飞往塞尔萨玛",
    ["The NPC patrols a long route; look along it."] =
        "NPC沿一条很长的路线巡逻；沿路寻找。",
    ["The targets are rat-like humanoids."] =
        "目标是像老鼠的人形生物。",
    ["Hunt spiders for it."] =
        "猎杀蜘蛛获取。",
    ["Take the road to where the trail starts"] =
        "沿道路走到小路起点",
    ["A class quest coming up requires this."] =
        "接下来的职业任务需要它。",
    ["Exit Stonesplinter Valley, then stay on the road"] =
        "离开碎石怪之谷，然后沿道路走",
    ["The NPC waits on the tower's highest floor."] =
        "NPC在塔的顶层。",
    ["Head up the incline"] =
        "沿斜坡往上走",
    ["Dwarf and Gnome start"] =
        "矮人和侏儒起始",
    ["Step back outside"] =
        "回到外面",
    ["They are rare and scattered widely."] =
        "它们很少见，而且分布很散。",
    ["Pass through the tunnel, then stay on the road"] =
        "穿过隧道，然后沿道路走",
    ["Heal Mountaineer Dolf with Lesser Heal (Rank 2)."] =
        "用次级治疗术（等级2）治疗Mountaineer Dolf。",
    ["Buff Mountaineer Dolf with Power Word: Fortitude."] =
        "给Mountaineer Dolf施加真言术：韧。",
    ["The quest wants yetis; seek them out."] =
        "任务需要雪人；去找它们。",
    ["Look for the timber baskets."] =
        "寻找木篮子。",
    ["Any spot around Brewnall Village works."] =
        "Brewnall Village周围任意位置都可以。",
    ["Give it a few seconds."] =
        "等几秒钟。",
    ["Target one Large Crag Boar with it."] =
        "对一只Large Crag Boar使用它。",
    ["Use it on any Snow Leopard."] =
        "对任意一只雪豹使用。",
    ["Target any Ice Claw Bear with the item."] =
        "对任意一只冰爪熊使用该物品。",
    ["Keep it as pet food for later."] =
        "留着以后当宠物食物。",
    ["Find one Ice Claw Bear and use Tame Beast on it."] =
        "找一只冰爪熊，对它施放驯服野兽。",
    ["Push eastward if you still need more."] =
        "如果还不够，就继续往东走。",
    ["Hold on to it: a Paladin task coming up uses it."] =
        "留着它：接下来的圣骑士任务要用。",
    ["Keep to the road as it crosses the underground passages."] =
        "道路穿过地下通道时，不要离开道路。",
    ["The NPC can be indoors or out."] =
        "NPC可能在室内，也可能在室外。",
    ["Take the Deeprun Tram over to Stormwind City."] =
        "乘坐矿道地铁前往暴风城。",
    ["Flight master in Stormwind"] =
        "暴风城的飞行管理员",
    ["The NPC roams a wide loop; look along it."] =
        "NPC沿一大圈路线游荡；沿路寻找。",
    ["You likely gathered 10 Linen Cloth already."] =
        "你可能已经收集了10块亚麻布。",
    ["Narm Faulk lies dead; use the item on his body."] =
        "Narm Faulk已经死了；对他的尸体使用该物品。",
    ["Wait for the talking to finish"] =
        "等对话结束",
    ["Climb the big ramp"] =
        "爬上大坡道",
    ["The NPC stands high in the great tree."] =
        "NPC在大树的高处。",
    ["The NPC stands in an adjoining chamber."] =
        "NPC在相邻的房间里。",
    ["The targets are imps."] =
        "目标是小鬼。",
    ["Look for groups of pink fungi."] =
        "寻找成簇的粉色蘑菇。",
    ["Mostly found beside tree trunks."] =
        "大多在树干旁边。",
    ["Look for big orange blossoms."] =
        "寻找大朵的橙色花。",
    ["Climb to the cave's upper level."] =
        "爬到洞穴上层。",
    ["The NPC stands at the summit of the great tree."] =
        "NPC在大树的顶端。",
    ["Heal Sentinel Shaya with Lesser Heal (Rank 2)."] =
        "用次级治疗术（等级2）治疗Sentinel Shaya。",
    ["Buff Sentinel Shaya with Power Word: Fortitude."] =
        "给Sentinel Shaya施加真言术：韧。",
    ["Pick up 5 Earthroot while questing."] =
        "做任务时采集5个地根草。",
    ["A class quest further on requires this."] =
        "后面的职业任务需要它。",
    ["Look for brown clumps of roots."] =
        "寻找成团的棕色根须。",
    ["Kill black-furred tigers."] =
        "击杀黑色皮毛的老虎。",
    ["The targets are spiders with green bodies."] =
        "目标是身体呈绿色的蜘蛛。",
    ["Look for little brown pinecones giving off green smoke."] =
        "寻找冒着绿烟的棕色小松果。",
    ["The target is a satyr."] =
        "目标是一只萨特。",
    ["The targets are spread over several spots."] =
        "目标分布在好几个地点。",
    ["With the coming hand-ins, this gets you to level 9."] =
        "加上接下来的交任务，这能让你升到9级。",
    ["At this spot or a bit to the east."] =
        "在这里或稍微往东一点。",
    ["The NPC patrols the road; look along it."] =
        "NPC在道路上巡逻；沿路寻找。",
    ["For this quest you guard an NPC on the move."] =
        "这个任务需要保护一个行进中的NPC。",
    ["If she is absent, wait for her to reappear."] =
        "如果她不在，等她重新出现。",
    ["Move fast: the clock is ticking on this one."] =
        "动作要快：这个任务有时间限制。",
    ["Kill harpies."] =
        "击杀鹰身人。",
    ["Step into the cavern within the trunk"] =
        "进入树干里的洞穴",
    ["The spot is on the lower floor of the hollow tree."] =
        "位置在空心树的下层。",
    ["Don't forget to train Pick Pocket."] =
        "别忘了学习搜索。",
    ["Keep it; an upcoming task asks for it."] =
        "留着它；接下来的任务需要它。",
    ["Fly to Moonglade"] =
        "飞往月光林地",
    ["Target a Webwood Lurker with it."] =
        "对一只Webwood Lurker使用它。",
    ["Aim the item at any Nightsaber Stalker."] =
        "对任意一只Nightsaber Stalker使用该物品。",
    ["The beasts are leopards with blue fur."] =
        "这些野兽是蓝色皮毛的豹子。",
    ["Aim the item at one Strigid Screecher."] =
        "对一只Strigid Screecher使用该物品。",
    ["Target the owls here."] =
        "目标是这里的猫头鹰。",
    ["You need to stand close to this spot."] =
        "你需要站在这个位置附近。",
    ["Go into the hollow tree's cavern"] =
        "进入空心树的洞穴",
    ["The target is a big gray spider."] =
        "目标是一只灰色大蜘蛛。",
    ["Target Sethir the Ancient and use Pickpocket."] =
        "选中Sethir the Ancient并使用搜索。",
    ["The target is a violet satyr."] =
        "目标是一只紫色萨特。",
    ["The NPC waits here, then strolls out onto the big branch close by."] =
        "NPC在这里等候，然后会走到附近的大树枝上。",
    ["Fight the elementals of the swamp."] =
        "与沼泽中的元素战斗。",
    ["Use Herbalism's Track Herbs to spot them."] =
        "用草药学的寻找草药来发现它们。",
    ["Pick these up while questing around Teldrassil."] =
        "在泰达希尔做任务时顺便采集。",
    ["Get your Herbalism skill to 15."] =
        "把草药学技能练到15。",
    ["Together with the next turn-ins, this brings you to level 11."] =
        "加上接下来的交任务，这能让你升到11级。",
    ["Circle the mountain, then climb the trail"] =
        "绕过山，然后沿小路往上爬",
    ["The NPC stands on the highest level of this structure."] =
        "NPC在这座建筑的最高层。",
    ["Flight master in Auberdine"] =
        "奥伯丁的飞行管理员",
    ["Your pet will need this food shortly."] =
        "你的宠物很快就需要这些食物。",
    ["Hunt the crabs."] =
        "猎杀螃蟹。",
    ["You'll find extra ones swimming nearby as well."] =
        "附近水里也有更多在游动。",
    ["Use the item on any Rabid Thistle Bear."] =
        "对任意一只狂暴蓟熊使用该物品。",
    ["The targets are bears with grey fur."] =
        "目标是灰色皮毛的熊。",
    ["Keep from damaging the creature."] =
        "不要伤害这只生物。",
    ["Your targets sit below the water's surface."] =
        "目标在水面以下。",
    ["Avoid slaying the satyrs if you can."] =
        "尽量不要杀死萨特。",
    ["You'll need this for the following quest."] =
        "下一个任务需要它。",
    ["Hunt down satyrs."] =
        "猎杀萨特。",
    ["Big birds that roam on foot."] =
        "在地上走动的大鸟。",
    ["Make your way to the Gates of Ironforge"] =
        "前往铁炉堡大门",
    ["Swim to precisely this point, then from the game menu pick Support and ask to be unstuck."] =
        "游到这个确切位置，然后打开游戏菜单，选择客服支持，申请角色脱困。",
    ["Stay outdoors by this building."] =
        "待在这座建筑旁边的室外。",
    ["Pull the camera back for a wider view."] =
        "拉远镜头，扩大视野。",
    ["Turn the view so Furlbrow's Wardrobe is visible."] =
        "转动视角，直到看到Furlbrow's Wardrobe。",
    ["Look for beige sacks."] =
        "寻找米色的袋子。",
    ["Look beside objects and structures."] =
        "在物件和建筑旁边找。",
    ["Hunt the vultures."] =
        "猎杀秃鹫。",
    ["Many of them gather in this area."] =
        "这片区域有很多。",
    ["The rest lie dotted across the zone."] =
        "其余的散布在整个区域。",
    ["Kill boars for these."] =
        "击杀野猪获取。",
    ["With the coming turn-ins, this gets you to level 15."] =
        "加上接下来的交任务，这能让你升到15级。",
    ["Flight master at Rut'theran Village"] =
        "鲁瑟兰村的飞行管理员",
    ["Leave your pet with the stable master."] =
        "把宠物寄存在兽栏管理员处。",
    ["You will tame a short-term pet shortly."] =
        "你马上要驯服一只临时宠物。",
    ["Here your pet picks up Claw (Rank 2)."] =
        "你的宠物在这里学会爪击（等级2）。",
    ["You will let it go shortly."] =
        "你很快会放生它。",
    ["Send your pet against a Thistle Bear."] =
        "派你的宠物攻击一只蓟熊。",
    ["Get your companion back from the stable master."] =
        "从兽栏管理员处取回你的宠物。",
    ["Release the short-term pet you tamed."] =
        "放生你驯服的临时宠物。",
    ["The NPC stands on the pier."] =
        "NPC站在码头上。",
    ["The targets are sea creatures with long necks."] =
        "目标是长脖子的海洋生物。",
    ["Head to the hilltop."] =
        "前往山顶。",
    ["Wade in to use it."] =
        "走进水里使用。",
    ["The spot is at the foot of the falls."] =
        "位置在瀑布脚下。",
    ["Look for an urn of woven wicker."] =
        "寻找一个柳条编织的瓮。",
    ["The target is a non-hostile ghost of a night elf woman."] =
        "目标是一个非敌对的暗夜精灵女性鬼魂。",
    ["Look for a figure in yellow and green garb."] =
        "寻找一个穿黄绿色衣服的人。",
    ["Go to the lowest deck of the wreck."] =
        "前往沉船的最底层甲板。",
    ["Swim in by way of a porthole."] =
        "从舷窗游进去。",
    ["Search stacks of brown crates."] =
        "搜查成堆的棕色箱子。",
    ["The NPC stands atop the dam."] =
        "NPC站在水坝顶上。",
    ["The object rests by the barrier."] =
        "该物件在屏障旁边。",
    ["Together with the next turn-ins, this brings you to level 19."] =
        "加上接下来的交任务，这能让你升到19级。",
    ["This skips some tedious quests with a timer."] =
        "这样可以跳过一些乏味的限时任务。",
    ["The upcoming quest may prove hard."] =
        "接下来的任务可能很难。",
    ["The targets are troggs."] =
        "目标是穴居人。",
    ["Redridge and Westfall"] =
        "赤脊山和西部荒野",
    ["Look for a big mound of brown earth."] =
        "寻找一个棕色的大土堆。",
    ["The target patrols a long route by the road."] =
        "目标沿道路旁一条很长的路线巡逻。",
    ["The target's route also goes far into Jangolode Mine and Gold Coast Quarry."] =
        "目标的路线也会深入詹戈洛德矿洞和金海岸矿洞。",
    ["It takes roughly 5 minutes to reappear."] =
        "大约5分钟后重新出现。",
    ["The target is a murloc, grey and bigger than the others."] =
        "目标是一个鱼人，灰色，比其他的更大。",
    ["It roams the shoreline."] =
        "它在海岸线上游荡。",
    ["If the NPC is absent, stay until he reappears."] =
        "如果NPC不在，就等到他重新出现。",
    ["Escort The Defias Traitor and keep him alive."] =
        "护送迪菲亚叛徒，保证他活着。",
    ["The NPC is on an upper floor of the tower."] =
        "NPC在塔的上层。",
    ["Hunt the red-feathered birds."] =
        "猎杀红色羽毛的鸟。",
    ["The targets are little winged dragons."] =
        "目标是有翅膀的小龙。",
    ["Skip Redridge Alphas; they don't carry them."] =
        "跳过Redridge Alpha；它们身上没有。",
    ["Raise Lockpicking to 95"] =
        "把开锁技能提升到95",
    ["Look for little gray coffers of metal."] =
        "寻找灰色的小金属箱。",
    ["Go inside and stay on the trail"] =
        "进去后沿小路走",
    ["Your target is a ghoul."] =
        "你的目标是一只食尸鬼。",
    ["Fight undead foes."] =
        "与亡灵敌人战斗。",
    ["The target is the dungeon's second boss."] =
        "目标是副本的第二个首领。",
    ["The target is the dungeon's last boss."] =
        "目标是副本的最终首领。",
    ["The objective is aboard the vessel."] =
        "目标在船上。",
    ["You'll find them all over the instance."] =
        "副本里到处都有。",
    ["The NPC is indoors"] =
        "NPC在室内",
    ["Fight the murlocs."] =
        "与鱼人战斗。",
    ["The spot is at the cave's mouth."] =
        "位置在洞口。",
    ["Look for the brown fungi."] =
        "寻找棕色蘑菇。",
    ["Extra ones are below, in the side chambers."] =
        "下面的侧室里还有更多。",
    ["Gather the blue-capped fungi."] =
        "采集蓝色菌盖的蘑菇。",
    ["Expect a possible ambush while you gather it."] =
        "采集时可能会遭到伏击。",
    ["It shows up a short way off."] =
        "它会在不远处出现。",
    ["It shows up at your feet."] =
        "它会出现在你脚下。",
    ["Murloc packs arrive at the waterside."] =
        "成群的鱼人会从水边过来。",
    ["The attackers rush the camp."] =
        "攻击者会冲进营地。",
    ["Engage foes one at a time."] =
        "一次只打一个敌人。",
    ["Watch out, the landscape conceals some monsters."] =
        "小心，地形中藏着一些怪物。",
    ["Avoid drawing several foes together."] =
        "避免同时引来多个敌人。",
    ["Stay with Prospector Remtravel and defend him."] =
        "跟着Prospector Remtravel并保护他。",
    ["He is frail and goes down fast."] =
        "他很脆弱，很快就会倒下。",
    ["Look on top of the table."] =
        "在桌子上面找。",
    ["Escort Therylune and defend her."] =
        "护送Therylune并保护她。",
    ["Escort Volcor and defend him."] =
        "护送Volcor并保护他。",
    ["Allow the foes to hit him before you join in."] =
        "先让敌人攻击他，你再加入战斗。",
    ["If it is not around, move on without it."] =
        "如果它不在，就不用管它，继续前进。",
    ["It reappears only after a long wait."] =
        "它要等很久才会重新出现。",
    ["Keep Kerlonian Evershade safe while he trails behind you."] =
        "Kerlonian Evershade跟在你身后时，保护他的安全。",
    ["Keep near him; he dozes off."] =
        "待在他附近；他会睡着。",
    ["The NPC is on the house's raised terrace."] =
        "NPC在房子的高台上。",
    ["Ashenvale and Stonetalon"] =
        "灰谷和石爪山脉",
    ["The item drops rarely."] =
        "这个物品掉率很低。",
    ["Look for little gray sheaves of straw."] =
        "寻找灰色的小捆稻草。",
    ["Lower the Ground Clutter option to 1."] =
        "把“地面杂物”选项降到1。",
    ["Find it in the game options, under System, then Graphics."] =
        "在游戏选项的“系统”中，再到“图形”里找到它。",
    ["Fly to Astranaar"] =
        "飞往阿斯特兰纳",
    ["Keep to the road the whole way."] =
        "全程沿道路走。",
    ["Pick up Claw (Rank 3) for your pet."] =
        "为你的宠物学习爪击（等级3）。",
    ["Tame an Ashenvale Bear with Tame Beast."] =
        "用驯服野兽驯服一只灰谷熊。",
    ["Track down a chestnut-furred bear."] =
        "找到一只栗色皮毛的熊。",
    ["Keep to the road until you reach the Barrens"] =
        "沿道路走，直到抵达贫瘠之地",
    ["Keep your distance from the Crossroads."] =
        "与十字路口保持距离。",
    ["Flight master in Ratchet"] =
        "棘齿城的飞行管理员",
    ["Look for white spheres."] =
        "寻找白色球体。",
    ["The target is a gray furbolg."] =
        "目标是一只灰色熊怪。",
    ["Shrubs that glitter white."] =
        "闪着白光的灌木。",
    ["Exit Ruins of Stardust"] =
        "离开星尘废墟",
    ["Go into Fire Scar Shrine and climb the trail"] =
        "进入火痕神殿，沿小路往上爬",
    ["The target summons protectors with Ilkrud's Guardians."] =
        "目标会用Ilkrud's Guardians召唤守护者。",
    ["Cut off the target's spells when you can."] =
        "有机会就打断目标的法术。",
    ["Exit Fire Scar Shrine"] =
        "离开火痕神殿",
    ["Circle the mountain on foot."] =
        "步行绕过这座山。",
    ["A yellowish naga; her fins look pinkish."] =
        "偏黄色的纳迦；她的鳍呈粉色。",
    ["The target is rare and seldom up."] =
        "目标是稀有怪，很少出现。",
    ["The target is a naga with jade skin and rose-colored fins."] =
        "目标是翠绿皮肤、玫瑰色鳍的纳迦。",
    ["It circles the island clockwise, close to the shore."] =
        "它在岸边附近顺时针绕岛游动。",
    ["She travels with a pair of guards."] =
        "她身边跟着两个守卫。",
    ["Hunt naga."] =
        "猎杀纳迦。",
    ["Take the passage into Stonetalon Mountains"] =
        "走通道进入石爪山脉",
    ["Look for it high on the clifftop."] =
        "在高处的悬崖顶上找。",
    ["The targets are wyverns."] =
        "目标是双足飞龙。",
    ["Fly to Stonetalon Peak"] =
        "飞往石爪峰",
    ["Watch out and keep away from Tideress."] =
        "小心，远离Tideress。",
    ["Your prey is a green-hued creature of living water, level 27."] =
        "你的猎物是一个27级的绿色活水生物。",
    ["This is in the Pool of Ask'ar part of the dungeon."] =
        "这在副本的阿斯卡之池区域。",
    ["Look on Ghamoo-ra's north side."] =
        "在加摩拉北侧找。",
    ["Dive down into the submerged cave."] =
        "潜入水下洞穴。",
    ["Find the NPC to the southwest of Ghamoo-ra."] =
        "在加摩拉西南边找到NPC。",
    ["It is the dungeon's 4th boss."] =
        "它是副本的第4个首领。",
    ["Kill Fallenroot and Blackfathom foes."] =
        "击杀Fallenroot和黑暗深渊的敌人。",
    ["Fly to Talrendis Point"] =
        "飞往塔伦迪斯营地",
    ["This trip is dangerous; move with great caution."] =
        "这段路很危险；务必非常小心。",
    ["Stay on the road and keep away from Horde NPCs."] =
        "沿道路走，远离部落NPC。",
    ["The Warsong Outriders riding along the road stay peaceful."] =
        "沿路骑行的Warsong Outrider不会主动攻击。",
    ["The target is a gray murloc."] =
        "目标是一个灰色鱼人。",
    ["The target appears at this spot."] =
        "目标会在这里出现。",
    ["Go into Whelgar's Excavation Site"] =
        "进入维尔加挖掘场",
    ["Head out of Whelgar's Excavation Site"] =
        "离开维尔加挖掘场",
    ["The targets are raptors."] =
        "目标是迅猛龙。",
    ["Targets are both in the tomb and around it."] =
        "目标在陵墓里和周围都有。",
    ["The vendor stocks only a few."] =
        "商人只有少量存货。",
    ["A quest in Duskwood will require it afterward."] =
        "之后暮色森林的一个任务会需要它。",
    ["Buy it now; a task in Duskwood needs it before long."] =
        "现在就买；暮色森林的一个任务很快会用到。",
    ["The spot is in the crypt under the building."] =
        "位置在建筑物下面的墓穴里。",
    ["Duskwood and Redridge"] =
        "暮色森林和赤脊山",
    ["Flight master at Darkshire"] =
        "夜色镇的飞行管理员",
    ["The target is a ghoul with red skin."] =
        "目标是一只红皮肤的食尸鬼。",
    ["The targets are ghouls."] =
        "目标是食尸鬼。",
    ["Exit the tomb"] =
        "离开陵墓",
    ["Rob one Malformed Defias Drone with Pickpocket."] =
        "对一个Malformed Defias Drone使用搜索。",
    ["Use Sap on Klaven Mortwake, then open the chest."] =
        "对Klaven Mortwake使用闷棍，然后打开箱子。",
    ["Opening it puts a harmful effect on you."] =
        "打开它会让你中一个有害效果。",
    ["Climb the trail across the mountains"] =
        "沿小路翻越山脉",
    ["Take the trail that circles the peak"] =
        "走绕山峰的小路",
    ["Defeat each wave of attackers."] =
        "击败每一波攻击者。",
    ["Beware of foes lurking in stealth."] =
        "当心潜行中的敌人。",
    ["Target Doc Mixilpixil, then take a seat."] =
        "选中Doc Mixilpixil，然后坐下。",
    ["The target is a boar whose hide is a deeper shade of brown."] =
        "目标是一只皮毛颜色更深的棕色野猪。",
    ["The targets are orcs."] =
        "目标是兽人。",
    ["You no longer need these; vendor or discard them."] =
        "你不再需要这些；卖给商人或丢弃。",
    ["The targets are Horrors and Fiends."] =
        "目标是恐魔和恶魔。",
    ["Don't engage Mor'Ladim, an elite undead foe at level 35."] =
        "不要招惹Mor'Ladim，他是35级的精英亡灵敌人。",
    ["The target wanders near the crypt, outdoors."] =
        "目标在墓穴附近的室外游荡。",
    ["Climb the steps and exit the tomb"] =
        "爬上台阶，离开陵墓",
    ["The target is a sword-wielding gnoll."] =
        "目标是一个持剑的豺狼人。",
    ["The target is a gnoll in a crimson robe, wielding a lengthy blade."] =
        "目标是一个身穿深红长袍、手持长刃的豺狼人。",
    ["Beware: nearby foes join when you attack him."] =
        "当心：你攻击他时附近的敌人会加入。",
    ["Keep to the cave's interior when you can."] =
        "尽量待在洞穴内部。",
    ["The following step takes place in the cave."] =
        "下一步在洞穴里进行。",
    ["Keep Corporal Keeshan safe during the escort."] =
        "护送途中保护Corporal Keeshan的安全。",
    ["At the cave's mouth, draw foes to him with care."] =
        "在洞口时，小心地把敌人引到他身边。",
    ["The target is the dungeon's fifth boss."] =
        "目标是副本的第五个首领。",
    ["Targets are within the wrecked vessel underwater."] =
        "目标在水下的沉船里。",
    ["The target is a blue raptor."] =
        "目标是一只蓝色迅猛龙。",
    ["Look for a big mound of dirt."] =
        "寻找一个大土堆。",
    ["The item may also spawn on the high ledge by Sarltooth."] =
        "这个物品也可能刷新在Sarltooth旁边的高处岩架上。",
    ["Look for a big, broad yellow urn."] =
        "寻找一个又大又宽的黄色瓮。",
    ["Look for a big, tall crimson urn."] =
        "寻找一个又大又高的深红色瓮。",
    ["The target is a big stone container."] =
        "目标是一个大型石制容器。",
    ["The target is up on the boat's top deck."] =
        "目标在船的顶层甲板上。",
    ["Climb the incline at the rear."] =
        "爬上后面的斜坡。",
    ["Go to the lowest deck of the ship."] =
        "前往船的最底层甲板。",
    ["Swim in via the gap at the base."] =
        "从底部的缺口游进去。",
    ["These foes hide in stealth."] =
        "这些敌人会潜行隐身。",
    ["Most often found in or beside water."] =
        "多在水中或水边。",
    ["Grab every one you spot on the way here."] =
        "来这里的路上见到就拿。",
    ["With the coming hand-ins, this brings you to level 29."] =
        "加上接下来的交任务，这能让你升到29级。",
    ["Take the door on the bridge, then descend the steps"] =
        "从桥上的门进去，然后走下台阶",
    ["The NPC is on the lower level within the bridge."] =
        "NPC在桥内部的下层。",
    ["Leap from the span and splash down below"] =
        "从桥上跳下，落入下面的水中",
    ["Look for a pale, rolled scroll."] =
        "寻找一个浅色的卷轴。",
    ["A dwarf corpse grips it."] =
        "一具矮人尸体握着它。",
    ["Fly to Refuge Pointe"] =
        "飞往避难谷地",
    ["Flight master at Southshore"] =
        "南海镇的飞行管理员",
    ["The targets are turtles."] =
        "目标是海龟。",
    ["Head north, keeping to the riverbank."] =
        "沿河岸向北走。",
    ["Flight master at Chillwind Camp"] =
        "冰风岗的飞行管理员",
    ["Stonetalon and Ashenvale"] =
        "石爪山脉和灰谷",
    ["Take the road, then climb the trail into Nijel's Point"] =
        "沿道路走，再沿小路爬上尼耶尔前哨站",
    ["Fly to Nijel's Point"] =
        "飞往尼耶尔前哨站",
    ["The quest is gray, yet the later ones in the chain award plenty of XP."] =
        "这个任务是灰色的，但任务链后面的任务经验很多。",
    ["Take the road until this trail"] =
        "沿道路走到这条小路",
    ["Keep on the trail"] =
        "继续沿小路走",
    ["Fight the treants."] =
        "与树人战斗。",
    ["Head uphill on the trail and across the passage"] =
        "沿小路上坡，穿过通道",
    ["Exit the Howling Vale by the tunnel"] =
        "穿过隧道离开狼嚎谷",
    ["You pick up Claw (Rank 4) here."] =
        "你的宠物在这里学会爪击（等级4）。",
    ["Tame any Elder Ashenvale Bear with Tame Beast."] =
        "用驯服野兽驯服任意一只Elder Ashenvale Bear。",
    ["They show up lying on the ground."] =
        "它们会躺在地上。",
    ["Circle the peak, then climb the twisting dirt trail to the shrine"] =
        "绕过山峰，然后沿蜿蜒的土路爬到神殿",
    ["Circle the mountain, then stay on the trail"] =
        "绕过山，然后沿小路走",
    ["Stand on the marked point, then apply the item."] =
        "站在标记的位置上，然后使用该物品。",
    ["Obtain Furbolg Form"] =
        "获得熊怪形态",
    ["Walk over the span"] =
        "走过桥",
    ["The foes are gnomes."] =
        "敌人是侏儒。",
    ["In Gnomeregan's outer halls, not in the instance itself."] =
        "在诺莫瑞根的外部大厅，不在副本里。",
    ["Take the lift down, then head north."] =
        "乘升降梯下去，然后向北走。",
    ["The NPC is atop the raised platform."] =
        "NPC在高台上。",
    ["It sits a short distance southward from Techbot."] =
        "它在Techbot以南不远处。",
    ["Use it on foes that are Irradiated."] =
        "对受到辐射的敌人使用。",
    ["The targets are troggs with a green glow."] =
        "目标是发绿光的穴居人。",
    ["Inside The Hall of Gears, stick to the top tiers."] =
        "在齿轮大厅里，待在最上层。",
    ["Take the trail southwest into The Dormitory."] =
        "沿小路往西南进入宿舍区。",
    ["By the wall on The Dormitory's lower floor."] =
        "在宿舍区下层的墙边。",
    ["The target is the third boss you meet."] =
        "目标是你遇到的第三个首领。",
    ["The target sits on the raised deck beside Electrocutioner 6000."] =
        "目标在Electrocutioner 6000旁边的高台上。",
    ["In the Engineering Labs, on the lowest floor."] =
        "在工程实验室的最底层。",
    ["The objective is next to Crowd Pummeler 9-60."] =
        "目标在群体打击者9-60旁边。",
    ["Keep to Launch Bay's top floor."] =
        "待在Launch Bay的顶层。",
    ["Look for boxy, standing devices."] =
        "寻找立着的方形装置。",
    ["The machine you need is in the Dormitory."] =
        "你需要的机器在宿舍区。",
    ["It can take more than one to get it."] =
        "可能需要不止一个才能拿到。",
    ["Duskwood and Stranglethorn"] =
        "暮色森林和荆棘谷",
    ["Head into Stormwind Keep"] =
        "进入暴风城城堡",
    ["The NPC stands by the water's edge."] =
        "NPC站在水边。",
    ["The targets are worgen."] =
        "目标是狼人。",
    ["Other ghouls occupy the same spawn points."] =
        "其他食尸鬼也会在相同的刷新点出现。",
    ["The target can be in the house or around it."] =
        "目标可能在房子里或周围。",
    ["Just out of the mine."] =
        "就在矿洞外面。",
    ["The NPC patrols the southern route once every 20-30 minutes."] =
        "NPC每20-30分钟巡逻一次南边的路线。",
    ["A pair of foes go after him."] =
        "会有两个敌人攻击他。",
    ["Saving his life unlocks a new task."] =
        "救下他会解锁一个新任务。",
    ["Hang on to it; an upcoming quest uses it."] =
        "留着它；接下来的任务要用。",
    ["The NPC stands in the narrow lane between houses."] =
        "NPC站在房屋之间的窄巷里。",
    ["Hillsbrad and Arathi"] =
        "希尔斯布莱德和阿拉希",
    ["Search for gray rocks standing up beside the walls."] =
        "寻找墙边立着的灰色石头。",
    ["Further hidden ones lurk on the high ridgelines."] =
        "高处的山脊上还藏着更多。",
    ["Some are indoors as well."] =
        "有些也在室内。",
    ["Fly to Aerie Peak"] =
        "飞往鹰巢山",
    ["The NPC is at the summit of the trail."] =
        "NPC在小路的顶端。",
    ["This spares you time further on."] =
        "这能为之后节省时间。",
    ["Flight master at Theramore"] =
        "塞拉摩的飞行管理员",
    ["This quest is buggy and may not show up."] =
        "这个任务有bug，可能不会出现。",
    ["Expect several foes at once."] =
        "会同时遇到多个敌人。",
    ["Make Private Hendel your main target."] =
        "把Private Hendel作为主要目标。",
    ["Steer clear of Brackenwall Village."] =
        "避开蕨墙村。",
    ["Watch out: the foes here are above your level."] =
        "小心：这里的敌人等级比你高。",
    ["The quest starts from a small piece of metal."] =
        "这个任务由一小块金属开始。",
    ["Take the lift down"] =
        "乘升降梯下去",
    ["Look for a little brown tome."] =
        "寻找一本棕色的小书。",
    ["The item is held by a dwarf corpse."] =
        "这个物品在一具矮人尸体手中。",
    ["Flight master at Thalanaar"] =
        "萨兰纳尔的飞行管理员",
    ["Keep clear of Freewind Post."] =
        "远离乱风岗。",
    ["This spot has most of them; elsewhere they are rare."] =
        "大多集中在这里；别处很少。",
    ["Return here as you do your other quests."] =
        "做其他任务时回到这里。",
    ["The foes here are scorpions."] =
        "这里的敌人是蝎子。",
    ["Look for assorted mechanical pieces."] =
        "寻找各种机械零件。",
    ["Parts lie all across the Shimmering Flats."] =
        "零件散落在整个闪光平原。",
    ["Fly to Gadgetzan"] =
        "飞往加基森",
    ["Stand on the metal grating to begin the battle."] =
        "站到金属格栅上开始战斗。",
    ["Shows up once you defeat six challengers."] =
        "击败六名挑战者后出现。",
    ["The NPC is upstairs, out on the balcony."] =
        "NPC在楼上的阳台上。",
    ["The NPC stands on the top tier of the pier."] =
        "NPC站在码头的最上层。",
    ["Fly to Booty Bay"] =
        "飞往藏宝海湾",
    ["If he is absent, move on without him."] =
        "如果他不在，就不用管他，继续前进。",
    ["You may come back for it another time."] =
        "你可以以后再回来做。",
    ["These foes heal both their allies and themselves."] =
        "这些敌人会治疗同伴和自己。",
    ["When the targets run out, skip ahead."] =
        "目标没有了就跳过这一步。",
    ["No rush; you may complete this afterwards."] =
        "不急，可以之后再完成。",
    ["The objective sits up on the raised deck."] =
        "目标在高起的甲板上。",
    ["Search the riverbanks."] =
        "在河岸边搜寻。",
    ["Here your pet picks up Claw (Rank 5)."] =
        "你的宠物在这里学会爪击（等级5）。",
    ["Tame a Scorpashi Lasher with Tame Beast."] =
        "用驯服野兽驯服一只Scorpashi Lasher。",
    ["Head uphill into Nijel's Point"] =
        "往山上走，进入尼耶尔前哨站",
    ["With the coming hand-ins, this brings you to level 36."] =
        "加上接下来要交的任务，这能让你升到36级。",
    ["The quest starts from a little book."] =
        "这个任务由一本小书开始。",
    ["The targets are lobsters."] =
        "目标是龙虾。",
    ["Draw him to the doorway so other foes stay out of it."] =
        "把他引到门口，以免其他敌人加入战斗。",
    ["Escort Dalinda Malem and keep her alive."] =
        "护送Dalinda Malem，确保她活着。",
    ["The targets here are centaurs."] =
        "这里的目标是半人马。",
    ["Magram Pack Runners patrol with 2 hyena escorts; steer clear."] =
        "Magram Pack Runner带着2只土狼护卫巡逻，避开它们。",
    ["Stay away from Ghost Walker Post."] =
        "远离幽灵岗哨。",
    ["Target kodos with the item."] =
        "对科多兽使用该物品。",
    ["The kodos trail behind you."] =
        "科多兽会跟在你身后。",
    ["Lead them to Smeed Scrabblescrew, then speak with them there."] =
        "把它们带到Smeed Scrabblescrew那里，然后在那里与它们互动。",
    ["Look for pale skulls of horned beasts."] =
        "寻找有角野兽的白色头骨。",
    ["A lengthy grinding stretch is coming up."] =
        "接下来要刷很长一段时间的怪。",
    ["The targets are Sea Witches and Tidehunters."] =
        "目标是海巫和潮汐猎手。",
    ["Other naga compete for the same spawn points."] =
        "其他纳迦会占用相同的刷新点。",
    ["The targets are on islands and beneath the surface."] =
        "目标在岛上和水下。",
    ["This spreads out the grinding so less is left later."] =
        "这样把刷怪分散开，之后要刷的就少了。",
    ["Take the mountain trail to get there."] =
        "走山间小路过去。",
    ["Stay clear of Valley of Spears."] =
        "避开长矛谷。",
    ["Look for tan sacks by the houses."] =
        "在房屋旁寻找棕褐色的袋子。",
    ["Some of them are not usable."] =
        "其中有些无法使用。",
    ["Basilisks compete for the same spawn points."] =
        "石化蜥蜴会占用相同的刷新点。",
    ["They compete for spawn points with the other Kurzen foes."] =
        "它们与其他库尔森敌人争夺刷新点。",
    ["A key class quest coming up requires this."] =
        "接下来一个重要的职业任务需要它。",
    ["The targets are on the cave floor."] =
        "目标在洞穴的地面上。",
    ["Targets are spread across the whole cavern."] =
        "目标分布在整个洞穴里。",
    ["Hold on to it for a Searing Gorge task later."] =
        "留着它，之后灼热峡谷的任务要用。",
    ["Stay away from Bhag'thera."] =
        "远离Bhag'thera。",
    ["The big cat you need roams in plain sight: a level 40 elite black panther."] =
        "你要找的大猫不潜行，四处游荡：一只40级精英黑豹。",
    ["The targets are in the water and along its edges."] =
        "目标在水中和水边。",
    ["Look for an orange tiger."] =
        "寻找一只橙色老虎。",
    ["Mostly found atop the hill."] =
        "大多在山顶上。",
    ["Steer clear of elite murlocs."] =
        "避开精英鱼人。",
    ["The targets are trolls."] =
        "目标是巨魔。",
    ["With the coming hand-ins, this gets you to level 38."] =
        "加上接下来要交的任务，这能让你升到38级。",
    ["Hunt the little winged dragonkin."] =
        "猎杀带翅膀的小型龙类。",
    ["The target is a humanoid escorted by 2 guards."] =
        "目标是一个由2名卫兵护送的人型生物。",
    ["Clear the monsters just south before you start."] =
        "开始前先清掉南边附近的怪物。",
    ["Escort Galen Goodward and keep him alive."] =
        "护送Galen Goodward，确保他活着。",
    ["Look for big blue crystals."] =
        "寻找大块的蓝色水晶。",
    ["Keep to the water to skip foes above your level."] =
        "沿水路走，避开比你等级高的敌人。",
    ["Together with the next turn-ins, this brings you to level 39."] =
        "加上接下来要交的任务，这能让你升到39级。",
    ["Hold on to it for the Whirlwind class chain."] =
        "留着它，旋风斩职业任务链要用。",
    ["A major boost to your weapon."] =
        "能大幅提升你的武器。",
    ["Arathi and Alterac"] =
        "阿拉希和奥特兰克",
    ["The target travels the road in one direction, escorted by 4 guards."] =
        "目标沿道路单向行进，有4名卫兵护送。",
    ["If she makes it to Tarren Mill, she spawns again."] =
        "如果她走到塔伦米尔，就会重新刷新。",
    ["She starts her route over in Arathi Highlands."] =
        "她会从阿拉希高地重新开始她的路线。",
    ["The targets are kobolds."] =
        "目标是狗头人。",
    ["Additional ones are in the cavern up the trail."] =
        "沿小路往上的洞穴里还有更多。",
    ["Keep away from Hammerfall."] =
        "远离落锤镇。",
    ["Climb the trail to the cavern"] =
        "沿小路往上，到洞穴",
    ["The NPC stands atop the ridge."] =
        "NPC站在山脊顶上。",
    ["Escort Kinelory and keep her alive."] =
        "护送Kinelory，确保她活着。",
    ["The targets are ogres."] =
        "目标是食人魔。",
    ["Together with the next turn-ins, this brings you to level 40."] =
        "加上接下来要交的任务，这能让你升到40级。",
    ["Stay clear of Refuge Point."] =
        "避开避难谷地。",
    ["A level 40 elite foe shows up shortly."] =
        "很快会出现一个40级精英敌人。",
    ["Drink a second Nature Protection Potion mid-fight."] =
        "战斗中途再喝一瓶自然防护药水。",
    ["Consume one ahead of time, so it has recharged once combat begins."] =
        "提前喝一瓶，这样开战时冷却已经结束。",
    ["Get Essence of the Exile done as well."] =
        "也把任务“Essence of the Exile”完成。",
    ["Be sure the cooldown on the Nature Protection Potion has ended."] =
        "确保自然防护药水的冷却已结束。",
    ["Stay behind Bath'rah the Windwatcher as he walks."] =
        "Bath'rah the Windwatcher走动时跟在他后面。",
    ["This calls up Cyclonian."] =
        "这会召唤出Cyclonian。",
    ["Take the trail across the peaks"] =
        "沿小路翻过山峰",
    ["Take the passage to Faldir's Cove"] =
        "走通道到法迪尔海湾",
    ["Escort Professor Phizzlethorpe and keep him alive."] =
        "护送Professor Phizzlethorpe，确保他活着。",
    ["The tome is bound in brown and rests in a metal kettle."] =
        "这本书是棕色封皮，放在一个金属锅里。",
    ["The objective is on the central deck of the submerged wreck."] =
        "目标在沉船的中层甲板上。",
    ["Look for a flat beige parchment."] =
        "寻找一张平放的米色羊皮纸。",
    ["Search for a book lying open."] =
        "寻找一本摊开的书。",
    ["The target is in the ship's lowest hold."] =
        "目标在船的最底层货舱。",
    ["Look for big gray rocks."] =
        "寻找大块的灰色岩石。",
    ["They show up as dots on the minimap."] =
        "它们会在小地图上显示为圆点。",
    ["Hold on to it, an upcoming quest uses it."] =
        "留着它，接下来的任务要用。",
    ["Clear the raptors around before you begin."] =
        "开始前先清掉周围的迅猛龙。",
    ["Let the conversation play out, then escort \"Stinky\" Ignatz and keep him alive."] =
        "等对话结束，然后护送\"Stinky\" Ignatz，确保他活着。",
    ["Speak with him once he gives up."] =
        "他投降后与他交谈。",
    ["Hunt the felguards."] =
        "猎杀恶魔卫士。",
    ["This is the sole spot; wait for them to reappear."] =
        "只有这一个地点，等它们重生。",
    ["The targets are felhounds."] =
        "目标是地狱犬。",
    ["The targets are succubi."] =
        "目标是魅魔。",
    ["The spot is beside a giant skeleton."] =
        "地点在一具巨大的骨架旁边。",
    ["Clear out the foes around here before you start."] =
        "开始前先清掉这附近的敌人。",
    ["Target the spectral centaurs."] =
        "以幽灵半人马为目标。",
    ["The targets are brown-colored skeletons."] =
        "目标是棕色的骷髅。",
    ["Together with the next turn-ins, this brings you to level 41."] =
        "加上接下来要交的任务，这能让你升到41级。",
    ["The target wanders inside the tent and around it."] =
        "目标在帐篷里和帐篷周围走动。",
    ["Take the road, then descend the trail"] =
        "沿道路走，再顺着小路下去",
    ["On the road, Rexxar leaves you alone."] =
        "在路上，雷克萨不会找你麻烦。",
    ["Cross by boat or by swimming"] =
        "坐船或游泳过去",
    ["Flight master at Feathermoon"] =
        "羽月要塞飞行管理员",
    ["Your pet picks up Claw (Rank 6) here."] =
        "你的宠物在这里学会爪击（等级6）。",
    ["Tame a Scorpid Hunter with Tame Beast."] =
        "用驯服野兽驯服一只Scorpid Hunter。",
    ["Head into the Library wing."] =
        "进入图书馆区。",
    ["The target is the dungeon's opening boss."] =
        "目标是副本的第一个首领。",
    ["Head across the hall called Gallery of Treasures."] =
        "穿过名为Gallery of Treasures的大厅。",
    ["Keep an eye on the minimap until its area name reads Scarlet Monastery again."] =
        "留意小地图，直到区域名称重新显示为血色修道院。",
    ["This is in the Armory wing."] =
        "这在军械库区。",
    ["Found in the Cathedral wing."] =
        "在大教堂区。",
    ["A lengthy stretch of quests is coming up."] =
        "接下来是一长段任务。",
    ["This vendor sells no arrows or bullets."] =
        "这个商人不卖箭和子弹。",
    ["Get these for simple Badlands turn-ins ahead."] =
        "拿上这些，之后在荒芜之地可以轻松交任务。",
    ["The NPC or item sits on the rocky shelf above."] =
        "NPC或物品在上方的岩石平台上。",
    ["Fight the dwarves."] =
        "与矮人战斗。",
    ["Look for a timber box."] =
        "寻找一个木箱。",
    ["A cluster of them gathers here."] =
        "这里聚集着一大群。",
    ["More of them dot the surroundings."] =
        "周围还零星分布着更多。",
    ["With the coming hand-ins, this brings you to level 42."] =
        "加上接下来要交的任务，这能让你升到42级。",
    ["Unlocks the flight point at Thorium Point."] =
        "开启瑟银哨塔的飞行点。",
    ["Flight master at Thorium Point"] =
        "瑟银哨塔飞行管理员",
    ["Take the passage out of Booty Bay"] =
        "走通道离开藏宝海湾",
    ["Take the tunnel into Booty Bay"] =
        "穿过隧道进入藏宝海湾",
    ["Take the trail toward the Ruins of Aboraz"] =
        "沿小路前往阿博拉兹废墟",
    ["Gradually move toward the northeast."] =
        "逐渐往东北方向推进。",
    ["The targets are goblins."] =
        "目标是地精。",
    ["Kill the witch doctors and the mystics."] =
        "击杀巫医和秘法师。",
    ["A dark panther, elite at 40, visible rather than hidden."] =
        "一只40级精英黑豹，不潜行，看得见。",
    ["Be ready: these opponents are elites at level 38."] =
        "做好准备：这些敌人是38级精英。",
    ["Saltwater Crocolisks spawn in the same places."] =
        "Saltwater Crocolisk也在同样的地方刷新。",
    ["The object is a table made of stone."] =
        "目标物品是一张石桌。",
    ["Drag him up until he breaks the surface."] =
        "把他往上拉，直到他浮出水面。",
    ["Follow the shoreline"] =
        "沿着海岸线走",
    ["The item is a brownish sheet of parchment."] =
        "物品是一张棕色的羊皮纸。",
    ["Look for a flat, white scroll lying open."] =
        "寻找一张摊开平放的白色卷轴。",
    ["If some pages are unavailable, go on without them."] =
        "如果有些书页拿不到，就不用管它们，继续前进。",
    ["You want Chapters I, II and III."] =
        "你需要第一章、第二章和第三章。",
    ["Collect the chunks of wood."] =
        "收集木块。",
    ["Do not go near Stonard."] =
        "别靠近斯通纳德。",
    ["Silt Crawlers drop it more often."] =
        "Silt Crawler掉率更高。",
    ["Fly to Nethergarde Keep"] =
        "飞往守望堡",
    ["A timer runs on this one; don't dawdle."] =
        "这个任务有时间限制，别磨蹭。",
    ["Hold on until Rizzle has fled."] =
        "坚持到Rizzle逃跑。",
    ["Targets here are human."] =
        "这里的目标是人类。",
    ["Dungeon runs are a fine choice here too, as you like."] =
        "如果你愿意，这里也可以去刷副本。",
    ["Each set of 5 handed in at Gadgetzan gives 380 xp."] =
        "在加基森每交5个可获得380点经验。",
    ["Hyenas also use these spawn spots."] =
        "土狼也会在这些刷新点出现。",
    ["Feralas and Tanaris"] =
        "菲拉斯和塔纳利斯",
    ["Position yourself in its center."] =
        "站到它的中心。",
    ["Consider bringing a group for this one."] =
        "这个可以考虑组队来做。",
    ["Zones with stronger foes lie just ahead."] =
        "前面的区域敌人更强。",
    ["The quests alone won't give you the level you need."] =
        "光靠任务达不到所需的等级。",
    ["Swim this way to stay out of fatigue"] =
        "从这边游，以免进入疲劳区",
    ["Hunt the crimson winged serpents."] =
        "猎杀深红色的风蛇。",
    ["Slay them, then apply the item to their remains."] =
        "杀死它们，然后对其尸体使用该物品。",
    ["Once freed, they can be killed."] =
        "被释放后就可以击杀。",
    ["Win the encounter at the temple."] =
        "打赢神庙那场战斗。",
    ["Take the trail to the southeast."] =
        "沿小路往东南走。",
    ["Inside a big room around a central pool."] =
        "在一个中央有水池的大房间里。",
    ["Most of them are in Theka the Martyr's scarab chamber."] =
        "大多在殉教者塞卡所在的甲虫房间。",
    ["It could take a few trips through the instance."] =
        "可能需要刷几次副本。",
    ["Do more Zul'Farrak runs."] =
        "多刷几次祖尔法拉克。",
    ["Keep to the road, then cross the tunnel"] =
        "沿道路走，然后穿过隧道",
    ["The robot sits in the open ground linking the cave and the tunnel."] =
        "机器人在连接洞穴和隧道的空地上。",
    ["Others lie past the tunnel."] =
        "隧道另一边还有更多。",
    ["Get out of the cave and use the passage beyond"] =
        "离开洞穴，走后面的通道",
    ["Look for a big, pale egg."] =
        "寻找一个白色的大蛋。",
    ["Hunt gorillas."] =
        "猎杀大猩猩。",
    ["Bears appear at the same spawn spots."] =
        "熊也会在同样的刷新点出现。",
    ["Hunt bears."] =
        "猎杀熊。",
    ["They appear in the same spots as the apes."] =
        "它们与猩猩在同样的地点出现。",
    ["Kill the foes near the big cage first."] =
        "先杀掉大笼子附近的敌人。",
    ["This helps with the following step."] =
        "这对下一步有帮助。",
    ["This sets Captured Sprite Darters free."] =
        "这会释放Captured Sprite Darter。",
    ["Save as many of them as possible."] =
        "尽可能多地救下它们。",
    ["Keep 6 or more of them alive."] =
        "至少保住其中6只。",
    ["If she is gone, wait until she comes back."] =
        "如果她不在，就等她回来。",
    ["Go into the cavern at the trail's foot"] =
        "进入小路尽头下方的洞穴",
    ["Getting it here speeds up Un'Goro Crater."] =
        "在这里拿到它能加快安戈洛环形山的进度。",
    ["Stay clear of the elite foes."] =
        "避开精英敌人。",
    ["Gather the big plumes colored brown and ivory."] =
        "收集棕色和象牙色的大羽毛。",
    ["Drop the Ground Clutter option down to 1."] =
        "把“地面杂物”选项调到1。",
    ["Hop onto the ledge here."] =
        "从这里跳上岩架。",
    ["Monsters are unable to reach you from this spot."] =
        "在这个位置怪物够不到你。",
    ["Hold off until you have left combat."] =
        "等脱离战斗后再进行。",
    ["Other creatures use these spawn points too."] =
        "其他生物也会占用这些刷新点。",
    ["If it hasn't turned up by level 49, move on."] =
        "如果到49级还没出现，就继续前进。",
    ["Stay on the road, then take the trail downhill"] =
        "沿道路走，再顺着小路下山",
    ["Point it at Gammerita."] =
        "对Gammerita使用它。",
    ["The quarry: a tough elite tortoise, azure-shelled."] =
        "猎物：一只蓝色龟壳的强悍精英海龟。",
    ["Look for little blue flasks."] =
        "寻找蓝色的小瓶子。",
    ["Steer around Revantusk Village."] =
        "绕开恶齿村。",
    ["Stay away from Gammerita."] =
        "远离Gammerita。",
    ["Kill mobs until your hearthstone is off cooldown"] =
        "刷怪直到炉石冷却完毕",
    ["The target patrols a wide loop, turning counterclockwise."] =
        "目标沿一大圈逆时针巡逻。",
    ["Watch for a pair of guards hiding in stealth."] =
        "小心两名潜行的卫兵。",
    ["The target's spawn point is 58.9, 39.3 in Tanaris."] =
        "目标的刷新点在塔纳利斯58.9, 39.3。",
    ["Head down the passage that opens on Lost Rigger Cove"] =
        "沿通道下去，通往Lost Rigger Cove",
    ["Few kills yield this item."] =
        "这个物品掉率很低。",
    ["Others can be found on raised wood platforms close by."] =
        "附近高起的木平台上还有更多。",
    ["Others are indoors too."] =
        "室内也有一些。",
    ["Take the passage out of Lost Rigger Cove"] =
        "走通道离开Lost Rigger Cove",
    ["If the NPC is gone, hold on until it reappears."] =
        "如果NPC不在，就等它重新出现。",
    ["Search the sand mounds."] =
        "搜寻沙堆。",
    ["It competes for spawn points."] =
        "它会与其他怪物争夺刷新点。",
    ["Stay clear of the elite tyrannosaur."] =
        "避开精英暴龙。",
    ["Every creature in Un'Goro Crater can drop it."] =
        "安戈洛环形山的所有生物都可能掉落它。",
    ["Gather from clumps of multicolored crystals."] =
        "从彩色水晶簇上采集。",
    ["Spawn points are shared, so pick up every one you find."] =
        "刷新点是共用的，所以见到就拿。",
    ["Gathering it causes other hues to show up."] =
        "采集后会出现其他颜色的。",
    ["The targets are mobile plant monsters."] =
        "目标是会移动的植物怪物。",
    ["Together with the next turn-ins, this brings you to level 50."] =
        "加上接下来要交的任务，这能让你升到50级。",
    ["Flight master at Marshal's Refuge"] =
        "马绍尔营地飞行管理员",
    ["In the Maraudon Tunnels, the target is a centaur in violet armor."] =
        "在玛拉顿通道里，目标是一个穿紫色盔甲的半人马。",
    ["Head into the purple wing of the Maraudon Tunnels."] =
        "进入玛拉顿通道的紫色区域。",
    ["Use it on the Spirit of Gelk."] =
        "对Spirit of Gelk使用它。",
    ["In the Maraudon Tunnels, find the chamber joining the purple and orange areas."] =
        "在玛拉顿通道里，找到连接紫色和橙色区域的房间。",
    ["Target the Spirit of Kolk with the item."] =
        "对Spirit of Kolk使用该物品。",
    ["Found in the Maraudon Tunnels, along the orange wing."] =
        "在玛拉顿通道的橙色区域。",
    ["The target is beside the big pool holding orange crystals."] =
        "目标在有橙色水晶的大水池旁边。",
    ["Target the Spirit of Magra with it."] =
        "对Spirit of Magra使用它。",
    ["Target Spirit of Veng with it."] =
        "对Spirit of Veng使用它。",
    ["In the orange area."] =
        "在橙色区域。",
    ["Use it beside the Vylestem Vines."] =
        "在Vylestem Vines旁边使用它。",
    ["Look for stumps topped with big leaves."] =
        "寻找顶部长着大叶子的树桩。",
    ["The spot is in Foulspore Cavern."] =
        "地点在Foulspore Cavern。",
    ["This happens in Maraudon's violet wing."] =
        "这在玛拉顿的紫色区域进行。",
    ["Aim the item at the Spirit of Maraudos."] =
        "对Spirit of Maraudos使用该物品。",
    ["The target is a spectral centaur holding a spear."] =
        "目标是一个手持长矛的幽灵半人马。",
    ["Small green flasks."] =
        "绿色的小瓶子。",
    ["Search the shoreline, right by the waves."] =
        "在海岸线上紧挨海浪的地方搜寻。",
    ["The objective is on the ship's center deck."] =
        "目标在船的中层甲板上。",
    ["Search for a parchment roll, white in color."] =
        "寻找一卷白色的羊皮纸。",
    ["Search the ship's middle or lowest deck."] =
        "在船的中层或最底层甲板搜寻。",
    ["If she is absent, wait for her to come back."] =
        "如果她不在，就等她回来。",
    ["Hunt down an elite raptor of level 43 whose scales look azure."] =
        "猎杀一只蓝色鳞片的43级精英迅猛龙。",
    ["The quarry is a pale tiger, an elite at 43."] =
        "猎物是一只白色老虎，43级精英。",
    ["It calls 2 small adds of a lesser level; neither one is elite."] =
        "它会召唤2个等级较低的小怪，都不是精英。",
    ["When it drops to about 50% health."] =
        "在它生命值降到约50%时。",
    ["Look underneath the bridge."] =
        "在桥底下找。",
    ["Hunt flame and stone elementals."] =
        "猎杀火焰元素和岩石元素。",
    ["Fight elementals and golems."] =
        "与元素和傀儡战斗。",
    ["Drop onto the metal catwalk at this spot"] =
        "从这里跳到金属走道上",
    ["Drop off the cavern's bridge at this spot"] =
        "从洞里这座桥上跳下去",
    ["Go in through the second cave opening"] =
        "从第二个洞口进去",
    ["Slave Workers can drop them too."] =
        "Slave Worker也会掉落。",
    ["Climb the trail out of the Cauldron"] =
        "沿小路往上，离开大熔炉",
    ["The foes here are elite."] =
        "这里的敌人是精英。",
    ["Do not leave this quest undone; it matters."] =
        "别漏掉这个任务，它很重要。",
    ["The spot is at the tower's upper level."] =
        "地点在塔的上层。",
    ["Beware, this foe is elite."] =
        "小心，这个敌人是精英。",
    ["Walk over the rope bridge"] =
        "走过吊桥",
    ["Hunt the elite azure saurian; it stands at level 48."] =
        "猎杀那只蓝色的精英爬行动物，它是48级。",
    ["The target wanders the trail."] =
        "目标在小路上游荡。",
    ["Defeat every foe close by before you begin."] =
        "开始前先打败附近所有敌人。",
    ["Escort Dorius Stonetender and keep him safe."] =
        "护送Dorius Stonetender，确保他的安全。",
    ["Keep it; a later quest calls for it."] =
        "留着它，之后的任务要用。",
    ["Look by the lookout towers ringing the Cauldron."] =
        "在大熔炉周围的瞭望塔附近找。",
    ["Climb the trail into Thorium Point"] =
        "沿小路往上，进入瑟银哨塔",
    ["Blasted Lands and Burning Steppes"] =
        "诅咒之地和燃烧平原",
    ["Prioritize these targets."] =
        "优先击杀这些目标。",
    ["Hunt basilisks."] =
        "猎杀石化蜥蜴。",
    ["They appear in the same spots as the boars."] =
        "它们与野猪在同样的地点出现。",
    ["Hunt hyenas for these."] =
        "猎杀土狼获取。",
    ["Scorpions spawn in the same spots."] =
        "蝎子也在同样的地点刷新。",
    ["Climb the trail to Morgan's Vigil"] =
        "沿小路往上，到摩根的岗哨",
    ["Flight master at Morgan's Vigil"] =
        "摩根的岗哨飞行管理员",
    ["8 different quests will ask for it."] =
        "有8个不同的任务需要它。",
    ["You hand in 60 pieces of cloth for every quest."] =
        "每个任务要交60块布。",
    ["Undead foes drop these in both Plaguelands zones, Western and Eastern."] =
        "西瘟疫之地和东瘟疫之地的亡灵敌人都会掉落。",
    ["Keep your Argent Dawn Commission aura up."] =
        "保持Argent Dawn Commission效果一直生效。",
    ["Together with the next turn-ins, this brings you to level 52."] =
        "加上接下来要交的任务，这能让你升到52级。",
    ["Azshara and Felwood"] =
        "艾萨拉和费伍德森林",
    ["A lengthy stretch of questing lies ahead."] =
        "前面是一长段任务。",
    ["Hand these in afterwards for experience and reputation."] =
        "之后把这些交掉，获取经验和声望。",
    ["Raise Timbermaw Hold standing to Unfriendly"] =
        "木喉要塞声望提升到冷淡",
    ["Extra targets wait in the caves."] =
        "洞穴里还有更多目标。",
    ["Stay on the trail to reach Jaedenar"] =
        "沿小路走到加德纳尔",
    ["Climb the trail into Jadefire Run"] =
        "沿小路往上，进入碧火小径",
    ["Flight master at Talonbranch Glade"] =
        "刺枝林地飞行管理员",
    ["Big blue plumes."] =
        "蓝色的大羽毛。",
    ["Head eastward as you go."] =
        "一路往东推进。",
    ["You pick up Claw (Rank 7) here."] =
        "在这里学会爪击（等级7）。",
    ["Flight master at Everlook"] =
        "永望镇飞行管理员",
    ["The flight master stands past the walls, outdoors."] =
        "飞行管理员在城墙外面。",
    ["Tame an Angerclaw Mauler with your Tame Beast spell."] =
        "用驯服野兽法术驯服一只Angerclaw Mauler。",
    ["Track down a plague-ridden bear with a chestnut coat."] =
        "找到一只栗色毛皮、染上瘟疫的熊。",
    ["Feralas and Azshara"] =
        "菲拉斯和艾萨拉",
    ["Aim the item at the Strider foes."] =
        "对陆行鸟敌人使用该物品。",
    ["The targets are towering green giants."] =
        "目标是高大的绿色巨人。",
    ["The item strips their elite status."] =
        "该物品会让它们失去精英状态。",
    ["Hunt down the elementals formed of water."] =
        "猎杀水元素。",
    ["Reveal Dire Maul on your map"] =
        "在地图上发现厄运之槌",
    ["Stand on the neighboring ledge, then hop into this crack in the wall"] =
        "站到旁边的岩架上，然后跳进墙上的这道裂缝",
    ["Hop onto the ledge"] =
        "跳上岩架",
    ["Leap over at this spot"] =
        "从这里跳过去",
    ["Leap up at this spot"] =
        "从这里跳上去",
    ["Shay Leafrunner trails behind you; keep her alive."] =
        "Shay Leafrunner会跟在你身后，确保她活着。",
    ["Keep near her, as she tends to stray."] =
        "待在她附近，她容易走丢。",
    ["Finish the quest named The Videre Elixir."] =
        "完成任务“The Videre Elixir”。",
    ["Keep the elixir in your bags; never consume it."] =
        "把药剂留在背包里，千万别喝。",
    ["You will die from it."] =
        "你会因此死亡。",
    ["Put these items in your bank vault."] =
        "把这些物品存进银行。",
    ["The quest giver waits on the hilltop."] =
        "任务发布者在山顶上。",
    ["The targets are Myrmidons and Sirens."] =
        "目标是侍从和海妖。",
    ["Skirt the Ruins of Eldarath, then take the bridge across"] =
        "绕过埃达拉斯废墟，再过桥",
    ["Drop down with care"] =
        "小心跳下去",
    ["The spot is the middle of the timber deck."] =
        "地点在木平台的中央。",
    ["It shows up close by after a while."] =
        "过一会儿它会在附近出现。",
    ["At times it takes several minutes."] =
        "有时要等好几分钟。",
    ["The targets are flame elementals."] =
        "目标是火焰元素。",
    ["An elite foe waits on the summit; steer clear."] =
        "山顶上有一个精英敌人，避开它。",
    ["Ringo trails behind you; keep him alive."] =
        "Ringo会跟在你身后，确保他活着。",
    ["Keep near him; he passes out."] =
        "待在他附近，他会晕倒。",
    ["Take the trail through the cavern"] =
        "沿小路穿过洞穴",
    ["Escort A-Me 01 and keep it alive."] =
        "护送A-Me 01，确保它活着。",
    ["Winterspring and Felwood"] =
        "冬泉谷和费伍德森林",
    ["Go into Jaedenar"] =
        "进入加德纳尔",
    ["Go to the upper floor of the cavern."] =
        "到洞穴的上层。",
    ["Circle the gap in the ground, then take the trail downward"] =
        "绕过地上的裂口，再顺着小路往下",
    ["The target is deep in the cave, on its lowest floor."] =
        "目标在洞穴深处的最底层。",
    ["Search the upper and lower floors of the cavern."] =
        "在洞穴的上层和下层搜寻。",
    ["The prisoner is held in a cage of yellow wood."] =
        "囚犯关在一个黄色木笼里。",
    ["Climb the trail and exit the cavern"] =
        "沿小路往上，离开洞穴",
    ["The targets are furbolgs."] =
        "目标是熊怪。",
    ["With the coming hand-ins, this brings you to level 55."] =
        "加上接下来要交的任务，这能让你升到55级。",
    ["A tough quest lies just ahead."] =
        "前面有一个困难的任务。",
    ["Flee if things go badly."] =
        "情况不妙就逃跑。",
    ["The NPC is a human spirit."] =
        "NPC是一个人类的灵魂。",
    ["The targets are leafless trees that walk."] =
        "目标是会走动的无叶树。",
    ["Slay the greenish beings of living water."] =
        "击杀绿色的活水生物。",
    ["The targets are wolves and bears."] =
        "目标是狼和熊。",
    ["The targets are 3 white furbolgs moving as one pack."] =
        "目标是3只结伴行动的白色熊怪。",
    ["The target patrols a long route beside the road."] =
        "目标沿道路旁的一条长路线巡逻。",
    ["Move on if you have not seen it once the trail ends."] =
        "如果走到小路尽头还没见到它，就继续前进。",
    ["Escort Ranshalla and guard her."] =
        "护送Ranshalla并保护她。",
    ["Wait until the foes hit her before you strike."] =
        "等敌人攻击她之后再出手。",
    ["They appear near 28.1, 35.0 in Winterspring."] =
        "它们在冬泉谷28.1, 35.0附近出现。",
    ["You can also do dungeons until you hit level 56."] =
        "你也可以刷副本直到56级。",
    ["Give Nafien the items in sets of 5."] =
        "每次5个交给Nafien。",
    ["Every full set you hand over earns 50 reputation."] =
        "每交满一组可获得50点声望。",
    ["Raise Timbermaw Hold standing to Neutral"] =
        "木喉要塞声望提升到中立",
    ["The NPC stands within the passage."] =
        "NPC站在通道里。",
    ["This foe is elite."] =
        "这个敌人是精英。",
    ["Target Black Broodlings with the item."] =
        "对黑色雏龙使用该物品。",
    ["A red crystal hovers over each body."] =
        "每具尸体上方都悬浮着一块红色水晶。",
    ["Hunt the huge red dragons."] =
        "猎杀巨大的红龙。",
    ["Look for gray standing stones."] =
        "寻找灰色的立石。",
    ["The target is an ogre."] =
        "目标是一个食人魔。",
    ["Watch out, its blows are strong."] =
        "小心，它攻击很猛。",
    ["The targets are wolves and orcs."] =
        "目标是狼和兽人。",
    ["The NPC is an elderly human lady."] =
        "NPC是一位人类老妇人。",
    ["If absent, she can be on the house's upper floor, at 52.4, 42.1 in Stormwind City."] =
        "如果不在，她可能在暴风城52.4, 42.1那栋房子的楼上。",
    ["Walk over the rope bridge, then climb the trail"] =
        "走过吊桥，再沿小路往上",
    ["The Plaguelands"] =
        "瘟疫之地",
    ["Check each of the two floors indoors."] =
        "室内两层都要找。",
    ["Stand at the watchtower's doorway."] =
        "站在瞭望塔门口。",
    ["An elite foe waits indoors; stay clear of it."] =
        "室内有一个精英敌人，避开它。",
    ["Spiders also appear at these spawn spots."] =
        "蜘蛛也会在这些刷新点出现。",
    ["Look for a white set of bones."] =
        "寻找一副白色的骨头。",
    ["The targets appear in several places."] =
        "目标在多个地点出现。",
    ["Finish Locked Away to obtain this."] =
        "完成任务“Locked Away”来获得它。",
    ["The target is a ghoul armed with a pitchfork."] =
        "目标是一个拿着干草叉的食尸鬼。",
    ["Elites roam close by; keep your distance."] =
        "附近有精英游荡，保持距离。",
    ["Search the bones of a fallen person."] =
        "搜寻一具死者的骸骨。",
    ["The NPC is within the ruined home."] =
        "NPC在倒塌的房屋里。",
    ["Search within the houses here."] =
        "在这里的房屋里搜寻。",
    ["Look for big yellow grubs."] =
        "寻找黄色的大幼虫。",
    ["With the coming hand-ins, this gets you to level 58."] =
        "加上接下来要交的任务，这能让你升到58级。",
    ["Flight master at Light's Hope Chapel"] =
        "圣光之愿礼拜堂飞行管理员",
    ["Look for big rocks seeping green slime."] =
        "寻找渗出绿色黏液的大岩石。",
    ["Progress westward as you go."] =
        "一路往西推进。",
    ["Other undead compete for the same spawn points."] =
        "其他亡灵会占用相同的刷新点。",
    ["The spirits rise where those foes die."] =
        "那些敌人死后会在原地冒出灵魂。",
    ["Go down into the tomb"] =
        "下到墓穴里",
    ["This is below ground, on the crypt's lower floor."] =
        "在地下，墓穴的下层。",
    ["Your character must be seated first."] =
        "你的角色必须先坐下。",
    ["Move the camera close and check which book is genuine."] =
        "把镜头拉近，看看哪本书是真的。",
    ["Some books are traps that summon foes."] =
        "有些书是陷阱，会召唤敌人。",
    ["The genuine book can look two ways:"] =
        "真书有两种样子：",
    ["Close to the big buildings lit in blue."] =
        "在亮着蓝光的大建筑附近。",
    ["A new one may appear when one is killed."] =
        "杀掉一个后可能会出现新的。",
    ["The targets are in the ruined houses."] =
        "目标在倒塌的房屋里。",
    ["It shows up on top of the box."] =
        "它会出现在箱子上面。",
    ["Targets are in the tower and around its base."] =
        "目标在塔里和塔底周围。",
    ["If an elite stands on the tower's roof, hold back outside."] =
        "如果塔顶站着精英，就在外面等着。",
    ["Pick up Claw (Rank 8) for your pet."] =
        "让你的宠物学会爪击（等级8）。",
    ["Tame a Winterspring Screecher with the Tame Beast spell."] =
        "用驯服野兽法术驯服一只Winterspring Screecher。",
    ["Hunt the white owls."] =
        "猎杀白色猫头鹰。",
    ["Either the patriarch or the matriarch yetis work."] =
        "雪人族长或雪人女族长都可以。",
    ["Climb across the mountain to the far side"] =
        "翻过山到另一边",
    ["Hunt the chimaeras."] =
        "猎杀奇美拉。",
    ["Target Legacki with the item."] =
        "对Legacki使用该物品。",
    ["Target Sprinkle with it."] =
        "对Sprinkle使用它。",
    ["Target Quixxil with it."] =
        "对Quixxil使用它。",
    ["Flight master at Cenarion Hold"] =
        "塞纳里奥要塞飞行管理员",
    ["Watch out: killing them can summon more foes."] =
        "小心：杀死它们可能会召唤更多敌人。",
    ["Look for fragments of rock that glow blue."] =
        "寻找发着蓝光的岩石碎块。",
    ["Roam the area where the insects swarm."] =
        "在虫群聚集的区域四处走动。",
    ["Hunt the gray scorpids."] =
        "猎杀灰色蝎子。",
    ["The target is an orc wearing violet robes."] =
        "目标是一个穿紫色长袍的兽人。",
    ["It shows up around here."] =
        "它在这附近出现。",
    ["Hunt the yellow scorpids."] =
        "猎杀黄色蝎子。",
    ["Target the burrowing worms."] =
        "以钻地的蠕虫为目标。",
    ["This number shrinks while you kill monsters."] =
        "杀怪时这个数字会减少。",
    ["Bring any feathers you collect to the NPC at 64.8, 8.1."] =
        "把收集到的羽毛交给64.8, 8.1的NPC。",
    ["The NPC stands outdoors, next to the crypt."] =
        "NPC在室外，墓穴旁边。",
    ["The targets are bats."] =
        "目标是蝙蝠。",
    ["Check in and around the structures."] =
        "在建筑物里面和周围找。",
    ["With the coming hand-ins, this gets you to level 5."] =
        "加上接下来要交的任务，这能让你升到5级。",
    ["The target is a shambling zombie."] =
        "目标是一只蹒跚的僵尸。",
    ["The quest giver is an abomination."] =
        "任务发布者是一只憎恶。",
    ["He may step off the road now and then to pick plants."] =
        "他可能时不时离开道路去采集植物。",
    ["Heal Deathguard Kel with Lesser Heal (Rank 2)."] =
        "用次级治疗术（等级2）治疗Deathguard Kel。",
    ["Buff Deathguard Kel with Power Word: Fortitude."] =
        "为Deathguard Kel施加真言术：韧。",
    ["The targets are gray, demon-like hounds."] =
        "目标是灰色的、像恶魔一样的猎犬。",
    ["The targets are zombies."] =
        "目标是僵尸。",
    ["Look for wilted violet weeds."] =
        "寻找枯萎的紫色杂草。",
    ["Walk the shoreline toward the southwest."] =
        "沿着海岸线向西南走。",
    ["If the beach ends first, move on without it."] =
        "如果海滩先走到头了，就放弃它继续前进。",
    ["Keep to the trail as it curves."] =
        "顺着弯曲的小路走。",
    ["Step into the flames."] =
        "走进火焰中。",
    ["Stay on the trail and keep climbing the steps"] =
        "沿小路走，继续爬台阶",
    ["Loot the gray chests built from metal."] =
        "拾取灰色的金属箱子。",
    ["Search in and around the sunken wrecks."] =
        "在沉船里面和周围寻找。",
    ["The target is a troll in crimson robes."] =
        "目标是一个穿着深红色长袍的巨魔。",
    ["Look for the skull-shaped objects."] =
        "寻找骷髅形状的物体。",
    ["The targets are clumps of purple eggs."] =
        "目标是一簇簇紫色的蛋。",
    ["Search close to the trunks."] =
        "在树干附近寻找。",
    ["Stay on the trail, then cross the tunnel"] =
        "沿小路走，然后穿过隧道",
    ["Traverse the passageway"] =
        "穿过通道",
    ["Fly to Orgrimmar"] =
        "飞往奥格瑞玛",
    ["The quest comes from a bounty sign."] =
        "这个任务来自一块悬赏告示牌。",
    ["Look for an iron slab marked with a skull."] =
        "寻找一块刻有骷髅标记的铁板。",
    ["Use the item at the pink marking."] =
        "在粉色标记处使用物品。",
    ["Move gradually northwest toward Agamand Mills."] =
        "逐步向西北推进到阿加曼德磨坊。",
    ["The target is a skeletal caster in armor."] =
        "目标是一个穿着盔甲的骷髅施法者。",
    ["The target is a banshee."] =
        "目标是一个女妖。",
    ["The targets are skeletons in armor."] =
        "目标是穿着盔甲的骷髅。",
    ["The targets are skeletal mages."] =
        "目标是骷髅法师。",
    ["Together with the next turn-ins, this brings you to level 13."] =
        "加上接下来交的任务，你会升到13级。",
    ["The target patrols the road from Brill to The Sepulcher."] =
        "目标在布瑞尔到瑟伯切尔的道路上巡逻。",
    ["The target appears close to The Sepulcher, at 47.5, 39.8 in Silverpine Forest."] =
        "目标出现在瑟伯切尔附近，银松森林的47.5, 39.8。",
    ["Fight quilboars."] =
        "与野猪人战斗。",
    ["Look for little brown pinecones."] =
        "寻找棕色的小松果。",
    ["Hunt the black-feathered birds."] =
        "猎杀黑色羽毛的鸟。",
    ["Look for gray slabs of stone lying flat."] =
        "寻找平放在地上的灰色石板。",
    ["Do not trail after the wolf."] =
        "不要跟着那只狼走。",
    ["Take the lift to the top of Thunder Bluff"] =
        "乘升降梯到雷霆崖顶部",
    ["Beside the forge."] =
        "在熔炉旁边。",
    ["Take a lift down out of Thunder Bluff"] =
        "乘升降梯下雷霆崖",
    ["Aim the item at one Adult Plainstrider."] =
        "对一只成年平原陆行鸟使用物品。",
    ["Target a Prairie Stalker with it."] =
        "对一只Prairie Stalker使用它。",
    ["Use the item on any Swoop."] =
        "对任意一只Swoop使用物品。",
    ["Choose an animal of level 9-10 and make it your pet with the Tame Beast spell."] =
        "选一只9-10级的动物，用驯服野兽法术把它变成你的宠物。",
    ["This pet is temporary; a lasting one comes shortly."] =
        "这只宠物是临时的；很快就会有一只长期的。",
    ["Flight master at Camp Taurajo"] =
        "陶拉祖营地的飞行管理员",
    ["Fly to Thunder Bluff"] =
        "飞往雷霆崖",
    ["Stick to the road and stay alert."] =
        "沿着道路走，保持警惕。",
    ["Flight master at the Crossroads"] =
        "十字路口的飞行管理员",
    ["This is food for your pet."] =
        "这是给宠物的食物。",
    ["A spirit shows up after this."] =
        "之后会出现一个灵魂。",
    ["Find one Venomtail Scorpid and use Tame Beast on it."] =
        "找一只Venomtail Scorpid，对它施放驯服野兽。",
    ["Release your current pet before this."] =
        "在此之前先放生你当前的宠物。",
    ["Here you tame a pet to keep."] =
        "在这里驯服一只长期保留的宠物。",
    ["The NPC waits at the mountain's summit."] =
        "该NPC在山顶等候。",
    ["Kill Water Seekers and Thornweavers."] =
        "击杀寻水者和织棘者。",
    ["The objective is at the far end."] =
        "目标在最远端。",
    ["Receive Sapta Sight"] =
        "获得Sapta Sight",
    ["The quest giver stands among the boulders."] =
        "任务发布者站在巨石之间。",
    ["This NPC is found down in the Cleft of Shadow."] =
        "该NPC在下面的暗影裂口里。",
    ["This clears the quest's time limit."] =
        "这会解除任务的时间限制。",
    ["Fly to Undercity"] =
        "飞往幽暗城",
    ["Orc and Troll start"] =
        "兽人和巨魔起始",
    ["Stay out of the cave when you can."] =
        "尽量不要进洞穴。",
    ["The following step is out of the cave."] =
        "下一步在洞穴外。",
    ["Look for a dark-shelled scorpion."] =
        "寻找一只深色外壳的蝎子。",
    ["Target Lazy Peons with the item."] =
        "对懒惰的苦工使用物品。",
    ["The targets are dozing orcs."] =
        "目标是打瞌睡的兽人。",
    ["Look for cacti bearing red fruit."] =
        "寻找结着红色果实的仙人掌。",
    ["Heal Grunt Kor'ja with the second rank of Lesser Heal."] =
        "用次级治疗术（等级2）治疗Grunt Kor'ja。",
    ["Buff Grunt Kor'ja with Power Word: Fortitude."] =
        "为Grunt Kor'ja施加真言术：韧。",
    ["Aim the item at one Dire Mottled Boar."] =
        "对一只恐怖斑纹野猪使用物品。",
    ["Use it on any Surf Crawler."] =
        "对任意一只Surf Crawler使用它。",
    ["Use it on any Armored Scorpid."] =
        "对任意一只Armored Scorpid使用它。",
    ["This leads to a quest for later levels."] =
        "这会引出一个更高等级的任务。",
    ["Escort Deathstalker Erland and keep him alive."] =
        "护送Deathstalker Erland，保证他活着。",
    ["Hunt the wolves whose fur is jet black."] =
        "猎杀毛色漆黑的狼。",
    ["Pick one Ferocious Grizzled Bear and tame it with Tame Beast."] =
        "选一只Ferocious Grizzled Bear，用驯服野兽驯服它。",
    ["Fly to The Sepulcher"] =
        "飞往瑟伯切尔",
    ["He has three ghouls at his side."] =
        "他身边有三个食尸鬼。",
    ["Hold off until one steps out, then slay it."] =
        "等到有一只走出来，再杀掉它。",
    ["The target shows up here sooner or later."] =
        "目标迟早会在这里出现。",
    ["The NPC is on Undercity's upper level."] =
        "该NPC在幽暗城的上层。",
    ["The NPC is in a little cave."] =
        "该NPC在一个小洞穴里。",
    ["The NPC is past the big trogg chamber, on its right side."] =
        "该NPC在穴居人大厅后面，靠右侧。",
    ["The quest giver waits in the tent."] =
        "任务发布者在帐篷里等候。",
    ["Move on if it is absent."] =
        "如果它不在，就继续前进。",
    ["If it isn't there, hold on until it shows up."] =
        "如果它不在，就等它出现。",
    ["Circle the mountain by its northern flank."] =
        "从北侧绕过这座山。",
    ["The target is a troll."] =
        "目标是一个巨魔。",
    ["The target is a human in a crimson long coat."] =
        "目标是一个穿着深红色长外套的人类。",
    ["The targets are the striped zhevras."] =
        "目标是带条纹的斑马。",
    ["Go into the water beside the rock that bubbles."] =
        "在冒泡的岩石旁边下水。",
    ["Look for big blue fungi."] =
        "寻找大的蓝色蘑菇。",
    ["Up to two foes might jump you."] =
        "最多可能有两个敌人突袭你。",
    ["Kill the purple raptors."] =
        "击杀紫色的迅猛龙。",
    ["Targets are found across the entire Barrens."] =
        "目标遍布整个贫瘠之地。",
    ["Slay any you come across along the way."] =
        "路上遇到的都杀掉。",
    ["With the coming hand-ins, this gets you to level 18."] =
        "加上接下来交的任务，你会升到18级。",
    ["Steal from Gamon using Pick Pocket."] =
        "对Gamon使用搜索偷取。",
    ["Use it on Tazan's Satchel."] =
        "对Tazan's Satchel使用它。",
    ["The item is already in your inventory."] =
        "物品已经在你的背包里了。",
    ["Check the upper and lower tiers of the structure."] =
        "检查建筑的上层和下层。",
    ["Escort Wizzlecrank's Shredder and keep it intact."] =
        "护送Wizzlecrank's Shredder，保证它完好无损。",
    ["Look for gray steel pails."] =
        "寻找灰色的钢桶。",
    ["The target is a pale lion."] =
        "目标是一只浅色的狮子。",
    ["It turns up in the area."] =
        "它会在这片区域出现。",
    ["Keep away from Sister Rathtalon."] =
        "远离Sister Rathtalon。",
    ["The target is a harpy with emerald plumage; beware, it is elite."] =
        "目标是一只翠绿色羽毛的鹰身人；小心，它是精英。",
    ["The target circles in the air, so search around."] =
        "目标在空中盘旋，所以要四处找找。",
    ["A small chest made of wood."] =
        "一个木制的小箱子。",
    ["Polly is the target for the item."] =
        "物品的目标是Polly。",
    ["Defeat Kolkar foes around Stagnant Oasis."] =
        "在死水绿洲周围击败科卡尔敌人。",
    ["Sooner or later a yell shows up in the chat window."] =
        "聊天窗口迟早会出现一句喊话。",
    ["Watch for his yell: I am summoned!"] =
        "留意他的喊话：“我被召唤了！”",
    ["Verog arrives after a shout dares intruders to his tent to die."] =
        "有人喊话叫闯入者到他的帐篷来送死之后，Verog就会出现。",
    ["Escort Kaya Flathoof and keep her safe."] =
        "护送Kaya Flathoof，保护她的安全。",
    ["Close to the finish, 3 foes ambush you together."] =
        "快到终点时，会有3个敌人一起伏击你。",
    ["Fly to Sun Rock Retreat"] =
        "飞往烈日石居",
    ["Gather the big, white eggs."] =
        "收集白色的大蛋。",
    ["Monsters might jump you here."] =
        "这里可能有怪物突袭你。",
    ["Hatchling spiders may bring a level 22 spider."] =
        "幼蛛可能会引来一只22级的蜘蛛。",
    ["Together with the next turn-ins, this brings you to level 20."] =
        "加上接下来交的任务，你会升到20级。",
    ["Look for a kodo with grey hide."] =
        "寻找一只灰色皮的科多兽。",
    ["The targets are big pink lizards."] =
        "目标是粉色的大蜥蜴。",
    ["The targets are under the water and along the shore."] =
        "目标在水下和岸边。",
    ["The target is a raptor."] =
        "目标是一只迅猛龙。",
    ["Trade your Blood Shards to gain buffs."] =
        "用你的血之碎片换取增益效果。",
    ["Trade any spare Blood Shards to him during your Barrens questing."] =
        "在贫瘠之地做任务时，把多余的血之碎片都拿来跟他交换。",
    ["Ask him for the Spirit of the Wind buff"] =
        "向他索取Spirit of the Wind增益效果",
    ["Hunt the winged serpents."] =
        "猎杀有翼的蛇。",
    ["Take the lift up into Thunder Bluff"] =
        "乘升降梯上雷霆崖",
    ["The object is a vase woven from wicker."] =
        "该物体是一个柳条编的花瓶。",
    ["They appear in scattered spots."] =
        "它们分散出现在各处。",
    ["Climb the mountainside"] =
        "爬上山坡",
    ["Descend the slope"] =
        "走下斜坡",
    ["Drop with care onto the rock, then go into the cave"] =
        "小心跳到岩石上，然后进入洞穴",
    ["The targets are oozes."] =
        "目标是软泥怪。",
    ["Look for little green shrubs bearing violet blooms."] =
        "寻找开着紫色花朵的绿色小灌木。",
    ["A centaur flanked by two bodyguards."] =
        "一个有两名护卫在旁的半人马。",
    ["Climb the trail and cross the peaks"] =
        "沿小路往上爬，翻过山峰",
    ["Look for a robot shaped like a person."] =
        "寻找一个人形的机器人。",
    ["The target appears right here."] =
        "目标就在这里出现。",
    ["Take the passage and trace the lantern trail into Ashenvale"] =
        "走通道，沿着灯笼指引的小路进入灰谷",
    ["Stay clear of Astranaar."] =
        "远离阿斯特兰纳。",
    ["Exit the tunnel into Ashenvale"] =
        "走出隧道，进入灰谷",
    ["Flight master at Zoram'gar Outpost"] =
        "佐拉姆加前哨站的飞行管理员",
    ["The NPC waits within the hut."] =
        "该NPC在小屋里等候。",
    ["Use it twice on Taskmaster Fizzule."] =
        "对Taskmaster Fizzule使用它两次。",
    ["A short way north of here."] =
        "在这里往北不远处。",
    ["Target Taskmaster Fizzule and salute him."] =
        "选中Taskmaster Fizzule，向他敬礼。",
    ["Rob Foreman Silixiz with Pick Pocket."] =
        "对Foreman Silixiz使用搜索。",
    ["Open with Ambush for a bigger hit."] =
        "用伏击起手，打出更高伤害。",
    ["Lean on Rupture for bonus damage."] =
        "多用割裂造成额外伤害。",
    ["Eviscerate adds a burst of damage here."] =
        "在这里剔骨能打出一波爆发伤害。",
    ["The objective is on the terrace above."] =
        "目标在上方的平台上。",
    ["Use Pick Lock to open it."] =
        "使用开锁打开它。",
    ["Poison crafting needs these."] =
        "制作毒药需要这些。",
    ["Flight master at Tarren Mill"] =
        "塔伦米尔的飞行管理员",
    ["Get rid of your Touch of Zanzil."] =
        "消除你身上的赞吉尔之触。",
    ["Pick any Gray Bear and use Tame Beast on it."] =
        "任选一只Gray Bear，对它施放驯服野兽。",
    ["Go into Durnholde Keep, then over the bridge"] =
        "进入敦霍尔德城堡，然后过桥",
    ["Look for it bound to the orc's leg."] =
        "它绑在兽人的腿上，去那里找。",
    ["Together with the next turn-ins, this brings you to level 23."] =
        "加上接下来交的任务，你会升到23级。",
    ["Indoors or out in the open fields."] =
        "在室内或外面的空地上。",
    ["It may be found outdoors too."] =
        "也可能在室外找到。",
    ["The NPC is a little wolf."] =
        "该NPC是一只小狼。",
    ["He goes berserk and attacks you once the quest is handed in."] =
        "交任务后他会狂暴并攻击你。",
    ["A woman holding a pitchfork."] =
        "一个拿着干草叉的女人。",
    ["The target patrols the trail between the houses."] =
        "目标在房屋之间的小路上巡逻。",
    ["The target's spawn point is 30.5, 40.6 in Hillsbrad Foothills."] =
        "目标的刷新点在希尔斯布莱德丘陵的30.5, 40.6。",
    ["With the coming hand-ins, this brings you to level 24."] =
        "加上接下来交的任务，你会升到24级。",
    ["Tougher foes are coming up next."] =
        "接下来的敌人更难对付。",
    ["Some may be in the smithy."] =
        "铁匠铺里可能也有一些。",
    ["The NPC is in the yard where black wolves roam."] =
        "该NPC在黑狼游荡的院子里。",
    ["Do this once the prisoner is free."] =
        "救出囚犯后再做这个。",
    ["The tome is blue, resting on a bookshelf."] =
        "那本书是蓝色的，放在书架上。",
    ["Look in the room where Fenrus is."] =
        "在芬鲁斯所在的房间里找。",
    ["The target is a dinosaur with blue hide."] =
        "目标是一只蓝色皮肤的恐龙。",
    ["Look for big boulders oozing green fluid."] =
        "寻找渗出绿色液体的大石头。",
    ["The target is a quilboar robed in red."] =
        "目标是一个穿红袍的野猪人。",
    ["Kill Stalkers and Pathfinders."] =
        "击杀潜伏者和探路者。",
    ["The target is a red winged serpent."] =
        "目标是一条红色的有翼蛇。",
    ["The target roams; check the area."] =
        "目标会游荡；在这片区域找找。",
    ["Keep some range when you use the item."] =
        "使用物品时保持一定距离。",
    ["With the coming hand-ins, this gets you to level 25."] =
        "加上接下来交的任务，你会升到25级。",
    ["Fly to Brackenwall Village"] =
        "飞往蕨墙村",
    ["The target is an aquatic dinosaur."] =
        "目标是一只水生恐龙。",
    ["The target roams through the water."] =
        "目标在水中游荡。",
    ["The target is beneath the platform."] =
        "目标在平台下面。",
    ["The target stands atop the timber platform."] =
        "目标站在木制平台上。",
    ["Exit Windshear Crag"] =
        "离开烈风峭壁",
    ["The targets are deer."] =
        "目标是鹿。",
    ["The targets are tiny blue dragons."] =
        "目标是蓝色的小龙。",
    ["Hunt the green slimes."] =
        "猎杀绿色的软泥怪。",
    ["Corrosive Sap Beasts use the same spawn points."] =
        "Corrosive Sap Beast也使用相同的刷新点。",
    ["Do not engage Sentinel Amarassan."] =
        "不要与Sentinel Amarassan交战。",
    ["The quarry is a kaldorei elite, level 27."] =
        "目标是一名27级的卡多雷精英。",
    ["Exit Stonetalon Peak"] =
        "离开石爪峰",
    ["Look for brown pinecones on the ground."] =
        "寻找地上的棕色松果。",
    ["Steer clear of the elite windstrider."] =
        "避开精英风行者。",
    ["Basilisks and moving tree creatures share these spawn points."] =
        "石化蜥蜴和会走动的树人共用这些刷新点。",
    ["Monsters are found throughout the Charred Vale."] =
        "焦炭谷到处都有怪物。",
    ["Take the trail toward Sun Rock Retreat"] =
        "沿小路前往烈日石居",
    ["Stay on the trail until the Charred Vale"] =
        "沿小路一直走到焦炭谷",
    ["The NPC is on the tower's middle floor."] =
        "该NPC在塔的中层。",
    ["Flight master at Splintertree Post"] =
        "碎木岗哨的飞行管理员",
    ["The targets are night elves hiding in stealth."] =
        "目标是潜行中的暗夜精灵。",
    ["Track Hidden makes them simpler to spot."] =
        "追踪隐藏生物能让它们更容易被发现。",
    ["Escort Torek and guard him."] =
        "护送Torek并保护他。",
    ["Don't let him die."] =
        "别让他死了。",
    ["Take the riverside trail, then climb this trail"] =
        "走河边的小路，然后沿这条小路往上爬",
    ["The target is a panther with black fur."] =
        "目标是一只黑色皮毛的豹子。",
    ["The target roams a wide route."] =
        "目标的游荡路线很长。",
    ["The target appears close to 62.4, 50.0 in Ashenvale."] =
        "目标出现在灰谷的62.4, 50.0附近。",
    ["Take the trail north into Thistlefur Hold"] =
        "沿小路向北进入蓟皮要塞",
    ["Search the brown crates built of timber."] =
        "搜索棕色的木箱。",
    ["Mostly on the cavern's upper level."] =
        "大多在洞穴的上层。",
    ["The NPC is on the cave's lowest level."] =
        "该NPC在洞穴的最底层。",
    ["Escort Ruul Snowhoof and keep him alive."] =
        "护送Ruul Snowhoof，保证他活着。",
    ["Look for a gray druid-style bear."] =
        "寻找一只灰色的德鲁伊熊。",
    ["The target is a watery being tinted a deeper green."] =
        "目标是一个颜色偏深绿的水之生物。",
    ["Together with the next turn-ins, this brings you to level 28."] =
        "加上接下来交的任务，你会升到28级。",
    ["Steer away from Silverwind Refuge."] =
        "避开银风避难所。",
    ["Climb the trail, then return by road to Splintertree Post"] =
        "沿小路往上爬，然后沿道路返回碎木岗哨",
    ["Escort Muglash and keep him safe."] =
        "护送Muglash，保护他的安全。",
    ["If the item isn't usable yet, hold on a moment."] =
        "如果物品还不能使用，就稍等一下。",
    ["Go into the Blackfathom Deeps instance"] =
        "进入黑暗深渊副本",
    ["In Blackfathom Deeps, naga enemies drop it."] =
        "在黑暗深渊里，纳迦敌人会掉落它。",
    ["The targets are all over the tunnels."] =
        "隧道里到处都是目标。",
    ["Collect the azure shards along the cavern sides in Blackfathom Deeps."] =
        "在黑暗深渊里收集洞壁上的蓝色碎片。",
    ["Head to the Moonshrine Ruins for this."] =
        "为此前往月神殿废墟。",
    ["Head back to Splintertree Post"] =
        "返回碎木岗哨",
    ["Your quarry is a huge azure bird of level 31."] =
        "你的目标是一只31级的巨大蓝色鸟。",
    ["The target circles over a wide area."] =
        "目标在一大片区域上空盘旋。",
    ["It appears near 78.0, 66.0 in Ashenvale."] =
        "它出现在灰谷的78.0, 66.0附近。",
    ["Take a lift down to Thousand Needles, walk the road toward Freewind Post, then a lift back up"] =
        "乘升降梯下到千针石林，沿道路走向乱风岗，再乘升降梯上去",
    ["Fly to Freewind Post"] =
        "飞往乱风岗",
    ["A pair of level 30 foes stand guard over it."] =
        "有两个30级的敌人守着它。",
    ["Use the teleporter to reach the Plateau"] =
        "使用传送器到达高原",
    ["Go back to Dorn Plainstalker"] =
        "返回Dorn Plainstalker处",
    ["This won't kill you."] =
        "这不会杀死你。",
    ["Kill Surveyors and Diggers."] =
        "击杀勘察员和挖掘者。",
    ["Take the lift upward"] =
        "乘升降梯上去",
    ["Look for big eggs."] =
        "寻找大蛋。",
    ["Keep away from Heartrazor."] =
        "远离Heartrazor。",
    ["Steelsnap is a brown hyena with 2 hyena escorts."] =
        "Steelsnap是一只棕色土狼，身边有2只土狼护卫。",
    ["The target appears near 17.3, 22.2 in Thousand Needles."] =
        "目标出现在千针石林的17.3, 22.2附近。",
    ["The target is a centaur, black in color."] =
        "目标是一个黑色的半人马。",
    ["It roams a wide route."] =
        "它的游荡路线很长。",
    ["Leave it out if you'd rather not hunt for it."] =
        "如果不想去找它，就跳过。",
    ["His patrol crosses this spot two times."] =
        "他的巡逻路线会两次经过这里。",
    ["Expect three foes to strike."] =
        "预计会有三个敌人来袭。",
    ["Fight off the foes that come at you"] =
        "击退来袭的敌人",
    ["Look for thorny plants."] =
        "寻找带刺的植物。",
    ["Hard quests are coming up."] =
        "接下来是困难的任务。",
    ["Climb the trail and cross the rope bridges"] =
        "沿小路往上爬，走过绳桥",
    ["The objective lies atop the mesa."] =
        "目标在台地顶上。",
    ["The target is a level 28 elite."] =
        "目标是28级精英。",
    ["You can defeat it alone without much trouble."] =
        "你可以轻松单独击败它。",
    ["Escort Lakota Windsong safely to the end."] =
        "护送Lakota Windsong安全抵达终点。",
    ["On every plateau, a pair of foes spawns."] =
        "每个高台上都会刷出两个敌人。",
    ["Be ready: this opponent is an elite at level 30."] =
        "做好准备：这个对手是30级精英。",
    ["Leave it if it proves too hard."] =
        "如果太难就放弃。",
    ["Climb the road into Feralas"] =
        "沿道路往上进入菲拉斯",
    ["Should you die, come back to life at Camp Mojache."] =
        "如果死了，就在莫沙彻营地复活。",
    ["Fly to Camp Mojache"] =
        "飞往莫沙彻营地",
    ["Get Water Sapta done as well."] =
        "同时完成“Water Sapta”。",
    ["You'll need this to pick up an upcoming quest."] =
        "接之后的一个任务需要它。",
    ["Leap up and take the trail behind that tree"] =
        "跳上去，走那棵树后面的小路",
    ["Head north along the river to reach the NPC."] =
        "沿河向北走到该NPC处。",
    ["Draw foes one at a time if you can."] =
        "尽量一次只引一个敌人。",
    ["Do not take on the whole group together."] =
        "不要同时和一整群敌人打。",
    ["Descend the ramp, then stay on the trail"] =
        "走下坡道，然后沿小路走",
    ["Climb the trail to the cave's highest level"] =
        "沿小路爬到洞穴的最高层",
    ["When nearly dead, it calls two guards."] =
        "快死时，它会叫来两个卫兵。",
    ["Warden Belamoore stands guard over it."] =
        "Warden Belamoore守着它。",
    ["The target is a mage of level 36."] =
        "目标是一个36级的法师。",
    ["Fight Kegan, breaking her line of sight with doors and stairways."] =
        "与Kegan战斗，利用门和楼梯卡她的视野。",
    ["While Shield Guards glow, stop your melee attacks on them."] =
        "盾卫发光时，停止对它们的近战攻击。",
    ["Expect heavy damage from it."] =
        "它的伤害很高，做好准备。",
    ["Together with the next turn-ins, this brings you to level 32."] =
        "加上接下来交的任务，你会升到32级。",
    ["Gather the big fungi."] =
        "收集大蘑菇。",
    ["The targets are out in front of the cavern."] =
        "目标在洞穴前面。",
    ["Flight master at Hammerfall"] =
        "落锤镇的飞行管理员",
    ["Stay away from Refuge Pointe."] =
        "远离避难谷地。",
    ["Together with the next turn-ins, this brings you to level 33."] =
        "加上接下来交的任务，你会升到33级。",
    ["Head out of the Apothecarium"] =
        "离开炼金房",
    ["Hive Drones compete for these spawn points."] =
        "Hive Drone会争抢这些刷新点。",
    ["The NPC is on the building's ground level."] =
        "该NPC在建筑的一楼。",
    ["The quest giver is in the Dormitory."] =
        "任务发布者在宿舍区。",
    ["Escort Kernobee to the portal at the dungeon's mouth."] =
        "护送克努比到副本入口的传送门。",
    ["Open the gray chest built of metal."] =
        "打开灰色的金属箱子。",
    ["Close to the north wall."] =
        "靠近北墙。",
    ["It shares a chamber with Mekgineer Thermaplugg."] =
        "它和麦克尼尔·瑟玛普拉格在同一个房间。",
    ["Plan on killing monsters for quite some time."] =
        "做好长时间杀怪的准备。",
    ["Other satyrs use the same spawn points."] =
        "其他萨特也使用相同的刷新点。",
    ["Take the trail toward Shadowprey Village"] =
        "沿小路前往葬影村",
    ["Fly to Shadowprey Village"] =
        "飞往葬影村",
    ["Defeat every foe in this chamber before starting."] =
        "开始之前先击败这个房间里的所有敌人。",
    ["Target Burning Blade foes with the item."] =
        "对燃刃敌人使用物品。",
    ["Wait for the foe to be badly hurt, then apply it."] =
        "等敌人受重伤后再使用。",
    ["Look for big white clams."] =
        "寻找白色的大蚌。",
    ["Flight master at Grom'gol"] =
        "格罗姆高的飞行管理员",
    ["They appear in the same spots as the panthers."] =
        "它们和豹子在相同的地点出现。",
    ["Watch for Shadowmaw Panthers; they are hidden by stealth."] =
        "留意Shadowmaw Panther；它们会潜行。",
    ["Tigers compete for the same spawn points."] =
        "老虎会争抢相同的刷新点。",
    ["The NPC is on the building's lowest floor"] =
        "该NPC在建筑的最底层",
    ["Climb the steps"] =
        "爬上台阶",
    ["You won't find an ammunition seller."] =
        "这里找不到弹药商人。",
    ["Guard \"Stinky\" Ignatz as you escort him."] =
        "护送\"Stinky\" Ignatz时保护好他。",
    ["Hunt the orange spiders."] =
        "猎杀橙色的蜘蛛。",
    ["Watch out: Darkfang Lurkers hide in stealth."] =
        "小心：Darkfang Lurker会潜行。",
    ["Escort Ogron, guarding him from attackers."] =
        "护送Ogron，保护他不受攻击。",
    ["Keep out of Theramore Isle."] =
        "不要进入塞拉摩岛。",
    ["Let yourself drown for a quick trip."] =
        "让自己溺水，快速赶路。",
    ["Save it: the warrior's Whirlwind weapon questline asks for it."] =
        "留着它：战士的旋风武器任务线需要它。",
    ["Alterac and Arathi"] =
        "奥特兰克和阿拉希",
    ["Get ready to take down an elite of level 40 shortly."] =
        "准备好，马上要击杀一个40级精英。",
    ["Quaff one potion right away so it is ready again later."] =
        "立刻喝一瓶药水，这样之后冷却就好了。",
    ["It wanders to the mouth of the cave."] =
        "它会游荡到洞口。",
    ["Look on the upper floor as well."] =
        "楼上也找找。",
    ["Climb the slope, then leap the wall"] =
        "爬上斜坡，然后跳过墙",
    ["Fly to Kargath"] =
        "飞往卡加斯",
    ["Stranglethorn and Swamp of Sorrows"] =
        "荆棘谷和悲伤沼泽",
    ["Go along the shore, then climb the trail"] =
        "沿着岸边走，然后沿小路往上爬",
    ["Keep clear of Darkshire."] =
        "避开夜色镇。",
    ["Flight master at Stonard"] =
        "斯通纳德的飞行管理员",
    ["Look for assorted little brown items."] =
        "寻找各种棕色的小物品。",
    ["Look for purple rings made of rock."] =
        "寻找紫色的石环。",
    ["A guardian shows up."] =
        "会出现一个守护者。",
    ["Stay clear of Lord Azrethoc."] =
        "避开Lord Azrethoc。",
    ["An elite winged fiend of level 40 with brown hide."] =
        "一个40级精英有翼恶魔，棕色皮肤。",
    ["The target wanders close by; look around."] =
        "目标在附近游荡；四处找找。",
    ["You can handle this alone without much trouble."] =
        "你可以轻松单独搞定。",
    ["A tougher foe is coming up."] =
        "接下来有一个更难对付的敌人。",
    ["Grab the loot."] =
        "拾取战利品。",
    ["The target is a crocodile with white scales."] =
        "目标是一只白色鳞片的鳄鱼。",
    ["The target roams a wide loop through the water."] =
        "目标在水中绕着一大圈游荡。",
    ["Accepting this starts a 2 hour countdown."] =
        "接受这个任务会开始2小时的倒计时。",
    ["The timer keeps running while you're offline."] =
        "离线时计时也不会停止。",
    ["Take this quest only when you have time to spare."] =
        "只在时间充裕时接这个任务。",
    ["Watch out for a pair of stronger monsters here."] =
        "小心这里两个更强的怪物。",
    ["Look for the NPC dressed in red armor."] =
        "寻找穿红色盔甲的NPC。",
    ["Climb the trail to Gordunni Outpost"] =
        "沿小路往上到戈杜尼前哨",
    ["Beside the shining blue rings on the ground."] =
        "在地上发光的蓝色圆环旁边。",
    ["Look for earth mounds that pop up."] =
        "寻找冒出来的土堆。",
    ["Ones holding the quest item shine blue."] =
        "带有任务物品的会发出蓝光。",
    ["Fight the tauren."] =
        "与牛头人战斗。",
    ["The target is a winged green bug, level 47."] =
        "目标是一只47级的绿色有翼虫子。",
    ["You can likely beat it at your current level."] =
        "以你目前的等级应该能打赢它。",
    ["Kill bugs."] =
        "击杀虫子。",
    ["Extra targets lurk in the bug caverns."] =
        "虫子洞穴里还有更多目标。",
    ["Stay on the road"] =
        "沿道路走",
    ["The targets are ghosts that materialize."] =
        "目标是会显形的幽灵。",
    ["No drops come from Stagwings and Skystormers."] =
        "Stagwing和Skystormer不会掉落。",
    ["Saves you some monster farming afterward."] =
        "之后能少刷些怪。",
    ["You need Chapter I as well as Chapter II."] =
        "你需要第一章和第二章。",
    ["It doesn't show up often."] =
        "它不常出现。",
    ["The NPC waits on the house's upper-floor terrace."] =
        "该NPC在房子楼上的露台等候。",
    ["Take the road until the trail starts"] =
        "沿道路走到小路起点",
    ["Circle the mountain on the trail, then climb it"] =
        "沿小路绕山，然后爬上去",
    ["Kill the crocodiles."] =
        "击杀鳄鱼。",
    ["Stay out of Swamp Talker's way."] =
        "避开Swamp Talker。",
    ["Hunt down the gray murloc; it is level 50."] =
        "追杀那只灰色鱼人；它是50级。",
    ["Tanaris and Dustwallow"] =
        "塔纳利斯和尘泥沼泽",
    ["Watch out for foes hidden in stealth."] =
        "小心潜行的敌人。",
    ["Look for brown eggs covered in spikes."] =
        "寻找布满尖刺的棕色蛋。",
    ["Buy plenty of arrows or bullets."] =
        "买足箭或子弹。",
    ["Stock up first: nobody in the Hinterlands sells arrows or bullets for level 40."] =
        "先备足：辛特兰没有人卖40级的箭或子弹。",
    ["Take the road that circles the peak, then descend the trail"] =
        "沿绕山峰的道路走，然后沿小路下去",
    ["Flight master at Revantusk Village"] =
        "恶齿村的飞行管理员",
    ["A trio of enemies attacks."] =
        "会有三个敌人来袭。",
    ["Look for a little silver pail holding tools."] =
        "寻找一个装着工具的银色小桶。",
    ["The targets are big eagle-like beasts."] =
        "目标是像鹰一样的大型野兽。",
    ["Wolves and owlbeasts use these spawn spots as well."] =
        "狼和枭兽也使用这些刷新点。",
    ["Look for crates made of wood."] =
        "寻找木箱。",
    ["The targets are wolves hidden in stealth."] =
        "目标是潜行的狼。",
    ["Steer clear of hostile Alliance NPCs."] =
        "避开敌对的联盟NPC。",
    ["Warning: this turns on your PvP flag."] =
        "警告：这会开启你的PvP状态。",
    ["Head into Shadra'Alor"] =
        "进入沙德拉洛",
    ["Get out of Shadra'Alor"] =
        "离开沙德拉洛",
    ["Feralas and Un'Goro"] =
        "菲拉斯和安戈洛",
    ["The targets are hippogryphs."] =
        "目标是角鹰兽。",
    ["Use it on the stone giant foes."] =
        "对石巨人敌人使用它。",
    ["You have 2 hours before it disappears."] =
        "你有2小时时间，之后它会消失。",
    ["Watch out: this foe is a level 50 elite."] =
        "小心：这个敌人是50级精英。",
    ["You can likely do it alone."] =
        "你应该能单独完成。",
    ["The NPC turns hostile and fights you."] =
        "该NPC会变为敌对并攻击你。",
    ["The target yields at roughly 30% health."] =
        "目标在生命值约30%时投降。",
    ["The NPC roams the trail close to Kargath."] =
        "该NPC在卡加斯附近的小路上游荡。",
    ["The NPC gives the quest only while at this spot."] =
        "该NPC只有在这个位置时才会给任务。",
    ["If the NPC is away, stay until he comes back."] =
        "如果该NPC不在，就等他回来。",
    ["Burning Steppes and Azshara"] =
        "燃烧平原和艾萨拉",
    ["Pass through Blackrock Mountain into Burning Steppes"] =
        "穿过黑石山进入燃烧平原",
    ["Fly to Flame Crest"] =
        "飞往烈焰峰",
    ["It lies atop a stone slab."] =
        "它放在一块石板上。",
    ["The following quest needs you at level 52."] =
        "下一个任务需要52级。",
    ["Ammunition can't be bought here."] =
        "这里买不到弹药。",
    ["Flight master at Valormok"] =
        "瓦罗莫克的飞行管理员",
    ["Look for a rectangular slab etched with green glyphs."] =
        "寻找一块刻有绿色符文的长方形石板。",
    ["Look for an oblong slab carved with pink glyphs."] =
        "寻找一块刻有粉色符文的长条形石板。",
    ["A rectangular slab carved with blue glyphs."] =
        "一块刻有蓝色符文的长方形石板。",
    ["Seek a carved slab of rock bearing golden glyphs."] =
        "寻找一块刻有金色符文的石板。",
    ["The NPC is in the tower, which has several floors."] =
        "该NPC在塔里，塔有好几层。",
    ["Felwood and Winterspring"] =
        "费伍德森林和冬泉谷",
    ["Walk west beside the river"] =
        "沿河向西走",
    ["Fly to Bloodvenom Post"] =
        "飞往血毒岗哨",
    ["Together with the next turn-ins, this brings you to level 53."] =
        "加上接下来交的任务，你会升到53级。",
    ["Hold on to it for a task in Un'Goro Crater later."] =
        "留着它，之后在安戈洛环形山的任务要用。",
    ["Get onto the massive incline."] =
        "走上那道巨大的斜坡。",
    ["Watch out for elite foes here."] =
        "小心这里的精英敌人。",
    ["Flee afterward."] =
        "之后逃跑。",
    ["More than one crystal might be required."] =
        "可能需要不止一块水晶。",
    ["The target shouts for Magus Rimtori once badly hurt."] =
        "目标受重伤时会呼叫Magus Rimtori。",
    ["A green cat, a Corrupted Saber, appears when you use it."] =
        "使用它时会出现一只绿色的猫，即Corrupted Saber。",
    ["Hold on until it begins to trail you."] =
        "等它开始跟着你。",
    ["The kitten is the green cat beside you."] =
        "小猫就是你身边那只绿色的猫。",
    ["Look beside Winna Hazzard."] =
        "在Winna Hazzard旁边找。",
    ["Hunt down an elite turtle of level 48 whose shell looks azure."] =
        "追杀一只48级精英海龟，它的壳是蓝色的。",
    ["The NPC wears a pale shirt and carries a lamp."] =
        "该NPC穿着浅色衬衫，提着一盏灯。",
    ["Elite human foes walk patrols here; stay clear."] =
        "这里有人类精英敌人巡逻；避开它们。",
    ["The NPC hides beneath the staircase."] =
        "该NPC躲在楼梯下面。",
    ["You can also take it out of your bank."] =
        "也可以从银行取出。",
    ["The target is a ghoul armed with a hayfork."] =
        "目标是一个拿着干草叉的食尸鬼。",
    ["It can appear at this spot."] =
        "它可能在这个位置出现。",
    ["One last lengthy stretch of monster farming."] =
        "最后一段长时间的刷怪。",
    ["Hold on to it; a task in Un'Goro Crater calls for it later."] =
        "留着它；安戈洛环形山的任务稍后需要。",
    -- Skyborne: the way off the isle
    ["Dalaran is reached through the Skyborne portal."] =
        "通过Skyborne传送门前往达拉然。",
    ["Take the Skyborne portal to Stormwind"] =
        "乘坐Skyborne传送门前往暴风城",
    -- Ding - Items: Cozy Sleeping Bag (hand-written guide)
    ["Cozy Sleeping Bag"] =
        "舒适的睡袋",
    ["A trail of clues on both continents, open from level 14, that ends with a bedroll worth up to 3% more experience: no fights, only objects to click."] =
        "横跨两块大陆的一串线索，14级起即可进行，终点是一个最多提供3%额外经验的睡袋：无需战斗，只需点击物品。",
    ["Westfall, west of Sentinel Hill: the burned-out remains beside the wrecked cart."] =
        "西部荒野，哨兵岭以西：损毁马车旁的烧焦残骸。",
    ["The Barrens, by the road south of Camp Taurajo: the burned-out remains at the foot of the burnt tower."] =
        "贫瘠之地，陶拉祖营地以南的路边：烧毁的塔楼脚下的烧焦残骸。",
    ["Horde land: stay clear of the guards."] =
        "部落领地：远离守卫。",
    ["Alliance land: stay clear of the guards."] =
        "联盟领地：远离守卫。",
    ["Right there: the next clue, on the remains or on the plank nailed beside them."] =
        "就在原地：下一条线索在残骸上，或在旁边钉着的木板上。",
    ["Path northeast of Sun Rock Retreat"] =
        "烈日石居东北方的小路",
    ["The camp is up in the hills: follow this path west."] =
        "营地在山上：沿这条小路向西走。",
    ["At the end of the path, in the abandoned camp: the bedroll lying on a crate."] =
        "小路尽头的废弃营地：放在箱子上的睡袋。",
    ["Optional: the wood and tinder from this reward relight the campfire beside it, a small quest the bag does not need."] =
        "可选：用这次奖励的木头和火绒重新点燃旁边的篝火，这是个小任务，睡袋并不需要它。",
    ["Up the hill north of the camp: a mound of fresh dirt."] =
        "营地北边的山坡上：一堆新翻的泥土。",
    ["Loch Modan, on top of the dam: the eagle figurine on the carved stone heads facing the Wetlands."] =
        "洛克莫丹，大坝顶上：面向湿地的石雕头像上的雄鹰雕像。",
    ["Cart against Thoradin's Wall"] =
        "靠在索拉丁之墙边的马车",
    ["On the Hillsbrad Foothills side: climb onto the cart, then up into the wall."] =
        "在希尔斯布莱德丘陵一侧：爬上马车，再爬进墙里。",
    ["The messenger bag hangs on the outer face of the wall."] =
        "信使包挂在墙的外侧。",
    ["The satchel just below it holds the sleeping bag."] =
        "正下方的挎包里装着睡袋。",
    ["Use it outdoors and stay on it without moving: each minute of sleep adds 1% experience, up to 3%."] =
        "在户外使用并站在上面不要移动：每睡一分钟增加1%经验，最多3%。",
    ["Try the sleeping bag"] =
        "试试睡袋",
    -- Ding - Leveling: what each trip is for (trainers, weapon masters, pets)
    ["Loot the beasts you kill on the way here"] =
        "拾取你在来路上击杀的野兽",
    ["Learn First Aid from the trainer"] =
        "向训练师学习急救",
    ["Learn Blacksmithing from the trainer"] =
        "向训练师学习锻造",
    ["Learn Mining from the trainer"] =
        "向训练师学习采矿",
    ["Learn Cooking from the trainer"] =
        "向训练师学习烹饪",
    ["Learn Herbalism from the trainer"] =
        "向训练师学习草药学",
    ["Learn Thrown at the weapon master"] =
        "向武器大师学习投掷武器",
    ["Learn Staves at the weapon master"] =
        "向武器大师学习法杖",
    ["Learn Swords at the weapon master"] =
        "向武器大师学习单手剑",
    ["Learn Maces at the weapon master"] =
        "向武器大师学习单手锤",
    ["Learn Bows at the weapon master"] =
        "向武器大师学习弓",
    ["Learn Guns at the weapon master"] =
        "向武器大师学习枪械",
    ["Learn Two-Handed Swords at the weapon master"] =
        "向武器大师学习双手剑",
    ["Learn Two-Handed Axes at the weapon master"] =
        "向武器大师学习双手斧",
    ["Learn Two-Handed Maces at the weapon master"] =
        "向武器大师学习双手锤",
    ["Learn Swords and Daggers at the weapon master"] =
        "向武器大师学习单手剑和匕首",
    ["Learn Swords and Staves at the weapon master"] =
        "向武器大师学习单手剑和法杖",
    ["Learn Bows and Staves at the weapon master"] =
        "向武器大师学习弓和法杖",
    ["Learn Guns and Maces at the weapon master"] =
        "向武器大师学习枪械和单手锤",
    ["Learn Guns and Two-Handed Axes at the weapon master"] =
        "向武器大师学习枪械和双手斧",
    ["Learn Two-Handed Swords and Staves at the weapon master"] =
        "向武器大师学习双手剑和法杖",
    ["Learn Two-Handed Axes and Two-Handed Maces at the weapon master"] =
        "向武器大师学习双手斧和双手锤",
    ["Learn Two-Handed Maces and Staves at the weapon master"] =
        "向武器大师学习双手锤和法杖",
    ["Learn Crossbows and Two-Handed Swords at the weapon master"] =
        "向武器大师学习弩和双手剑",
    ["Learn Guns, Two-Handed Axes and Two-Handed Maces at the weapon master"] =
        "向武器大师学习枪械、双手斧和双手锤",
    ["Tame a pet here"] =
        "在这里驯服一只宠物",
    ["Tame a beast here to learn the next rank of Claw"] =
        "在这里驯服一只野兽，学会下一级爪击",
    ["Head to the big cage"] =
        "前往大笼子",
    ["Visit the caged quilboar"] =
        "拜访笼中的野猪人",
    ["Go to the corrupted moonwell"] =
        "前往被污染的月亮井",
    -- Ding - Leveling: where an object or a monster target is (notes)
    ["The object is indoors."] =
        "该物件在室内。",
    ["The object is indoors, one floor up."] =
        "该物件在室内楼上一层。",
    ["The object is on the lower level, indoors."] =
        "该物件在室内下层。",
    ["The object is on the lower level within the bridge."] =
        "该物件在桥内部的下层。",
    ["The object is on the highest level of this structure."] =
        "该物件在这座建筑的最高层。",
    ["The object is up on the summit."] =
        "该物件在山顶上。",
    ["The object sits on the rocky shelf above."] =
        "该物件在上方的岩石平台上。",
    ["The target is indoors."] =
        "目标在室内。",
    ["The target is indoors, one floor up."] =
        "目标在室内楼上一层。",
    ["The target is indoors at street level."] =
        "目标在室内，与街道同层。",
    ["The target is indoors, on the central storey."] =
        "目标在室内中间那层。",
    ["The target is on the lower level, indoors."] =
        "目标在室内下层。",
    ["The target is on the tower's highest floor."] =
        "目标在塔的顶层。",
    ["The target is up on the summit."] =
        "目标在山顶上。",
    ["The target is down in the Cleft of Shadow."] =
        "目标在下面的暗影裂口里。",
    ["The target can be indoors or out."] =
        "目标可能在室内，也可能在室外。",
    ["The target patrols a long route; look along it."] =
        "目标沿一条很长的路线巡逻；沿路寻找。",
    ["The target waits here, then strolls out onto the big branch close by."] =
        "目标在这里等候，然后会走到附近的大树枝上。",
    -- Ding - Leveling: why an item goes to the bank (notes)
    ["You need it later for \"The Legend of Stalvan\": keep it in the bank to free a bag slot."] =
        "之后的任务“斯塔文的传说”需要它：先存进银行，腾出背包空间。",
    ["You need it later for \"Juice Delivery\": keep it in the bank to free a bag slot."] =
        "之后的任务“僵尸酒”需要它：先存进银行，腾出背包空间。",
    ["You need it later for \"The Brassbolts Brothers\": keep it in the bank to free a bag slot."] =
        "之后的任务“防撞头盔”需要它：先存进银行，腾出背包空间。",
    ["You need it later for \"A Noble Brew\": keep it in the bank to free a bag slot."] =
        "之后的任务“名酿”需要它：先存进银行，腾出背包空间。",
    ["You need it later for \"Soothing Turtle Bisque\": keep it in the bank to free a bag slot."] =
        "之后的任务“海龟汤”需要它：先存进银行，腾出背包空间。",
    ["You need it later for \"Reassignment\": keep it in the bank to free a bag slot."] =
        "之后的任务“人事调动”需要它：先存进银行，腾出背包空间。",
    ["You need it later for \"Parts for Kravel\": keep it in the bank to free a bag slot."] =
        "之后的任务“给克拉维尔的零件”需要它：先存进银行，腾出背包空间。",
    ["You need them later for \"Goblin Sponsorship\" and \"The Hidden Key\": keep them in the bank to free bag slots."] =
        "之后的任务“地精赞助商”和“隐藏的钥匙”需要它们：先存进银行，腾出背包空间。",
    ["You need it later for \"Chapter I\": keep it in the bank to free a bag slot."] =
        "之后的任务“荆棘谷的青山 - 第一章”需要它：先存进银行，腾出背包空间。",
    ["You need it later for \"Chapter II\": keep it in the bank to free a bag slot."] =
        "之后的任务“荆棘谷的青山 - 第二章”需要它：先存进银行，腾出背包空间。",
    ["You need it later for \"Chapter III\": keep it in the bank to free a bag slot."] =
        "之后的任务“荆棘谷的青山 - 第三章”需要它：先存进银行，腾出背包空间。",
    ["You need it later for \"Chapter IV\": keep it in the bank to free a bag slot."] =
        "之后的任务“荆棘谷的青山 - 第四章”需要它：先存进银行，腾出背包空间。",
    ["You need it later for \"The Karnitol Shipwreck\": keep it in the bank to free a bag slot."] =
        "之后的任务“卡尼托的背包”需要它：先存进银行，腾出背包空间。",
    ["You need them later for \"Magical Analysis\" and \"Caught!\": keep them in the bank to free bag slots."] =
        "之后的任务“魔法分析”和“被锁起来的矮人”需要它们：先存进银行，腾出背包空间。",
    ["You need it later for \"Rumors for Kravel\": keep it in the bank to free a bag slot."] =
        "之后的任务“地精的谣言”需要它：先存进银行，腾出背包空间。",
    ["You need it later for \"Ongeku\": keep it in the bank to free a bag slot."] =
        "之后的任务“盎格库尔”需要它：先存进银行，腾出背包空间。",
    ["You need it later for \"Sunken Treasure\": keep it in the bank to free a bag slot."] =
        "之后的任务“水下宝藏”需要它：先存进银行，腾出背包空间。",
    ["You need them later for \"Back to Booty Bay\" and \"Safety First\": keep them in the bank to free bag slots."] =
        "之后的任务“返回藏宝海湾”和“安全第一”需要它们：先存进银行，腾出背包空间。",
    ["You need them later for \"Report Back to Fizzlebub\" and \"Rhapsody's Kalimdor Kocktail\": keep them in the bank to free bag slots."] =
        "之后的任务“向菲兹巴布报告”和“拉普索迪的卡利姆多鸡尾酒”需要它们：先存进银行，腾出背包空间。",
    ["You need them later for \"The Borrower\", \"Screecher Spirits\", \"The Super Egg-O-Matic\" and \"Rhapsody's Kalimdor Kocktail\": keep them in the bank to free bag slots."] =
        "之后的任务“海龟照片”、“尖啸者的灵魂”、“超级测蛋器”和“拉普索迪的卡利姆多鸡尾酒”需要它们：先存进银行，腾出背包空间。",
    ["You need them later for \"Crystals of Power\": keep them in the bank to free bag slots."] =
        "之后的任务“能量水晶”需要它们：先存进银行，腾出背包空间。",
    ["You need them later for \"Rhapsody's Tale\", \"The Super Snapper FX\", \"Whiskey Slim's Lost Grog\" and \"Favored of Elune?\": keep them in the bank to free bag slots."] =
        "之后的任务“拉普索迪的故事”、“超级摄影器FX”、“威士忌斯利姆的酒”和“月神之兽？”需要它们：先存进银行，腾出背包空间。",
    ["You need it later for \"Deliver to MacKinley\": keep it in the bank to free a bag slot."] =
        "之后的任务“给马克基雷的货物”需要它：先存进银行，腾出背包空间。",
    ["You need them later for \"The Bait for Lar'korwi\", \"Un'Goro Soil\", \"A Visit to Gregan\" and \"It's a Secret to Everybody\": keep them in the bank to free bag slots."] =
        "之后的任务“拉克维的诱饵”、“安戈洛的泥土”、“造访格雷甘”和“无人知晓的秘密”需要它们：先存进银行，腾出背包空间。",
    ["You need it later for \"Rise of the Silithid\": keep it in the bank to free a bag slot."] =
        "之后的任务“异种蝎的威胁”需要它：先存进银行，腾出背包空间。",
    ["You need it later for \"A Taste of Flame\": keep it in the bank to free a bag slot."] =
        "之后的任务“烈焰精华”需要它：先存进银行，腾出背包空间。",
    ["You need them later for \"Chasing A-Me 01\" and \"Arcane Runes\": keep them in the bank to free bag slots."] =
        "之后的任务“找回A-Me 01”和“奥术符文”需要它们：先存进银行，腾出背包空间。",
    ["You need them later for \"Good Natured Emma\", \"Arcane Runes\" and \"Sprinkle's Secret Ingredient\": keep them in the bank to free bag slots."] =
        "之后的任务“善良的艾玛”、“奥术符文”和“斯普琳科的秘密佐料”需要它们：先存进银行，腾出背包空间。",
    ["You need them later for \"The Stone Circle\", \"Felbound Ancients\", \"A Little Slime Goes a Long Way\", \"Moontouched Wildkin\" and \"Meet at the Grave\": keep them in the bank to free bag slots."] =
        "之后的任务“石环”、“被禁锢的古树”、“远方的软泥怪”、“月光羽毛”和“墓地相见”需要它们：先存进银行，腾出背包空间。",
    ["You need it later for \"Return to Tymor\": keep it in the bank to free a bag slot."] =
        "之后的任务“向法师泰摩尔回复”需要它：先存进银行，腾出背包空间。",
    ["You need them later for \"Aquementas\", \"The Everlook Report\", \"Duke Nicholas Zverenhoff\" and \"Troubled Spirits of Kel'Theril\": keep them in the bank to free bag slots."] =
        "之后的任务“亚奎门塔斯”、“永望镇报告”、“尼古拉斯·瑟伦霍夫公爵”和“凯斯利尔的怨灵”需要它们：先存进银行，腾出背包空间。",
    ["You need it later for \"Felnok Steelspring\": keep it in the bank to free a bag slot."] =
        "之后的任务“菲诺克”需要它：先存进银行，腾出背包空间。",
    ["You need it later for \"Glyphed Oaken Branch\": keep it in the bank to free a bag slot."] =
        "之后的任务“雕文橡木枝”需要它：先存进银行，腾出背包空间。",
    ["You need them later for \"The Disruption Ends\" and \"Supplies for the Crossroads\": keep them in the bank to free bag slots."] =
        "之后的任务“野猪人的头目”和“十字路口的补给品”需要它们：先存进银行，腾出背包空间。",
    ["You need it later for \"Chen's Empty Keg\": keep it in the bank to free a bag slot."] =
        "之后的任务“老陈的空酒桶”需要它：先存进银行，腾出背包空间。",
    ["You need it later for \"Egg Hunt\": keep it in the bank to free a bag slot."] =
        "之后的任务“蝎卵”需要它：先存进银行，腾出背包空间。",
    ["You need them later for \"Souvenirs of Death\" and \"Battle of Hillsbrad\": keep them in the bank to free bag slots."] =
        "之后的任务“死亡的纪念品”和“希尔斯布莱德之战”需要它们：先存进银行，腾出背包空间。",
    ["You need it later for \"Frostmaw\": keep it in the bank to free a bag slot."] =
        "之后的任务“霜喉雪人”需要它：先存进银行，腾出背包空间。",
    ["You need it later for \"The Swarm Grows\": keep it in the bank to free a bag slot."] =
        "之后的任务“疯狂的虫群”需要它：先存进银行，腾出背包空间。",
    ["You need them later for \"Martek the Exiled\" and \"Hemet Nesingwary\": keep them in the bank to free bag slots."] =
        "之后的任务“流放者马特克”和“赫米特·奈辛瓦里”需要它们：先存进银行，腾出背包空间。",
    ["You need it later for \"Caught!\": keep it in the bank to free a bag slot."] =
        "之后的任务“被锁起来的矮人”需要它：先存进银行，腾出背包空间。",
    ["You need them later for \"The Black Shield\" and \"Into the Field\": keep them in the bank to free bag slots."] =
        "之后的任务“黑色盾牌”和“进入沙漠”需要它们：先存进银行，腾出背包空间。",
    ["You need them later for \"Tanaris Field Sampling\" and \"Screecher Spirits\": keep them in the bank to free bag slots."] =
        "之后的任务“塔纳利斯的样本”和“尖啸者的灵魂”需要它们：先存进银行，腾出背包空间。",
    ["You need it later for \"Back to Booty Bay\": keep it in the bank to free a bag slot."] =
        "之后的任务“返回藏宝海湾”需要它：先存进银行，腾出背包空间。",
    ["You need them later for \"Deadmire\" and \"Safety First\": keep them in the bank to free bag slots."] =
        "之后的任务“死沼巨鳄”和“安全第一”需要它们：先存进银行，腾出背包空间。",
    ["You need them later for \"Another Message to the Wildhammer\", \"Screecher Spirits\" and \"The Super Egg-O-Matic\": keep them in the bank to free bag slots."] =
        "之后的任务“又一个给蛮锤部族的警告”、“尖啸者的灵魂”和“超级测蛋器”需要它们：先存进银行，腾出背包空间。",
    ["You need it later for \"Return to Witch Doctor Uzer'i\": keep it in the bank to free a bag slot."] =
        "之后的任务“向巫医尤克里回复”需要它：先存进银行，腾出背包空间。",
    ["You need it later for \"The Atal'ai Exile\": keep it in the bank to free a bag slot."] =
        "之后的任务“阿塔莱流放者”需要它：先存进银行，腾出背包空间。",
    ["You need them later for \"Testing the Vessel\" and \"Report Back to Fizzlebub\": keep them in the bank to free bag slots."] =
        "之后的任务“测试容器”和“向菲兹巴布报告”需要它们：先存进银行，腾出背包空间。",
    ["You need it later for \"Return to Apothecary Zinge\": keep it in the bank to free a bag slot."] =
        "之后的任务“向药剂师金格回报”需要它：先存进银行，腾出背包空间。",
    ["You need them later for \"The Stone Circle\" and \"Crystals of Power\": keep them in the bank to free bag slots."] =
        "之后的任务“石环”和“能量水晶”需要它们：先存进银行，腾出背包空间。",
    ["You need them later for \"Ripple Delivery\", \"Whiskey Slim's Lost Grog\" and \"Seeping Corruption\": keep them in the bank to free bag slots."] =
        "之后的任务“送回蜜酒”、“威士忌斯利姆的酒”和“堕落之水”需要它们：先存进银行，腾出背包空间。",
    ["You need them later for \"Bungle in the Jungle\", \"The Bait for Lar'korwi\" and \"It's a Secret to Everybody\": keep them in the bank to free bag slots."] =
        "之后的任务“擒虫先擒王”、“拉克维的诱饵”和“无人知晓的秘密”需要它们：先存进银行，腾出背包空间。",
    ["You need them later for \"Delivery to Magatha\" and \"Seeping Corruption\": keep them in the bank to free bag slots."] =
        "之后的任务“玛加萨的石版”和“堕落之水”需要它们：先存进银行，腾出背包空间。",
    ["You need it later for \"Jes'rimon's Payment to Jediga\": keep it in the bank to free a bag slot."] =
        "之后的任务“杰斯雷蒙的报酬”需要它：先存进银行，腾出背包空间。",
    ["You need it later for \"Meet at the Grave\": keep it in the bank to free a bag slot."] =
        "之后的任务“墓地相见”需要它：先存进银行，腾出背包空间。",
    ["You need them later for \"Delivery to Andron Gant\", \"A Grave Situation\" and \"Betrayed\": keep them in the bank to free bag slots."] =
        "之后的任务“安德隆·甘特的石版”、“寻找墓碑”和“叛徒”需要它们：先存进银行，腾出背包空间。",
    ["You need them later for \"The Everlook Report\" and \"Duke Nicholas Zverenhoff\": keep them in the bank to free bag slots."] =
        "之后的任务“永望镇报告”和“尼古拉斯·瑟伦霍夫公爵”需要它们：先存进银行，腾出背包空间。",
    ["You need it later for \"Aquementas\": keep it in the bank to free a bag slot."] =
        "之后的任务“亚奎门塔斯”需要它：先存进银行，腾出背包空间。",
    -- Places of the hearthstone steps (`sethearth`): the town, as this language names it (an
    -- inn's own name: its town).
    ["Astranaar"] =
        "阿斯特兰纳",
    ["Auberdine"] =
        "奥伯丁",
    ["Bloodhoof Village"] =
        "血蹄村",
    ["Booty Bay"] =
        "藏宝海湾",
    ["Brill"] =
        "布瑞尔",
    ["Camp Mojache"] =
        "莫沙彻营地",
    ["Camp Taurajo"] =
        "陶拉祖营地",
    ["Cenarion Hold"] =
        "塞纳里奥要塞",
    ["Coriella Calmbreeze"] =
        "Coriella Calmbreeze",
    ["Darkshire"] =
        "夜色镇",
    ["Deepwater Tavern"] =
        "米奈希尔港",
    ["Dolanaar"] =
        "多兰纳尔",
    ["Donaal Downbreeze"] =
        "Donaal Downbreeze",
    ["Everlook"] =
        "永望镇",
    ["Feathermoon Stronghold"] =
        "羽月要塞",
    ["Freewind Post"] =
        "乱风岗",
    ["Gadgetzan"] =
        "加基森",
    ["Gallows' End Tavern"] =
        "布瑞尔",
    ["Goldshire"] =
        "闪金镇",
    ["Grom'gol"] =
        "格罗姆高营地",
    ["Hammerfall"] =
        "落锤镇",
    ["Ironforge"] =
        "铁炉堡",
    ["Kargath"] =
        "卡加斯",
    ["Kharanos"] =
        "卡拉诺斯",
    ["Lakeshire"] =
        "湖畔镇",
    ["Light's Hope Chapel"] =
        "圣光之愿礼拜堂",
    ["Menethil Harbor"] =
        "米奈希尔港",
    ["Nijel's Point"] =
        "尼耶尔前哨站",
    ["Orgrimmar"] =
        "奥格瑞玛",
    ["Ratchet"] =
        "棘齿城",
    ["Razor Hill"] =
        "剃刀岭",
    ["Revantusk Village"] =
        "恶齿村",
    ["Sentinel Hill"] =
        "哨兵岭",
    ["Shadowprey Village"] =
        "葬影村",
    ["Southshore"] =
        "南海镇",
    ["Splintertree Post"] =
        "碎木岗哨",
    ["Stonard"] =
        "斯通纳德",
    ["Stonetalon Peak"] =
        "石爪峰",
    ["Stormwind City"] =
        "暴风城",
    ["Stoutlager Inn"] =
        "塞尔萨玛",
    ["Sun Rock Retreat"] =
        "烈日石居",
    ["Tarren Mill"] =
        "塔伦米尔",
    ["The Crossroads"] =
        "十字路口",
    ["The Sepulcher"] =
        "瑟伯切尔",
    ["Thelsamar"] =
        "塞尔萨玛",
    ["Theramore"] =
        "塞拉摩",
    ["Theramore Isle"] =
        "塞拉摩岛",
    ["Thunder Bluff"] =
        "雷霆崖",
    ["Thunderbrew Distillery"] =
        "卡拉诺斯",
    -- Ding! - Class quests (hand-written guides)
    ["Druid quests"] =
        "德鲁伊任务",
    ["At level 10, your trainer teaches Teleport: Moonglade: the quick way to Moonglade and back, used all through this guide."] =
        "10级时，训练师会教你“传送：月光林地”：往返月光林地的快捷方式，本指南全程都会用到。",
    ["Denatharion, the druid trainer of the Cenarion Enclave in Darnassus, sends you to Mathrengyl next to him."] =
        "德纳萨里安，达纳苏斯塞纳里奥区的德鲁伊训练师，会让你去找他旁边的玛斯雷。",
    ["Mathrengyl Bearwalker, upstairs in the Cenarion Enclave."] =
        "玛斯雷·驭熊者，在塞纳里奥区的楼上。",
    ["From level 10: the chain that teaches Bear Form."] =
        "10级起：学会熊形态的任务线。",
    ["Dendrite Starblaze waits on the upper floor of the great house of Nighthaven."] =
        "德迪利特·星焰在永夜港大房子的楼上等候。",
    ["The Great Bear Spirit waits northwest of the village, up the hill path: listen to all it has to say."] =
        "巨熊之灵在村子西北，沿山路而上：听它把话说完。",
    ["Sindrayl, the hippogryph master south of Nighthaven: take this flight path for your next trips here."] =
        "辛德拉尔，永夜港南边的角鹰兽管理员：开启这条飞行路线，以后来这里更方便。",
    ["Lunaclaw's cave, in the hills east of Auberdine"] =
        "月爪枭兽的洞穴，在奥伯丁以东的山丘中",
    ["Deep in the cave, use the Cenarion Moondust by the moonkin stone: Lunaclaw appears. Defeat her, then speak to her spirit."] =
        "在洞穴深处，于月夜枭兽之石旁使用塞纳里奥月尘：月爪枭兽会出现。击败她，然后与她的灵魂交谈。",
    ["Turning this in teaches Bear Form."] =
        "交付此任务后学会熊形态。",
    ["From level 10: the Skyborne quests of the bear spirit, on Zephras Isle."] =
        "10级起：Zephras Isle上熊之灵的Skyborne任务。",
    ["Alfina Nightgaze, the druid trainer of Dalaran, gives it."] =
        "Alfina Nightgaze，达拉然的德鲁伊训练师，给出此任务。",
    ["Opens the way to Moonglade, the home of the druids."] =
        "开启前往月光林地的道路，那里是德鲁伊的家园。",
    ["Sheldras Moontree, the druid trainer of Stormwind, in the park."] =
        "沙德拉斯·月树，暴风城的德鲁伊训练师，在公园里。",
    ["Five Earthroot will be needed: an herb found along the roads, picked with Herbalism or bought at the auction house."] =
        "需要五株地根草：一种长在路边的草药，可用草药学采集或在拍卖行购买。",
    ["From level 14: the chain that teaches Cure Poison."] =
        "14级起：学会消毒术的任务线。",
    ["Fill the sampler at the mouth of the Cliffspring Falls cave, northeast of Auberdine."] =
        "在奥伯丁东北的壁泉河瀑布洞口装满取样器。",
    ["Alanndarian Nightsong, in her house in Auberdine."] =
        "奥兰达利亚·夜歌，在她奥伯丁的房子里。",
    ["The Lunar Fungus grows in the small caves of the hills east of Auberdine, near Lunaclaw's."] =
        "月亮菇长在奥伯丁以东山丘的小洞穴里，靠近月爪枭兽的洞穴。",
    ["Sickly Deer wander the woods of Darkshore: use the salve on them."] =
        "生病的鹿在黑海岸的树林中游荡：对它们使用药膏。",
    ["Turning this in teaches Cure Poison."] =
        "交付此任务后学会消毒术。",
    ["From level 16: the chain that teaches Aquatic Form."] =
        "16级起：学会水栖形态的任务线。",
    ["The Shrine Bauble, a small wicker urn, lies on the bottom of Lake Elune'ara: dive around the shrine."] =
        "神殿灵珠是一个柳条编的小罐，躺在月神湖湖底：在神殿周围潜水寻找。",
    ["Use the bauble at the Shrine of Remulos, by the lake."] =
        "在湖边的雷姆洛斯神殿使用灵珠。",
    ["The first half of the pendant lies under the water off the north of Darkshore."] =
        "坠饰的第一半在黑海岸北部外海的水下。",
    ["The second half lies under the water off the western coast of Westfall."] =
        "第二半在西部荒野西海岸外的水下。",
    ["Back at the Shrine of Remulos: use a half pendant there to make it whole."] =
        "回到雷姆洛斯神殿：在那里使用半块坠饰，将其合而为一。",
    ["Turning this in teaches Aquatic Form."] =
        "交付此任务后学会水栖形态。",
    ["Night Elves get it from Mathrengyl Bearwalker in Darnassus."] =
        "暗夜精灵从达纳苏斯的玛斯雷·驭熊者处接取。",
    ["From level 20: Forever's chain of the Great Cat Spirit, in Moonglade."] =
        "20级起：Forever的巨豹之灵任务线，在月光林地。",
    ["The Great Cat Spirit rests in the south of Moonglade."] =
        "巨豹之灵栖息在月光林地南部。",
    ["The three relics lie in the southeast of Moonglade."] =
        "三件圣物在月光林地东南部。",
    ["The Avatar of Saeyleenan waits in the south of Moonglade."] =
        "Avatar of Saeyleenan在月光林地南部等候。",
    ["Mathrengyl Bearwalker, upstairs in the Cenarion Enclave of Darnassus."] =
        "玛斯雷·驭熊者，在达纳苏斯塞纳里奥区的楼上。",
    ["Any druid trainer of a capital gives it."] =
        "任何主城的德鲁伊训练师都会给出此任务。",
    ["From level 50: Torwa Pathfinder's chain in Un'Goro Crater, which ends in the Temple of Atal'Hakkar."] =
        "50级起：托尔瓦·寻路者在安戈洛环形山的任务线，终点在阿塔哈卡神庙。",
    ["Torwa Pathfinder camps on the eastern side of the crater."] =
        "托尔瓦·寻路者在环形山东侧扎营。",
    ["The Gorishi wasps of the hive in the south carry the stings; the Bloodcaps grow on red plants all over the crater."] =
        "南边虫巢的格里什异种蝎身上有钉刺；血帽长在环形山各处的红色植物上。",
    ["Use the barb on a devilsaur: they roam the open plains of the crater."] =
        "对魔暴龙使用尖刺：它们在环形山的开阔平原上游荡。",
    ["Atal'alarion, the guardian of the idol in the temple, drops the Putrid Vine."] =
        "阿塔拉利恩，神庙中神像的守护者，掉落腐烂藤蔓。",
    ["Hunter quests"] =
        "猎人任务",
    ["Dazalar, the hunter trainer of Dolanaar."] =
        "达扎拉，多兰纳尔的猎人训练师。",
    ["From level 10: three beasts to tame, then you can tame a pet of your own."] =
        "10级起：驯服三只野兽，之后就能驯服自己的宠物。",
    ["Use the taming rod on a Webwood Lurker, east of Dolanaar. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "对多兰纳尔以东的树林潜伏者使用驯兽棒。驯服后将它解散：它会重新攻击你，做好准备。",
    ["Use the rod on a Nightsaber Stalker, west of Dolanaar, then dismiss it the same way."] =
        "对多兰纳尔以西的夜刃捕食者使用驯兽棒，然后用同样的方法将它解散。",
    ["Use the rod on a Strigid Screecher, south of Dolanaar."] =
        "对多兰纳尔以南的巨翼恶枭使用驯兽棒。",
    ["Turning this in teaches Tame Beast: you can now keep a pet."] =
        "交付此任务后学会驯服野兽：现在你可以拥有宠物了。",
    ["Jocaste, the hunter trainer of Darnassus, upstairs."] =
        "祖卡斯特，达纳苏斯的猎人训练师，在楼上。",
    ["Your pet can now learn new skills."] =
        "你的宠物现在可以学习新技能了。",
    ["Grif Wildheart, the hunter trainer of Kharanos."] =
        "格瑞夫，卡拉诺斯的猎人训练师。",
    ["Use the taming rod on a Large Crag Boar, north of Kharanos. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "对卡拉诺斯以北的大峭壁野猪使用驯兽棒。驯服后将它解散：它会重新攻击你，做好准备。",
    ["Use the rod on a Snow Leopard, south of Kharanos, then dismiss it the same way."] =
        "对卡拉诺斯以南的雪豹使用驯兽棒，然后用同样的方法将它解散。",
    ["Use the rod on an Ice Claw Bear, in the hills south of Kharanos."] =
        "对卡拉诺斯以南山丘中的冰爪熊使用驯兽棒。",
    ["Belia Thundergranite, the pet trainer of Ironforge, in the Hall of Arms."] =
        "贝莉亚·雷岩，铁炉堡的宠物训练师，在军事大厅。",
    ["Josephine Carson, the hunter trainer of Goldshire."] =
        "Josephine Carson，闪金镇的猎人训练师。",
    ["Use the taming rod on a Rockhide Boar, in the southeast of Elwynn Forest. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "对艾尔文森林东南部的石皮野猪使用驯兽棒。驯服后将它解散：它会重新攻击你，做好准备。",
    ["Use the rod on a Gray Forest Wolf, in the east of the forest, then dismiss it the same way."] =
        "对森林东部的森林灰狼使用驯兽棒，然后用同样的方法将它解散。",
    ["Use the rod on a Young Forest Bear, in the west of the forest near Westbrook Garrison."] =
        "对森林西部西泉要塞附近的森林熊幼崽使用驯兽棒。",
    ["Isaac Chan, the pet trainer, stands next to Josephine."] =
        "宠物训练师Isaac Chan站在Josephine旁边。",
    ["Elayaa Easewind sends you to Quel'ana Quickgale."] =
        "Elayaa Easewind会让你去找Quel'ana Quickgale。",
    ["Use the taming rod on a Windsong Crawler. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "对Windsong Crawler使用驯兽棒。驯服后将它解散：它会重新攻击你，做好准备。",
    ["Use the rod on an Ornery Galestrider, then dismiss it the same way."] =
        "对Ornery Galestrider使用驯兽棒，然后用同样的方法将它解散。",
    ["Use the rod on a Vuldren Alpha."] =
        "对Vuldren Alpha使用驯兽棒。",
    ["Quel'dora Quickgale, the pet trainer, stands next to Quel'ana."] =
        "宠物训练师Quel'dora Quickgale站在Quel'ana旁边。",
    ["Any hunter trainer of a capital gives it."] =
        "任何主城的猎人训练师都会给出此任务。",
    ["From level 50: Ogtinc's chain in Azshara, which ends in the Temple of Atal'Hakkar."] =
        "50级起：奥汀克在艾萨拉的任务线，终点在阿塔哈卡神庙。",
    ["Ogtinc lives up a hill path in the middle of Azshara."] =
        "奥汀克住在艾萨拉中部一条山路的高处。",
    ["The Mosshoof Coursers of northern Azshara carry the antlers; only some do."] =
        "艾萨拉北部的苔蹄快步者身上有鹿角；但只有部分才有。",
    ["Wavethrashers haunt the Azshara shoreline; not every one leaves a scale."] =
        "碎浪多头怪出没于艾萨拉的海岸线；并非每只都会留下鳞片。",
    ["Morphaz, one of the green dragons of the temple, drops the tooth."] =
        "摩弗拉斯，神庙中的绿龙之一，掉落牙齿。",
    ["Mage quests"] =
        "法师任务",
    ["Zaldimar Wefhellt, the mage trainer of Goldshire, upstairs in the inn."] =
        "扎尔迪玛·维夫希尔特，闪金镇的法师训练师，在旅店楼上。",
    ["From level 10: your trainer's first errand, a few minutes from Goldshire."] =
        "10级起：训练师交给你的第一件差事，离闪金镇只有几分钟路程。",
    ["Jennea Cannon, upstairs in the Wizard's Sanctum of the Mage Quarter, in Stormwind."] =
        "詹妮亚·坎农，在暴风城法师区巫师圣殿的楼上。",
    ["Stand in the water of Mirror Lake, in the west of Elwynn Forest, and use the flask there."] =
        "站在艾尔文森林西部的明镜湖水中，在那里使用瓶子。",
    ["Magis Sparkmantle, the mage trainer of Kharanos."] =
        "玛济斯·石衣，卡拉诺斯的法师训练师。",
    ["From level 10: your trainer's first errand, in Dun Morogh."] =
        "10级起：训练师交给你的第一件差事，在丹莫罗。",
    ["Bink, the mage trainer of Ironforge, in the Hall of Mysteries."] =
        "彬克，铁炉堡的法师训练师，在神秘大厅。",
    ["Bink's toolbox lies by the gates of Gnomeregan, in the west of Dun Morogh."] =
        "彬克的工具箱在丹莫罗西部的诺莫瑞根大门旁。",
    ["From level 10: the Skyborne mage quests of Zephras Isle."] =
        "10级起：Zephras Isle的Skyborne法师任务。",
    ["The wind-infused boughs lie on the ground west of the camp."] =
        "注入风之力的树枝散落在营地以西的地上。",
    ["Your mage trainer gives it."] =
        "你的法师训练师给出此任务。",
    ["From level 15: a chain in Stormwind that ends with a robe for you."] =
        "15级起：暴风城的一条任务线，最后会得到一件长袍。",
    ["The chest of coffers and the cantation lie in Jennea's tower."] =
        "封灵箱和显形卷轴都在詹妮亚的塔里。",
    ["The Blue Recluse, the inn of the Mage Quarter"] =
        "蓝色隐士，法师区的旅店",
    ["Read the cantation to reveal a Rift Spawn, fight it until it is stunned, then use a coffer on it. Three hide in the inn, one of them downstairs."] =
        "阅读显形卷轴，让裂隙怒灵现形，与它战斗直到它被击晕，然后对它使用封灵箱。旅店里藏着三只，其中一只在楼下。",
    ["The Charged Rift Gem lies in the Silver Stream Mine, in the north of Loch Modan; the linen comes from humanoids anywhere."] =
        "充能裂隙宝石在洛克莫丹北部的银泉矿洞里；亚麻布可以从任何地方的人型生物身上获得。",
    ["Wynne Larson, the robe merchant of the Mage Quarter."] =
        "维恩·拉尔森，法师区的长袍商。",
    ["Your reward: the Manaweave Robe."] =
        "奖励：法纹长袍。",
    ["From level 26: a chain that ends with a second robe."] =
        "26级起：一条任务线，最后会得到第二件长袍。",
    ["High Sorcerer Andromath, at the top of the Wizard's Sanctum."] =
        "高阶巫师安多玛斯，在巫师圣殿顶层。",
    ["The book lies in the Tower of Ilgalar, in the east of Redridge Mountains."] =
        "书在赤脊山东部的伊尔加拉之塔里。",
    ["The spiders of the western woods of Duskwood carry the silk."] =
        "暮色森林西部树林中的蜘蛛身上有蛛丝。",
    ["Your reward: the Astral Knot Garment."] =
        "奖励：星结之衣。",
    ["Your capital's mage trainer gives it."] =
        "你所在主城的法师训练师给出此任务。",
    ["From level 30: Tabetha's quests in Dustwallow Marsh, which end with a mage's wand."] =
        "30级起：塔贝萨在尘泥沼泽的任务，最后会得到一根法师魔杖。",
    ["Tabetha lives on her farm in the south of Dustwallow Marsh."] =
        "塔贝萨住在尘泥沼泽南部她的农场里。",
    ["Magus Tirth, at the Shimmering Flats of Thousand Needles, near the race track."] =
        "大法师提尔斯，在千针石林的闪光平原，靠近赛道。",
    ["\"Plucky\" Johnson, the chicken by the tent: beckon to him with the emote so he turns back into a man, then ask him for the phrase."] =
        "胆大的约翰森，帐篷旁的那只鸡：用表情动作向他招手，让他变回人形，然后向他询问咒语。",
    ["Tabetha gives it too."] =
        "塔贝萨也会给出此任务。",
    ["The Witherbark trolls of eastern Arathi Highlands carry the totem sticks."] =
        "阿拉希高地东部的枯木巨魔身上有图腾棒。",
    ["Use the stick on the central stone of the Circle of Outer Binding, in Arathi Highlands; clear its guards first. The Jade is a gem found while mining, or at the auction house."] =
        "在阿拉希高地的外禁锢法阵，对中央的石头使用图腾棒；先清理它的守卫。翡翠是采矿时找到的宝石，也可在拍卖行购买。",
    ["The book lies in the Library of the Scarlet Monastery."] =
        "书在血色修道院的图书馆里。",
    ["Your reward: a mage's wand."] =
        "奖励：一根法师魔杖。",
    ["From level 35: Tabetha's second chain, which goes through Uldaman."] =
        "35级起：塔贝萨的第二条任务线，途经奥达曼。",
    ["The Burning Blade summoners of Mannoroc Coven, in southern Desolace, carry the orb."] =
        "凄凉之地南部玛诺洛克集会所的火刃召唤师身上有宝珠。",
    ["Right there: Tabetha frees the demon of the orb; defeat it."] =
        "就在原地：塔贝萨会释放宝珠中的恶魔；击败它。",
    ["The Obsidian Sentinel of Uldaman holds the power source."] =
        "奥达曼的黑曜石哨兵持有能量源。",
    ["Right there: destroy the mana surges as they appear around Tabetha."] =
        "就在原地：法力怒灵在塔贝萨周围出现时将其消灭。",
    ["From level 40: Tabetha's task in Zul'Farrak."] =
        "40级起：塔贝萨在祖尔法拉克的任务。",
    ["Hydromancer Velratha, by the sacred pool of Zul'Farrak, drops the tiara."] =
        "水占师维蕾萨，在祖尔法拉克的圣池旁，掉落头冠。",
    ["Your capital's master mage gives it."] =
        "你所在主城的法师大师给出此任务。",
    ["From level 50: Archmage Xylem's chain in Azshara, which ends in the Temple of Atal'Hakkar."] =
        "50级起：大法师克希雷姆在艾萨拉的任务线，终点在阿塔哈卡神庙。",
    ["Sanath Lim-yo, at the foot of Archmage Xylem's tower in Azshara: talk to him to be sent up to the archmage."] =
        "萨纳斯，在艾萨拉大法师克希雷姆的塔下：与他交谈，他会把你送到大法师那里。",
    ["The blood elves of the ruins in northeastern Azshara carry the dust."] =
        "艾萨拉东北部废墟中的血精灵身上有粉尘。",
    ["The Spitelash sirens of the western shore of Azshara carry the coral."] =
        "艾萨拉西岸的恶鞭海妖身上有珊瑚。",
    ["Morphaz, one of the green dragons of the temple, drops the shard."] =
        "摩弗拉斯，神庙中的绿龙之一，掉落碎片。",
    ["From level 60: Lorekeeper Lydros' quest, inside Dire Maul."] =
        "60级起：博学者莱德罗斯的任务，在厄运之槌里面。",
    ["Hydrospawn, a water elemental of Dire Maul, drops the essence."] =
        "海多斯博恩，厄运之槌的水元素，掉落精华。",
    ["Paladin quests"] =
        "圣骑士任务",
    ["Brother Wilhelm, the paladin trainer of Goldshire, sends you to Stormwind."] =
        "威尔海姆修士，闪金镇的圣骑士训练师，会让你去暴风城。",
    ["Duthorian Rall, in the Cathedral of Light."] =
        "达索瑞恩·拉尔，在光明大教堂。",
    ["From level 12: the chain that teaches Redemption."] =
        "12级起：学会救赎的任务线。",
    ["Read the Tome of Divinity from your bags to start the next quest."] =
        "在背包中阅读圣洁之书，开始下一个任务。",
    ["Stephanie Turner, a poor woman of Old Town."] =
        "斯蒂芬妮·特纳，旧城区的一位穷苦妇人。",
    ["She needs Linen Cloth: humanoids carry it everywhere."] =
        "她需要亚麻布：各地的人型生物身上都有。",
    ["Gazin Tenorm, in the Cathedral of Light."] =
        "贾森·坦诺姆，在光明大教堂。",
    ["Henze Faulk lies lifeless in the east of Elwynn Forest: use the Symbol of Life on him."] =
        "亨兹·法奥克毫无生气地躺在艾尔文森林东部：对他使用生命符记。",
    ["The Defias around Henze carry the script."] =
        "亨兹周围的迪菲亚身上有手稿。",
    ["Turning this in teaches Redemption."] =
        "交付此任务后学会救赎。",
    ["Azar Stronghammer, the paladin trainer of Kharanos, sends you to Ironforge."] =
        "阿扎尔·战锤，卡拉诺斯的圣骑士训练师，会让你去铁炉堡。",
    ["Tiza Battleforge, in the Mystic Ward of Ironforge."] =
        "蒂萨·热炉，在铁炉堡的秘法区。",
    ["John Turner, a poor man who walks the streets of Ironforge."] =
        "约翰·特纳，一位在铁炉堡街头游走的穷人。",
    ["He needs Linen Cloth: humanoids carry it everywhere."] =
        "他需要亚麻布：各地的人型生物身上都有。",
    ["Muiredon Battleforge, beside Tiza."] =
        "穆里顿·热炉，在蒂萨旁边。",
    ["Narm Faulk lies lifeless in the east of Dun Morogh: use the Symbol of Life on him."] =
        "纳姆·法奥克毫无生气地躺在丹莫罗东部：对他使用生命符记。",
    ["The Dark Iron spies around Narm carry the script."] =
        "纳姆周围的黑铁间谍身上有手稿。",
    ["From level 20: the Tome of Valor, then the Test of Righteousness, which ends with Verigan's Fist, a two-handed mace."] =
        "20级起：先是勇气之书，再是正义试炼，最后获得维里甘之拳，一把双手锤。",
    ["Read the Tome of Valor from your bags to start the next quest."] =
        "在背包中阅读勇气之书，开始下一个任务。",
    ["Duthorian Rall, in the Cathedral of Light of Stormwind."] =
        "达索瑞恩·拉尔，在暴风城的光明大教堂。",
    ["Daphne Stilwell, at her house in the south of Westfall. Take her quest only when ready: three waves of Defias attack, then more."] =
        "达芙妮·斯迪威尔，在西部荒野南部她的房子里。准备好了再接她的任务：迪菲亚会发动三波进攻，之后还有更多。",
    ["Stay by Daphne until the last wave falls; a friend helps."] =
        "留在达芙妮身边，直到最后一波敌人倒下；会有一位朋友帮忙。",
    ["Jordan Stilwell, outside the gates of Ironforge."] =
        "乔丹·斯迪威尔，在铁炉堡大门外。",
    ["Four items: the lumber from the Deadmines, the hammer from Shadowfang Keep, the ore from Loch Modan and the Kor Gem from Darkshore."] =
        "四样东西：死亡矿井的木材、影牙城堡的铁锤、洛克莫丹的矿石和黑海岸的科尔宝石。",
    ["Bailor Stonehand, in Thelsamar."] =
        "白洛尔·石手，在塞尔萨玛。",
    ["The ore lies in a crate by a tree stump, in the northeast of Loch Modan."] =
        "矿石在洛克莫丹东北部树桩旁的一个箱子里。",
    ["Thundris Windweaver, in Auberdine."] =
        "桑迪斯·织风，在奥伯丁。",
    ["The naga of the Blackfathom Deeps entrance, under the water of Zoram Strand in Ashenvale, carry the corrupted gem. They are elite: bring a group."] =
        "黑暗深渊入口处的纳迦，在灰谷佐拉姆海岸的水下，身上有被污染的宝石。它们是精英：组队前往。",
    ["The goblin woodcarvers of the Deadmines carry the lumber."] =
        "死亡矿井的地精木匠身上有木材。",
    ["Jordan's hammer lies in the stables of Shadowfang Keep."] =
        "乔丹的铁锤在影牙城堡的马厩里。",
    ["Your reward: Verigan's Fist."] =
        "奖励：维里甘之拳。",
    ["Delgren the Purifier, at Maestra's Post in Ashenvale."] =
        "净化者德尔格伦，在灰谷的迈斯特拉岗哨。",
    ["From level 22: Forever's paladin chain of Delgren the Purifier."] =
        "22级起：Forever的净化者德尔格伦圣骑士任务线。",
    ["Katherine the Pure, in the Cathedral of Light of Stormwind."] =
        "纯洁的凯瑟琳，在暴风城的光明大教堂。",
    ["Ursula Deline, the warlock trainer of the Mage Quarter."] =
        "厄苏拉·德林，法师区的术士训练师。",
    ["The Blackrock orcs of Redridge Mountains carry the summoner's salt."] =
        "赤脊山的黑石兽人身上有召唤师之盐。",
    ["The demons of Demon Fall Canyon, in the southeast of Ashenvale, carry the motes."] =
        "灰谷东南部屠魔峡谷的恶魔身上有微粒。",
    ["Bring them to the Spear of Mannoroth, in the canyon."] =
        "把它们带到峡谷中的Spear of Mannoroth。",
    ["From level 40: the quest of your warhorse."] =
        "40级起：获得战马的任务。",
    ["Turning this in teaches Summon Warhorse."] =
        "交付此任务后学会召唤战马。",
    ["Lord Grayson Shadowbreaker, in the Cathedral of Light."] =
        "格雷森·沙东布瑞克公爵，在光明大教堂。",
    ["From level 50: the chain of the Mightstone, which ends in the Temple of Atal'Hakkar."] =
        "50级起：力量之石任务线，终点在阿塔哈卡神庙。",
    ["Commander Ashlam Valorfist, at Chillwind Camp in the Western Plaguelands."] =
        "指挥官阿什拉姆·瓦罗菲斯特，在西瘟疫之地的冰风岗。",
    ["The skeletons of the fields of Andorhal carry the scourgestones."] =
        "安多哈尔田野上的骷髅身上有天灾石。",
    ["High Priest Thel'danis walks around Chillwind Camp."] =
        "高阶牧师赛尔丹尼斯在冰风岗周围走动。",
    ["The six troll bosses of the temple's upper ring each drop one feather: Gasher, Zul'Lor, Mijan, Hukku, Zolo and Loro."] =
        "神庙上层环廊的六个巨魔首领各掉落一根羽毛：加什尔、祖罗尔、米杉、胡库、祖罗和洛若尔。",
    ["From level 60: the long chain of your charger. It asks for about 200 gold and goes through Stratholme, Dire Maul and Scholomance."] =
        "60级起：获得军马的漫长任务线。需要大约200金币，途经斯坦索姆、厄运之槌和通灵学院。",
    ["High Priest Rohan, in the Mystic Ward of Ironforge: the sacrifice he asks for is gold."] =
        "高阶牧师洛汉，在铁炉堡的秘法区：他要求的献祭是金币。",
    ["Use the censer on the Terrordale Spirits, in the northwest of the Eastern Plaguelands."] =
        "对恐惧谷的灵魂使用香炉，它们在东瘟疫之地西北部。",
    ["Grimand Elmore, in the Dwarven District of Stormwind."] =
        "格瑞曼德·艾尔默，在暴风城的矮人区。",
    ["Grimand wants gold, Arthas' Tears (a herb), Runecloth, an Arcanite Bar, and holy water from the supply crates of Stratholme."] =
        "格瑞曼德需要金币、阿尔萨斯之泪（一种草药）、符文布、一块奥金锭，以及斯坦索姆物资箱里的圣水。",
    ["Merideth Carlson, the horse breeder of Southshore, makes the horse feed."] =
        "梅丽德丝·卡尔森，南海镇的养马人，负责制作马饲料。",
    ["The Enriched Manna Biscuits are sold by the Argent Dawn's quartermasters."] =
        "可口的魔法点心由银色黎明的军需官出售。",
    ["The Ancient Equine Spirit waits in western Dire Maul, past Tendris Warpwood."] =
        "上古圣马之魂在厄运之槌西区等候，过了特迪斯·扭木就是。",
    ["An Azerothian Diamond and a Pristine Black Diamond: found while mining and on monsters of the Plaguelands, or at the auction house."] =
        "一块艾泽拉斯钻石和一块原始黑钻石：采矿时和瘟疫之地的怪物身上都能找到，也可在拍卖行购买。",
    ["In Scholomance, use the Divination Scryer to call Death Knight Darkreaver, defeat him, then use the charger's soul on his fallen mount."] =
        "在通灵学院，使用预言水晶球召唤死亡骑士达克雷尔，击败他，然后对他倒下的坐骑使用军马之魂。",
    ["Your reward: Summon Charger, your epic mount."] =
        "奖励：召唤军马，你的史诗坐骑。",
    ["Priest quests"] =
        "牧师任务",
    ["Priestess Anetta, the priest trainer of Northshire Abbey."] =
        "女牧师安妮塔，北郡修道院的牧师训练师。",
    ["From level 5: heal a wounded guard, and get your first robe."] =
        "5级起：治疗一名受伤的卫兵，并获得你的第一件长袍。",
    ["Priestess Josetta, the priest trainer of Goldshire."] =
        "女牧师洁塞塔，闪金镇的牧师训练师。",
    ["Guard Roberts lies wounded east of Goldshire: heal him with Lesser Heal, then give him Power Word: Fortitude."] =
        "卫兵罗伯兹受伤躺在闪金镇以东：用次级治疗术治疗他，然后对他施放真言术：韧。",
    ["Branstock Khalder, the priest trainer of Coldridge Valley."] =
        "布兰斯托克·卡德尔，寒脊山谷的牧师训练师。",
    ["From level 5: heal a wounded mountaineer, and get your first robe."] =
        "5级起：治疗一名受伤的巡山人，并获得你的第一件长袍。",
    ["Maxan Anvol, the priest trainer of Kharanos."] =
        "马克萨恩·安沃尔，卡拉诺斯的牧师训练师。",
    ["Mountaineer Dolf lies wounded near Kharanos: heal him with Lesser Heal, then give him Power Word: Fortitude."] =
        "巡山人多尔夫受伤躺在卡拉诺斯附近：用次级治疗术治疗他，然后对他施放真言术：韧。",
    ["Shanda, the priest trainer of Aldrassil, in Shadowglen."] =
        "珊达，幽影谷奥达希尔的牧师训练师。",
    ["From level 5: heal a wounded sentinel, and get your first robe."] =
        "5级起：治疗一名受伤的哨兵，并获得你的第一件长袍。",
    ["Laurna Morninglight, the priest trainer of Dolanaar."] =
        "劳尔娜·晨光，多兰纳尔的牧师训练师。",
    ["Sentinel Shaya lies wounded south of Dolanaar: heal her with Lesser Heal, then give her Power Word: Fortitude."] =
        "哨兵莎恩雅受伤躺在多兰纳尔以南：用次级治疗术治疗她，然后对她施放真言术：韧。",
    ["From level 10: the quest that teaches Desperate Prayer."] =
        "10级起：学会绝望祷言的任务。",
    ["High Priestess Laurena, in the Cathedral of Light of Stormwind."] =
        "高阶牧师劳瑞娜，在暴风城的光明大教堂。",
    ["Priestess Josetta gives it too."] =
        "女牧师洁塞塔也会给出此任务。",
    ["From level 10: Forever's quest of Divine Grace, for Humans."] =
        "10级起：Forever的Divine Grace任务，人类专属。",
    ["From level 10: Forever's quest of Confounding Flash, for Gnomes."] =
        "10级起：Forever的Confounding Flash任务，侏儒专属。",
    ["High Priestess Mims, in the Mystic Ward of Ironforge."] =
        "High Priestess Mims，在铁炉堡的秘法区。",
    ["From level 10: the quest that teaches Starshards."] =
        "10级起：学会星辰碎片的任务。",
    ["Priestess Alathea, in the Temple of the Moon of Darnassus."] =
        "女祭司阿兰希雅，在达纳苏斯的月亮神庙。",
    ["From level 20: the quest that teaches Feedback."] =
        "20级起：学会回馈的任务。",
    ["High Priest Rohan, in the Mystic Ward of Ironforge."] =
        "高阶牧师洛汉，在铁炉堡的秘法区。",
    ["From level 20: the quest that teaches Fear Ward."] =
        "20级起：学会防护恐惧结界的任务。",
    ["From level 20: Forever's second Gnome priest quest."] =
        "20级起：Forever的第二个侏儒牧师任务。",
    ["From level 20: the quest that teaches Elune's Grace."] =
        "20级起：学会艾露恩的赐福的任务。",
    ["Any priest trainer of a capital gives it."] =
        "任何主城的牧师训练师都会给出此任务。",
    ["The Mosshoof Coursers of northern Azshara carry the glands; only some do."] =
        "艾萨拉北部的苔蹄快步者身上有腺体；但只有部分才有。",
    ["The undead of the Western Plaguelands and the Zanzil zombies of Stranglethorn carry the ichor."] =
        "西瘟疫之地的亡灵和荆棘谷的赞吉尔僵尸身上有脓液。",
    ["Morphaz, one of the green dragons of the temple, carries the blood."] =
        "摩弗拉斯，神庙中的绿龙之一，身上有血液。",
    ["Greta Mosshoof, at the Emerald Sanctuary in Felwood."] =
        "格雷塔·苔蹄，在费伍德森林的翡翠圣地。",
    ["Rogue quests"] =
        "潜行者任务",
    ["Hogral Bakkan, the rogue trainer of Kharanos."] =
        "霍格拉尔·巴坎，卡拉诺斯的潜行者训练师。",
    ["From level 10: a first errand for the rogues of Ironforge."] =
        "10级起：为铁炉堡的潜行者跑第一趟差事。",
    ["Hulfdan Blackbeard, in the Forlorn Cavern of Ironforge."] =
        "霍夫丹·黑须，在铁炉堡的荒弃的洞穴。",
    ["Onin MacHammar stands on a platform in the west of Dun Morogh, near Gnomeregan."] =
        "奥宁·雨锤站在丹莫罗西部诺莫瑞根附近的一个平台上。",
    ["Learn Pick Lock at your trainer, then practice on lockboxes until your skill reaches 75."] =
        "在训练师处学会开锁，然后用锁箱练习，直到技能达到75。",
    ["From level 16: Pick Lock opens the chests and boxes of the quests to come."] =
        "16级起：开锁可以打开之后任务中的宝箱和箱子。",
    ["Master Mathias Shaw, on the top floor of SI:7's headquarters, in Old Town."] =
        "马迪亚斯·肖尔，在旧城区军情七处总部的顶层。",
    ["From level 20: the chain that teaches your poisons."] =
        "20级起：学会毒药的任务线。",
    ["Agent Kearnen watches from a hill in the southeast of Westfall."] =
        "密探吉尔妮在西部荒野东南部的一座小山上监视。",
    ["Pick the Defias Tower Key from the pocket of a Malformed Defias Drone, by the tower; then, upstairs, sap Klaven Mortwake before you open the chest."] =
        "从塔楼旁丑陋的迪菲亚懒汉的口袋里偷取迪菲亚塔楼钥匙；然后到楼上，先对克拉文·摩特维克使用闷棍，再打开箱子。",
    ["The chest leaves a sickness on you: that is the next quest."] =
        "箱子会让你染上一种疾病：这就是下一个任务。",
    ["Doc Mixilpixil works in the cellar of SI:7's headquarters."] =
        "道克·米希匹克斯在军情七处总部的地下室工作。",
    ["Lie down in front of him (the emote) so he can examine you."] =
        "在他面前躺下（表情动作），让他为你检查。",
    ["Turning this in teaches your poisons."] =
        "交付此任务后学会毒药。",
    ["Myrokos Silentform, at Ravenholdt Manor in the Alterac Mountains: the way in is a cave in the north of Hillsbrad Foothills."] =
        "麦洛克斯，在奥特兰克山脉的拉文霍德庄园：入口是希尔斯布莱德丘陵北部的一个山洞。",
    ["From level 24: Forever's Syndicate quests, at Ravenholdt Manor."] =
        "24级起：Forever的辛迪加任务，在拉文霍德庄园。",
    ["Lord Tomas is hiding in the east of Hillsbrad Foothills."] =
        "Lord Tomas躲在希尔斯布莱德丘陵东部。",
    ["Any rogue trainer of a capital gives it."] =
        "任何主城的潜行者训练师都会给出此任务。",
    ["From level 50: Lord Jorach Ravenholdt's chain, which ends in the Temple of Atal'Hakkar."] =
        "50级起：乔拉齐·拉文霍德公爵的任务线，终点在阿塔哈卡神庙。",
    ["Lord Jorach Ravenholdt, in Ravenholdt Manor."] =
        "乔拉齐·拉文霍德公爵，在拉文霍德庄园。",
    ["The Timbermaw shamans of northern Azshara carry the bag."] =
        "艾萨拉北部的木喉萨满祭司身上有袋子。",
    ["Archmage Xylem, at the top of his tower in Azshara: Sanath Lim-yo, at its foot, sends you up."] =
        "大法师克希雷姆，在他艾萨拉高塔的顶层：塔下的萨纳斯会把你送上去。",
    ["The Forest Oozes of northeastern Azshara carry the fragments."] =
        "艾萨拉东北部的森林软泥怪身上有碎片。",
    ["Morphaz, one of the green dragons of the temple, drops the key."] =
        "摩弗拉斯，神庙中的绿龙之一，掉落钥匙。",
    ["Shaman quests"] =
        "萨满祭司任务",
    ["Teo Hammerstorm, the shaman trainer of Coldridge Valley."] =
        "Teo Hammerstorm，寒脊山谷的萨满祭司训练师。",
    ["From level 4: the Call of Earth, your first totem."] =
        "4级起：大地的召唤，你的第一个图腾。",
    ["The Frostmane trolls south of the valley carry the pendant."] =
        "山谷南边的霜鬃巨魔身上有坠饰。",
    ["On the hill west of the valley: drink the Earth Sapta to see the Minor Manifestation of Earth."] =
        "在山谷以西的山丘上：喝下大地灵契，就能看见大地之魂。",
    ["Turning this in teaches your first earth totem."] =
        "交付此任务后学会你的第一个大地图腾。",
    ["Ingrid Dunwald in Kharanos, or Eldrun Stormbreaker in Ironforge."] =
        "卡拉诺斯的Ingrid Dunwald，或铁炉堡的Eldrun Stormbreaker。",
    ["From level 10: the Call of Fire, your first fire totem."] =
        "10级起：火焰的召唤，你的第一个火焰图腾。",
    ["Bruegs Kindleborn, in the far east of Dun Morogh, by the road to Loch Modan."] =
        "Bruegs Kindleborn，在丹莫罗最东端，通往洛克莫丹的路边。",
    ["Braldir Ashmantle, on a hill in the southwest of Loch Modan."] =
        "Braldir Ashmantle，在洛克莫丹西南部的一座小山上。",
    ["The Tunnel Rat geomancers of Loch Modan carry the Fire Tar; the Stonesplinter seers of the south carry the pouches."] =
        "洛克莫丹的坑道鼠地卜师身上有火焰焦油；南部的碎石怪先知身上有袋子。",
    ["Right by Braldir: call the Minor Manifestation of Fire at the brazier, then defeat it for its ember."] =
        "就在Braldir身边：在火盆处召唤火焰之魂，然后击败它取得余烬。",
    ["Light the Brazier of the Dormant Flame with the ember."] =
        "用余烬点燃眠炎火盆。",
    ["Bruegs Kindleborn, in the far east of Dun Morogh."] =
        "Bruegs Kindleborn，在丹莫罗最东端。",
    ["Turning this in teaches your first fire totem."] =
        "交付此任务后学会你的第一个火焰图腾。",
    ["Eldrun Stormbreaker, the shaman trainer of Ironforge."] =
        "Eldrun Stormbreaker，铁炉堡的萨满祭司训练师。",
    ["From level 20: the Call of Water, your first water totem."] =
        "20级起：水之召唤，你的第一个水之图腾。",
    ["Norric Lochthane, by the dam in the north of Loch Modan."] =
        "Norric Lochthane，在洛克莫丹北部的大坝旁。",
    ["Hervdana Saegrund, in the southeast of the Wetlands."] =
        "Hervdana Saegrund，在湿地东南部。",
    ["Fill the waterskin where Hervdana's quest says: DingDB does not hold this place yet."] =
        "按Hervdana的任务说明在指定地点装满水囊：DingDB尚未收录这个地点。",
    ["At the Forgotten Shrine of Westfall: call the corrupt manifestation of water, then defeat it for its bracers."] =
        "在西部荒野的Forgotten Shrine：召唤堕落的水之魂，然后击败它取得护腕。",
    ["The Minor Manifestation of Water rises beside the shrine."] =
        "水之魂会在神殿旁出现。",
    ["Turning this in teaches your first water totem."] =
        "交付此任务后学会你的第一个水之图腾。",
    ["From level 30: the Call of Air, your first air totem."] =
        "30级起：空气的召唤，你的第一个空气图腾。",
    ["Veyric Thunderhame, in the north of Arathi Highlands."] =
        "Veyric Thunderhame，在阿拉希高地北部。",
    ["Turning this in teaches your first air totem."] =
        "交付此任务后学会你的第一个空气图腾。",
    ["From level 30: Veyric Thunderhame's elemental quests, to level 40."] =
        "30级起：Veyric Thunderhame的元素任务，直到40级。",
    ["Four twisted totems: from the Stonevault troggs of the Badlands, the Maraudine centaurs of Desolace, the Lost Ones of the Swamp of Sorrows and the Mirefin murlocs of Dustwallow Marsh."] =
        "四个扭曲的图腾：分别来自荒芜之地的石窟穴居人、凄凉之地的玛洛迪半人马、悲伤沼泽的失落者和尘泥沼泽的黑鳍鱼人。",
    ["Charlga Razorflank, the crone of Razorfen Kraul, carries the note."] =
        "卡尔加·刺肋，剃刀沼泽的老巫婆，身上有字条。",
    ["The Ravaging Tempests of western Thousand Needles carry the eye."] =
        "千针石林西部的Ravaging Tempest身上有眼睛。",
    ["Bath'rah the Windwatcher, in the hills of the Alterac Mountains."] =
        "捕风者巴斯拉，在奥特兰克山脉的丘陵中。",
    ["Warlock quests"] =
        "术士任务",
    ["Drusilla La Salle, the warlock trainer of Northshire Abbey."] =
        "杜希拉·拉萨雷，北郡修道院的术士训练师。",
    ["Your trainer's first errand, around Northshire Abbey."] =
        "训练师交给你的第一件差事，在北郡修道院周围。",
    ["The stolen books lie in the kobold camp east of the abbey."] =
        "被偷的书在修道院以东的狗头人营地里。",
    ["Alamar Grimm, the warlock trainer of Coldridge Valley."] =
        "阿拉玛尔·格里姆，寒脊山谷的术士训练师。",
    ["Your trainer's first errand, around Coldridge Valley."] =
        "训练师交给你的第一件差事，在寒脊山谷周围。",
    ["The Frostmane novices of the troll cave in the south of the valley carry the charm."] =
        "山谷南部巨魔洞穴里的霜鬃巨魔新兵身上有护符。",
    ["Remen Marcot, in the inn of Goldshire, sends you to Stormwind."] =
        "雷门·玛考特，在闪金镇的旅店里，会让你去暴风城。",
    ["Lago Blackwrench, in the Forlorn Cavern of Ironforge, sends you to Stormwind."] =
        "拉戈·黑钳，在铁炉堡的荒弃的洞穴，会让你去暴风城。",
    ["Gakin the Darkbinder, in the cellar of the Slaughtered Lamb, in the Mage Quarter of Stormwind."] =
        "黑暗缚灵者加科因，在暴风城法师区已宰的羔羊的地下室。",
    ["From level 10: the chain that teaches Summon Voidwalker."] =
        "10级起：学会召唤虚空行者的任务线。",
    ["Surena Caledon hides in a house of the Brackwell Pumpkin Patch, in the east of Elwynn Forest."] =
        "苏伦娜·凯尔东躲在艾尔文森林东部布莱克威尔南瓜田的一栋房子里。",
    ["Down the stairs of the Slaughtered Lamb's crypt: use the choker on the summoning circle, then defeat the voidwalker."] =
        "沿已宰的羔羊的地穴楼梯下去：对召唤法阵使用颈环，然后击败虚空行者。",
    ["Turning this in teaches Summon Voidwalker."] =
        "交付此任务后学会召唤虚空行者。",
    ["Gakin the Darkbinder, in the cellar of the Slaughtered Lamb."] =
        "黑暗缚灵者加科因，在已宰的羔羊的地下室。",
    ["From level 20: the chain that teaches Summon Succubus."] =
        "20级起：学会召唤魅魔的任务线。",
    ["Takar the Seer, north of Camp Taurajo in the Barrens: Horde land, stay clear of the guards."] =
        "先知塔卡尔，在贫瘠之地陶拉祖营地以北：部落领地，远离守卫。",
    ["The Heartswood grows in the north of Ashenvale, near the Horde's lumber camp."] =
        "同心树生长在灰谷北部，靠近部落的伐木场。",
    ["In the Slaughtered Lamb's crypt again: use the heartswood core on the summoning circle, then defeat the succubus."] =
        "再次来到已宰的羔羊的地穴：对召唤法阵使用同心树之核，然后击败魅魔。",
    ["Turning this in teaches Summon Succubus."] =
        "交付此任务后学会召唤魅魔。",
    ["From level 30: the chain that teaches Summon Felhunter."] =
        "30级起：学会召唤地狱猎犬的任务线。",
    ["Strahad Farsan, in Ratchet."] =
        "斯坦哈德·法尔杉，在棘齿城。",
    ["Krom Stoutarm, in the Hall of Explorers of Ironforge."] =
        "克罗姆·粗臂，在铁炉堡的探险者大厅。",
    ["The moldy tome lies in the southwest of Hillsbrad Foothills; the tattered manuscript, in a damaged chest of western Thousand Needles."] =
        "发霉的书籍在希尔斯布莱德丘陵西南部；破损的手稿在千针石林西部一个破损的箱子里。",
    ["The Dragonmaw orcs of the Wetlands carry the rod."] =
        "湿地的龙喉兽人身上有魔棒。",
    ["Right by Strahad: use the tome on the summoning circle, then defeat the felhunter."] =
        "就在斯坦哈德身边：对召唤法阵使用书籍，然后击败地狱猎犬。",
    ["Turning this in teaches Summon Felhunter."] =
        "交付此任务后学会召唤地狱猎犬。",
    ["Demisette Cloyce, in the Slaughtered Lamb of Stormwind."] =
        "德米赛特·克劳斯，在暴风城的已宰的羔羊。",
    ["From level 40: the quest of your felsteed."] =
        "40级起：获得地狱战马的任务。",
    ["Turning this in teaches Summon Felsteed."] =
        "交付此任务后学会召唤地狱战马。",
    ["Niby the Almighty and Impsy wait in a small camp of central Felwood."] =
        "万能的尼比和伊普斯在费伍德森林中部的一个小营地里等候。",
    ["From level 50: the demonic quests of Niby and Impsy, in Felwood."] =
        "50级起：尼比和伊普斯在费伍德森林的恶魔任务。",
    ["Felcloth drops from demons and satyrs, Azshara's above all; the auction house sells it too."] =
        "恶魔布由恶魔和萨特掉落，尤其是艾萨拉的；拍卖行也有出售。",
    ["The Irontree treants of northern Felwood carry the rotting wood; the oozes of the Bloodvenom river, the essence."] =
        "费伍德森林北部的铁木树人身上有腐烂的木头；血毒河的软泥怪身上有精华。",
    ["Three essences: from the satyrs of Jaedenar in Felwood, the Legashi satyrs of Azshara, and the felguards by the Dark Portal in the Blasted Lands."] =
        "三份精华：分别来自费伍德森林加德纳尔的萨特、艾萨拉的雷加什萨特，以及诅咒之地黑暗之门旁的地狱卫士。",
    ["North of the camp, by the remains of Kroshius: use the item Impsy gives you to wake him, then defeat him."] =
        "营地以北，克罗苏斯的遗骸旁：使用伊普斯给你的物品唤醒他，然后击败他。",
    ["Spackle Thornberry, the demon trainer of the Slaughtered Lamb."] =
        "斯巴克尔，已宰的羔羊的恶魔训练师。",
    ["From level 60: the long chain of your dreadsteed. It asks for costly materials and goes through Scholomance and Dire Maul."] =
        "60级起：获得恐惧战马的漫长任务线。需要昂贵的材料，途经通灵学院和厄运之槌。",
    ["Mor'zul Bloodbringer, in the west of the Burning Steppes."] =
        "莫苏尔·召血者，在燃烧平原西部。",
    ["The owlbeasts of Winterspring carry the blood."] =
        "冬泉谷的枭兽身上有血。",
    ["Gorzeeki Wildeyes, right by Mor'zul."] =
        "戈瑟奇·邪眼，就在莫苏尔身边。",
    ["Mor'zul gives these three."] =
        "这三个任务由莫苏尔给出。",
    ["These three ask for an alchemist's elixir, an enchanter's shard with ore of the Burning Steppes, and scales of black dragonkin: make them, find them, or buy them at the auction house."] =
        "这三个任务需要一种炼金师的药剂、一种附魔师的碎片加上燃烧平原的矿石，以及黑龙的鳞片：可以自己制作、寻找，或在拍卖行购买。",
    ["An Arcanite Bar: an alchemist makes it, or the auction house sells it."] =
        "一块奥金锭：由炼金师制作，或在拍卖行购买。",
    ["Lord Banehollow, in the shrine of Jaedenar, in Felwood."] =
        "魔王贝恩霍勒，在费伍德森林加德纳尔的神殿里。",
    ["Ulathek hides in Jaedenar too: defeat him for his heart."] =
        "乌拉泰克也躲在加德纳尔：击败他取得他的心脏。",
    ["Ur'dan sells the stardust, right by Lord Banehollow."] =
        "乌尔丹出售星尘，就在魔王贝恩霍勒身边。",
    ["In the alchemy lab of Scholomance, use the imp in a jar and let it do its work."] =
        "在通灵学院的炼金实验室里，使用瓶中的小鬼，让它完成工作。",
    ["In Dire Maul, summon the Xorothian Dreadsteed with the ritual items and defeat it; then speak to its spirit."] =
        "在厄运之槌，用仪式物品召唤克索诺斯恐惧战马并击败它；然后与它的灵魂交谈。",
    ["Your reward: Summon Dreadsteed, your epic mount."] =
        "奖励：召唤恐惧战马，你的史诗坐骑。",
    ["Warrior quests"] =
        "战士任务",
    ["Lyria Du Lac, the warrior trainer of Goldshire."] =
        "里瑞亚·杜拉克，闪金镇的战士训练师。",
    ["From level 10: the chain that teaches Defensive Stance."] =
        "10级起：学会防御姿态的任务线。",
    ["Harry Burlguard, in the tavern of Old Town, in Stormwind."] =
        "哈里·伯加德，在暴风城旧城区的酒馆里。",
    ["Bartleby, a drunk in the same tavern: he attacks as soon as you take his quest."] =
        "巴特莱比，同一家酒馆里的醉汉：你一接他的任务他就会发起攻击。",
    ["Turning this in teaches Defensive Stance."] =
        "交付此任务后学会防御姿态。",
    ["Granis Swiftaxe, the warrior trainer of Kharanos."] =
        "格兰尼斯·快斧，卡拉诺斯的战士训练师。",
    ["Muren Stormpike, upstairs in the Hall of Arms of Ironforge."] =
        "穆伦·雷矛，在铁炉堡军事大厅的楼上。",
    ["Vejrek waits in a Frostmane hut in the west of Dun Morogh."] =
        "维吉雷克在丹莫罗西部的一间霜鬃巨魔小屋里等着。",
    ["Kyra Windblade, the warrior trainer of Dolanaar."] =
        "凯拉·风刃，多兰纳尔的战士训练师。",
    ["Elanaria, on the Warrior's Terrace of Darnassus."] =
        "艾兰娜瑞，在达纳苏斯的战士区。",
    ["Vorlus Vilehoof roams with the satyrs southwest of Dolanaar."] =
        "沃鲁斯·邪蹄和萨特们一起在多兰纳尔西南游荡。",
    ["Seena Skybreaker, the warrior trainer of Zephras Isle."] =
        "Seena Skybreaker，Zephras Isle的战士训练师。",
    ["From level 10: the Skyborne warrior quest of Zephras Isle."] =
        "10级起：Zephras Isle的Skyborne战士任务。",
    ["Zaal Stormshield carries the bulwark, in the north of the isle."] =
        "Zaal Stormshield身上有那面壁垒盾，在岛的北部。",
    ["Your capital's warrior trainer gives it."] =
        "你所在主城的战士训练师给出此任务。",
    ["From level 30: the chain that teaches Berserker Stance."] =
        "30级起：学会狂暴姿态的任务线。",
    ["Klannoc Macleod, on Fray Island, off the coast of the Barrens."] =
        "克兰诺克·马克雷德，在贫瘠之地海岸外的勇士岛上。",
    ["Step on the grate of the arena: six fighters come one at a time, then Big Will."] =
        "踩上竞技场的格栅：六名斗士会逐一出场，然后是比格维尔。",
    ["Turning this in teaches Berserker Stance."] =
        "交付此任务后学会狂暴姿态。",
    ["From level 30: Bath'rah's chain, which ends with a Whirlwind weapon of your choice."] =
        "30级起：巴斯拉的任务线，最后可以自选一件旋风武器。",
    ["Eight Liferoot: an herb, picked with Herbalism or bought at the auction house."] =
        "八株活根草：一种草药，可用草药学采集或在拍卖行购买。",
    ["The Drywhisker kobolds of eastern Arathi Highlands carry the three charms."] =
        "阿拉希高地东部的枯须狗头人身上有那三个护符。",
    ["At Bath'rah's cauldron, right by him: put the three charms in it."] =
        "在巴斯拉身边的大锅处：把三个护符放进去。",
    ["The Bloodscalp trolls of northern Stranglethorn carry the tusks."] =
        "荆棘谷北部的血顶巨魔身上有獠牙。",
    ["Follow Bath'rah to the summoning, then defeat Cyclonian for its heart: a strong foe, bring help."] =
        "跟随巴斯拉前往召唤地点，然后击败塞克隆尼亚取得它的心脏：它是强敌，找人帮忙。",
    ["Your reward: a Whirlwind weapon of your choice."] =
        "奖励：一件自选的旋风武器。",
    ["From level 50: the Fallen Hero's chain, which ends in the Temple of Atal'Hakkar."] =
        "50级起：部落英雄的灵魂给出的任务线，终点在阿塔哈卡神庙。",
    ["The Fallen Hero of the Horde, a spirit in the west of the Swamp of Sorrows."] =
        "部落英雄的灵魂，一个位于悲伤沼泽西部的幽魂。",
    ["The Helboars of the Blasted Lands."] =
        "诅咒之地的地狱野猪。",
    ["The Shadowsworn of the Blasted Lands, by the Dark Portal; they come back quickly."] =
        "诅咒之地黑暗之门旁的魔誓者；它们刷新很快。",
    ["Gennia Runetotem, the druid trainer of Bloodhoof Village, sends you to Thunder Bluff."] =
        "根妮亚·符文图腾，血蹄村的德鲁伊训练师，会让你去雷霆崖。",
    ["Turak Runetotem, in the Elder Rise of Thunder Bluff."] =
        "图拉克·符文图腾，在雷霆崖的长者高地。",
    ["Faustron, the wind rider master southwest of Nighthaven: take this flight path for your next trips here."] =
        "法斯托恩，永夜港西南的双足飞龙管理员：开启这条飞行路线，以后来这里更方便。",
    ["Lunaclaw's spot, west of Camp Taurajo in the Barrens"] =
        "月爪枭兽的所在地，在贫瘠之地陶拉祖营地以西",
    ["Use the Cenarion Lunardust by the moonkin stone: Lunaclaw appears. Defeat her, then speak to her spirit."] =
        "在月夜枭兽之石旁使用赛纳里奥银尘：月爪枭兽会出现。击败她，然后与她的灵魂交谈。",
    ["Muln Earthfury gives it, in the northwest of Mulgore."] =
        "Muln Earthfury给出此任务，在莫高雷西北部。",
    ["Fill the sampler in the bubbling pool at the top of Dreadmist Peak: three acolytes attack right after, so clear the top first or bring help."] =
        "在鬼雾峰山顶冒泡的水池里装满取样器：随后会有三名侍僧发起攻击，所以先清理山顶或找人帮忙。",
    ["Tonga Runetotem, just south of the Crossroads."] =
        "图加·符文图腾，就在十字路口南边。",
    ["The kodos of the northern Barrens carry the Kodo Horns."] =
        "贫瘠之地北部的科多兽身上有科多兽角。",
    ["Sickly Gazelles graze in the north of the Barrens: use the salve on them."] =
        "生病的瞪羚在贫瘠之地北部吃草：对它们使用药膏。",
    ["The first half of the pendant lies under the water in the far north of the Barrens."] =
        "坠饰的第一半在贫瘠之地最北端的水下。",
    ["The second half lies under the water off the coast of Silverpine Forest."] =
        "第二半在银松森林海岸外的水下。",
    ["Turak Runetotem gives it, in the Elder Rise of Thunder Bluff."] =
        "图拉克·符文图腾给出此任务，在雷霆崖的长者高地。",
    ["Thotar, the hunter trainer of Razor Hill."] =
        "索塔尔，剃刀岭的猎人训练师。",
    ["Use the taming rod on a Dire Mottled Boar, south of Razor Hill. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "对剃刀岭以南的可怕的杂斑野猪使用驯兽棒。驯服后将它解散：它会重新攻击你，做好准备。",
    ["Use the rod on a Surf Crawler, on the southern shore of Durotar, then dismiss it the same way."] =
        "对杜隆塔尔南岸的海浪蟹使用驯兽棒，然后用同样的方法将它解散。",
    ["Use the rod on an Armored Scorpid, northwest of Razor Hill."] =
        "对剃刀岭西北的硬甲蝎使用驯兽棒。",
    ["Ormak Grimshot, the hunter trainer of Orgrimmar, in the Valley of Honor."] =
        "奥玛克，奥格瑞玛的猎人训练师，在荣誉谷。",
    ["Yaw Sharpmane, the hunter trainer of Bloodhoof Village."] =
        "雅文·刺鬃，血蹄村的猎人训练师。",
    ["Use the taming rod on an Adult Plainstrider, north of the village. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "对村子以北的成年平原陆行鸟使用驯兽棒。驯服后将它解散：它会重新攻击你，做好准备。",
    ["Use the rod on a Prairie Stalker, southeast of the village, then dismiss it the same way."] =
        "对村子东南的草原捕食者使用驯兽棒，然后用同样的方法将它解散。",
    ["Use the rod on a Swoop, in the plains north of the village."] =
        "对村子以北平原上的猛鹫使用驯兽棒。",
    ["Holt Thunderhorn, the hunter trainer of Thunder Bluff, on the Hunter Rise."] =
        "浩特·雷角，雷霆崖的猎人训练师，在猎人高地。",
    ["Uthel'nay, the mage trainer of Orgrimmar, in the Valley of Spirits."] =
        "尤塞尔奈，奥格瑞玛的法师训练师，在精神谷。",
    ["From level 10: your trainer's first errand, in Durotar."] =
        "10级起：训练师交给你的第一件差事，在杜隆塔尔。",
    ["Un'Thuwa, the mage trainer of Sen'jin Village."] =
        "安苏瓦，森金村的法师训练师。",
    ["The Ju-Ju Heaps stand on the Echo Isles, off the southern coast."] =
        "魂能骨堆位于南部海岸外的回音群岛上。",
    ["Cain Firesong, the mage trainer of Brill."] =
        "凯恩·火歌，布瑞尔的法师训练师。",
    ["From level 10: your trainer's first errand, in Tirisfal Glades."] =
        "10级起：训练师交给你的第一件差事，在提瑞斯法林地。",
    ["Anastasia Hartwell, the mage trainer of the Undercity, in the Magic Quarter."] =
        "安娜斯塔西娅·哈特威尔，幽暗城的法师训练师，在魔法区。",
    ["The snapdragons grow by the farm of the Balnirs, in the east of Tirisfal Glades."] =
        "金鱼草长在提瑞斯法林地东部的巴尼尔农场旁。",
    ["From level 15: a chain in the Undercity that ends with a robe for you."] =
        "15级起：幽暗城的一条任务线，最后会得到一件长袍。",
    ["The chest of coffers and the cantation lie beside Anastasia."] =
        "封灵箱和显形卷轴就在安娜斯塔西娅旁边。",
    ["The alchemist shop of the Undercity"] =
        "幽暗城的炼金商店",
    ["Read the cantation to reveal a Rift Spawn, fight it until it is stunned, then use a coffer on it."] =
        "阅读显形卷轴，让裂隙怒灵现形，与它战斗直到它被击晕，然后对它使用封灵箱。",
    ["The Dalaran mages of Ambermill, in Silverpine Forest, carry the mana gems; the linen comes from humanoids anywhere."] =
        "银松森林安伯米尔的达拉然法师身上有法力宝石；亚麻布可以从任何地方的人型生物身上获得。",
    ["Josef Gregorian, the tailor of the Undercity's Rogues' Quarter."] =
        "乔瑟夫·格里高利，幽暗城盗贼区的裁缝。",
    ["Your reward: the Spellfire Robes."] =
        "奖励：魔焰长袍。",
    ["Deino, the mage trainer of Orgrimmar, in the Valley of Spirits."] =
        "迪诺，奥格瑞玛的法师训练师，在精神谷。",
    ["Fill the flask at the waterfall of Xavian, in eastern Ashenvale: take the path up from the south."] =
        "在灰谷东部克萨维亚的瀑布装满瓶子：从南边的小路上去。",
    ["The Laughing Sisters, nymphs of the woods of central Ashenvale, carry the hair."] =
        "欢笑的姐妹，灰谷中部树林里的仙女，身上有头发。",
    ["Kil'hala, the tailor of the Crossroads."] =
        "基尔哈拉，十字路口的裁缝。",
    ["Your reward: the Nether-lace Garment."] =
        "奖励：虚灵长袍。",
    ["Shadow Priest Sarvis, at the start of Deathknell."] =
        "暗影牧师萨维斯，在丧钟镇的起点。",
    ["The Forsaken paladin's story, a chain added by Forever, starts in Deathknell."] =
        "被遗忘者圣骑士的故事是Forever新增的任务线，从丧钟镇开始。",
    ["Aramis Hammerhand, the paladin trainer of Deathknell."] =
        "Aramis Hammerhand，丧钟镇的圣骑士训练师。",
    ["Shari Stilwell, the paladin trainer of Brill."] =
        "Shari Stilwell，布瑞尔的圣骑士训练师。",
    ["Breton Samuels, at the outpost in the west of Tirisfal Glades."] =
        "Breton Samuels，在提瑞斯法林地西部的前哨。",
    ["Jorin Croge, a few steps away."] =
        "Jorin Croge，就在几步之外。",
    ["The Vile Fin murlocs of the western coast."] =
        "西海岸的邪鳍鱼人。",
    ["The lumber piles lie on the western coast, south of the murlocs."] =
        "木材堆在西海岸，鱼人的南边。",
    ["Danitha Morr, at the outpost."] =
        "Danitha Morr，在前哨。",
    ["The Tarnished gather on the western coast; Rudolph Gelhardt, their paladin, carries the head the quest asks for."] =
        "Tarnished聚集在西海岸；他们的圣骑士Rudolph Gelhardt身上有任务所需的头颅。",
    ["Lady Sylvanas Windrunner, in the Royal Quarter of the Undercity."] =
        "希尔瓦娜斯·风行者，在幽暗城的皇家区。",
    ["Danitha Morr, at the outpost in the west of Tirisfal Glades."] =
        "Danitha Morr，在提瑞斯法林地西部的前哨。",
    ["From level 12: the lessons in divinity, the next chapter of the Forsaken paladin's story."] =
        "12级起：神圣课程，被遗忘者圣骑士故事的下一章。",
    ["Tanis Alderwood, in the Undercity."] =
        "Tanis Alderwood，在幽暗城。",
    ["Tanis needs Linen Cloth: humanoids carry it everywhere."] =
        "Tanis需要亚麻布：各地的人型生物身上都有。",
    ["Deathguard Billmuth, at the outpost."] =
        "Deathguard Billmuth，在前哨。",
    ["Deathguard Falgan, in the east of Tirisfal Glades, near the Scarlet watch post."] =
        "Deathguard Falgan，在提瑞斯法林地东部，靠近血色十字军的哨所。",
    ["The Scarlet zealots and friars of the watch post carry the attack plans."] =
        "哨所里的血色狂热者和血色苦行修士身上有进攻计划。",
    ["From level 18: the story goes on in Silverpine Forest, around a moonsilver blade."] =
        "18级起：故事在银松森林继续，围绕一把月银之刃展开。",
    ["Trevan Rol, at the Sepulcher."] =
        "Trevan Rol，在瑟伯切尔。",
    ["Deathguard Baldren, at the Sepulcher."] =
        "Deathguard Baldren，在瑟伯切尔。",
    ["The charred remains lie in the east of Silverpine Forest, facing Fenris Isle."] =
        "烧焦的残骸在银松森林东部，面向芬里斯岛。",
    ["Lumina Windsinger, held in Fenris Keep."] =
        "Lumina Windsinger，被关押在芬里斯城堡。",
    ["The Rot Hide gnolls of Fenris Isle carry the key."] =
        "芬里斯岛的腐皮豺狼人身上有钥匙。",
    ["Lumina Windsinger waits again at the Sepulcher."] =
        "Lumina Windsinger又在瑟伯切尔等候。",
    ["Old Fire-Eye prowls the south of Silverpine Forest."] =
        "Old Fire-Eye在银松森林南部徘徊。",
    ["Ott, the weaponsmith of Tarren Mill."] =
        "奥特，塔伦米尔的武器锻造师。",
    ["Ulric Frostveil, at Zoram'gar Outpost on the coast of Ashenvale."] =
        "Ulric Frostveil，在灰谷海岸的佐拉姆加前哨站。",
    ["From level 20: Ulric Frostveil's quest of the Kor Gem, in Ashenvale."] =
        "20级起：Ulric Frostveil的科尔宝石任务，在灰谷。",
    ["The naga of the Blackfathom Deeps entrance, under the water of Zoram Strand, carry the corrupted gem. They are elite: bring a group."] =
        "黑暗深渊入口处的纳迦，在佐拉姆海岸的水下，身上有被污染的宝石。它们是精英：组队前往。",
    ["Ken'jai, the priest trainer of the Valley of Trials."] =
        "肯杰，试炼谷的牧师训练师。",
    ["From level 5: heal a wounded grunt, and get your first robe."] =
        "5级起：治疗一名受伤的步兵，并获得你的第一件长袍。",
    ["Tai'jin, the priest trainer of Razor Hill."] =
        "泰金，剃刀岭的牧师训练师。",
    ["Grunt Kor'ja lies wounded south of Razor Hill: heal her with Lesser Heal, then give her Power Word: Fortitude."] =
        "步兵科雅受伤躺在剃刀岭以南：用次级治疗术治疗她，然后对她施放真言术：韧。",
    ["Dark Cleric Duesten, the priest trainer of Deathknell."] =
        "黑暗牧师杜斯滕，丧钟镇的牧师训练师。",
    ["From level 5: heal a wounded deathguard, and get your first robe."] =
        "5级起：治疗一名受伤的亡灵卫兵，并获得你的第一件长袍。",
    ["Dark Cleric Beryl, the priest trainer of Brill."] =
        "黑暗牧师贝里尔，布瑞尔的牧师训练师。",
    ["Deathguard Kel lies wounded north of Brill: heal him with Lesser Heal, then give him Power Word: Fortitude."] =
        "亡灵卫兵科尔受伤躺在布瑞尔以北：用次级治疗术治疗他，然后对他施放真言术：韧。",
    ["From level 10: the quest that teaches Hex of Weakness."] =
        "10级起：学会虚弱妖术的任务。",
    ["Ur'kyo, the priest trainer of Orgrimmar, in the Valley of Spirits."] =
        "乌尔库，奥格瑞玛的牧师训练师，在精神谷。",
    ["Aelthalyste, the priest trainer of the Undercity, in the War Quarter."] =
        "艾萨莱斯特，幽暗城的牧师训练师，在军事区。",
    ["From level 10: the quest that teaches Touch of Weakness."] =
        "10级起：学会虚弱之触的任务。",
    ["From level 20: the quest that teaches Shadowguard."] =
        "20级起：学会暗影守卫的任务。",
    ["From level 20: the quest that teaches Devouring Plague."] =
        "20级起：学会噬灵瘟疫的任务。",
    ["Learn Pick Lock at your trainer, then practice on lockboxes until your skill reaches 75: Gallywix's lockbox, at 20, needs it."] =
        "在训练师处学会开锁，然后用锁箱练习，直到技能达到75：20级时开加里维克斯的保险箱需要它。",
    ["Shenthul, in a tent of the Cleft of Shadow, in Orgrimmar."] =
        "申苏尔，在奥格瑞玛暗影裂口的一顶帐篷里。",
    ["Shenthul greets you with a hand sign: answer it with the salute emote."] =
        "申苏尔会用手势向你致意：用敬礼表情动作回应他。",
    ["By the Venture Co. tower in the far north of the Barrens: target Taskmaster Fizzule, fire the flare gun twice, then salute him."] =
        "在贫瘠之地最北端的风险投资公司塔楼旁：选中工头费苏勒，发射两次信号枪，然后向他敬礼。",
    ["In the tower: pick Silixiz's key from his pocket, kill the guards floor by floor, Gallywix at the top, then open his lockbox."] =
        "在塔楼里：从希里克斯的口袋里偷取他的钥匙，逐层击杀守卫，加里维克斯在顶层，然后打开他的保险箱。",
    ["The lockbox leaves a sickness on you: Shenthul sends you to be cured."] =
        "保险箱会让你染上一种疾病：申苏尔会让你去接受治疗。",
    ["Serge Hinott, the alchemist of Tarren Mill."] =
        "瑟尔格·希诺特，塔伦米尔的炼金师。",
    ["Stay by Serge while he prepares the cure."] =
        "在瑟尔格准备解药时待在他身边。",
    ["Canaga Earthcaller, in the Valley of Trials."] =
        "坎纳甘·地鸣，在试炼谷。",
    ["The Felstalkers of the valley carry the hooves."] =
        "山谷里的地狱捕猎者身上有蹄子。",
    ["Up the hill path south of the valley: drink the Earth Sapta to see the Minor Manifestation of Earth."] =
        "沿山谷以南的山路上去：喝下大地灵契，就能看见大地之魂。",
    ["Seer Ravenfeather, in Camp Narache."] =
        "鸦羽先知，在纳拉其营地。",
    ["The Bristleback shamans east of the camp carry the salve."] =
        "营地以东的刺背萨满祭司身上有药膏。",
    ["On the hill south of the camp: drink the Earth Sapta to see the Minor Manifestation of Earth."] =
        "在营地以南的山丘上：喝下大地灵契，就能看见大地之魂。",
    ["Windshaper Boro, on Zephras Isle."] =
        "Windshaper Boro，在Zephras Isle。",
    ["Drink the Earth Sapta to see the Minor Manifestation of Earth, east of Boro."] =
        "喝下大地灵契，就能看见Boro以东的大地之魂。",
    ["Swart, the shaman trainer of Razor Hill."] =
        "斯瓦特，剃刀岭的萨满祭司训练师。",
    ["Narm Skychaser, the shaman trainer of Bloodhoof Village."] =
        "纳姆·逐星，血蹄村的萨满祭司训练师。",
    ["Kranal Fiss, at the Far Watch Post on the border of the Barrens."] =
        "卡纳尔·菲斯，在贫瘠之地边境的前沿哨所。",
    ["Telf Joolam, on top of a mountain in the west of Durotar."] =
        "泰尔夫·祖拉姆，在杜隆塔尔西部的一座山顶上。",
    ["The Razormane of the northern Barrens carry the Fire Tar; the Burning Blade cultists of the cave north of Razor Hill carry the pouches."] =
        "贫瘠之地北部的钢鬃野猪人身上有火焰焦油；剃刀岭以北洞穴里的火刃祭司身上有袋子。",
    ["Right by Telf: drink the Fire Sapta, then defeat the Minor Manifestation of Fire for its ember."] =
        "就在泰尔夫身边：喝下火焰灵契，然后击败火焰之魂取得余烬。",
    ["Sessaria Skystride, on Zephras Isle."] =
        "Sessaria Skystride，在Zephras Isle。",
    ["Olariaan Swiftburn, in the south of the isle."] =
        "Olariaan Swiftburn，在岛的南部。",
    ["Skypriest Faladiel carries the heart."] =
        "Skypriest Faladiel身上有心脏。",
    ["Kuramaa, the spirit of mischief, carries the mask."] =
        "Kuramaa，恶作剧之灵，身上有面具。",
    ["Light the Brazier of Offering by Olariaan, then the Brazier of Eternal Flame by Sessaria."] =
        "点燃Olariaan旁边的Brazier of Offering，然后点燃Sessaria旁边的Brazier of Eternal Flame。",
    ["Searn Firewarder, in the Valley of Wisdom of Orgrimmar."] =
        "希尔恩·火结，在奥格瑞玛的智慧谷。",
    ["Xanis Flameweaver, on the Elder Rise of Thunder Bluff."] =
        "萨尼斯·织火，在雷霆崖的长者高地。",
    ["Islen Waterseer, by the coast east of the Barrens."] =
        "水之先知伊斯伦，在贫瘠之地东边的海岸旁。",
    ["Brine, in the south of the Barrens."] =
        "布瑞恩，在贫瘠之地南部。",
    ["Fill the waterskin at the quilboar watering hole, right by Brine."] =
        "在布瑞恩旁边的野猪人水池装满水囊。",
    ["Fill it at the Spring Well of Tarren Mill, in Hillsbrad Foothills."] =
        "在希尔斯布莱德丘陵塔伦米尔的清泉井装满它。",
    ["Fill it at the ruins of the Stardust Fountain, in the south of Ashenvale."] =
        "在灰谷南部的星尘喷泉废墟装满它。",
    ["By the Brazier of Everfount, in the lake of Silverpine Forest: use the brazier's water, then defeat the corrupt manifestation for its bracers."] =
        "在银松森林湖中的圣泉火盆旁：使用火盆的水，然后击败堕落的水之魂取得护腕。",
    ["The Minor Manifestation of Water rises beside the brazier."] =
        "水之魂会在火盆旁出现。",
    ["Prate Cloudseer, on a mesa in the middle of Thousand Needles."] =
        "普拉特·白云，在千针石林中部的一座台地上。",
    ["Rau Cliffrunner, at Freewind Post."] =
        "劳恩·峭壁行者，在乱风岗。",
    ["From level 33: Forever's elemental quests of Rau Cliffrunner, in Thousand Needles."] =
        "33级起：Forever的劳恩·峭壁行者元素任务，在千针石林。",
    ["Beram Skychaser in Thunder Bluff, or Sagorne Creststrider in Orgrimmar."] =
        "雷霆崖的博拉姆·逐星，或奥格瑞玛的萨格尼。",
    ["From level 50: Bath'rah the Windwatcher's chain, which ends in the Temple of Atal'Hakkar."] =
        "50级起：捕风者巴斯拉的任务线，终点在阿塔哈卡神庙。",
    ["One Elemental Earth, Fire, Water and Air: elementals drop them, or the auction house sells them."] =
        "元素之土、元素火焰、元素之水和元素空气各一份：由元素生物掉落，或在拍卖行购买。",
    ["The spiders and the bears of the Western Plaguelands carry the eyes and the claws."] =
        "西瘟疫之地的蜘蛛和熊身上有眼睛和爪子。",
    ["Ruzan, in the Valley of Trials."] =
        "鲁赞，在试炼谷。",
    ["Your trainer's first errand, in the Valley of Trials."] =
        "训练师交给你的第一件差事，在试炼谷。",
    ["The Vile Familiars of the cave south of the valley carry the heads."] =
        "山谷南边洞穴里的邪灵劣魔身上有头颅。",
    ["Zureetha Fargaze, beside Ruzan."] =
        "祖雷萨，在鲁赞旁边。",
    ["Venya Marthand, in Deathknell."] =
        "温雅·玛山德，在丧钟镇。",
    ["Your trainer's first errand, in Deathknell."] =
        "训练师交给你的第一件差事，在丧钟镇。",
    ["The Rattlecage Skeletons east of Deathknell carry the skulls."] =
        "丧钟镇以东的断骨骷髅身上有头骨。",
    ["Ophek, in Razor Hill, sends you to Orgrimmar."] =
        "奥菲克，在剃刀岭，会让你去奥格瑞玛。",
    ["Gan'rul Bloodeye, in the Cleft of Shadow of Orgrimmar."] =
        "甘鲁尔·血眼，在奥格瑞玛的暗影裂口。",
    ["The Tablet of Verga lies in the Burning Blade stash at the back of Skull Rock, in the north of Durotar."] =
        "维尔加石板在杜隆塔尔北部骷髅石深处火刃氏族的藏匿处。",
    ["Right by Gan'rul: use the glyphs on the summoning circle, then defeat the voidwalker."] =
        "就在甘鲁尔身边：对召唤法阵使用雕文，然后击败虚空行者。",
    ["Ageron Kargal, in Brill, sends you to the Undercity."] =
        "埃格隆·卡加尔，在布瑞尔，会让你去幽暗城。",
    ["Carendin Halgar, in the Magic Quarter of the Undercity."] =
        "凯伦丁·哈加尔，在幽暗城的魔法区。",
    ["Egalin's Grimoire lies in Perrine's chest, in the house south of Brill."] =
        "埃加林的魔典在布瑞尔以南那栋房子里派瑞恩的箱子中。",
    ["Right by Carendin: use the runes on the summoning circle, then defeat the voidwalker."] =
        "就在凯伦丁身边：对召唤法阵使用符文，然后击败虚空行者。",
    ["Cazul, in the Cleft of Shadow."] =
        "卡祖尔，在暗影裂口。",
    ["Zankaja, in the Valley of Spirits of Orgrimmar."] =
        "赞卡沙，在奥格瑞玛的精神谷。",
    ["Gazrog, at the Crossroads."] =
        "加兹罗格，在十字路口。",
    ["Ken'zigla, at the camp of Malaka'jin in the far south of Stonetalon Mountains."] =
        "肯兹格拉，在石爪山脉最南端的玛拉卡金营地。",
    ["Grunt Logmar, by the road north of Camp Taurajo."] =
        "步兵劳格玛，在陶拉祖营地以北的路边。",
    ["Grunt Dogran is held by the Kolkar in the Barrens: give him the draught."] =
        "步兵多格兰被贫瘠之地的科卡尔半人马关押：把伤药交给他。",
    ["Right by Gan'rul: use Dogran's pendant on the summoning circle, then defeat the succubus."] =
        "就在甘鲁尔身边：对召唤法阵使用多格兰的坠饰，然后击败魅魔。",
    ["Jorah Annison, in the Magic Quarter of the Undercity."] =
        "约拉·安尼森，在幽暗城的魔法区。",
    ["The Dragonmaw orcs of the Wetlands carry the rod: Alliance land, stay clear of the guards."] =
        "湿地的龙喉兽人身上有魔棒：联盟领地，远离守卫。",
    ["Zevrost, the warlock trainer of the Cleft of Shadow."] =
        "泽弗洛斯特，暗影裂口的术士训练师。",
    ["Kurgul, the demon trainer of the Cleft of Shadow."] =
        "库古尔，暗影裂口的恶魔训练师。",
    ["Your warrior trainer, in Razor Hill or Bloodhoof Village, sends you to Uzzek."] =
        "你的战士训练师，在剃刀岭或血蹄村，会让你去找犹塞克。",
    ["Uzzek, at the Far Watch Post on the border of the Barrens."] =
        "犹塞克，在贫瘠之地边境的前沿哨所。",
    ["From level 10: the quest that teaches Defensive Stance."] =
        "10级起：学会防御姿态的任务。",
    ["The Thunder Lizards of the north of Durotar carry the scales."] =
        "杜隆塔尔北部的雷霆蜥蜴身上有鳞片。",
    ["Thun'grim Firegaze, on a hill east of the Crossroads."] =
        "索恩格瑞姆·火眼，在十字路口以东的一座小山上。",
    ["The steel bars lie in the Razormane camp below the hill."] =
        "钢锭在山下的钢鬃野猪人营地里。",
    ["Austil de Mon, the warrior trainer of Brill."] =
        "奥斯蒂尔·德·蒙，布瑞尔的战士训练师。",
    ["Deathguard Dillinger, in Brill."] =
        "亡灵卫兵迪林格尔，在布瑞尔。",
    ["Open the mausoleum north of Brill: Ulag the Cleaver comes out."] =
        "打开布瑞尔以北的陵墓：切割者奥拉格会冲出来。",
    ["Coleman Farthing, in the inn of Brill."] =
        "库勒曼·法席恩，在布瑞尔的旅店里。",
    ["The four heirlooms lie in the crypt of the Agamand Mills, in the northwest of Tirisfal Glades."] =
        "四件传家宝在提瑞斯法林地西北部阿加曼德磨坊的地穴里。",
}
