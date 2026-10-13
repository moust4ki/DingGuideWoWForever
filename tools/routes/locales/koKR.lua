-- Korean guide texts: [English text] = Korean text, one entry per phrase of the guides
-- (zone names of the titles, route intros, automatic notes, hand-written notes). tools/translate_guides.lua
-- writes Ding/Locales/Guides/koKR/ from it; a note joining several phrases is translated
-- phrase by phrase. Keys: the English texts of the routes (tools/routes/*.lua), the
-- automatic notes of tools/draft_guide.lua and Ding/Guides/NightElf/01_Shadowglen.lua.
-- Zone, town and NPC names follow the Korean WoW Classic client (QuestieDB koKR lookups).
return {
    -- Shadowglen (hand-written guide)
    ["Shadowglen"] =
        "그늘 협곡",
    ["Both quest givers stand right in front of you, at the foot of Aldrassil."] =
        "퀘스트를 주는 두 NPC가 바로 앞, 알드랏실 아래에 있습니다.",
    ["Young nightsabers and thistle boars all around Aldrassil: kill everything you come across."] =
        "알드랏실 주변의 새끼 흑호와 엉겅퀴멧돼지: 보이는 대로 처치하세요.",
    ["Tarindrella stands a little southwest of Aldrassil (57.8, 45.2)."] =
        "타린드렐라는 알드랏실에서 조금 남서쪽에 있습니다 (57.8, 45.2).",
    ["The class trainers are inside Aldrassil."] =
        "직업 상급자는 알드랏실 안에 있습니다.",
    ["Gilshalan needs level 3: if you are not there yet, Ding! will remind you before the cave."] =
        "길스할란의 퀘스트는 3레벨부터입니다: 아직이라면 동굴에 가기 전에 Ding!이 다시 알려 줍니다.",
    ["One single loop: mangy nightsabers and boars to the north, moss on the grells, totems to the west (54, 40)."] =
        "한 바퀴로 끝내세요: 북쪽에서 병든 흑호와 멧돼지, 그렐에게서 이끼, 서쪽에서 토템 (54, 40).",
    ["Iverron waits in front of the cave, to the north (54.6, 33)."] =
        "이베론은 북쪽 동굴 앞에서 기다립니다 (54.6, 33).",
    ["Spiders in the cave, right behind Iverron."] =
        "거미는 이베론 바로 뒤의 동굴 안에 있습니다.",
    ["Githyiss the Vile, at the back of the cave (56.6, 26.3), may drop a fang: use it from your bags."] =
        "동굴 안쪽 (56.6, 26.3)의 흉측한 기시이스가 송곳니를 떨어뜨릴 수 있습니다: 가방에서 사용하세요.",
    ["Back to Aldrassil: everything is turned in at the same place."] =
        "알드랏실로 돌아가세요: 모두 같은 곳에서 완료합니다.",
    ["Mushrooms on the grells, lilies north of Aldrassil (57, 37), ichor on the spiders, egg at the back of the cave."] =
        "버섯은 그렐, 백합은 알드랏실 북쪽 (57, 37), 영액은 거미, 알은 동굴 안쪽.",
    ["Iverron, still in front of the cave."] =
        "이베론은 여전히 동굴 앞에 있습니다.",
    ["Tenaron is at the very top of Aldrassil: follow the ramp that winds up around the trunk."] =
        "테나론은 알드랏실 꼭대기에 있습니다: 나무줄기를 감아 오르는 비탈길을 따라가세요.",
    ["Fill the phial at the moonwell, to the northeast (60, 33)."] =
        "북동쪽 달샘에서 약병을 채우세요 (60, 33).",
    ["Porthannius, on the road out of Shadowglen."] =
        "포르타니우스는 그늘 협곡을 나가는 길에 있습니다.",
    ["Head for Dolanaar"] =
        "돌라나르로 이동",
    ["Follow the road south to the inn: both open quests are turned in at Dolanaar."] =
        "남쪽 길을 따라 여관까지 가세요: 진행 중인 퀘스트 두 개 모두 돌라나르에서 완료합니다.",
    -- human
    ["Northshire"] =
        "북부 신병 훈련소",
    ["Everything happens around Northshire Abbey: follow the arrow from NPC to NPC."] =
        "모든 일은 노스샤이어 수도원 주변에서 진행됩니다: 화살표를 따라 NPC를 차례로 찾아가세요.",
    ["Elwynn Forest"] =
        "엘윈 숲",
    ["Goldshire is your base for the whole forest: inn, class trainers and quests."] =
        "골드샤이어가 숲 전체의 거점입니다: 여관, 직업 상급자, 퀘스트.",
    ["Westfall"] =
        "서부 몰락지대",
    ["Head west on the Goldshire road, then to Sentinel Hill in the middle of Westfall."] =
        "골드샤이어 길로 서쪽으로 간 다음, 서부 몰락지대 중앙의 감시의 언덕으로 가세요.",
    ["Loch Modan"] =
        "모단 호수",
    ["Take the Deeprun Tram from Stormwind to Ironforge, then the road east through Dun Morogh to Thelsamar."] =
        "스톰윈드에서 깊은굴 지하철을 타고 아이언포지로 간 다음, 던 모로를 지나는 동쪽 길로 텔사마까지 가세요.",
    -- dwarf_gnome
    ["Coldridge Valley"] =
        "눈마루 골짜기",
    ["Everything starts in Coldridge: follow the arrow from NPC to NPC."] =
        "모든 것은 눈마루 골짜기에서 시작됩니다: 화살표를 따라 NPC를 차례로 찾아가세요.",
    ["Dun Morogh"] =
        "던 모로",
    ["Leave the valley through the tunnel to the northeast: Kharanos is your base for Dun Morogh."] =
        "북동쪽 터널로 골짜기를 나가세요: 카라노스가 던 모로의 거점입니다.",
    ["Take the road east through the South Gate tunnel to Thelsamar."] =
        "남부 관문 터널을 지나는 동쪽 길로 텔사마까지 가세요.",
    ["Deeprun Tram from Ironforge to Stormwind, then the road west through Goldshire to Sentinel Hill."] =
        "아이언포지에서 깊은굴 지하철로 스톰윈드까지 간 다음, 골드샤이어를 지나는 서쪽 길로 감시의 언덕까지 가세요.",
    -- nightelf
    ["Teldrassil"] =
        "텔드랏실",
    ["Dolanaar is your base for Teldrassil: inn, class trainers and most quests."] =
        "돌라나르가 텔드랏실의 거점입니다: 여관, 직업 상급자, 대부분의 퀘스트.",
    ["Darkshore"] =
        "어둠의 해안",
    ["Rut'theran (portal at the foot of Darnassus), then the boat to Auberdine: your base on Darkshore."] =
        "다르나서스 아래쪽 차원문으로 루테란 마을에 간 다음, 배로 아우버다인까지 가세요: 어둠의 해안의 거점입니다.",
    ["Boat from Auberdine to Menethil Harbor, then the road east through the Wetlands to Loch Modan: Thelsamar is your base."] =
        "아우버다인에서 배로 메네실 항구까지 간 다음, 저습지를 지나는 동쪽 길로 모단 호수까지 가세요: 텔사마가 거점입니다.",
    -- alliance
    ["Redridge Mountains"] =
        "붉은마루 산맥",
    ["Redridge is east of Elwynn Forest: follow the road east to Lakeshire. Night Elves: boat from Auberdine to Menethil, Ironforge, then the tram to Stormwind."] =
        "붉은마루 산맥은 엘윈 숲 동쪽에 있습니다: 동쪽 길을 따라 레이크샤이어까지 가세요. 나이트 엘프: 아우버다인에서 배로 메네실 항구, 아이언포지를 거쳐 지하철로 스톰윈드까지 가세요.",
    ["Duskwood"] =
        "그늘숲",
    ["Duskwood is south of Elwynn: Darkshire, in the east of the forest, is your base."] =
        "그늘숲은 엘윈 숲 남쪽에 있습니다: 숲 동쪽의 다크샤이어가 거점입니다.",
    ["Wetlands"] =
        "저습지",
    ["The Wetlands are north of Loch Modan: Menethil Harbor, on the west coast, is your base."] =
        "저습지는 모단 호수 북쪽에 있습니다: 서쪽 해안의 메네실 항구가 거점입니다.",
    ["Ashenvale"] =
        "잿빛 골짜기",
    ["Boat from Menethil to Auberdine, then the road south to Ashenvale: Astranaar is your base."] =
        "메네실 항구에서 배로 아우버다인까지 간 다음, 남쪽 길로 잿빛 골짜기까지 가세요: 아스트라나르가 거점입니다.",
    ["Stonetalon Mountains"] =
        "돌발톱 산맥",
    ["The Stonetalon Mountains are west of Ashenvale."] =
        "돌발톱 산맥은 잿빛 골짜기 서쪽에 있습니다.",
    ["Back to Astranaar for the last Ashenvale quests."] =
        "잿빛 골짜기의 마지막 퀘스트를 위해 아스트라나르로 돌아가세요.",
    ["Back to Duskwood for the end of its quests: Darkshire is still your base."] =
        "남은 퀘스트를 위해 그늘숲으로 돌아가세요: 거점은 여전히 다크샤이어입니다.",
    ["Hillsbrad Foothills"] =
        "힐스브래드 구릉지",
    ["From Menethil, the road north crosses Thandol Span to the Foothills: Southshore is your base."] =
        "메네실 항구에서 북쪽 길로 탄돌 교각을 건너 구릉지로 가세요: 사우스쇼어가 거점입니다.",
    ["Thousand Needles"] =
        "버섯구름 봉우리",
    ["Reach Thousand Needles through Theramore and the southern Barrens, or through Feralas; the goblin camp in the east is your base."] =
        "테라모어와 불모의 땅 남부를 거치거나 페랄라스를 거쳐 버섯구름 봉우리로 가세요. 동쪽의 고블린 야영지가 거점입니다.",
    ["Desolace"] =
        "잊혀진 땅",
    ["Desolace is south of the Stonetalon Mountains: the Alliance base is in the northeast of the zone."] =
        "잊혀진 땅은 돌발톱 산맥 남쪽에 있습니다: 얼라이언스 거점은 지역 북동쪽에 있습니다.",
    ["Stranglethorn Vale"] =
        "가시덤불 골짜기",
    ["Stranglethorn Vale is south of Duskwood: Rebel Camp in the north, Booty Bay in the south."] =
        "가시덤불 골짜기는 그늘숲 남쪽에 있습니다: 북쪽에 반란군 야영지, 남쪽에 무법항이 있습니다.",
    ["Arathi Highlands"] =
        "아라시 고원",
    ["The Arathi Highlands are north of the Wetlands, across Thandol Span."] =
        "아라시 고원은 탄돌 교각 건너편, 저습지 북쪽에 있습니다.",
    ["Dustwallow Marsh"] =
        "먼지진흙 습지대",
    ["Boat from Menethil to Theramore, the Alliance base on the edge of the marsh."] =
        "메네실 항구에서 배로 테라모어까지 가세요. 습지대 가장자리의 얼라이언스 거점입니다.",
    ["Badlands"] =
        "황야의 땅",
    ["The Badlands are southeast of Loch Modan."] =
        "황야의 땅은 모단 호수 남동쪽에 있습니다.",
    ["Swamp of Sorrows"] =
        "슬픔의 늪",
    ["The Swamp of Sorrows is east of Deadwind Pass, south of Redridge."] =
        "슬픔의 늪은 죽음의 고개 동쪽, 붉은마루 산맥 남쪽에 있습니다.",
    ["Back to Stranglethorn for the end of its quests, from Booty Bay."] =
        "남은 퀘스트를 위해 가시덤불 골짜기로 돌아가세요. 무법항에서 시작합니다.",
    ["Tanaris"] =
        "타나리스",
    ["Gadgetzan, in the north of Tanaris, is your base. Boat from Booty Bay to Ratchet, or fly from Theramore."] =
        "타나리스 북쪽의 가젯잔이 거점입니다. 무법항에서 배로 톱니항까지 가거나, 테라모어에서 날아가세요.",
    ["Feralas"] =
        "페랄라스",
    ["The Alliance stronghold of Feralas is on an island west of the zone."] =
        "페랄라스의 얼라이언스 요새는 지역 서쪽의 섬에 있습니다.",
    ["The Hinterlands"] =
        "동부 내륙지",
    ["The Hinterlands are northeast of Hillsbrad Foothills: the Wildhammer aerie is in the west."] =
        "동부 내륙지는 힐스브래드 구릉지 북동쪽에 있습니다: 와일드해머일족의 맹금의 봉우리는 서쪽에 있습니다.",
    ["Searing Gorge"] =
        "이글거리는 협곡",
    ["Searing Gorge is south of Loch Modan, through the Badlands."] =
        "이글거리는 협곡은 황야의 땅을 지나 모단 호수 남쪽에 있습니다.",
    ["Blasted Lands"] =
        "저주받은 땅",
    ["Fly to the Blasted Lands, south of the Swamp of Sorrows: the Alliance keep in the north of the zone is your base."] =
        "슬픔의 늪 남쪽에 있는 저주받은 땅으로 날아가세요. 지역 북쪽의 얼라이언스 요새가 거점입니다.",
    ["Un'Goro Crater"] =
        "운고로 분화구",
    ["Un'Goro Crater opens southwest of Tanaris: take the ramp down from Gadgetzan."] =
        "운고로 분화구는 타나리스 남서쪽에 있습니다: 가젯잔에서 비탈길을 따라 내려가세요.",
    ["Azshara"] =
        "아즈샤라",
    ["Azshara is east of Ashenvale."] =
        "아즈샤라는 잿빛 골짜기 동쪽에 있습니다.",
    ["Felwood"] =
        "악령의 숲",
    ["Felwood is north of Ashenvale: the Alliance base is in the south of the zone."] =
        "악령의 숲은 잿빛 골짜기 북쪽에 있습니다: 얼라이언스 거점은 지역 남쪽에 있습니다.",
    ["Burning Steppes"] =
        "불타는 평원",
    ["The Burning Steppes are north of Redridge: the Alliance camp is in the east of the zone."] =
        "불타는 평원은 붉은마루 산맥 북쪽에 있습니다: 얼라이언스 야영지는 지역 동쪽에 있습니다.",
    ["Winterspring"] =
        "여명의 설원",
    ["Winterspring is northeast of Felwood: Everlook is your base."] =
        "여명의 설원은 악령의 숲 북동쪽에 있습니다: 눈망루 마을이 거점입니다.",
    ["Western Plaguelands"] =
        "서부 역병지대",
    ["The Western Plaguelands are north of Hillsbrad Foothills: the Alliance camp is in the south of the zone."] =
        "서부 역병지대는 힐스브래드 구릉지 북쪽에 있습니다: 얼라이언스 야영지는 지역 남쪽에 있습니다.",
    ["Eastern Plaguelands"] =
        "동부 역병지대",
    ["The Eastern Plaguelands continue the Western ones to the east: Light's Hope Chapel is in the east."] =
        "동부 역병지대는 서부 역병지대의 동쪽으로 이어집니다: 희망의 빛 예배당은 동쪽에 있습니다.",
    ["Silithus"] =
        "실리더스",
    ["Silithus is south of Un'Goro Crater: Cenarion Hold is in the north of the zone."] =
        "실리더스는 운고로 분화구 남쪽에 있습니다: 세나리온 요새는 지역 북쪽에 있습니다.",
    -- orc_troll
    ["Valley of Trials"] =
        "시험의 골짜기",
    ["Everything happens in the Valley of Trials: follow the arrow from NPC to NPC."] =
        "모든 일은 시험의 골짜기에서 진행됩니다: 화살표를 따라 NPC를 차례로 찾아가세요.",
    ["Durotar"] =
        "듀로타",
    ["Leave the valley by the road east, then north to Razor Hill: your base for Durotar."] =
        "동쪽 길로 골짜기를 나간 다음, 북쪽의 칼바위 언덕으로 가세요: 듀로타의 거점입니다.",
    ["The Barrens"] =
        "불모의 땅",
    ["Cross the bridge west of Razor Hill into the Barrens, then follow the road to the Crossroads: your base."] =
        "칼바위 언덕 서쪽의 다리를 건너 불모의 땅으로 들어간 다음, 길을 따라 크로스로드로 가세요: 거점입니다.",
    -- tauren
    ["Camp Narache"] =
        "나라체 야영지",
    ["Everything starts at Camp Narache: follow the arrow from NPC to NPC."] =
        "모든 것은 나라체 야영지에서 시작됩니다: 화살표를 따라 NPC를 차례로 찾아가세요.",
    ["Mulgore"] =
        "멀고어",
    ["Follow the road north out of Camp Narache to Bloodhoof Village: your base for Mulgore."] =
        "나라체 야영지에서 북쪽 길을 따라 블러드후프 마을로 가세요: 멀고어의 거점입니다.",
    ["Leave Mulgore by the road east into the Barrens, then north to the Crossroads: your base."] =
        "동쪽 길로 멀고어를 나가 불모의 땅으로 들어간 다음, 북쪽의 크로스로드로 가세요: 거점입니다.",
    -- undead
    ["Deathknell"] =
        "데스넬",
    ["Everything starts in Deathknell: follow the arrow from NPC to NPC."] =
        "모든 것은 데스넬에서 시작됩니다: 화살표를 따라 NPC를 차례로 찾아가세요.",
    ["Tirisfal Glades"] =
        "티리스팔 숲",
    ["Leave Deathknell by the road east to Brill: your base for Tirisfal Glades."] =
        "동쪽 길로 데스넬을 나가 브릴로 가세요: 티리스팔 숲의 거점입니다.",
    ["Silverpine Forest"] =
        "은빛소나무 숲",
    ["From Brill, take the road west then south over the bridge into Silverpine Forest: the Sepulcher is your base."] =
        "브릴에서 서쪽 길로 간 다음, 남쪽으로 다리를 건너 은빛소나무 숲으로 가세요: 공동묘지가 거점입니다.",
    ["Zeppelin from the towers outside Undercity to Orgrimmar, then the road west and south to the Crossroads: your base for the Barrens."] =
        "언더시티 밖의 비행선 탑에서 오그리마로 간 다음, 서쪽과 남쪽 길로 크로스로드까지 가세요: 불모의 땅의 거점입니다.",
    -- horde
    ["The Barrens and Stonetalon"] =
        "불모의 땅과 돌발톱 산맥",
    ["The Crossroads, in the middle of the Barrens, is your base; the Stonetalon Mountains are west of the Barrens."] =
        "불모의 땅 중앙의 크로스로드가 거점입니다. 돌발톱 산맥은 불모의 땅 서쪽에 있습니다.",
    ["Ashenvale is north of the Barrens: Splintertree Post, in the east of the forest, is your base."] =
        "잿빛 골짜기는 불모의 땅 북쪽에 있습니다: 숲 동쪽의 토막나무 주둔지가 거점입니다.",
    ["Zeppelin from the tower outside Orgrimmar to Undercity, then the road south through Silverpine Forest to Tarren Mill: your base."] =
        "오그리마 밖의 비행선 탑에서 언더시티로 간 다음, 은빛소나무 숲을 지나는 남쪽 길로 타렌 밀농장까지 가세요: 거점입니다.",
    ["Zeppelin back to Orgrimmar for the higher quests of the Barrens and the Stonetalon Mountains."] =
        "불모의 땅과 돌발톱 산맥의 더 높은 레벨 퀘스트를 위해 비행선으로 오그리마에 돌아가세요.",
    ["Thousand Needles is south of the Barrens, down the Great Lift: Freewind Post is your base."] =
        "버섯구름 봉우리는 불모의 땅 남쪽, 구름 승강장 아래에 있습니다: 높새바람 봉우리가 거점입니다.",
    ["Hillsbrad, Alterac and Arathi"] =
        "힐스브래드, 알터랙, 아라시",
    ["Zeppelin to Undercity, then Tarren Mill again; the Alterac Mountains are north of the Foothills, the Arathi Highlands east, with Hammerfall in the east of the highlands."] =
        "비행선으로 언더시티에 간 다음 다시 타렌 밀농장으로 가세요. 알터랙 산맥은 구릉지 북쪽, 아라시 고원은 동쪽에 있고, 해머폴은 고원 동쪽에 있습니다.",
    ["Desolace is south of the Stonetalon Mountains: the Horde village is on the west coast."] =
        "잊혀진 땅은 돌발톱 산맥 남쪽에 있습니다: 호드 마을은 서쪽 해안에 있습니다.",
    ["Zeppelin from Orgrimmar to Grom'gol, the Horde camp in the north of Stranglethorn."] =
        "오그리마에서 비행선을 타고 가시덤불 골짜기 북쪽의 호드 야영지인 그롬골 주둔지로 가세요.",
    ["Dustwallow and Thousand Needles"] =
        "먼지진흙 습지대와 버섯구름 봉우리",
    ["Zeppelin back to Orgrimmar. Dustwallow Marsh is east of the southern Barrens, with Brackenwall Village in the north of the marsh; the Shimmering Flats are in the east of Thousand Needles."] =
        "비행선으로 오그리마에 돌아가세요. 먼지진흙 습지대는 불모의 땅 남부의 동쪽에 있고, 담쟁이 마을은 습지대 북쪽에 있습니다. 소금 평원은 버섯구름 봉우리 동쪽에 있습니다.",
    ["Back to the Arathi Highlands: Hammerfall is in the east of the zone."] =
        "아라시 고원으로 돌아가세요: 해머폴은 지역 동쪽에 있습니다.",
    ["Fly from Hammerfall to Kargath, in the west of the Badlands."] =
        "해머폴에서 황야의 땅 서쪽의 카르가스로 날아가세요.",
    ["Back to Stranglethorn for the end of its quests, from Grom'gol and Booty Bay."] =
        "남은 퀘스트를 위해 가시덤불 골짜기로 돌아가세요. 그롬골 주둔지와 무법항에서 진행합니다.",
    ["The Swamp of Sorrows is east of Deadwind Pass: Stonard is your base."] =
        "슬픔의 늪은 죽음의 고개 동쪽에 있습니다: 스토나드가 거점입니다.",
    ["Feralas is west of Thousand Needles: Camp Mojache, in the east of the zone, is your base."] =
        "페랄라스는 버섯구름 봉우리 서쪽에 있습니다: 지역 동쪽의 모자케 야영지가 거점입니다.",
    ["Gadgetzan, in the north of Tanaris, is your base: the road south through Thousand Needles, or the boat from Booty Bay to Ratchet."] =
        "타나리스 북쪽의 가젯잔이 거점입니다: 버섯구름 봉우리를 지나는 남쪽 길로 가거나, 무법항에서 배로 톱니항까지 가세요.",
    ["The Hinterlands are east of Hillsbrad Foothills: the Revantusk troll village is on the east coast."] =
        "동부 내륙지는 힐스브래드 구릉지 동쪽에 있습니다: 트롤 마을인 레반터스크 마을은 동쪽 해안에 있습니다.",
    ["Searing Gorge is south of the Badlands: fly to Kargath, then the road south. The Burning Steppes are south of the gorge."] =
        "이글거리는 협곡은 황야의 땅 남쪽에 있습니다: 카르가스로 날아간 다음 남쪽 길로 가세요. 불타는 평원은 협곡 남쪽에 있습니다.",
    ["Azshara is east of Ashenvale: Valormok, in the southwest of the zone, is your base."] =
        "아즈샤라는 잿빛 골짜기 동쪽에 있습니다: 지역 남서쪽의 발로르모크가 거점입니다.",
    ["Felwood is north of Ashenvale: the Horde post is in the west of the zone."] =
        "악령의 숲은 잿빛 골짜기 북쪽에 있습니다: 호드 주둔지는 지역 서쪽에 있습니다.",
    ["The Western Plaguelands are east of Tirisfal Glades: the Bulwark guards the border, east of Brill."] =
        "서부 역병지대는 티리스팔 숲 동쪽에 있습니다: 브릴 동쪽의 보루가 경계를 지킵니다.",
    -- automatic notes
    ["If the starting item dropped: use it from your bags."] =
        "시작 아이템을 얻었다면: 가방에서 사용하세요.",
    ["Human"] =
        "인간",
    ["Dwarf and Gnome"] =
        "드워프와 노움",
    ["Night Elf"] =
        "나이트 엘프",
    ["Orc and Troll"] =
        "오크와 트롤",
    ["Tauren"] =
        "타우렌",
    ["Undead"] =
        "언데드",
    ["Alliance"] =
        "얼라이언스",
    ["Horde"] =
        "호드",
    ["From here the guide moves between zones by itself: the first step in a zone says how to get there."] =
        "여기서부터 가이드가 알아서 지역을 오갑니다. 각 지역의 첫 단계에서 가는 방법을 알려 줍니다.",
    ["Shortcut: let monsters kill you, release your spirit and come back to life at the spirit healer, then go on."] =
        "지름길: 몬스터에게 죽은 뒤 영혼을 풀어 영혼의 치유사에게서 되살아난 다음 계속 진행하세요.",
    ["Finish the level on nearby monsters before moving on."] =
        "다음으로 넘어가기 전에 주변 몬스터로 레벨을 마저 올리세요.",
    -- Ding - Leveling (Leveling routes): notes, step texts and section titles
    ["Human start"] =
        "인간 시작",
    ["Night Elf start"] =
        "나이트 엘프 시작",
    ["Tauren start"] =
        "타우렌 시작",
    ["Undead start"] =
        "언데드 시작",
    -- Skyborne start (tools/routes/skyborne.lua)
    ["Skyborne start"] =
        "Skyborne 시작",
    ["Everything starts on Zephras Isle: follow the arrow from NPC to NPC."] =
        "모든 것은 Zephras Isle에서 시작됩니다: 화살표를 따라 NPC를 차례로 찾아가세요.",
    -- Ding - Leveling (Leveling routes): notes of the goal and condition steps
    -- Ding - Leveling: how each section begins (tools/routes/leveling/travel.lua)
    ["Elwynn Forest: Northshire Abbey, where every human starts."] =
        "엘윈 숲: 노스샤이어 수도원은 모든 인간이 시작하는 곳입니다.",
    ["Dun Morogh: Coldridge Valley, where dwarves and gnomes start."] =
        "던 모로: 눈마루 골짜기는 드워프와 노움이 시작하는 곳입니다.",
    ["Teldrassil: Shadowglen, where night elves start."] =
        "텔드랏실: 그늘 협곡은 나이트 엘프가 시작하는 곳입니다.",
    ["Travel to Westfall"] =
        "서부 몰락지대로 이동",
    ["Westfall: Sentinel Hill is the hub, in the middle of the zone. The first stop is the farm in the north."] =
        "서부 몰락지대: 감시의 언덕이 지역 중앙의 거점입니다. 첫 목적지는 북쪽의 농장입니다.",
    ["Travel to Auberdine"] =
        "아우버다인으로 이동",
    ["Darkshore: Auberdine, the port on the west coast."] =
        "어둠의 해안: 아우버다인은 서쪽 해안의 항구입니다.",
    ["Travel to Thelsamar"] =
        "텔사마로 이동",
    ["Loch Modan: Thelsamar, on the road in the west of the zone."] =
        "모단 호수: 텔사마는 지역 서쪽의 길가에 있습니다.",
    ["Travel to Redridge Mountains"] =
        "붉은마루 산맥으로 이동",
    ["Redridge Mountains: Lakeshire is the hub, by the lake. The first stop is the western pass from Elwynn Forest."] =
        "붉은마루 산맥: 레이크샤이어가 호숫가의 거점입니다. 첫 목적지는 엘윈 숲에서 이어지는 서쪽 고개입니다.",
    ["Ashenvale: Maestra's Post in the west, then Astranaar in the middle of the zone."] =
        "잿빛 골짜기: 서쪽의 마에스트라 주둔지에 먼저 들른 다음 지역 중앙의 아스트라나르로 가세요.",
    ["Travel to Menethil Harbor"] =
        "메네실 항구로 이동",
    ["Wetlands: Menethil Harbor, on the west coast."] =
        "저습지: 메네실 항구는 서쪽 해안에 있습니다.",
    ["Travel to Darkshire"] =
        "다크샤이어로 이동",
    ["Duskwood: Darkshire, in the east of the zone."] =
        "그늘숲: 다크샤이어는 지역 동쪽에 있습니다.",
    ["Travel to Stonetalon Peak"] =
        "돌발톱 봉우리로 이동",
    ["Stonetalon Mountains: Stonetalon Peak, in the far north of the zone."] =
        "돌발톱 산맥: 돌발톱 봉우리는 지역 최북단에 있습니다.",
    ["Stormwind first, then Duskwood and Stranglethorn Vale."] =
        "스톰윈드에 먼저 들른 다음 그늘숲과 가시덤불 골짜기로 가세요.",
    ["Travel to Southshore"] =
        "사우스쇼어로 이동",
    ["Hillsbrad Foothills: Southshore, on the coast in the south."] =
        "힐스브래드 구릉지: 사우스쇼어는 남쪽 해안에 있습니다.",
    ["Dustwallow Marsh: Theramore Isle, off the east coast."] =
        "먼지진흙 습지대: 테라모어 섬은 동쪽 해안 앞바다에 있습니다.",
    ["Travel to Booty Bay"] =
        "무법항으로 이동",
    ["Stranglethorn Vale: Booty Bay, at the southern tip. The boat from Ratchet lands there."] =
        "가시덤불 골짜기: 무법항은 남쪽 끝에 있습니다. 톱니항에서 오는 배가 여기에 도착합니다.",
    ["Desolace: Nijel's Point, in the north-east corner, is the Alliance hub."] =
        "잊혀진 땅: 나이젤의 야영지가 북동쪽 구석에 있는 얼라이언스 거점입니다.",
    ["Stranglethorn Vale: Booty Bay, at the southern tip."] =
        "가시덤불 골짜기: 무법항은 남쪽 끝에 있습니다.",
    ["Stormwind first, then the Swamp of Sorrows."] =
        "스톰윈드에 먼저 들른 다음 슬픔의 늪으로 가세요.",
    ["Travel to Refuge Pointe"] =
        "임시 주둔지로 이동",
    ["Arathi Highlands: Refuge Pointe, in the middle of the zone."] =
        "아라시 고원: 임시 주둔지는 지역 중앙에 있습니다.",
    ["Stormwind first, then Dustwallow Marsh: Theramore Isle."] =
        "스톰윈드에 먼저 들른 다음 먼지진흙 습지대: 테라모어 섬으로 가세요.",
    ["Travel to Nijel's Point"] =
        "나이젤의 야영지로 이동",
    ["Desolace: Nijel's Point, in the north-east corner."] =
        "잊혀진 땅: 나이젤의 야영지는 북동쪽 구석에 있습니다.",
    ["Ironforge first, then the Badlands."] =
        "아이언포지에 먼저 들른 다음 황야의 땅으로 가세요.",
    ["Travel to Stormwind"] =
        "스톰윈드로 이동",
    ["Stormwind first, then Stranglethorn Vale."] =
        "스톰윈드에 먼저 들른 다음 가시덤불 골짜기로 가세요.",
    ["Duskwood: Darkshire first, then the Swamp of Sorrows."] =
        "그늘숲: 다크샤이어에 먼저 들른 다음 슬픔의 늪으로 가세요.",
    ["Travel to Gadgetzan"] =
        "가젯잔으로 이동",
    ["Tanaris: Gadgetzan, in the north of the zone."] =
        "타나리스: 가젯잔은 지역 북쪽에 있습니다.",
    ["Tanaris: Gadgetzan first, then Feralas: Feathermoon Stronghold."] =
        "타나리스: 가젯잔에 먼저 들른 다음 페랄라스: 페더문 요새로 가세요.",
    ["Travel to Aerie Peak"] =
        "맹금의 봉우리로 이동",
    ["The Hinterlands: Aerie Peak, in the west of the zone."] =
        "동부 내륙지: 맹금의 봉우리는 지역 서쪽에 있습니다.",
    ["Travel to Un'Goro Crater"] =
        "운고로 분화구로 이동",
    ["Un'Goro Crater: Marshal's Refuge is the hub, in the north. The first stop is in the south-east."] =
        "운고로 분화구: 마샬의 야영지가 북쪽의 거점입니다. 첫 목적지는 남동쪽에 있습니다.",
    ["Travel to Thorium Point"] =
        "토륨 조합 거점으로 이동",
    ["Searing Gorge: Thorium Point, in the north-west of the zone."] =
        "이글거리는 협곡: 토륨 조합 거점은 지역 북서쪽에 있습니다.",
    ["Travel to Nethergarde Keep"] =
        "네더가드 요새로 이동",
    ["Blasted Lands: Nethergarde Keep, in the north-east, then the Burning Steppes."] =
        "저주받은 땅: 네더가드 요새는 북동쪽에 있습니다. 그다음 불타는 평원으로 가세요.",
    ["Travel to Chillwind Camp"] =
        "서리바람 야영지로 이동",
    ["Western Plaguelands: Chillwind Camp, in the south of the zone."] =
        "서부 역병지대: 서리바람 야영지는 지역 남쪽에 있습니다.",
    ["Travel to Rut'theran Village"] =
        "루테란 마을로 이동",
    ["Teldrassil: Rut'theran Village first, then Azshara and Felwood."] =
        "텔드랏실: 루테란 마을에 먼저 들른 다음 아즈샤라와 악령의 숲으로 가세요.",
    ["Travel to Feathermoon Stronghold"] =
        "페더문 요새로 이동",
    ["Feralas: Feathermoon Stronghold, on the island off the west coast."] =
        "페랄라스: 페더문 요새는 서쪽 해안 앞바다의 섬에 있습니다.",
    ["Tanaris: Gadgetzan first, then Un'Goro Crater."] =
        "타나리스: 가젯잔에 먼저 들른 다음 운고로 분화구로 가세요.",
    ["Travel to Emerald Sanctuary"] =
        "에메랄드 성소로 이동",
    ["Felwood: Emerald Sanctuary, in the south of the zone."] =
        "악령의 숲: 에메랄드 성소는 지역 남쪽에 있습니다.",
    ["Ironforge first, then the Burning Steppes: Morgan's Vigil, in the east."] =
        "아이언포지에 먼저 들른 다음 불타는 평원: 동쪽의 모건의 터로 가세요.",
    ["Travel to Ironforge"] =
        "아이언포지로 이동",
    ["Ironforge first, then the Plaguelands: Chillwind Camp and Light's Hope Chapel."] =
        "아이언포지에 먼저 들른 다음 역병지대: 서리바람 야영지와 희망의 빛 예배당으로 가세요.",
    ["Winterspring: Everlook, in the middle of the zone."] =
        "여명의 설원: 눈망루 마을은 지역 중앙에 있습니다.",
    ["Travel to Silithus"] =
        "실리더스로 이동",
    ["Silithus: Valor's Rest, in the north-east, then Cenarion Hold."] =
        "실리더스: 용사의 안식처는 북동쪽에 있습니다. 그다음 세나리온 요새로 가세요.",
    ["Tirisfal Glades: Deathknell, where the undead rise."] =
        "티리스팔 숲: 데스넬은 언데드가 깨어나는 곳입니다.",
    ["Mulgore: Camp Narache, where tauren start."] =
        "멀고어: 나라체 야영지는 타우렌이 시작하는 곳입니다.",
    ["Durotar: the Valley of Trials, where orcs and trolls start."] =
        "듀로타: 시험의 골짜기는 오크와 트롤이 시작하는 곳입니다.",
    ["Travel to Silverpine Forest"] =
        "은빛소나무 숲으로 이동",
    ["Silverpine Forest: the Sepulcher is the hub, in the middle. The first stop is on the road in the north."] =
        "은빛소나무 숲: 공동묘지가 중앙의 거점입니다. 첫 목적지는 북쪽 길가에 있습니다.",
    ["Travel to Razor Hill"] =
        "칼바위 언덕으로 이동",
    ["Durotar: Razor Hill first, then the Barrens: the Crossroads, and Stonetalon Mountains."] =
        "듀로타: 칼바위 언덕에 먼저 들른 다음 불모의 땅: 크로스로드, 그리고 돌발톱 산맥으로 가세요.",
    ["Ashenvale: Splintertree Post, in the east of the zone. The way in is the tunnel from Stonetalon."] =
        "잿빛 골짜기: 토막나무 주둔지는 지역 동쪽에 있습니다. 돌발톱 산맥에서 이어지는 터널로 들어갑니다.",
    ["Travel to the Undercity"] =
        "언더시티로 이동",
    ["Undercity first, then Hillsbrad Foothills: Tarren Mill."] =
        "언더시티에 먼저 들른 다음 힐스브래드 구릉지: 타렌 밀농장으로 가세요.",
    ["Thunder Bluff first, then the Barrens."] =
        "썬더 블러프에 먼저 들른 다음 불모의 땅으로 가세요.",
    ["Travel to Sun Rock Retreat"] =
        "해바위 야영지로 이동",
    ["Stonetalon Mountains: Sun Rock Retreat, in the middle of the zone."] =
        "돌발톱 산맥: 해바위 야영지는 지역 중앙에 있습니다.",
    ["Travel to the Crossroads"] =
        "크로스로드로 이동",
    ["The Barrens: the Crossroads first, then Ashenvale: Splintertree Post."] =
        "불모의 땅: 크로스로드에 먼저 들른 다음 잿빛 골짜기: 토막나무 주둔지로 가세요.",
    ["Travel to Camp Taurajo"] =
        "타우라조 야영지로 이동",
    ["The Barrens: Camp Taurajo first, then Thousand Needles: Freewind Post."] =
        "불모의 땅: 타우라조 야영지에 먼저 들른 다음 버섯구름 봉우리: 높새바람 봉우리로 가세요.",
    ["Arathi Highlands: Hammerfall, in the east of the zone."] =
        "아라시 고원: 해머폴은 지역 동쪽에 있습니다.",
    ["Thousand Needles: Freewind Post, on the mesas in the middle of the zone."] =
        "버섯구름 봉우리: 높새바람 봉우리는 지역 중앙의 바위 고원 위에 있습니다.",
    ["Travel to Desolace"] =
        "잊혀진 땅으로 이동",
    ["Desolace: Ghost Walker Post is the hub, in the middle of the zone."] =
        "잊혀진 땅: 침묵의 초소가 지역 중앙의 거점입니다.",
    ["Travel to Grom'gol Base Camp"] =
        "그롬골 주둔지로 이동",
    ["Stranglethorn Vale: Grom'gol Base Camp, on the west coast. The zeppelin from Orgrimmar lands there."] =
        "가시덤불 골짜기: 그롬골 주둔지는 서쪽 해안에 있습니다. 오그리마에서 오는 비행선이 여기에 도착합니다.",
    ["Orgrimmar first, then Dustwallow Marsh: Brackenwall Village."] =
        "오그리마에 먼저 들른 다음 먼지진흙 습지대: 담쟁이 마을로 가세요.",
    ["Travel to Tarren Mill"] =
        "타렌 밀농장으로 이동",
    ["Hillsbrad Foothills: Tarren Mill first, then Alterac Mountains and Arathi Highlands."] =
        "힐스브래드 구릉지: 타렌 밀농장에 먼저 들른 다음 알터랙 산맥과 아라시 고원으로 가세요.",
    ["Travel to the Badlands"] =
        "황야의 땅으로 이동",
    ["Badlands: Kargath, at the western edge, is the Horde hub."] =
        "황야의 땅: 카르가스가 서쪽 끝에 있는 호드 거점입니다.",
    ["Travel to Ratchet"] =
        "톱니항으로 이동",
    ["The Barrens: Ratchet first, then Stranglethorn Vale and the Swamp of Sorrows: Stonard."] =
        "불모의 땅: 톱니항에 먼저 들른 다음 가시덤불 골짜기와 슬픔의 늪: 스토나드로 가세요.",
    ["Travel to Shadowprey Village"] =
        "그늘수렵 마을로 이동",
    ["Desolace: Shadowprey Village, on the west coast."] =
        "잊혀진 땅: 그늘수렵 마을은 서쪽 해안에 있습니다.",
    ["Travel to Brackenwall Village"] =
        "담쟁이 마을로 이동",
    ["Dustwallow Marsh: Brackenwall Village, in the north-west of the zone."] =
        "먼지진흙 습지대: 담쟁이 마을은 지역 북서쪽에 있습니다.",
    ["Travel to Camp Mojache"] =
        "모자케 야영지로 이동",
    ["Feralas: Camp Mojache, in the east of the zone."] =
        "페랄라스: 모자케 야영지는 지역 동쪽에 있습니다.",
    ["Stranglethorn Vale: Grom'gol Base Camp, on the west coast."] =
        "가시덤불 골짜기: 그롬골 주둔지는 서쪽 해안에 있습니다.",
    ["Travel to the Swamp of Sorrows"] =
        "슬픔의 늪으로 이동",
    ["Swamp of Sorrows: Stonard is the hub, in the middle of the zone."] =
        "슬픔의 늪: 스토나드가 지역 중앙의 거점입니다.",
    ["Travel to the Shimmering Flats"] =
        "소금 평원으로 이동",
    ["Thousand Needles: the Shimmering Flats first, then Tanaris and Dustwallow Marsh."] =
        "버섯구름 봉우리: 소금 평원에 먼저 들른 다음 타나리스와 먼지진흙 습지대로 가세요.",
    ["Undercity first, then the Hinterlands: Revantusk Village."] =
        "언더시티에 먼저 들른 다음 동부 내륙지: 레반터스크 마을로 가세요.",
    ["Feralas: Camp Mojache first, then Un'Goro Crater."] =
        "페랄라스: 모자케 야영지에 먼저 들른 다음 운고로 분화구로 가세요.",
    ["Stranglethorn Vale: Booty Bay first, then the Swamp of Sorrows."] =
        "가시덤불 골짜기: 무법항에 먼저 들른 다음 슬픔의 늪으로 가세요.",
    ["Travel to the Blasted Lands"] =
        "저주받은 땅으로 이동",
    ["Blasted Lands: the first stop is at the northern entrance, by the Swamp of Sorrows."] =
        "저주받은 땅: 첫 목적지는 슬픔의 늪과 맞닿은 북쪽 입구에 있습니다.",
    ["Travel to Kargath"] =
        "카르가스로 이동",
    ["Badlands: Kargath first, at the western edge, then the Searing Gorge."] =
        "황야의 땅: 서쪽 끝의 카르가스에 먼저 들른 다음 이글거리는 협곡으로 가세요.",
    ["Burning Steppes: Flame Crest, in the east. The way in is through Blackrock Mountain."] =
        "불타는 평원: 화염 마루는 동쪽에 있습니다. 검은바위 산을 통과해 들어갑니다.",
    ["Travel to Valormok"] =
        "발로르모크로 이동",
    ["Azshara: Valormok, in the west of the zone."] =
        "아즈샤라: 발로르모크는 지역 서쪽에 있습니다.",
    ["Travel to Bloodvenom Post"] =
        "피멍울 초소로 이동",
    ["Felwood: Bloodvenom Post, in the west of the zone."] =
        "악령의 숲: 피멍울 초소는 지역 서쪽에 있습니다.",
    ["Undercity first, then the Plaguelands."] =
        "언더시티에 먼저 들른 다음 역병지대로 가세요.",
    -- Ding - Leveling: notes, labels and titles of the Leveling routes, in our wording
    ["This frees room in your bags."] =
        "가방 공간을 확보할 수 있습니다.",
    ["You receive one further along the route."] =
        "경로를 더 진행하면 하나를 받습니다.",
    ["Pick up anything that sells for 10 copper or more."] =
        "판매가가 10코퍼 이상인 것은 모두 주우세요.",
    ["You'll level faster with this."] =
        "이렇게 하면 레벨업이 더 빨라집니다.",
    ["The NPC is outdoors, right beside the structure."] =
        "NPC는 건물 바로 옆 바깥에 있습니다.",
    ["Skip the foes and dash into the tent."] =
        "적을 무시하고 천막 안으로 달려 들어가세요.",
    ["Foes cannot strike you from there."] =
        "그곳에서는 적이 당신을 공격할 수 없습니다.",
    ["Widen the camera view."] =
        "카메라 시야를 넓히세요.",
    ["Recall to your bind point in Northshire Valley"] =
        "귀환석으로 북부 신병 훈련소의 귀환 장소로 돌아가세요",
    ["The NPC is indoors."] =
        "NPC는 건물 안에 있습니다.",
    ["The NPC is indoors at street level."] =
        "NPC는 건물 안 1층에 있습니다.",
    ["The quest giver stands outdoors, not indoors."] =
        "퀘스트 제공자는 건물 안이 아니라 바깥에 서 있습니다.",
    ["With the coming hand-ins, this brings you to level 4."] =
        "이어지는 퀘스트 완료와 함께 4레벨이 됩니다.",
    ["The NPC is indoors, on the central storey."] =
        "NPC는 건물 안 가운데 층에 있습니다.",
    ["The objective is underground, in the mine shaft."] =
        "목표는 지하 갱도 안에 있습니다.",
    ["The targets roam the mine and the area around it."] =
        "대상은 광산과 그 주변을 돌아다닙니다.",
    ["Exit the mine shaft"] =
        "갱도를 나가세요",
    ["The quest giver stands outdoors at the back of the building."] =
        "퀘스트 제공자는 건물 뒤편 바깥에 서 있습니다.",
    ["The NPC is out back, at the rear of the structure."] =
        "NPC는 건물 뒤쪽 바깥에 있습니다.",
    ["The NPC stands by the horse stalls."] =
        "NPC는 마구간 옆에 서 있습니다.",
    ["Look for wooden pails."] =
        "나무 양동이를 찾으세요.",
    ["Leave it out if other players crowd the area."] =
        "다른 플레이어가 많이 몰려 있으면 건너뛰세요.",
    ["With the coming hand-ins, this gets you to level 6."] =
        "이어지는 퀘스트 완료와 함께 6레벨이 됩니다.",
    ["Climb to the highest floor of the building."] =
        "건물 꼭대기 층으로 올라가세요.",
    ["The NPC waits on the lower level, indoors."] =
        "NPC는 건물 안 아래층에서 기다립니다.",
    ["The NPC is indoors, one floor up."] =
        "NPC는 건물 안 한 층 위에 있습니다.",
    ["Heal Guard Roberts using Lesser Heal (Rank 2)."] =
        "하급 치유 (2 레벨)로 경비병 로버트를 치유하세요.",
    ["Buff Guard Roberts with Power Word: Fortitude."] =
        "경비병 로버트에게 신의 권능: 인내를 걸어 주세요.",
    ["Do it only if you can."] =
        "가능할 때만 하세요.",
    ["Go into the mine"] =
        "광산에 들어가세요",
    ["Stay on the trail through the mine"] =
        "광산을 지나는 길을 계속 따라가세요",
    ["This one roams, so scan the surrounding area."] =
        "이 대상은 돌아다니므로 주변을 살펴보세요.",
    ["Together with the next turn-ins, this brings you to level 8."] =
        "다음 퀘스트 완료와 함께 8레벨이 됩니다.",
    ["Die on purpose at this spot"] =
        "이 지점에서 일부러 죽으세요",
    ["Die to the monsters here on purpose."] =
        "여기 있는 몬스터에게 일부러 죽으세요.",
    ["Dying costs you nothing this early."] =
        "이 시점에는 죽어도 잃는 것이 없습니다.",
    ["This is the quickest way over."] =
        "건너가는 가장 빠른 방법입니다.",
    ["Get yourself killed, then resurrect with the spirit healer"] =
        "죽은 다음 영혼의 치유사에게서 부활하세요",
    ["Look for little stacks of brown wood."] =
        "작은 갈색 나무 더미를 찾으세요.",
    ["Look around tree trunks at ground level."] =
        "땅 높이의 나무줄기 주변을 살펴보세요.",
    ["The targets are wolves."] =
        "대상은 늑대입니다.",
    ["The following step may be hard."] =
        "다음 단계는 어려울 수 있습니다.",
    ["One extra level makes it easier."] =
        "레벨이 하나 더 높으면 더 쉬워집니다.",
    ["With the coming turn-ins, this gets you to level 10."] =
        "이어지는 퀘스트 완료와 함께 10레벨이 됩니다.",
    ["The NPC waits outside, at the building's front."] =
        "NPC는 건물 앞 바깥에서 기다립니다.",
    ["Fly to Lakeshire"] =
        "레이크샤이어로 날아가세요",
    ["Stay on the road and watch for danger."] =
        "길을 벗어나지 말고 위험에 주의하세요.",
    ["Foes in this area outlevel you."] =
        "이 지역의 적은 당신보다 레벨이 높습니다.",
    ["Let the conversation play out."] =
        "대화가 끝날 때까지 기다리세요.",
    ["Your targets here are gnolls."] =
        "여기서 대상은 놀입니다.",
    ["Fly to Sentinel Hill"] =
        "감시의 언덕으로 날아가세요",
    ["Fly to Stormwind City"] =
        "스톰윈드로 날아가세요",
    ["Head indoors"] =
        "건물 안으로 들어가세요",
    ["Step onto the pink rune."] =
        "분홍색 룬 위에 올라서세요.",
    ["Look within the tomb."] =
        "무덤 안을 살펴보세요.",
    ["The NPC stands one level over the crypt."] =
        "NPC는 납골당 한 층 위에 서 있습니다.",
    ["Be ready for a fight right away."] =
        "바로 전투가 시작되니 대비하세요.",
    ["The NPC waits indoors, a floor above the entrance."] =
        "NPC는 건물 안, 입구보다 한 층 위에서 기다립니다.",
    ["Head down into the Deeprun Tram station"] =
        "깊은굴 지하철 역으로 내려가세요",
    ["Pass through the portal to teleport."] =
        "차원문을 통과해 순간이동하세요.",
    ["Take the Deeprun Tram over to Ironforge."] =
        "깊은굴 지하철을 타고 아이언포지로 가세요.",
    ["The NPC stands by the wall on the central platform."] =
        "NPC는 가운데 승강장의 벽 옆에 서 있습니다.",
    ["Target the Deeprun Rats with the item."] =
        "깊은굴쥐에게 아이템을 사용하세요.",
    ["Look for little gray rodents."] =
        "작은 회색 쥐를 찾으세요.",
    ["Head to the Deeprun Tram's Ironforge platform."] =
        "깊은굴 지하철의 아이언포지 쪽 승강장으로 가세요.",
    ["Fly to Ironforge"] =
        "아이언포지로 날아가세요",
    ["Stay on the trail"] =
        "길을 계속 따라가세요",
    ["Steer clear of the elite yeti patrolling close by."] =
        "근처를 순찰하는 정예 설인을 피하세요.",
    ["The NPC is up on the summit."] =
        "NPC는 정상에 있습니다.",
    ["Let the elite yeti stroll off before you go near."] =
        "다가가기 전에 정예 설인이 멀어질 때까지 기다리세요.",
    ["Your objective lies in a little cavern."] =
        "목표는 작은 동굴 안에 있습니다.",
    ["Go quickly, time is short."] =
        "시간이 부족하니 서두르세요.",
    ["Go into the cavern"] =
        "동굴에 들어가세요",
    ["Head to the lower level of the cavern."] =
        "동굴 아래층으로 가세요.",
    ["Targets are in the cavern and around its entrance too."] =
        "대상은 동굴 안과 입구 주변에도 있습니다.",
    ["Head out of the cave"] =
        "동굴을 나가세요",
    ["Climb the trail"] =
        "길을 따라 올라가세요",
    ["Once in the Wetlands, head north."] =
        "저습지에 들어서면 북쪽으로 가세요.",
    ["Leap down from the ledge."] =
        "바위턱에서 뛰어내리세요.",
    ["This makes Menethil Harbor quicker to get to."] =
        "메네실 항구로 더 빨리 갈 수 있습니다.",
    ["Keep climbing the trail"] =
        "길을 따라 계속 올라가세요",
    ["Take the trail downhill"] =
        "길을 따라 내려가세요",
    ["Fly to Menethil Harbor"] =
        "메네실 항구로 날아가세요",
    ["Your targets are within the cavern."] =
        "대상은 동굴 안에 있습니다.",
    ["Without this, one quest can't be picked up."] =
        "이것이 없으면 퀘스트 하나를 받을 수 없습니다.",
    ["The NPC is past the tunnel; stay on the road."] =
        "NPC는 터널 너머에 있습니다. 길을 따라가세요.",
    ["The target is a pale bear."] =
        "대상은 옅은 색의 곰입니다.",
    ["Cross the tunnel to reach the NPC."] =
        "터널을 지나 NPC에게 가세요.",
    ["Fly to Thelsamar"] =
        "텔사마로 날아가세요",
    ["The NPC patrols a long route; look along it."] =
        "NPC는 긴 경로를 순찰합니다. 경로를 따라 찾아보세요.",
    ["The targets are rat-like humanoids."] =
        "대상은 쥐처럼 생긴 인간형입니다.",
    ["Hunt spiders for it."] =
        "거미를 사냥해서 얻으세요.",
    ["Take the road to where the trail starts"] =
        "큰길을 따라 오솔길이 시작되는 곳까지 가세요",
    ["A class quest coming up requires this."] =
        "곧 할 직업 퀘스트에 필요합니다.",
    ["Exit Stonesplinter Valley, then stay on the road"] =
        "가루바위 골짜기를 나간 다음 길을 따라가세요",
    ["The NPC waits on the tower's highest floor."] =
        "NPC는 탑 꼭대기 층에서 기다립니다.",
    ["Head up the incline"] =
        "비탈을 올라가세요",
    ["Dwarf and Gnome start"] =
        "드워프와 노움 시작",
    ["Step back outside"] =
        "다시 밖으로 나가세요",
    ["They are rare and scattered widely."] =
        "드물고 넓게 흩어져 있습니다.",
    ["Pass through the tunnel, then stay on the road"] =
        "터널을 지나간 다음 길을 따라가세요",
    ["Heal Mountaineer Dolf with Lesser Heal (Rank 2)."] =
        "하급 치유 (2 레벨)로 산악경비대 돌프를 치유하세요.",
    ["Buff Mountaineer Dolf with Power Word: Fortitude."] =
        "산악경비대 돌프에게 신의 권능: 인내를 걸어 주세요.",
    ["The quest wants yetis; seek them out."] =
        "이 퀘스트의 대상은 설인입니다. 찾아다니세요.",
    ["Look for the timber baskets."] =
        "나무 바구니를 찾으세요.",
    ["Any spot around Brewnall Village works."] =
        "Brewnall Village 주변이라면 어디든 됩니다.",
    ["Give it a few seconds."] =
        "몇 초 기다리세요.",
    ["Target one Large Crag Boar with it."] =
        "큰 멧돼지 하나에게 사용하세요.",
    ["Use it on any Snow Leopard."] =
        "아무 눈표범에게나 사용하세요.",
    ["Target any Ice Claw Bear with the item."] =
        "아무 얼음발톱흰곰에게나 아이템을 사용하세요.",
    ["Keep it as pet food for later."] =
        "나중에 소환수 먹이로 쓰도록 보관하세요.",
    ["Find one Ice Claw Bear and use Tame Beast on it."] =
        "얼음발톱흰곰을 하나 찾아 야수 길들이기를 사용하세요.",
    ["Push eastward if you still need more."] =
        "더 필요하면 동쪽으로 더 가세요.",
    ["Hold on to it: a Paladin task coming up uses it."] =
        "보관하세요: 곧 할 성기사 퀘스트에 쓰입니다.",
    ["Keep to the road as it crosses the underground passages."] =
        "지하 통로를 지나는 동안 길을 벗어나지 마세요.",
    ["The NPC can be indoors or out."] =
        "NPC는 건물 안이나 밖에 있을 수 있습니다.",
    ["Take the Deeprun Tram over to Stormwind City."] =
        "깊은굴 지하철을 타고 스톰윈드로 가세요.",
    ["Flight master in Stormwind"] =
        "스톰윈드 비행 조련사",
    ["The NPC roams a wide loop; look along it."] =
        "NPC는 넓은 경로를 돌아다닙니다. 경로를 따라 찾아보세요.",
    ["You likely gathered 10 Linen Cloth already."] =
        "아마 리넨 옷감 10개를 이미 모았을 것입니다.",
    ["Narm Faulk lies dead; use the item on his body."] =
        "나름 폴크는 죽어 있습니다. 그의 시체에 아이템을 사용하세요.",
    ["Wait for the talking to finish"] =
        "대화가 끝날 때까지 기다리세요",
    ["Climb the big ramp"] =
        "큰 경사로를 올라가세요",
    ["The NPC stands high in the great tree."] =
        "NPC는 거대한 나무 높은 곳에 서 있습니다.",
    ["The NPC stands in an adjoining chamber."] =
        "NPC는 옆방에 서 있습니다.",
    ["The targets are imps."] =
        "대상은 임프입니다.",
    ["Look for groups of pink fungi."] =
        "분홍색 버섯 무리를 찾으세요.",
    ["Mostly found beside tree trunks."] =
        "대개 나무줄기 옆에 있습니다.",
    ["Look for big orange blossoms."] =
        "큰 주황색 꽃을 찾으세요.",
    ["Climb to the cave's upper level."] =
        "동굴 위층으로 올라가세요.",
    ["The NPC stands at the summit of the great tree."] =
        "NPC는 거대한 나무 꼭대기에 서 있습니다.",
    ["Heal Sentinel Shaya with Lesser Heal (Rank 2)."] =
        "하급 치유 (2 레벨)로 파수꾼 샤야를 치유하세요.",
    ["Buff Sentinel Shaya with Power Word: Fortitude."] =
        "파수꾼 샤야에게 신의 권능: 인내를 걸어 주세요.",
    ["Pick up 5 Earthroot while questing."] =
        "퀘스트를 하면서 뱀뿌리 5개를 모으세요.",
    ["A class quest further on requires this."] =
        "나중에 할 직업 퀘스트에 필요합니다.",
    ["Look for brown clumps of roots."] =
        "갈색 뿌리 덩어리를 찾으세요.",
    ["Kill black-furred tigers."] =
        "검은 털의 호랑이를 처치하세요.",
    ["The targets are spiders with green bodies."] =
        "대상은 몸이 초록색인 거미입니다.",
    ["Look for little brown pinecones giving off green smoke."] =
        "초록색 연기를 내뿜는 작은 갈색 솔방울을 찾으세요.",
    ["The target is a satyr."] =
        "대상은 사티로스입니다.",
    ["The targets are spread over several spots."] =
        "대상은 여러 곳에 흩어져 있습니다.",
    ["With the coming hand-ins, this gets you to level 9."] =
        "이어지는 퀘스트 완료와 함께 9레벨이 됩니다.",
    ["At this spot or a bit to the east."] =
        "이 지점이나 조금 동쪽에 있습니다.",
    ["The NPC patrols the road; look along it."] =
        "NPC는 길을 순찰합니다. 길을 따라 찾아보세요.",
    ["For this quest you guard an NPC on the move."] =
        "이 퀘스트에서는 이동하는 NPC를 보호합니다.",
    ["If she is absent, wait for her to reappear."] =
        "그녀가 없다면 다시 나타날 때까지 기다리세요.",
    ["Move fast: the clock is ticking on this one."] =
        "서두르세요: 이 퀘스트는 시간 제한이 있습니다.",
    ["Kill harpies."] =
        "하피를 처치하세요.",
    ["Step into the cavern within the trunk"] =
        "나무줄기 속 동굴에 들어가세요",
    ["The spot is on the lower floor of the hollow tree."] =
        "그 지점은 속이 빈 나무의 아래층에 있습니다.",
    ["Don't forget to train Pick Pocket."] =
        "소매치기를 배우는 것을 잊지 마세요.",
    ["Keep it; an upcoming task asks for it."] =
        "보관하세요. 곧 할 퀘스트에 필요합니다.",
    ["Fly to Moonglade"] =
        "달의 숲으로 날아가세요",
    ["Target a Webwood Lurker with it."] =
        "나무그물 늑대거미에게 사용하세요.",
    ["Aim the item at any Nightsaber Stalker."] =
        "아무 긴발톱 흑호에게나 아이템을 사용하세요.",
    ["The beasts are leopards with blue fur."] =
        "야수는 푸른 털의 표범입니다.",
    ["Aim the item at one Strigid Screecher."] =
        "비명소리 스트리기드 올빼미 하나에게 아이템을 사용하세요.",
    ["Target the owls here."] =
        "여기 있는 올빼미를 대상으로 하세요.",
    ["You need to stand close to this spot."] =
        "이 지점 가까이에 서 있어야 합니다.",
    ["Go into the hollow tree's cavern"] =
        "속이 빈 나무의 동굴에 들어가세요",
    ["The target is a big gray spider."] =
        "대상은 큰 회색 거미입니다.",
    ["Target Sethir the Ancient and use Pickpocket."] =
        "고대정령 세시르를 대상으로 지정하고 소매치기를 사용하세요.",
    ["The target is a violet satyr."] =
        "대상은 보라색 사티로스입니다.",
    ["The NPC waits here, then strolls out onto the big branch close by."] =
        "NPC는 여기서 기다리다가 근처의 큰 나뭇가지 위로 걸어 나갑니다.",
    ["Fight the elementals of the swamp."] =
        "늪의 정령과 싸우세요.",
    ["Use Herbalism's Track Herbs to spot them."] =
        "약초채집의 약초 찾기를 사용해 찾으세요.",
    ["Pick these up while questing around Teldrassil."] =
        "텔드랏실에서 퀘스트를 하면서 모으세요.",
    ["Get your Herbalism skill to 15."] =
        "약초채집 숙련도를 15까지 올리세요.",
    ["Together with the next turn-ins, this brings you to level 11."] =
        "다음 퀘스트 완료와 함께 11레벨이 됩니다.",
    ["Circle the mountain, then climb the trail"] =
        "산을 돌아간 다음 길을 따라 올라가세요",
    ["The NPC stands on the highest level of this structure."] =
        "NPC는 이 건물의 꼭대기 층에 서 있습니다.",
    ["Flight master in Auberdine"] =
        "아우버다인 비행 조련사",
    ["Your pet will need this food shortly."] =
        "곧 소환수에게 이 먹이가 필요합니다.",
    ["Hunt the crabs."] =
        "게를 사냥하세요.",
    ["You'll find extra ones swimming nearby as well."] =
        "근처에서 헤엄치는 것들도 더 있습니다.",
    ["Use the item on any Rabid Thistle Bear."] =
        "아무 광포한 엉겅퀴곰에게나 아이템을 사용하세요.",
    ["The targets are bears with grey fur."] =
        "대상은 회색 털의 곰입니다.",
    ["Keep from damaging the creature."] =
        "그 동물에게 피해를 주지 마세요.",
    ["Your targets sit below the water's surface."] =
        "대상은 수면 아래에 있습니다.",
    ["Avoid slaying the satyrs if you can."] =
        "가능하면 사티로스를 죽이지 마세요.",
    ["You'll need this for the following quest."] =
        "다음 퀘스트에 필요합니다.",
    ["Hunt down satyrs."] =
        "사티로스를 사냥하세요.",
    ["Big birds that roam on foot."] =
        "걸어 다니는 큰 새입니다.",
    ["Make your way to the Gates of Ironforge"] =
        "아이언포지 관문으로 가세요",
    ["Swim to precisely this point, then from the game menu pick Support and ask to be unstuck."] =
        "정확히 이 지점까지 헤엄친 다음, 게임 메뉴에서 고객지원을 선택해 캐릭터 갇힘 해제를 요청하세요.",
    ["Stay outdoors by this building."] =
        "이 건물 옆 바깥에 머무르세요.",
    ["Pull the camera back for a wider view."] =
        "카메라를 멀리 빼서 시야를 넓히세요.",
    ["Turn the view so Furlbrow's Wardrobe is visible."] =
        "펄브로우의 옷장이 보이도록 시점을 돌리세요.",
    ["Look for beige sacks."] =
        "베이지색 자루를 찾으세요.",
    ["Look beside objects and structures."] =
        "물건과 건물 옆을 살펴보세요.",
    ["Hunt the vultures."] =
        "독수리를 사냥하세요.",
    ["Many of them gather in this area."] =
        "이 구역에 많이 모여 있습니다.",
    ["The rest lie dotted across the zone."] =
        "나머지는 지역 곳곳에 흩어져 있습니다.",
    ["Kill boars for these."] =
        "멧돼지를 처치해서 얻으세요.",
    ["With the coming turn-ins, this gets you to level 15."] =
        "이어지는 퀘스트 완료와 함께 15레벨이 됩니다.",
    ["Flight master at Rut'theran Village"] =
        "루테란 마을 비행 조련사",
    ["Leave your pet with the stable master."] =
        "야수 관리인에게 소환수를 맡기세요.",
    ["You will tame a short-term pet shortly."] =
        "곧 임시 소환수를 길들입니다.",
    ["Here your pet picks up Claw (Rank 2)."] =
        "여기서 소환수가 할퀴기 (2 레벨)를 배웁니다.",
    ["You will let it go shortly."] =
        "곧 풀어 줄 것입니다.",
    ["Send your pet against a Thistle Bear."] =
        "소환수가 엉겅퀴곰을 공격하게 하세요.",
    ["Get your companion back from the stable master."] =
        "야수 관리인에게서 소환수를 찾아오세요.",
    ["Release the short-term pet you tamed."] =
        "길들인 임시 소환수를 풀어 주세요.",
    ["The NPC stands on the pier."] =
        "NPC는 부두 위에 서 있습니다.",
    ["The targets are sea creatures with long necks."] =
        "대상은 목이 긴 바다 생물입니다.",
    ["Head to the hilltop."] =
        "언덕 꼭대기로 가세요.",
    ["Wade in to use it."] =
        "물에 들어가서 사용하세요.",
    ["The spot is at the foot of the falls."] =
        "그 지점은 폭포 아래에 있습니다.",
    ["Look for an urn of woven wicker."] =
        "고리버들로 엮은 항아리를 찾으세요.",
    ["The target is a non-hostile ghost of a night elf woman."] =
        "대상은 적대적이지 않은 나이트 엘프 여성의 유령입니다.",
    ["Look for a figure in yellow and green garb."] =
        "노란색과 초록색 옷을 입은 인물을 찾으세요.",
    ["Go to the lowest deck of the wreck."] =
        "난파선의 가장 아래 갑판으로 가세요.",
    ["Swim in by way of a porthole."] =
        "현창을 통해 헤엄쳐 들어가세요.",
    ["Search stacks of brown crates."] =
        "갈색 상자 더미를 뒤져 보세요.",
    ["The NPC stands atop the dam."] =
        "NPC는 댐 위에 서 있습니다.",
    ["The object rests by the barrier."] =
        "그 물체는 방벽 옆에 있습니다.",
    ["Together with the next turn-ins, this brings you to level 19."] =
        "다음 퀘스트 완료와 함께 19레벨이 됩니다.",
    ["This skips some tedious quests with a timer."] =
        "시간 제한이 있는 지루한 퀘스트 몇 개를 건너뜁니다.",
    ["The upcoming quest may prove hard."] =
        "다음 퀘스트는 어려울 수 있습니다.",
    ["The targets are troggs."] =
        "대상은 트로그입니다.",
    ["Redridge and Westfall"] =
        "붉은마루 산맥과 서부 몰락지대",
    ["Look for a big mound of brown earth."] =
        "큰 갈색 흙더미를 찾으세요.",
    ["The target patrols a long route by the road."] =
        "대상은 길가의 긴 경로를 순찰합니다.",
    ["The target's route also goes far into Jangolode Mine and Gold Coast Quarry."] =
        "대상의 경로는 잔골로드 광산과 황금해안 채석장 깊숙이까지 이어집니다.",
    ["It takes roughly 5 minutes to reappear."] =
        "다시 나타나기까지 약 5분이 걸립니다.",
    ["The target is a murloc, grey and bigger than the others."] =
        "대상은 다른 것보다 크고 회색인 멀록입니다.",
    ["It roams the shoreline."] =
        "해안선을 따라 돌아다닙니다.",
    ["If the NPC is absent, stay until he reappears."] =
        "NPC가 없다면 다시 나타날 때까지 기다리세요.",
    ["Escort The Defias Traitor and keep him alive."] =
        "데피아즈단 변절자를 호위하며 살려 두세요.",
    ["The NPC is on an upper floor of the tower."] =
        "NPC는 탑 위층에 있습니다.",
    ["Hunt the red-feathered birds."] =
        "붉은 깃털의 새를 사냥하세요.",
    ["The targets are little winged dragons."] =
        "대상은 날개 달린 작은 용입니다.",
    ["Skip Redridge Alphas; they don't carry them."] =
        "붉은마루일족 부대장은 건너뛰세요. 이것을 가지고 있지 않습니다.",
    ["Raise Lockpicking to 95"] =
        "자물쇠 따기를 95까지 올리세요",
    ["Look for little gray coffers of metal."] =
        "작은 회색 금속 함을 찾으세요.",
    ["Go inside and stay on the trail"] =
        "안으로 들어가 길을 계속 따라가세요",
    ["Your target is a ghoul."] =
        "대상은 구울입니다.",
    ["Fight undead foes."] =
        "언데드 적과 싸우세요.",
    ["The target is the dungeon's second boss."] =
        "대상은 던전의 두 번째 우두머리입니다.",
    ["The target is the dungeon's last boss."] =
        "대상은 던전의 마지막 우두머리입니다.",
    ["The objective is aboard the vessel."] =
        "목표는 배 위에 있습니다.",
    ["You'll find them all over the instance."] =
        "인스턴스 곳곳에 있습니다.",
    ["The NPC is indoors"] =
        "NPC는 건물 안에 있습니다",
    ["Fight the murlocs."] =
        "멀록과 싸우세요.",
    ["The spot is at the cave's mouth."] =
        "그 지점은 동굴 입구에 있습니다.",
    ["Look for the brown fungi."] =
        "갈색 버섯을 찾으세요.",
    ["Extra ones are below, in the side chambers."] =
        "아래쪽 곁방에 더 있습니다.",
    ["Gather the blue-capped fungi."] =
        "갓이 파란 버섯을 모으세요.",
    ["Expect a possible ambush while you gather it."] =
        "채집하는 동안 매복이 있을 수 있으니 대비하세요.",
    ["It shows up a short way off."] =
        "조금 떨어진 곳에 나타납니다.",
    ["It shows up at your feet."] =
        "발밑에 나타납니다.",
    ["Murloc packs arrive at the waterside."] =
        "멀록 무리가 물가로 몰려옵니다.",
    ["The attackers rush the camp."] =
        "공격자들이 야영지로 돌진합니다.",
    ["Engage foes one at a time."] =
        "적을 하나씩 상대하세요.",
    ["Watch out, the landscape conceals some monsters."] =
        "조심하세요, 지형에 가려진 몬스터가 있습니다.",
    ["Avoid drawing several foes together."] =
        "여러 적을 한꺼번에 끌지 마세요.",
    ["Stay with Prospector Remtravel and defend him."] =
        "발굴조사단장 렘트레블 곁에 머물며 그를 보호하세요.",
    ["He is frail and goes down fast."] =
        "약해서 금방 쓰러집니다.",
    ["Look on top of the table."] =
        "탁자 위를 살펴보세요.",
    ["Escort Therylune and defend her."] =
        "테리루네를 호위하며 보호하세요.",
    ["Escort Volcor and defend him."] =
        "볼코르를 호위하며 보호하세요.",
    ["Allow the foes to hit him before you join in."] =
        "적이 그를 먼저 공격하게 둔 뒤에 전투에 끼어드세요.",
    ["If it is not around, move on without it."] =
        "없다면 그냥 넘어가세요.",
    ["It reappears only after a long wait."] =
        "오래 기다려야 다시 나타납니다.",
    ["Keep Kerlonian Evershade safe while he trails behind you."] =
        "뒤따라오는 케를로니안 에버섀이드를 보호하세요.",
    ["Keep near him; he dozes off."] =
        "그의 곁에 있으세요. 그는 잠이 듭니다.",
    ["The NPC is on the house's raised terrace."] =
        "NPC는 집의 높은 테라스 위에 있습니다.",
    ["Ashenvale and Stonetalon"] =
        "잿빛 골짜기와 돌발톱 산맥",
    ["The item drops rarely."] =
        "이 아이템은 드물게 나옵니다.",
    ["Look for little gray sheaves of straw."] =
        "작은 회색 짚단을 찾으세요.",
    ["Lower the Ground Clutter option to 1."] =
        "Ground Clutter 옵션을 1로 낮추세요.",
    ["Find it in the game options, under System, then Graphics."] =
        "게임 설정의 시스템 아래 그래픽에서 찾을 수 있습니다.",
    ["Fly to Astranaar"] =
        "아스트라나르로 날아가세요",
    ["Keep to the road the whole way."] =
        "가는 내내 길을 벗어나지 마세요.",
    ["Pick up Claw (Rank 3) for your pet."] =
        "소환수에게 할퀴기 (3 레벨)를 배우게 하세요.",
    ["Tame an Ashenvale Bear with Tame Beast."] =
        "야수 길들이기로 잿빛골짜기곰을 길들이세요.",
    ["Track down a chestnut-furred bear."] =
        "밤색 털의 곰을 찾으세요.",
    ["Keep to the road until you reach the Barrens"] =
        "불모의 땅에 도착할 때까지 길을 따라가세요",
    ["Keep your distance from the Crossroads."] =
        "크로스로드에서 멀리 떨어져 있으세요.",
    ["Flight master in Ratchet"] =
        "톱니항 비행 조련사",
    ["Look for white spheres."] =
        "흰색 구체를 찾으세요.",
    ["The target is a gray furbolg."] =
        "대상은 회색 펄볼그입니다.",
    ["Shrubs that glitter white."] =
        "하얗게 반짝이는 덤불입니다.",
    ["Exit Ruins of Stardust"] =
        "별가루의 폐허를 나가세요",
    ["Go into Fire Scar Shrine and climb the trail"] =
        "Fire Scar Shrine에 들어가 길을 따라 올라가세요",
    ["The target summons protectors with Ilkrud's Guardians."] =
        "대상은 Ilkrud's Guardians 주문으로 수호병을 소환합니다.",
    ["Cut off the target's spells when you can."] =
        "가능하면 대상의 주문을 끊으세요.",
    ["Exit Fire Scar Shrine"] =
        "Fire Scar Shrine을 나가세요",
    ["Circle the mountain on foot."] =
        "걸어서 산을 돌아가세요.",
    ["A yellowish naga; her fins look pinkish."] =
        "노르스름한 나가입니다. 지느러미는 분홍빛입니다.",
    ["The target is rare and seldom up."] =
        "대상은 희귀해서 잘 나타나지 않습니다.",
    ["The target is a naga with jade skin and rose-colored fins."] =
        "대상은 비취색 피부와 장밋빛 지느러미의 나가입니다.",
    ["It circles the island clockwise, close to the shore."] =
        "해안 가까이에서 섬을 시계 방향으로 돕니다.",
    ["She travels with a pair of guards."] =
        "경비병 두 명과 함께 다닙니다.",
    ["Hunt naga."] =
        "나가를 사냥하세요.",
    ["Take the passage into Stonetalon Mountains"] =
        "통로를 지나 돌발톱 산맥으로 들어가세요",
    ["Look for it high on the clifftop."] =
        "높은 절벽 꼭대기에서 찾으세요.",
    ["The targets are wyverns."] =
        "대상은 와이번입니다.",
    ["Fly to Stonetalon Peak"] =
        "돌발톱 봉우리로 날아가세요",
    ["Watch out and keep away from Tideress."] =
        "조심해서 타이더레스를 피하세요.",
    ["Your prey is a green-hued creature of living water, level 27."] =
        "대상은 살아 있는 물로 된 초록빛 존재로, 27레벨입니다.",
    ["This is in the Pool of Ask'ar part of the dungeon."] =
        "던전의 The Pool of Ask'ar 구역에 있습니다.",
    ["Look on Ghamoo-ra's north side."] =
        "가무라의 북쪽을 살펴보세요.",
    ["Dive down into the submerged cave."] =
        "물에 잠긴 동굴로 잠수해 들어가세요.",
    ["Find the NPC to the southwest of Ghamoo-ra."] =
        "가무라의 남서쪽에서 NPC를 찾으세요.",
    ["It is the dungeon's 4th boss."] =
        "던전의 4번째 우두머리입니다.",
    ["Kill Fallenroot and Blackfathom foes."] =
        "썩은뿌리와 검은심연 적을 처치하세요.",
    ["Fly to Talrendis Point"] =
        "탈렌드리스 초소로 날아가세요",
    ["This trip is dangerous; move with great caution."] =
        "위험한 여정입니다. 매우 조심해서 이동하세요.",
    ["Stay on the road and keep away from Horde NPCs."] =
        "길을 따라가며 호드 NPC를 피하세요.",
    ["The Warsong Outriders riding along the road stay peaceful."] =
        "길을 따라 달리는 전쟁노래부족 척후병은 공격하지 않습니다.",
    ["The target is a gray murloc."] =
        "대상은 회색 멀록입니다.",
    ["The target appears at this spot."] =
        "대상은 이 지점에 나타납니다.",
    ["Go into Whelgar's Excavation Site"] =
        "Whelgar's Excavation Site에 들어가세요",
    ["Head out of Whelgar's Excavation Site"] =
        "Whelgar's Excavation Site를 나가세요",
    ["The targets are raptors."] =
        "대상은 랩터입니다.",
    ["Targets are both in the tomb and around it."] =
        "대상은 무덤 안과 주변 모두에 있습니다.",
    ["The vendor stocks only a few."] =
        "상인의 재고가 몇 개뿐입니다.",
    ["A quest in Duskwood will require it afterward."] =
        "나중에 그늘숲의 퀘스트에 필요합니다.",
    ["Buy it now; a task in Duskwood needs it before long."] =
        "지금 사 두세요. 곧 그늘숲의 퀘스트에 필요합니다.",
    ["The spot is in the crypt under the building."] =
        "그 지점은 건물 아래 납골당에 있습니다.",
    ["Duskwood and Redridge"] =
        "그늘숲과 붉은마루 산맥",
    ["Flight master at Darkshire"] =
        "다크샤이어 비행 조련사",
    ["The target is a ghoul with red skin."] =
        "대상은 붉은 피부의 구울입니다.",
    ["The targets are ghouls."] =
        "대상은 구울입니다.",
    ["Exit the tomb"] =
        "무덤을 나가세요",
    ["Rob one Malformed Defias Drone with Pickpocket."] =
        "기괴한 데피아즈단 일꾼 하나에게서 소매치기하세요.",
    ["Use Sap on Klaven Mortwake, then open the chest."] =
        "클라벤 몰트워크에게 혼절시키기를 쓴 다음 상자를 여세요.",
    ["Opening it puts a harmful effect on you."] =
        "열면 해로운 효과에 걸립니다.",
    ["Climb the trail across the mountains"] =
        "산을 넘는 길을 따라 올라가세요",
    ["Take the trail that circles the peak"] =
        "봉우리를 도는 길을 따라가세요",
    ["Defeat each wave of attackers."] =
        "몰려오는 공격자를 모두 물리치세요.",
    ["Beware of foes lurking in stealth."] =
        "은신해 숨어 있는 적을 조심하세요.",
    ["Target Doc Mixilpixil, then take a seat."] =
        "Doc Mixilpixil을 대상으로 지정한 다음 앉으세요.",
    ["The target is a boar whose hide is a deeper shade of brown."] =
        "대상은 가죽이 더 짙은 갈색인 멧돼지입니다.",
    ["The targets are orcs."] =
        "대상은 오크입니다.",
    ["You no longer need these; vendor or discard them."] =
        "이제 필요 없습니다. 상인에게 팔거나 버리세요.",
    ["The targets are Horrors and Fiends."] =
        "대상은 Horror와 Fiend입니다.",
    ["Don't engage Mor'Ladim, an elite undead foe at level 35."] =
        "35레벨 정예 언데드인 모르라딤과 싸우지 마세요.",
    ["The target wanders near the crypt, outdoors."] =
        "대상은 납골당 근처 바깥을 돌아다닙니다.",
    ["Climb the steps and exit the tomb"] =
        "계단을 올라가 무덤을 나가세요",
    ["The target is a sword-wielding gnoll."] =
        "대상은 검을 든 놀입니다.",
    ["The target is a gnoll in a crimson robe, wielding a lengthy blade."] =
        "대상은 진홍색 로브를 입고 긴 칼을 든 놀입니다.",
    ["Beware: nearby foes join when you attack him."] =
        "조심하세요: 그를 공격하면 주변 적이 함께 덤빕니다.",
    ["Keep to the cave's interior when you can."] =
        "가능하면 동굴 안쪽으로 다니세요.",
    ["The following step takes place in the cave."] =
        "다음 단계는 동굴 안에서 진행됩니다.",
    ["Keep Corporal Keeshan safe during the escort."] =
        "호위하는 동안 하사관 키샨을 보호하세요.",
    ["At the cave's mouth, draw foes to him with care."] =
        "동굴 입구에서는 적을 조심해서 그에게 끌어오세요.",
    ["The target is the dungeon's fifth boss."] =
        "대상은 던전의 다섯 번째 우두머리입니다.",
    ["Targets are within the wrecked vessel underwater."] =
        "대상은 물속 난파선 안에 있습니다.",
    ["The target is a blue raptor."] =
        "대상은 파란 랩터입니다.",
    ["Look for a big mound of dirt."] =
        "큰 흙더미를 찾으세요.",
    ["The item may also spawn on the high ledge by Sarltooth."] =
        "아이템은 살투스 옆 높은 바위턱에 나타날 수도 있습니다.",
    ["Look for a big, broad yellow urn."] =
        "크고 넓적한 노란 항아리를 찾으세요.",
    ["Look for a big, tall crimson urn."] =
        "크고 길쭉한 진홍색 항아리를 찾으세요.",
    ["The target is a big stone container."] =
        "대상은 큰 돌 상자입니다.",
    ["The target is up on the boat's top deck."] =
        "대상은 배의 맨 위 갑판에 있습니다.",
    ["Climb the incline at the rear."] =
        "뒤쪽 비탈을 올라가세요.",
    ["Go to the lowest deck of the ship."] =
        "배의 가장 아래 갑판으로 가세요.",
    ["Swim in via the gap at the base."] =
        "아래쪽 틈으로 헤엄쳐 들어가세요.",
    ["These foes hide in stealth."] =
        "이 적들은 은신해 있습니다.",
    ["Most often found in or beside water."] =
        "대개 물속이나 물가에 있습니다.",
    ["Grab every one you spot on the way here."] =
        "여기로 오는 길에 보이는 것은 모두 챙기세요.",
    ["With the coming hand-ins, this brings you to level 29."] =
        "이어지는 퀘스트 완료와 함께 29레벨이 됩니다.",
    ["Take the door on the bridge, then descend the steps"] =
        "다리 위의 문으로 들어간 다음 계단을 내려가세요",
    ["The NPC is on the lower level within the bridge."] =
        "NPC는 다리 안쪽 아래층에 있습니다.",
    ["Leap from the span and splash down below"] =
        "다리에서 뛰어내려 아래 물속으로 떨어지세요",
    ["Look for a pale, rolled scroll."] =
        "옅은 색의 말린 두루마리를 찾으세요.",
    ["A dwarf corpse grips it."] =
        "드워프 시체가 쥐고 있습니다.",
    ["Fly to Refuge Pointe"] =
        "임시 주둔지로 날아가세요",
    ["Flight master at Southshore"] =
        "사우스쇼어 비행 조련사",
    ["The targets are turtles."] =
        "대상은 거북입니다.",
    ["Head north, keeping to the riverbank."] =
        "강둑을 따라 북쪽으로 가세요.",
    ["Flight master at Chillwind Camp"] =
        "서리바람 야영지 비행 조련사",
    ["Stonetalon and Ashenvale"] =
        "돌발톱 산맥과 잿빛 골짜기",
    ["Take the road, then climb the trail into Nijel's Point"] =
        "큰길을 따라간 다음 길을 올라가 나이젤의 야영지로 들어가세요",
    ["Fly to Nijel's Point"] =
        "나이젤의 야영지로 날아가세요",
    ["The quest is gray, yet the later ones in the chain award plenty of XP."] =
        "이 퀘스트는 회색이지만, 연계의 다음 퀘스트들은 경험치를 많이 줍니다.",
    ["Take the road until this trail"] =
        "이 오솔길이 나올 때까지 큰길을 따라가세요",
    ["Keep on the trail"] =
        "길을 계속 따라가세요",
    ["Fight the treants."] =
        "나무정령과 싸우세요.",
    ["Head uphill on the trail and across the passage"] =
        "길을 따라 언덕을 올라가 통로를 건너세요",
    ["Exit the Howling Vale by the tunnel"] =
        "터널로 울부짖는 골짜기를 나가세요",
    ["You pick up Claw (Rank 4) here."] =
        "여기서 할퀴기 (4 레벨)를 배웁니다.",
    ["Tame any Elder Ashenvale Bear with Tame Beast."] =
        "야수 길들이기로 아무 덩치큰 잿빛골짜기곰이나 길들이세요.",
    ["They show up lying on the ground."] =
        "땅에 놓여 있습니다.",
    ["Circle the peak, then climb the twisting dirt trail to the shrine"] =
        "봉우리를 돌아간 다음 구불구불한 흙길을 따라 성소까지 올라가세요",
    ["Circle the mountain, then stay on the trail"] =
        "산을 돌아간 다음 길을 계속 따라가세요",
    ["Stand on the marked point, then apply the item."] =
        "표시된 지점에 선 다음 아이템을 사용하세요.",
    ["Obtain Furbolg Form"] =
        "펄볼그 변신 효과를 얻으세요",
    ["Walk over the span"] =
        "다리를 건너가세요",
    ["The foes are gnomes."] =
        "적은 노움입니다.",
    ["In Gnomeregan's outer halls, not in the instance itself."] =
        "인스턴스 안이 아니라 놈리건 바깥쪽 통로에 있습니다.",
    ["Take the lift down, then head north."] =
        "승강기를 타고 내려간 다음 북쪽으로 가세요.",
    ["The NPC is atop the raised platform."] =
        "NPC는 높은 단 위에 있습니다.",
    ["It sits a short distance southward from Techbot."] =
        "테크봇에서 조금 남쪽에 있습니다.",
    ["Use it on foes that are Irradiated."] =
        "오염된 적에게 사용하세요.",
    ["The targets are troggs with a green glow."] =
        "대상은 초록빛을 내는 트로그입니다.",
    ["Inside The Hall of Gears, stick to the top tiers."] =
        "Hall of Gears 안에서는 위층으로 다니세요.",
    ["Take the trail southwest into The Dormitory."] =
        "길을 따라 남서쪽의 Dormitory로 들어가세요.",
    ["By the wall on The Dormitory's lower floor."] =
        "Dormitory 아래층 벽 옆에 있습니다.",
    ["The target is the third boss you meet."] =
        "대상은 세 번째로 만나는 우두머리입니다.",
    ["The target sits on the raised deck beside Electrocutioner 6000."] =
        "대상은 전기처형기 6000 옆의 높은 발판 위에 있습니다.",
    ["In the Engineering Labs, on the lowest floor."] =
        "Engineering Labs의 가장 아래층에 있습니다.",
    ["The objective is next to Crowd Pummeler 9-60."] =
        "목표는 고철 압축기 9-60 옆에 있습니다.",
    ["Keep to Launch Bay's top floor."] =
        "Launch Bay 위층으로 다니세요.",
    ["Look for boxy, standing devices."] =
        "상자 모양으로 서 있는 장치를 찾으세요.",
    ["The machine you need is in the Dormitory."] =
        "필요한 기계는 Dormitory에 있습니다.",
    ["It can take more than one to get it."] =
        "얻기까지 하나 이상이 필요할 수 있습니다.",
    ["Duskwood and Stranglethorn"] =
        "그늘숲과 가시덤불 골짜기",
    ["Head into Stormwind Keep"] =
        "스톰윈드 왕궁에 들어가세요",
    ["The NPC stands by the water's edge."] =
        "NPC는 물가에 서 있습니다.",
    ["The targets are worgen."] =
        "대상은 늑대인간입니다.",
    ["Other ghouls occupy the same spawn points."] =
        "다른 구울도 같은 위치에 나타납니다.",
    ["The target can be in the house or around it."] =
        "대상은 집 안이나 주변에 있을 수 있습니다.",
    ["Just out of the mine."] =
        "광산 바로 밖에 있습니다.",
    ["The NPC patrols the southern route once every 20-30 minutes."] =
        "NPC는 20-30분마다 한 번씩 남쪽 경로를 순찰합니다.",
    ["A pair of foes go after him."] =
        "적 둘이 그를 노립니다.",
    ["Saving his life unlocks a new task."] =
        "그를 구하면 새 퀘스트가 열립니다.",
    ["Hang on to it; an upcoming quest uses it."] =
        "보관하세요. 곧 할 퀘스트에 쓰입니다.",
    ["The NPC stands in the narrow lane between houses."] =
        "NPC는 집 사이의 좁은 골목에 서 있습니다.",
    ["Hillsbrad and Arathi"] =
        "힐스브래드와 아라시",
    ["Search for gray rocks standing up beside the walls."] =
        "벽 옆에 세워진 회색 바위를 찾으세요.",
    ["Further hidden ones lurk on the high ridgelines."] =
        "높은 능선에도 숨어 있는 것이 더 있습니다.",
    ["Some are indoors as well."] =
        "건물 안에도 있습니다.",
    ["Fly to Aerie Peak"] =
        "맹금의 봉우리로 날아가세요",
    ["The NPC is at the summit of the trail."] =
        "NPC는 길의 맨 꼭대기에 있습니다.",
    ["This spares you time further on."] =
        "나중에 시간을 아낄 수 있습니다.",
    ["Flight master at Theramore"] =
        "테라모어 비행 조련사",
    ["This quest is buggy and may not show up."] =
        "이 퀘스트는 버그가 있어 나타나지 않을 수 있습니다.",
    ["Expect several foes at once."] =
        "여러 적이 한꺼번에 덤빌 수 있습니다.",
    ["Make Private Hendel your main target."] =
        "병사 헨델을 주 대상으로 삼으세요.",
    ["Steer clear of Brackenwall Village."] =
        "담쟁이 마을은 피하세요.",
    ["Watch out: the foes here are above your level."] =
        "조심하세요: 여기 적은 당신보다 레벨이 높습니다.",
    ["The quest starts from a small piece of metal."] =
        "이 퀘스트는 작은 금속 조각에서 시작합니다.",
    ["Take the lift down"] =
        "승강기를 타고 내려가세요",
    ["Look for a little brown tome."] =
        "작은 갈색 책을 찾으세요.",
    ["The item is held by a dwarf corpse."] =
        "아이템은 드워프 시체가 쥐고 있습니다.",
    ["Flight master at Thalanaar"] =
        "탈라나르 비행 조련사",
    ["Keep clear of Freewind Post."] =
        "높새바람 봉우리는 피하세요.",
    ["This spot has most of them; elsewhere they are rare."] =
        "대부분 이 지점에 있습니다. 다른 곳에서는 드뭅니다.",
    ["Return here as you do your other quests."] =
        "다른 퀘스트를 하면서 이곳으로 돌아오세요.",
    ["The foes here are scorpions."] =
        "여기의 적은 전갈입니다.",
    ["Look for assorted mechanical pieces."] =
        "여러 가지 기계 부품을 찾으세요.",
    ["Parts lie all across the Shimmering Flats."] =
        "부품은 소금 평원 곳곳에 있습니다.",
    ["Fly to Gadgetzan"] =
        "가젯잔으로 날아가세요",
    ["Stand on the metal grating to begin the battle."] =
        "금속 격자 위에 서서 전투를 시작하세요.",
    ["Shows up once you defeat six challengers."] =
        "도전자 6명을 물리치면 나타납니다.",
    ["The NPC is upstairs, out on the balcony."] =
        "NPC는 위층 발코니에 있습니다.",
    ["The NPC stands on the top tier of the pier."] =
        "NPC는 부두 맨 위층에 서 있습니다.",
    ["Fly to Booty Bay"] =
        "무법항으로 날아가세요",
    ["If he is absent, move on without him."] =
        "그가 없다면 그냥 넘어가세요.",
    ["You may come back for it another time."] =
        "나중에 다시 와서 해도 됩니다.",
    ["These foes heal both their allies and themselves."] =
        "이 적들은 아군과 자신을 모두 치유합니다.",
    ["When the targets run out, skip ahead."] =
        "대상이 더 없으면 다음으로 넘어가세요.",
    ["No rush; you may complete this afterwards."] =
        "서두르지 않아도 됩니다. 나중에 완료해도 됩니다.",
    ["The objective sits up on the raised deck."] =
        "목표는 높은 갑판 위에 있습니다.",
    ["Search the riverbanks."] =
        "강기슭을 찾아보세요.",
    ["Here your pet picks up Claw (Rank 5)."] =
        "여기서 소환수가 할퀴기 (5 레벨)를 배웁니다.",
    ["Tame a Scorpashi Lasher with Tame Beast."] =
        "야수 길들이기로 스콜파시 꼬리전갈을 길들이세요.",
    ["Head uphill into Nijel's Point"] =
        "언덕을 올라 나이젤의 야영지로 들어가세요",
    ["With the coming hand-ins, this brings you to level 36."] =
        "곧 있을 반납까지 하면 36레벨이 됩니다.",
    ["The quest starts from a little book."] =
        "퀘스트는 작은 책에서 시작됩니다.",
    ["The targets are lobsters."] =
        "대상은 랍스터입니다.",
    ["Draw him to the doorway so other foes stay out of it."] =
        "다른 적이 끼어들지 않도록 그를 문간으로 끌어내세요.",
    ["Escort Dalinda Malem and keep her alive."] =
        "달린다 말렘을 호위하며 살려 두세요.",
    ["The targets here are centaurs."] =
        "여기의 대상은 켄타우로스입니다.",
    ["Magram Pack Runners patrol with 2 hyena escorts; steer clear."] =
        "마그람일족 조련사는 하이에나 2마리를 데리고 순찰합니다. 피하세요.",
    ["Stay away from Ghost Walker Post."] =
        "침묵의 초소에는 가까이 가지 마세요.",
    ["Target kodos with the item."] =
        "코도에게 아이템을 사용하세요.",
    ["The kodos trail behind you."] =
        "코도가 뒤를 따라옵니다.",
    ["Lead them to Smeed Scrabblescrew, then speak with them there."] =
        "스미드 스크래블스크류에게 데려간 다음 거기서 그들과 대화하세요.",
    ["Look for pale skulls of horned beasts."] =
        "뿔 달린 짐승의 하얀 두개골을 찾으세요.",
    ["A lengthy grinding stretch is coming up."] =
        "곧 긴 사냥 구간이 이어집니다.",
    ["The targets are Sea Witches and Tidehunters."] =
        "대상은 바다마녀와 바다사냥꾼입니다.",
    ["Other naga compete for the same spawn points."] =
        "다른 나가와 같은 생성 위치를 두고 경쟁합니다.",
    ["The targets are on islands and beneath the surface."] =
        "대상은 섬과 물속에 있습니다.",
    ["This spreads out the grinding so less is left later."] =
        "사냥을 나눠서 해 두면 나중에 남는 사냥이 줄어듭니다.",
    ["Take the mountain trail to get there."] =
        "산길로 가세요.",
    ["Stay clear of Valley of Spears."] =
        "Valley of Spears는 피하세요.",
    ["Look for tan sacks by the houses."] =
        "집 옆의 황갈색 자루를 찾으세요.",
    ["Some of them are not usable."] =
        "일부는 사용할 수 없습니다.",
    ["Basilisks compete for the same spawn points."] =
        "바실리스크와 같은 생성 위치를 두고 경쟁합니다.",
    ["They compete for spawn points with the other Kurzen foes."] =
        "다른 쿠르젠 적과 생성 위치를 두고 경쟁합니다.",
    ["A key class quest coming up requires this."] =
        "곧 있을 중요한 직업 퀘스트에 필요합니다.",
    ["The targets are on the cave floor."] =
        "대상은 동굴 바닥에 있습니다.",
    ["Targets are spread across the whole cavern."] =
        "대상은 동굴 전체에 흩어져 있습니다.",
    ["Hold on to it for a Searing Gorge task later."] =
        "나중에 이글거리는 협곡 퀘스트에 쓰니 보관하세요.",
    ["Stay away from Bhag'thera."] =
        "바그테라에게는 가까이 가지 마세요.",
    ["The big cat you need roams in plain sight: a level 40 elite black panther."] =
        "찾는 대형 고양잇과 야수는 은신하지 않고 돌아다니는 40레벨 정예 흑표범입니다.",
    ["The targets are in the water and along its edges."] =
        "대상은 물속과 물가에 있습니다.",
    ["Look for an orange tiger."] =
        "주황색 호랑이를 찾으세요.",
    ["Mostly found atop the hill."] =
        "주로 언덕 위에 있습니다.",
    ["Steer clear of elite murlocs."] =
        "정예 멀록은 피하세요.",
    ["The targets are trolls."] =
        "대상은 트롤입니다.",
    ["With the coming hand-ins, this gets you to level 38."] =
        "곧 있을 반납까지 하면 38레벨이 됩니다.",
    ["Hunt the little winged dragonkin."] =
        "날개 달린 작은 용족을 사냥하세요.",
    ["The target is a humanoid escorted by 2 guards."] =
        "대상은 경비병 2명이 호위하는 인간형입니다.",
    ["Clear the monsters just south before you start."] =
        "시작하기 전에 바로 남쪽의 몬스터를 처치하세요.",
    ["Escort Galen Goodward and keep him alive."] =
        "갈렌 굿워드를 호위하며 살려 두세요.",
    ["Look for big blue crystals."] =
        "큰 파란 수정을 찾으세요.",
    ["Keep to the water to skip foes above your level."] =
        "레벨이 높은 적을 피하려면 물을 따라 이동하세요.",
    ["Together with the next turn-ins, this brings you to level 39."] =
        "다음 반납까지 하면 39레벨이 됩니다.",
    ["Hold on to it for the Whirlwind class chain."] =
        "소용돌이 직업 퀘스트 연계에 쓰니 보관하세요.",
    ["A major boost to your weapon."] =
        "무기가 크게 강해집니다.",
    ["Arathi and Alterac"] =
        "아라시와 알터랙",
    ["The target travels the road in one direction, escorted by 4 guards."] =
        "대상은 경비병 4명의 호위를 받으며 길을 따라 한 방향으로 이동합니다.",
    ["If she makes it to Tarren Mill, she spawns again."] =
        "타렌 밀농장에 도착하면 다시 나타납니다.",
    ["She starts her route over in Arathi Highlands."] =
        "그녀는 아라시 고원에서 경로를 다시 시작합니다.",
    ["The targets are kobolds."] =
        "대상은 코볼트입니다.",
    ["Additional ones are in the cavern up the trail."] =
        "길 위쪽의 동굴에 더 있습니다.",
    ["Keep away from Hammerfall."] =
        "해머폴에는 가까이 가지 마세요.",
    ["Climb the trail to the cavern"] =
        "길을 올라 동굴로 가세요",
    ["The NPC stands atop the ridge."] =
        "NPC는 능선 위에 서 있습니다.",
    ["Escort Kinelory and keep her alive."] =
        "키넬로리를 호위하며 살려 두세요.",
    ["The targets are ogres."] =
        "대상은 오우거입니다.",
    ["Together with the next turn-ins, this brings you to level 40."] =
        "다음 반납까지 하면 40레벨이 됩니다.",
    ["Stay clear of Refuge Point."] =
        "임시 주둔지는 피하세요.",
    ["A level 40 elite foe shows up shortly."] =
        "곧 40레벨 정예 적이 나타납니다.",
    ["Drink a second Nature Protection Potion mid-fight."] =
        "전투 중에 자연 보호 물약을 하나 더 마시세요.",
    ["Consume one ahead of time, so it has recharged once combat begins."] =
        "전투가 시작될 때 재사용 대기시간이 끝나 있도록 미리 하나 마시세요.",
    ["Get Essence of the Exile done as well."] =
        "떠도는 정령의 정수 퀘스트도 완료하세요.",
    ["Be sure the cooldown on the Nature Protection Potion has ended."] =
        "자연 보호 물약의 재사용 대기시간이 끝났는지 확인하세요.",
    ["Stay behind Bath'rah the Windwatcher as he walks."] =
        "바람의감시자 바스라가 걷는 동안 뒤에 붙어 있으세요.",
    ["This calls up Cyclonian."] =
        "사이클로니안이 소환됩니다.",
    ["Take the trail across the peaks"] =
        "길을 따라 봉우리를 넘어가세요",
    ["Take the passage to Faldir's Cove"] =
        "통로를 지나 팔디르의 만으로 가세요",
    ["Escort Professor Phizzlethorpe and keep him alive."] =
        "학자 피즐솔프를 호위하며 살려 두세요.",
    ["The tome is bound in brown and rests in a metal kettle."] =
        "책은 갈색 표지이며 금속 솥 안에 있습니다.",
    ["The objective is on the central deck of the submerged wreck."] =
        "목표는 가라앉은 난파선의 가운데 갑판에 있습니다.",
    ["Look for a flat beige parchment."] =
        "납작한 베이지색 양피지를 찾으세요.",
    ["Search for a book lying open."] =
        "펼쳐진 책을 찾으세요.",
    ["The target is in the ship's lowest hold."] =
        "대상은 배의 가장 아래 화물칸에 있습니다.",
    ["Look for big gray rocks."] =
        "큰 회색 바위를 찾으세요.",
    ["They show up as dots on the minimap."] =
        "미니맵에 점으로 표시됩니다.",
    ["Hold on to it, an upcoming quest uses it."] =
        "곧 할 퀘스트에 쓰니 보관하세요.",
    ["Clear the raptors around before you begin."] =
        "시작하기 전에 주변의 랩터를 처치하세요.",
    ["Let the conversation play out, then escort \"Stinky\" Ignatz and keep him alive."] =
        "대화가 끝날 때까지 기다린 다음 \"말썽꾼\" 이그나츠를 호위하며 살려 두세요.",
    ["Speak with him once he gives up."] =
        "그가 항복하면 대화하세요.",
    ["Hunt the felguards."] =
        "지옥수호병을 사냥하세요.",
    ["This is the sole spot; wait for them to reappear."] =
        "이곳 하나뿐이니 다시 나타날 때까지 기다리세요.",
    ["The targets are felhounds."] =
        "대상은 지옥사냥개입니다.",
    ["The targets are succubi."] =
        "대상은 서큐버스입니다.",
    ["The spot is beside a giant skeleton."] =
        "장소는 거대한 해골 옆입니다.",
    ["Clear out the foes around here before you start."] =
        "시작하기 전에 이 주변의 적을 처치하세요.",
    ["Target the spectral centaurs."] =
        "유령 켄타우로스를 노리세요.",
    ["The targets are brown-colored skeletons."] =
        "대상은 갈색 해골입니다.",
    ["Together with the next turn-ins, this brings you to level 41."] =
        "다음 반납까지 하면 41레벨이 됩니다.",
    ["The target wanders inside the tent and around it."] =
        "대상은 천막 안팎을 돌아다닙니다.",
    ["Take the road, then descend the trail"] =
        "큰길을 따라간 다음 길을 따라 내려가세요",
    ["On the road, Rexxar leaves you alone."] =
        "길 위에 있으면 렉사르가 건드리지 않습니다.",
    ["Cross by boat or by swimming"] =
        "배를 타거나 헤엄쳐서 건너세요",
    ["Flight master at Feathermoon"] =
        "페더문 요새 비행 조련사",
    ["Your pet picks up Claw (Rank 6) here."] =
        "여기서 소환수가 할퀴기 (6 레벨)를 배웁니다.",
    ["Tame a Scorpid Hunter with Tame Beast."] =
        "야수 길들이기로 사막전갈을 길들이세요.",
    ["Head into the Library wing."] =
        "도서관 구역으로 들어가세요.",
    ["The target is the dungeon's opening boss."] =
        "대상은 던전의 첫 우두머리입니다.",
    ["Head across the hall called Gallery of Treasures."] =
        "Gallery of Treasures라는 전당을 지나가세요.",
    ["Keep an eye on the minimap until its area name reads Scarlet Monastery again."] =
        "미니맵의 지역 이름이 다시 붉은십자군 수도원으로 바뀔 때까지 지켜보세요.",
    ["This is in the Armory wing."] =
        "무기고 구역에 있습니다.",
    ["Found in the Cathedral wing."] =
        "대성당 구역에 있습니다.",
    ["A lengthy stretch of quests is coming up."] =
        "곧 긴 퀘스트 구간이 이어집니다.",
    ["This vendor sells no arrows or bullets."] =
        "이 상인은 화살이나 탄환을 팔지 않습니다.",
    ["Get these for simple Badlands turn-ins ahead."] =
        "앞으로 있을 황야의 땅의 간단한 반납을 위해 구해 두세요.",
    ["The NPC or item sits on the rocky shelf above."] =
        "NPC나 아이템은 위쪽 바위턱에 있습니다.",
    ["Fight the dwarves."] =
        "드워프와 싸우세요.",
    ["Look for a timber box."] =
        "나무 상자를 찾으세요.",
    ["A cluster of them gathers here."] =
        "여기에 무리 지어 모여 있습니다.",
    ["More of them dot the surroundings."] =
        "주변에도 군데군데 더 있습니다.",
    ["With the coming hand-ins, this brings you to level 42."] =
        "곧 있을 반납까지 하면 42레벨이 됩니다.",
    ["Unlocks the flight point at Thorium Point."] =
        "토륨 조합 거점 비행 경로가 열립니다.",
    ["Flight master at Thorium Point"] =
        "토륨 조합 거점 비행 조련사",
    ["Take the passage out of Booty Bay"] =
        "통로를 지나 무법항을 나가세요",
    ["Take the tunnel into Booty Bay"] =
        "터널을 지나 무법항으로 들어가세요",
    ["Take the trail toward the Ruins of Aboraz"] =
        "길을 따라 Ruins of Aboraz 쪽으로 가세요",
    ["Gradually move toward the northeast."] =
        "조금씩 북동쪽으로 이동하세요.",
    ["The targets are goblins."] =
        "대상은 고블린입니다.",
    ["Kill the witch doctors and the mystics."] =
        "주술사와 신비술사를 처치하세요.",
    ["A dark panther, elite at 40, visible rather than hidden."] =
        "숨어 있지 않고 눈에 보이는 40레벨 정예 흑표범입니다.",
    ["Be ready: these opponents are elites at level 38."] =
        "대비하세요. 이 적들은 38레벨 정예입니다.",
    ["Saltwater Crocolisks spawn in the same places."] =
        "바다악어도 같은 곳에 나타납니다.",
    ["The object is a table made of stone."] =
        "대상은 돌로 된 탁자입니다.",
    ["Drag him up until he breaks the surface."] =
        "물 위로 나올 때까지 끌어올리세요.",
    ["Follow the shoreline"] =
        "해안선을 따라가세요",
    ["The item is a brownish sheet of parchment."] =
        "아이템은 갈색빛 양피지 한 장입니다.",
    ["Look for a flat, white scroll lying open."] =
        "펼쳐져 있는 납작한 흰 두루마리를 찾으세요.",
    ["If some pages are unavailable, go on without them."] =
        "일부 쪽을 구할 수 없으면 그냥 진행하세요.",
    ["You want Chapters I, II and III."] =
        "1장, 2장, 3장이 필요합니다.",
    ["Collect the chunks of wood."] =
        "나무 조각을 모으세요.",
    ["Do not go near Stonard."] =
        "스토나드 근처로 가지 마세요.",
    ["Silt Crawlers drop it more often."] =
        "늪지게가 더 자주 떨어뜨립니다.",
    ["Fly to Nethergarde Keep"] =
        "네더가드 요새로 날아가세요",
    ["A timer runs on this one; don't dawdle."] =
        "제한 시간이 있으니 서두르세요.",
    ["Hold on until Rizzle has fled."] =
        "리즐이 달아날 때까지 기다리세요.",
    ["Targets here are human."] =
        "여기의 대상은 인간입니다.",
    ["Dungeon runs are a fine choice here too, as you like."] =
        "원한다면 여기서도 던전을 도는 것이 좋은 선택입니다.",
    ["Each set of 5 handed in at Gadgetzan gives 380 xp."] =
        "가젯잔에서 5개씩 반납할 때마다 경험치 380을 얻습니다.",
    ["Hyenas also use these spawn spots."] =
        "하이에나도 이 생성 위치에 나타납니다.",
    ["Feralas and Tanaris"] =
        "페랄라스와 타나리스",
    ["Position yourself in its center."] =
        "그 한가운데에 서세요.",
    ["Consider bringing a group for this one."] =
        "파티를 꾸려 하는 것도 고려하세요.",
    ["Zones with stronger foes lie just ahead."] =
        "곧 더 강한 적이 있는 지역으로 갑니다.",
    ["The quests alone won't give you the level you need."] =
        "퀘스트만으로는 필요한 레벨에 도달하지 못합니다.",
    ["Swim this way to stay out of fatigue"] =
        "피로 상태를 피하려면 이쪽으로 헤엄치세요",
    ["Hunt the crimson winged serpents."] =
        "날개 달린 진홍색 뱀을 사냥하세요.",
    ["Slay them, then apply the item to their remains."] =
        "처치한 다음 시체에 아이템을 사용하세요.",
    ["Once freed, they can be killed."] =
        "풀려나면 처치할 수 있습니다.",
    ["Win the encounter at the temple."] =
        "사원에서 벌어지는 전투에서 승리하세요.",
    ["Take the trail to the southeast."] =
        "남동쪽 길을 따라가세요.",
    ["Inside a big room around a central pool."] =
        "가운데 웅덩이를 둘러싼 큰 방 안에 있습니다.",
    ["Most of them are in Theka the Martyr's scarab chamber."] =
        "대부분 순교자 데카의 스카라베 방에 있습니다.",
    ["It could take a few trips through the instance."] =
        "인스턴스를 몇 번 돌아야 할 수도 있습니다.",
    ["Do more Zul'Farrak runs."] =
        "줄파락을 더 도세요.",
    ["Keep to the road, then cross the tunnel"] =
        "큰길을 따라간 다음 터널을 지나가세요",
    ["The robot sits in the open ground linking the cave and the tunnel."] =
        "로봇은 동굴과 터널을 잇는 빈터에 있습니다.",
    ["Others lie past the tunnel."] =
        "터널 너머에도 더 있습니다.",
    ["Get out of the cave and use the passage beyond"] =
        "동굴을 나와 그 너머의 통로로 가세요",
    ["Look for a big, pale egg."] =
        "크고 하얀 알을 찾으세요.",
    ["Hunt gorillas."] =
        "고릴라를 사냥하세요.",
    ["Bears appear at the same spawn spots."] =
        "곰도 같은 생성 위치에 나타납니다.",
    ["Hunt bears."] =
        "곰을 사냥하세요.",
    ["They appear in the same spots as the apes."] =
        "유인원과 같은 위치에 나타납니다.",
    ["Kill the foes near the big cage first."] =
        "먼저 큰 우리 근처의 적을 처치하세요.",
    ["This helps with the following step."] =
        "다음 단계에 도움이 됩니다.",
    ["This sets Captured Sprite Darters free."] =
        "사로잡힌 화살요정용이 풀려납니다.",
    ["Save as many of them as possible."] =
        "가능한 한 많이 구하세요.",
    ["Keep 6 or more of them alive."] =
        "6마리 이상 살려 두세요.",
    ["If she is gone, wait until she comes back."] =
        "그녀가 없으면 돌아올 때까지 기다리세요.",
    ["Go into the cavern at the trail's foot"] =
        "길 아래 끝에 있는 동굴로 들어가세요",
    ["Getting it here speeds up Un'Goro Crater."] =
        "여기서 얻어 두면 운고로 분화구 진행이 빨라집니다.",
    ["Stay clear of the elite foes."] =
        "정예 적은 피하세요.",
    ["Gather the big plumes colored brown and ivory."] =
        "갈색과 상아색의 큰 깃털을 모으세요.",
    ["Drop the Ground Clutter option down to 1."] =
        "Ground Clutter 옵션을 1로 낮추세요.",
    ["Hop onto the ledge here."] =
        "여기 바위턱 위로 뛰어오르세요.",
    ["Monsters are unable to reach you from this spot."] =
        "이 자리에서는 몬스터가 닿지 못합니다.",
    ["Hold off until you have left combat."] =
        "전투가 끝날 때까지 기다리세요.",
    ["Other creatures use these spawn points too."] =
        "다른 생물도 이 생성 위치에 나타납니다.",
    ["If it hasn't turned up by level 49, move on."] =
        "49레벨까지 나타나지 않으면 넘어가세요.",
    ["Stay on the road, then take the trail downhill"] =
        "큰길을 따라간 다음 길을 따라 내려가세요",
    ["Point it at Gammerita."] =
        "감메리타에게 사용하세요.",
    ["The quarry: a tough elite tortoise, azure-shelled."] =
        "목표는 하늘색 등껍질을 가진 강한 정예 거북입니다.",
    ["Look for little blue flasks."] =
        "작은 파란 병을 찾으세요.",
    ["Steer around Revantusk Village."] =
        "레반터스크 마을은 돌아서 가세요.",
    ["Stay away from Gammerita."] =
        "감메리타에게는 가까이 가지 마세요.",
    ["Kill mobs until your hearthstone is off cooldown"] =
        "귀환석 재사용 대기시간이 끝날 때까지 몬스터를 처치하세요",
    ["The target patrols a wide loop, turning counterclockwise."] =
        "대상은 시계 반대 방향으로 넓게 돌며 순찰합니다.",
    ["Watch for a pair of guards hiding in stealth."] =
        "은신한 경비병 두 명을 조심하세요.",
    ["The target's spawn point is 58.9, 39.3 in Tanaris."] =
        "대상의 생성 위치는 타나리스 58.9, 39.3입니다.",
    ["Head down the passage that opens on Lost Rigger Cove"] =
        "Lost Rigger Cove로 이어지는 통로를 따라 내려가세요",
    ["Few kills yield this item."] =
        "이 아이템은 잘 떨어지지 않습니다.",
    ["Others can be found on raised wood platforms close by."] =
        "근처의 높은 나무 발판 위에도 있습니다.",
    ["Others are indoors too."] =
        "실내에도 있습니다.",
    ["Take the passage out of Lost Rigger Cove"] =
        "통로를 지나 Lost Rigger Cove를 나가세요",
    ["If the NPC is gone, hold on until it reappears."] =
        "NPC가 없으면 다시 나타날 때까지 기다리세요.",
    ["Search the sand mounds."] =
        "모래 더미를 찾아보세요.",
    ["It competes for spawn points."] =
        "다른 몬스터와 생성 위치를 두고 경쟁합니다.",
    ["Stay clear of the elite tyrannosaur."] =
        "정예 티라노사우루스는 피하세요.",
    ["Every creature in Un'Goro Crater can drop it."] =
        "운고로 분화구의 모든 생물이 떨어뜨릴 수 있습니다.",
    ["Gather from clumps of multicolored crystals."] =
        "여러 색이 섞인 수정 덩어리에서 채집하세요.",
    ["Spawn points are shared, so pick up every one you find."] =
        "생성 위치를 공유하니 보이는 대로 모두 주우세요.",
    ["Gathering it causes other hues to show up."] =
        "채집하면 다른 색이 나타납니다.",
    ["The targets are mobile plant monsters."] =
        "대상은 움직이는 식물 몬스터입니다.",
    ["Together with the next turn-ins, this brings you to level 50."] =
        "다음 반납까지 하면 50레벨이 됩니다.",
    ["Flight master at Marshal's Refuge"] =
        "마샬의 야영지 비행 조련사",
    ["In the Maraudon Tunnels, the target is a centaur in violet armor."] =
        "마라우돈 터널 안에서 대상은 보라색 갑옷을 입은 켄타우로스입니다.",
    ["Head into the purple wing of the Maraudon Tunnels."] =
        "마라우돈 터널의 보라색 구역으로 들어가세요.",
    ["Use it on the Spirit of Gelk."] =
        "겔크의 영혼에게 사용하세요.",
    ["In the Maraudon Tunnels, find the chamber joining the purple and orange areas."] =
        "마라우돈 터널에서 보라색 구역과 주황색 구역을 잇는 방을 찾으세요.",
    ["Target the Spirit of Kolk with the item."] =
        "콜크의 영혼에게 아이템을 사용하세요.",
    ["Found in the Maraudon Tunnels, along the orange wing."] =
        "마라우돈 터널의 주황색 구역에 있습니다.",
    ["The target is beside the big pool holding orange crystals."] =
        "대상은 주황색 수정이 있는 큰 웅덩이 옆에 있습니다.",
    ["Target the Spirit of Magra with it."] =
        "마그라의 영혼에게 사용하세요.",
    ["Target Spirit of Veng with it."] =
        "벵의 영혼에게 사용하세요.",
    ["In the orange area."] =
        "주황색 구역에 있습니다.",
    ["Use it beside the Vylestem Vines."] =
        "바일줄기 덩굴나무 옆에서 사용하세요.",
    ["Look for stumps topped with big leaves."] =
        "위에 큰 잎이 달린 그루터기를 찾으세요.",
    ["The spot is in Foulspore Cavern."] =
        "장소는 Foulspore Cavern입니다.",
    ["This happens in Maraudon's violet wing."] =
        "마라우돈의 보라색 구역에서 진행됩니다.",
    ["Aim the item at the Spirit of Maraudos."] =
        "마라우도스의 영혼에게 아이템을 사용하세요.",
    ["The target is a spectral centaur holding a spear."] =
        "대상은 창을 든 유령 켄타우로스입니다.",
    ["Small green flasks."] =
        "작은 녹색 병입니다.",
    ["Search the shoreline, right by the waves."] =
        "파도 바로 옆 해안가를 찾아보세요.",
    ["The objective is on the ship's center deck."] =
        "목표는 배의 가운데 갑판에 있습니다.",
    ["Search for a parchment roll, white in color."] =
        "흰 두루마리 양피지를 찾으세요.",
    ["Search the ship's middle or lowest deck."] =
        "배의 가운데 갑판이나 가장 아래 갑판을 찾아보세요.",
    ["If she is absent, wait for her to come back."] =
        "그녀가 없으면 돌아올 때까지 기다리세요.",
    ["Hunt down an elite raptor of level 43 whose scales look azure."] =
        "비늘이 하늘색인 43레벨 정예 랩터를 사냥하세요.",
    ["The quarry is a pale tiger, an elite at 43."] =
        "목표는 43레벨 정예 흰 호랑이입니다.",
    ["It calls 2 small adds of a lesser level; neither one is elite."] =
        "레벨이 더 낮은 작은 몬스터 2마리를 불러냅니다. 둘 다 정예가 아닙니다.",
    ["When it drops to about 50% health."] =
        "생명력이 약 50%로 떨어졌을 때입니다.",
    ["Look underneath the bridge."] =
        "다리 아래를 찾아보세요.",
    ["Hunt flame and stone elementals."] =
        "불의 정령과 바위 정령을 사냥하세요.",
    ["Fight elementals and golems."] =
        "정령과 골렘을 상대하세요.",
    ["Drop onto the metal catwalk at this spot"] =
        "여기서 금속 통로 위로 뛰어내리세요",
    ["Drop off the cavern's bridge at this spot"] =
        "여기서 동굴의 다리 아래로 뛰어내리세요",
    ["Go in through the second cave opening"] =
        "두 번째 동굴 입구로 들어가세요",
    ["Slave Workers can drop them too."] =
        "노예 일꾼도 떨어뜨릴 수 있습니다.",
    ["Climb the trail out of the Cauldron"] =
        "길을 올라 용광로를 나가세요",
    ["The foes here are elite."] =
        "여기의 적은 정예입니다.",
    ["Do not leave this quest undone; it matters."] =
        "이 퀘스트는 중요하니 남겨 두지 말고 완료하세요.",
    ["The spot is at the tower's upper level."] =
        "장소는 탑의 위층입니다.",
    ["Beware, this foe is elite."] =
        "조심하세요, 이 적은 정예입니다.",
    ["Walk over the rope bridge"] =
        "밧줄 다리를 건너가세요",
    ["Hunt the elite azure saurian; it stands at level 48."] =
        "48레벨 정예 하늘색 파충류를 사냥하세요.",
    ["The target wanders the trail."] =
        "대상은 길을 따라 돌아다닙니다.",
    ["Defeat every foe close by before you begin."] =
        "시작하기 전에 근처의 적을 모두 처치하세요.",
    ["Escort Dorius Stonetender and keep him safe."] =
        "도리우스 스톤텐더를 호위하며 지켜 주세요.",
    ["Keep it; a later quest calls for it."] =
        "나중 퀘스트에 필요하니 보관하세요.",
    ["Look by the lookout towers ringing the Cauldron."] =
        "용광로를 둘러싼 감시탑 근처를 찾아보세요.",
    ["Climb the trail into Thorium Point"] =
        "길을 올라 토륨 조합 거점으로 들어가세요",
    ["Blasted Lands and Burning Steppes"] =
        "저주받은 땅과 불타는 평원",
    ["Prioritize these targets."] =
        "이 대상을 먼저 노리세요.",
    ["Hunt basilisks."] =
        "바실리스크를 사냥하세요.",
    ["They appear in the same spots as the boars."] =
        "멧돼지와 같은 위치에 나타납니다.",
    ["Hunt hyenas for these."] =
        "하이에나를 사냥해 구하세요.",
    ["Scorpions spawn in the same spots."] =
        "전갈도 같은 위치에 나타납니다.",
    ["Climb the trail to Morgan's Vigil"] =
        "길을 올라 모건의 터로 가세요",
    ["Flight master at Morgan's Vigil"] =
        "모건의 터 비행 조련사",
    ["8 different quests will ask for it."] =
        "서로 다른 퀘스트 8개에 필요합니다.",
    ["You hand in 60 pieces of cloth for every quest."] =
        "퀘스트마다 옷감 60개를 반납합니다.",
    ["Undead foes drop these in both Plaguelands zones, Western and Eastern."] =
        "서부와 동부 역병지대 두 곳 모두에서 언데드 적이 떨어뜨립니다.",
    ["Keep your Argent Dawn Commission aura up."] =
        "은빛 여명회 위임장 효과를 유지하세요.",
    ["Together with the next turn-ins, this brings you to level 52."] =
        "다음 반납까지 하면 52레벨이 됩니다.",
    ["Azshara and Felwood"] =
        "아즈샤라와 악령의 숲",
    ["A lengthy stretch of questing lies ahead."] =
        "앞으로 긴 퀘스트 구간이 이어집니다.",
    ["Hand these in afterwards for experience and reputation."] =
        "나중에 반납해 경험치와 평판을 얻으세요.",
    ["Raise Timbermaw Hold standing to Unfriendly"] =
        "나무구렁 요새 평판을 약간 적대적까지 올리세요",
    ["Extra targets wait in the caves."] =
        "동굴 안에 대상이 더 있습니다.",
    ["Stay on the trail to reach Jaedenar"] =
        "길을 따라 자에데나르까지 가세요",
    ["Climb the trail into Jadefire Run"] =
        "길을 올라 Jadefire Run으로 들어가세요",
    ["Flight master at Talonbranch Glade"] =
        "Talonbranch Glade 비행 조련사",
    ["Big blue plumes."] =
        "큰 파란 깃털입니다.",
    ["Head eastward as you go."] =
        "가면서 동쪽으로 이동하세요.",
    ["You pick up Claw (Rank 7) here."] =
        "여기서 할퀴기 (7 레벨)를 배웁니다.",
    ["Flight master at Everlook"] =
        "눈망루 마을 비행 조련사",
    ["The flight master stands past the walls, outdoors."] =
        "비행 조련사는 성벽 너머 바깥에 서 있습니다.",
    ["Tame an Angerclaw Mauler with your Tame Beast spell."] =
        "야수 길들이기 주문으로 덩치큰 성난발톱곰을 길들이세요.",
    ["Track down a plague-ridden bear with a chestnut coat."] =
        "밤색 털의 역병 걸린 곰을 찾아내세요.",
    ["Feralas and Azshara"] =
        "페랄라스와 아즈샤라",
    ["Aim the item at the Strider foes."] =
        "타조류 적에게 아이템을 사용하세요.",
    ["The targets are towering green giants."] =
        "대상은 우뚝 솟은 녹색 거인입니다.",
    ["The item strips their elite status."] =
        "아이템을 쓰면 정예 상태가 사라집니다.",
    ["Hunt down the elementals formed of water."] =
        "물의 정령을 사냥하세요.",
    ["Reveal Dire Maul on your map"] =
        "지도에서 혈투의 전장을 발견하세요",
    ["Stand on the neighboring ledge, then hop into this crack in the wall"] =
        "옆 바위턱에 선 다음 벽의 이 틈으로 뛰어 들어가세요",
    ["Hop onto the ledge"] =
        "바위턱 위로 뛰어오르세요",
    ["Leap over at this spot"] =
        "여기서 뛰어 건너세요",
    ["Leap up at this spot"] =
        "여기서 뛰어오르세요",
    ["Shay Leafrunner trails behind you; keep her alive."] =
        "샤이 리프러너가 뒤를 따라옵니다. 살려 두세요.",
    ["Keep near her, as she tends to stray."] =
        "자주 엉뚱한 곳으로 가니 곁에 붙어 있으세요.",
    ["Finish the quest named The Videre Elixir."] =
        "앞날의 비약 퀘스트를 완료하세요.",
    ["Keep the elixir in your bags; never consume it."] =
        "비약은 가방에 보관하고 절대 마시지 마세요.",
    ["You will die from it."] =
        "이것 때문에 죽게 됩니다.",
    ["Put these items in your bank vault."] =
        "이 아이템들을 은행 금고에 맡기세요.",
    ["The quest giver waits on the hilltop."] =
        "퀘스트 제공자는 언덕 꼭대기에서 기다립니다.",
    ["The targets are Myrmidons and Sirens."] =
        "대상은 미르미돈과 세이렌입니다.",
    ["Skirt the Ruins of Eldarath, then take the bridge across"] =
        "엘다라스 폐허를 돌아간 다음 다리를 건너세요",
    ["Drop down with care"] =
        "조심해서 뛰어내리세요",
    ["The spot is the middle of the timber deck."] =
        "장소는 나무 갑판 한가운데입니다.",
    ["It shows up close by after a while."] =
        "잠시 후 근처에 나타납니다.",
    ["At times it takes several minutes."] =
        "몇 분이 걸릴 때도 있습니다.",
    ["The targets are flame elementals."] =
        "대상은 불의 정령입니다.",
    ["An elite foe waits on the summit; steer clear."] =
        "꼭대기에 정예 적이 있으니 피하세요.",
    ["Ringo trails behind you; keep him alive."] =
        "링고가 뒤를 따라옵니다. 살려 두세요.",
    ["Keep near him; he passes out."] =
        "그는 기절하니 곁에 붙어 있으세요.",
    ["Take the trail through the cavern"] =
        "길을 따라 동굴을 지나가세요",
    ["Escort A-Me 01 and keep it alive."] =
        "에이미 01을 호위하며 살려 두세요.",
    ["Winterspring and Felwood"] =
        "여명의 설원과 악령의 숲",
    ["Go into Jaedenar"] =
        "자에데나르로 들어가세요",
    ["Go to the upper floor of the cavern."] =
        "동굴 위층으로 가세요.",
    ["Circle the gap in the ground, then take the trail downward"] =
        "땅의 틈을 돌아간 다음 길을 따라 내려가세요",
    ["The target is deep in the cave, on its lowest floor."] =
        "대상은 동굴 깊은 곳의 가장 아래층에 있습니다.",
    ["Search the upper and lower floors of the cavern."] =
        "동굴의 위층과 아래층을 찾아보세요.",
    ["The prisoner is held in a cage of yellow wood."] =
        "포로는 노란 나무 우리에 갇혀 있습니다.",
    ["Climb the trail and exit the cavern"] =
        "길을 올라 동굴을 나가세요",
    ["The targets are furbolgs."] =
        "대상은 펄볼그입니다.",
    ["With the coming hand-ins, this brings you to level 55."] =
        "곧 있을 반납까지 하면 55레벨이 됩니다.",
    ["A tough quest lies just ahead."] =
        "곧 어려운 퀘스트가 있습니다.",
    ["Flee if things go badly."] =
        "상황이 나빠지면 도망치세요.",
    ["The NPC is a human spirit."] =
        "NPC는 인간의 영혼입니다.",
    ["The targets are leafless trees that walk."] =
        "대상은 걸어 다니는 앙상한 나무입니다.",
    ["Slay the greenish beings of living water."] =
        "살아 있는 물로 이루어진 녹색 존재를 처치하세요.",
    ["The targets are wolves and bears."] =
        "대상은 늑대와 곰입니다.",
    ["The targets are 3 white furbolgs moving as one pack."] =
        "대상은 한 무리로 다니는 흰 펄볼그 3마리입니다.",
    ["The target patrols a long route beside the road."] =
        "대상은 길옆으로 긴 경로를 순찰합니다.",
    ["Move on if you have not seen it once the trail ends."] =
        "길이 끝날 때까지 보이지 않으면 넘어가세요.",
    ["Escort Ranshalla and guard her."] =
        "란샬라를 호위하며 지켜 주세요.",
    ["Wait until the foes hit her before you strike."] =
        "적이 그녀를 공격할 때까지 기다렸다가 공격하세요.",
    ["They appear near 28.1, 35.0 in Winterspring."] =
        "여명의 설원 28.1, 35.0 근처에 나타납니다.",
    ["You can also do dungeons until you hit level 56."] =
        "56레벨이 될 때까지 던전을 돌아도 됩니다.",
    ["Give Nafien the items in sets of 5."] =
        "나피엔에게 아이템을 5개씩 주세요.",
    ["Every full set you hand over earns 50 reputation."] =
        "한 묶음을 건넬 때마다 평판 50을 얻습니다.",
    ["Raise Timbermaw Hold standing to Neutral"] =
        "나무구렁 요새 평판을 중립까지 올리세요",
    ["The NPC stands within the passage."] =
        "NPC는 통로 안에 서 있습니다.",
    ["This foe is elite."] =
        "이 적은 정예입니다.",
    ["Target Black Broodlings with the item."] =
        "검은 새끼용에게 아이템을 사용하세요.",
    ["A red crystal hovers over each body."] =
        "시체마다 그 위에 붉은 수정이 떠 있습니다.",
    ["Hunt the huge red dragons."] =
        "거대한 붉은 용을 사냥하세요.",
    ["Look for gray standing stones."] =
        "회색 선돌을 찾으세요.",
    ["The target is an ogre."] =
        "대상은 오우거입니다.",
    ["Watch out, its blows are strong."] =
        "조심하세요, 공격이 강합니다.",
    ["The targets are wolves and orcs."] =
        "대상은 늑대와 오크입니다.",
    ["The NPC is an elderly human lady."] =
        "NPC는 나이 든 인간 여성입니다.",
    ["If absent, she can be on the house's upper floor, at 52.4, 42.1 in Stormwind City."] =
        "없다면 스톰윈드 52.4, 42.1에 있는 집 위층에 있을 수 있습니다.",
    ["Walk over the rope bridge, then climb the trail"] =
        "밧줄 다리를 건넌 다음 길을 올라가세요",
    ["The Plaguelands"] =
        "역병지대",
    ["Check each of the two floors indoors."] =
        "실내 두 층을 각각 확인하세요.",
    ["Stand at the watchtower's doorway."] =
        "감시탑 입구에 서세요.",
    ["An elite foe waits indoors; stay clear of it."] =
        "실내에 정예 적이 있으니 피하세요.",
    ["Spiders also appear at these spawn spots."] =
        "거미도 이 생성 위치에 나타납니다.",
    ["Look for a white set of bones."] =
        "흰 뼈 무더기를 찾으세요.",
    ["The targets appear in several places."] =
        "대상은 여러 곳에 나타납니다.",
    ["Finish Locked Away to obtain this."] =
        "Locked Away 퀘스트를 완료해야 얻습니다.",
    ["The target is a ghoul armed with a pitchfork."] =
        "대상은 쇠스랑을 든 구울입니다.",
    ["Elites roam close by; keep your distance."] =
        "근처에 정예가 돌아다니니 거리를 두세요.",
    ["Search the bones of a fallen person."] =
        "쓰러진 사람의 유골을 살펴보세요.",
    ["The NPC is within the ruined home."] =
        "NPC는 폐허가 된 집 안에 있습니다.",
    ["Search within the houses here."] =
        "이곳의 집 안을 찾아보세요.",
    ["Look for big yellow grubs."] =
        "큰 노란 애벌레를 찾으세요.",
    ["With the coming hand-ins, this gets you to level 58."] =
        "곧 있을 반납까지 하면 58레벨이 됩니다.",
    ["Flight master at Light's Hope Chapel"] =
        "희망의 빛 예배당 비행 조련사",
    ["Look for big rocks seeping green slime."] =
        "녹색 점액이 스며 나오는 큰 바위를 찾으세요.",
    ["Progress westward as you go."] =
        "가면서 서쪽으로 이동하세요.",
    ["Other undead compete for the same spawn points."] =
        "다른 언데드와 같은 생성 위치를 두고 경쟁합니다.",
    ["The spirits rise where those foes die."] =
        "그 적이 죽은 자리에서 영혼이 일어납니다.",
    ["Go down into the tomb"] =
        "무덤 안으로 내려가세요",
    ["This is below ground, on the crypt's lower floor."] =
        "지하, 묘실의 아래층에 있습니다.",
    ["Your character must be seated first."] =
        "먼저 캐릭터가 앉아 있어야 합니다.",
    ["Move the camera close and check which book is genuine."] =
        "카메라를 가까이 대고 어느 책이 진짜인지 확인하세요.",
    ["Some books are traps that summon foes."] =
        "일부 책은 적을 소환하는 함정입니다.",
    ["The genuine book can look two ways:"] =
        "진짜 책은 두 가지 모습일 수 있습니다:",
    ["Close to the big buildings lit in blue."] =
        "파랗게 불이 켜진 큰 건물 근처에 있습니다.",
    ["A new one may appear when one is killed."] =
        "하나를 처치하면 새로 나타날 수 있습니다.",
    ["The targets are in the ruined houses."] =
        "대상은 폐허가 된 집에 있습니다.",
    ["It shows up on top of the box."] =
        "상자 위에 나타납니다.",
    ["Targets are in the tower and around its base."] =
        "대상은 탑 안과 탑 아래 주변에 있습니다.",
    ["If an elite stands on the tower's roof, hold back outside."] =
        "탑 지붕에 정예가 있으면 밖에서 기다리세요.",
    ["Pick up Claw (Rank 8) for your pet."] =
        "소환수용 할퀴기 (8 레벨)를 배우세요.",
    ["Tame a Winterspring Screecher with the Tame Beast spell."] =
        "야수 길들이기 주문으로 비명소리 여명의설원 올빼미를 길들이세요.",
    ["Hunt the white owls."] =
        "흰 올빼미를 사냥하세요.",
    ["Either the patriarch or the matriarch yetis work."] =
        "수컷 우두머리 설인과 암컷 우두머리 설인 모두 됩니다.",
    ["Climb across the mountain to the far side"] =
        "산을 넘어 반대편으로 가세요",
    ["Hunt the chimaeras."] =
        "키메라를 사냥하세요.",
    ["Target Legacki with the item."] =
        "레각키에게 아이템을 사용하세요.",
    ["Target Sprinkle with it."] =
        "스프링클에게 사용하세요.",
    ["Target Quixxil with it."] =
        "퀵실에게 사용하세요.",
    ["Flight master at Cenarion Hold"] =
        "세나리온 요새 비행 조련사",
    ["Watch out: killing them can summon more foes."] =
        "조심하세요, 처치하면 적이 더 소환될 수 있습니다.",
    ["Look for fragments of rock that glow blue."] =
        "파랗게 빛나는 바위 조각을 찾으세요.",
    ["Roam the area where the insects swarm."] =
        "곤충이 떼 지어 있는 구역을 돌아다니세요.",
    ["Hunt the gray scorpids."] =
        "회색 전갈을 사냥하세요.",
    ["The target is an orc wearing violet robes."] =
        "대상은 보라색 로브를 입은 오크입니다.",
    ["It shows up around here."] =
        "이 주변에 나타납니다.",
    ["Hunt the yellow scorpids."] =
        "노란 전갈을 사냥하세요.",
    ["Target the burrowing worms."] =
        "땅굴 벌레를 노리세요.",
    ["This number shrinks while you kill monsters."] =
        "몬스터를 처치하면 이 수치가 줄어듭니다.",
    ["Bring any feathers you collect to the NPC at 64.8, 8.1."] =
        "모은 깃털은 64.8, 8.1의 NPC에게 가져가세요.",
    ["The NPC stands outdoors, next to the crypt."] =
        "NPC는 묘실 옆 바깥에 서 있습니다.",
    ["The targets are bats."] =
        "대상은 박쥐입니다.",
    ["Check in and around the structures."] =
        "건물 안팎을 확인하세요.",
    ["With the coming hand-ins, this gets you to level 5."] =
        "곧 있을 반납까지 하면 5레벨이 됩니다.",
    ["The target is a shambling zombie."] =
        "대상은 비틀거리는 좀비입니다.",
    ["The quest giver is an abomination."] =
        "퀘스트를 주는 NPC는 누더기골렘입니다.",
    ["He may step off the road now and then to pick plants."] =
        "가끔 식물을 캐려고 길에서 벗어날 수 있습니다.",
    ["Heal Deathguard Kel with Lesser Heal (Rank 2)."] =
        "하급 치유 (2 레벨)로 죽음의경비병 켈을 치유하세요.",
    ["Buff Deathguard Kel with Power Word: Fortitude."] =
        "죽음의경비병 켈에게 신의 권능: 인내를 걸어 주세요.",
    ["The targets are gray, demon-like hounds."] =
        "대상은 악마처럼 생긴 회색 사냥개입니다.",
    ["The targets are zombies."] =
        "대상은 좀비입니다.",
    ["Look for wilted violet weeds."] =
        "시든 보라색 풀을 찾으세요.",
    ["Walk the shoreline toward the southwest."] =
        "해안선을 따라 남서쪽으로 걸어가세요.",
    ["If the beach ends first, move on without it."] =
        "먼저 해변이 끝나면 그것 없이 다음으로 넘어가세요.",
    ["Keep to the trail as it curves."] =
        "굽은 길을 따라 계속 가세요.",
    ["Step into the flames."] =
        "불길 속으로 들어가세요.",
    ["Stay on the trail and keep climbing the steps"] =
        "길을 벗어나지 말고 계단을 계속 올라가세요",
    ["Loot the gray chests built from metal."] =
        "금속으로 만든 회색 상자에서 전리품을 챙기세요.",
    ["Search in and around the sunken wrecks."] =
        "가라앉은 난파선 안과 주변을 찾아보세요.",
    ["The target is a troll in crimson robes."] =
        "대상은 진홍색 로브를 입은 트롤입니다.",
    ["Look for the skull-shaped objects."] =
        "해골 모양의 물체를 찾으세요.",
    ["The targets are clumps of purple eggs."] =
        "대상은 보라색 알 무더기입니다.",
    ["Search close to the trunks."] =
        "나무줄기 가까이를 찾아보세요.",
    ["Stay on the trail, then cross the tunnel"] =
        "길을 따라가다가 터널을 지나가세요",
    ["Traverse the passageway"] =
        "통로를 지나가세요",
    ["Fly to Orgrimmar"] =
        "오그리마로 날아가세요",
    ["The quest comes from a bounty sign."] =
        "퀘스트는 현상수배 게시판에서 받습니다.",
    ["Look for an iron slab marked with a skull."] =
        "해골이 새겨진 철판을 찾으세요.",
    ["Use the item at the pink marking."] =
        "분홍색 표시에서 아이템을 사용하세요.",
    ["Move gradually northwest toward Agamand Mills."] =
        "아가만드 방앗간을 향해 북서쪽으로 조금씩 이동하세요.",
    ["The target is a skeletal caster in armor."] =
        "대상은 갑옷을 입은 해골 주문시전자입니다.",
    ["The target is a banshee."] =
        "대상은 밴시입니다.",
    ["The targets are skeletons in armor."] =
        "대상은 갑옷을 입은 해골입니다.",
    ["The targets are skeletal mages."] =
        "대상은 해골 마법사입니다.",
    ["Together with the next turn-ins, this brings you to level 13."] =
        "다음 퀘스트 완료와 함께 13레벨이 됩니다.",
    ["The target patrols the road from Brill to The Sepulcher."] =
        "대상은 브릴에서 공동묘지까지 길을 순찰합니다.",
    ["The target appears close to The Sepulcher, at 47.5, 39.8 in Silverpine Forest."] =
        "대상은 은빛소나무 숲 47.5, 39.8, 공동묘지 근처에 나타납니다.",
    ["Fight quilboars."] =
        "가시멧돼지와 싸우세요.",
    ["Look for little brown pinecones."] =
        "작은 갈색 솔방울을 찾으세요.",
    ["Hunt the black-feathered birds."] =
        "검은 깃털의 새를 사냥하세요.",
    ["Look for gray slabs of stone lying flat."] =
        "바닥에 눕혀진 회색 석판을 찾으세요.",
    ["Do not trail after the wolf."] =
        "늑대를 따라가지 마세요.",
    ["Take the lift to the top of Thunder Bluff"] =
        "승강기를 타고 썬더 블러프 꼭대기로 올라가세요",
    ["Beside the forge."] =
        "용광로 옆에 있습니다.",
    ["Take a lift down out of Thunder Bluff"] =
        "승강기를 타고 내려가 썬더 블러프를 나가세요",
    ["Aim the item at one Adult Plainstrider."] =
        "다자란 초원타조 한 마리에게 아이템을 사용하세요.",
    ["Target a Prairie Stalker with it."] =
        "긴발톱 초원늑대를 대상으로 사용하세요.",
    ["Use the item on any Swoop."] =
        "아무 검독수리에게나 아이템을 사용하세요.",
    ["Choose an animal of level 9-10 and make it your pet with the Tame Beast spell."] =
        "9-10레벨 동물을 골라 야수 길들이기 주문으로 소환수로 삼으세요.",
    ["This pet is temporary; a lasting one comes shortly."] =
        "이 소환수는 임시입니다. 곧 계속 데리고 다닐 소환수를 얻습니다.",
    ["Flight master at Camp Taurajo"] =
        "타우라조 야영지 비행 조련사",
    ["Fly to Thunder Bluff"] =
        "썬더 블러프로 날아가세요",
    ["Stick to the road and stay alert."] =
        "길을 벗어나지 말고 주의하세요.",
    ["Flight master at the Crossroads"] =
        "크로스로드 비행 조련사",
    ["This is food for your pet."] =
        "소환수에게 줄 먹이입니다.",
    ["A spirit shows up after this."] =
        "이후 정령이 나타납니다.",
    ["Find one Venomtail Scorpid and use Tame Beast on it."] =
        "맹독전갈 한 마리를 찾아 야수 길들이기를 사용하세요.",
    ["Release your current pet before this."] =
        "그 전에 지금 소환수를 놓아주세요.",
    ["Here you tame a pet to keep."] =
        "여기서 계속 데리고 다닐 소환수를 길들입니다.",
    ["The NPC waits at the mountain's summit."] =
        "NPC는 산 정상에서 기다립니다.",
    ["Kill Water Seekers and Thornweavers."] =
        "풍수사와 가시마술사를 처치하세요.",
    ["The objective is at the far end."] =
        "목표는 맨 끝에 있습니다.",
    ["Receive Sapta Sight"] =
        "대지의 정기 효과를 받으세요",
    ["The quest giver stands among the boulders."] =
        "퀘스트를 주는 NPC는 바위들 사이에 서 있습니다.",
    ["This NPC is found down in the Cleft of Shadow."] =
        "이 NPC는 아래쪽 어둠의 틈에 있습니다.",
    ["This clears the quest's time limit."] =
        "이렇게 하면 퀘스트 제한 시간이 사라집니다.",
    ["Fly to Undercity"] =
        "언더시티로 날아가세요",
    ["Orc and Troll start"] =
        "오크와 트롤 시작",
    ["Stay out of the cave when you can."] =
        "가능하면 동굴에 들어가지 마세요.",
    ["The following step is out of the cave."] =
        "다음 단계는 동굴 밖에 있습니다.",
    ["Look for a dark-shelled scorpion."] =
        "껍질이 어두운 전갈을 찾으세요.",
    ["Target Lazy Peons with the item."] =
        "게으른 일꾼에게 아이템을 사용하세요.",
    ["The targets are dozing orcs."] =
        "대상은 졸고 있는 오크입니다.",
    ["Look for cacti bearing red fruit."] =
        "빨간 열매가 달린 선인장을 찾으세요.",
    ["Heal Grunt Kor'ja with the second rank of Lesser Heal."] =
        "하급 치유 2 레벨로 그런트 코르자를 치유하세요.",
    ["Buff Grunt Kor'ja with Power Word: Fortitude."] =
        "그런트 코르자에게 신의 권능: 인내를 걸어 주세요.",
    ["Aim the item at one Dire Mottled Boar."] =
        "사나운 점박이멧돼지 한 마리에게 아이템을 사용하세요.",
    ["Use it on any Surf Crawler."] =
        "아무 붉은톱니게에게나 사용하세요.",
    ["Use it on any Armored Scorpid."] =
        "아무 등껍질전갈에게나 사용하세요.",
    ["This leads to a quest for later levels."] =
        "높은 레벨에서 할 퀘스트로 이어집니다.",
    ["Escort Deathstalker Erland and keep him alive."] =
        "죽음의추적자 엘런드를 호위하며 살려 두세요.",
    ["Hunt the wolves whose fur is jet black."] =
        "털이 새까만 늑대를 사냥하세요.",
    ["Pick one Ferocious Grizzled Bear and tame it with Tame Beast."] =
        "사나운 불곰 한 마리를 골라 야수 길들이기로 길들이세요.",
    ["Fly to The Sepulcher"] =
        "공동묘지로 날아가세요",
    ["He has three ghouls at his side."] =
        "구울 셋을 곁에 데리고 있습니다.",
    ["Hold off until one steps out, then slay it."] =
        "한 마리가 나올 때까지 기다렸다가 처치하세요.",
    ["The target shows up here sooner or later."] =
        "대상은 조만간 여기에 나타납니다.",
    ["The NPC is on Undercity's upper level."] =
        "NPC는 언더시티 위층에 있습니다.",
    ["The NPC is in a little cave."] =
        "NPC는 작은 동굴 안에 있습니다.",
    ["The NPC is past the big trogg chamber, on its right side."] =
        "NPC는 큰 트로그 방을 지나 오른쪽에 있습니다.",
    ["The quest giver waits in the tent."] =
        "퀘스트를 주는 NPC는 천막 안에서 기다립니다.",
    ["Move on if it is absent."] =
        "없으면 다음으로 넘어가세요.",
    ["If it isn't there, hold on until it shows up."] =
        "없으면 나타날 때까지 기다리세요.",
    ["Circle the mountain by its northern flank."] =
        "산의 북쪽 기슭으로 돌아가세요.",
    ["The target is a troll."] =
        "대상은 트롤입니다.",
    ["The target is a human in a crimson long coat."] =
        "대상은 진홍색 긴 외투를 입은 인간입니다.",
    ["The targets are the striped zhevras."] =
        "대상은 줄무늬 얼룩말입니다.",
    ["Go into the water beside the rock that bubbles."] =
        "거품이 이는 바위 옆 물속으로 들어가세요.",
    ["Look for big blue fungi."] =
        "큰 파란 버섯을 찾으세요.",
    ["Up to two foes might jump you."] =
        "최대 둘까지 적이 덮칠 수 있습니다.",
    ["Kill the purple raptors."] =
        "보라색 랩터를 처치하세요.",
    ["Targets are found across the entire Barrens."] =
        "대상은 불모의 땅 전역에 있습니다.",
    ["Slay any you come across along the way."] =
        "가는 길에 만나는 대로 처치하세요.",
    ["With the coming hand-ins, this gets you to level 18."] =
        "곧 있을 퀘스트 완료와 함께 18레벨이 됩니다.",
    ["Steal from Gamon using Pick Pocket."] =
        "소매치기로 가몬의 물건을 훔치세요.",
    ["Use it on Tazan's Satchel."] =
        "타잔의 가방에 사용하세요.",
    ["The item is already in your inventory."] =
        "아이템은 이미 가방에 있습니다.",
    ["Check the upper and lower tiers of the structure."] =
        "건물의 위층과 아래층을 확인하세요.",
    ["Escort Wizzlecrank's Shredder and keep it intact."] =
        "위즐크랭크의 벌목기를 호위하며 부서지지 않게 지키세요.",
    ["Look for gray steel pails."] =
        "회색 강철 양동이를 찾으세요.",
    ["The target is a pale lion."] =
        "대상은 창백한 사자입니다.",
    ["It turns up in the area."] =
        "이 지역에 나타납니다.",
    ["Keep away from Sister Rathtalon."] =
        "마녀 라스탈론에게서 떨어져 있으세요.",
    ["The target is a harpy with emerald plumage; beware, it is elite."] =
        "대상은 에메랄드색 깃털의 하피입니다. 정예이니 조심하세요.",
    ["The target circles in the air, so search around."] =
        "대상이 공중을 맴도니 주변을 찾아보세요.",
    ["A small chest made of wood."] =
        "나무로 만든 작은 상자입니다.",
    ["Polly is the target for the item."] =
        "아이템 사용 대상은 앵무새입니다.",
    ["Defeat Kolkar foes around Stagnant Oasis."] =
        "죽은 오아시스 주변의 콜카르일족 적을 처치하세요.",
    ["Sooner or later a yell shows up in the chat window."] =
        "조만간 대화창에 외침이 나타납니다.",
    ["Watch for his yell: I am summoned!"] =
        "그의 외침을 기다리세요: 내가 소환되었다!",
    ["Verog arrives after a shout dares intruders to his tent to die."] =
        "침입자들에게 천막으로 와서 죽으라는 외침이 들린 뒤 베로그가 나타납니다.",
    ["Escort Kaya Flathoof and keep her safe."] =
        "카야 플랫후프를 호위하며 안전하게 지키세요.",
    ["Close to the finish, 3 foes ambush you together."] =
        "끝날 무렵 적 3명이 한꺼번에 기습합니다.",
    ["Fly to Sun Rock Retreat"] =
        "해바위 야영지로 날아가세요",
    ["Gather the big, white eggs."] =
        "크고 하얀 알을 모으세요.",
    ["Monsters might jump you here."] =
        "여기서 몬스터가 덮칠 수 있습니다.",
    ["Hatchling spiders may bring a level 22 spider."] =
        "새끼 거미가 22레벨 거미를 데려올 수 있습니다.",
    ["Together with the next turn-ins, this brings you to level 20."] =
        "다음 퀘스트 완료와 함께 20레벨이 됩니다.",
    ["Look for a kodo with grey hide."] =
        "회색 가죽의 코도를 찾으세요.",
    ["The targets are big pink lizards."] =
        "대상은 큰 분홍색 도마뱀입니다.",
    ["The targets are under the water and along the shore."] =
        "대상은 물속과 물가를 따라 있습니다.",
    ["The target is a raptor."] =
        "대상은 랩터입니다.",
    ["Trade your Blood Shards to gain buffs."] =
        "혈석 파편을 교환해 강화 효과를 받으세요.",
    ["Trade any spare Blood Shards to him during your Barrens questing."] =
        "불모의 땅 퀘스트 중에 남는 혈석 파편은 그와 교환하세요.",
    ["Ask him for the Spirit of the Wind buff"] =
        "그에게 Spirit of the Wind 강화 효과를 받으세요",
    ["Hunt the winged serpents."] =
        "날개 달린 뱀을 사냥하세요.",
    ["Take the lift up into Thunder Bluff"] =
        "승강기를 타고 썬더 블러프로 올라가세요",
    ["The object is a vase woven from wicker."] =
        "버들가지로 엮은 항아리입니다.",
    ["They appear in scattered spots."] =
        "여기저기 흩어져 나타납니다.",
    ["Climb the mountainside"] =
        "산비탈을 오르세요",
    ["Descend the slope"] =
        "비탈을 내려가세요",
    ["Drop with care onto the rock, then go into the cave"] =
        "바위 위로 조심해서 뛰어내린 다음 동굴로 들어가세요",
    ["The targets are oozes."] =
        "대상은 수액괴물입니다.",
    ["Look for little green shrubs bearing violet blooms."] =
        "보라색 꽃이 핀 작은 초록 덤불을 찾으세요.",
    ["A centaur flanked by two bodyguards."] =
        "경호원 둘을 거느린 켄타우로스입니다.",
    ["Climb the trail and cross the peaks"] =
        "길을 올라 봉우리를 넘어가세요",
    ["Look for a robot shaped like a person."] =
        "사람 모양의 로봇을 찾으세요.",
    ["The target appears right here."] =
        "대상은 바로 여기에 나타납니다.",
    ["Take the passage and trace the lantern trail into Ashenvale"] =
        "통로로 들어가 등불이 늘어선 길을 따라 잿빛 골짜기로 가세요",
    ["Stay clear of Astranaar."] =
        "아스트라나르는 피하세요.",
    ["Exit the tunnel into Ashenvale"] =
        "터널을 나가 잿빛 골짜기로 가세요",
    ["Flight master at Zoram'gar Outpost"] =
        "조람가르 전초기지 비행 조련사",
    ["The NPC waits within the hut."] =
        "NPC는 오두막 안에서 기다립니다.",
    ["Use it twice on Taskmaster Fizzule."] =
        "감독관 피줄에게 두 번 사용하세요.",
    ["A short way north of here."] =
        "여기서 북쪽으로 조금 가면 있습니다.",
    ["Target Taskmaster Fizzule and salute him."] =
        "감독관 피줄을 대상으로 지정하고 경례하세요.",
    ["Rob Foreman Silixiz with Pick Pocket."] =
        "소매치기로 현장감독 실릭시즈의 물건을 훔치세요.",
    ["Open with Ambush for a bigger hit."] =
        "매복으로 시작하면 더 큰 피해를 줍니다.",
    ["Lean on Rupture for bonus damage."] =
        "파열로 추가 피해를 주세요.",
    ["Eviscerate adds a burst of damage here."] =
        "여기서는 절개로 순간 피해를 더하세요.",
    ["The objective is on the terrace above."] =
        "목표는 위쪽 테라스에 있습니다.",
    ["Use Pick Lock to open it."] =
        "자물쇠 따기로 여세요.",
    ["Poison crafting needs these."] =
        "독 제조에 필요합니다.",
    ["Flight master at Tarren Mill"] =
        "타렌 밀농장 비행 조련사",
    ["Get rid of your Touch of Zanzil."] =
        "잔질의 손길을 없애세요.",
    ["Pick any Gray Bear and use Tame Beast on it."] =
        "아무 회색곰이나 골라 야수 길들이기를 사용하세요.",
    ["Go into Durnholde Keep, then over the bridge"] =
        "던홀드 요새에 들어간 다음 다리를 건너세요",
    ["Look for it bound to the orc's leg."] =
        "오크의 다리에 묶여 있으니 찾아보세요.",
    ["Together with the next turn-ins, this brings you to level 23."] =
        "다음 퀘스트 완료와 함께 23레벨이 됩니다.",
    ["Indoors or out in the open fields."] =
        "실내나 탁 트인 들판에 있습니다.",
    ["It may be found outdoors too."] =
        "바깥에도 있을 수 있습니다.",
    ["The NPC is a little wolf."] =
        "NPC는 작은 늑대입니다.",
    ["He goes berserk and attacks you once the quest is handed in."] =
        "퀘스트를 완료하면 그가 광폭해져 공격합니다.",
    ["A woman holding a pitchfork."] =
        "쇠스랑을 든 여자입니다.",
    ["The target patrols the trail between the houses."] =
        "대상은 집들 사이의 길을 순찰합니다.",
    ["The target's spawn point is 30.5, 40.6 in Hillsbrad Foothills."] =
        "대상의 생성 위치는 힐스브래드 구릉지 30.5, 40.6입니다.",
    ["With the coming hand-ins, this brings you to level 24."] =
        "곧 있을 퀘스트 완료와 함께 24레벨이 됩니다.",
    ["Tougher foes are coming up next."] =
        "다음에는 더 강한 적이 나옵니다.",
    ["Some may be in the smithy."] =
        "일부는 대장간에 있을 수 있습니다.",
    ["The NPC is in the yard where black wolves roam."] =
        "NPC는 검은 늑대가 돌아다니는 마당에 있습니다.",
    ["Do this once the prisoner is free."] =
        "포로를 풀어 준 뒤에 하세요.",
    ["The tome is blue, resting on a bookshelf."] =
        "책장에 놓인 파란 책입니다.",
    ["Look in the room where Fenrus is."] =
        "파멸의 펜루스가 있는 방을 찾아보세요.",
    ["The target is a dinosaur with blue hide."] =
        "대상은 파란 가죽의 공룡입니다.",
    ["Look for big boulders oozing green fluid."] =
        "녹색 액체가 새어 나오는 큰 바위를 찾으세요.",
    ["The target is a quilboar robed in red."] =
        "대상은 빨간 로브를 입은 가시멧돼지입니다.",
    ["Kill Stalkers and Pathfinders."] =
        "추적자와 길잡이를 처치하세요.",
    ["The target is a red winged serpent."] =
        "대상은 빨간 날개 달린 뱀입니다.",
    ["The target roams; check the area."] =
        "대상이 돌아다니니 주변을 확인하세요.",
    ["Keep some range when you use the item."] =
        "아이템을 사용할 때는 거리를 두세요.",
    ["With the coming hand-ins, this gets you to level 25."] =
        "곧 있을 퀘스트 완료와 함께 25레벨이 됩니다.",
    ["Fly to Brackenwall Village"] =
        "담쟁이 마을로 날아가세요",
    ["The target is an aquatic dinosaur."] =
        "대상은 수생 공룡입니다.",
    ["The target roams through the water."] =
        "대상은 물속을 돌아다닙니다.",
    ["The target is beneath the platform."] =
        "대상은 단 아래에 있습니다.",
    ["The target stands atop the timber platform."] =
        "대상은 나무 단 위에 서 있습니다.",
    ["Exit Windshear Crag"] =
        "칼바람 바위산을 나가세요",
    ["The targets are deer."] =
        "대상은 사슴입니다.",
    ["The targets are tiny blue dragons."] =
        "대상은 아주 작은 파란 용입니다.",
    ["Hunt the green slimes."] =
        "녹색 수액괴물을 사냥하세요.",
    ["Corrosive Sap Beasts use the same spawn points."] =
        "부식성 수액괴물도 같은 생성 위치를 씁니다.",
    ["Do not engage Sentinel Amarassan."] =
        "파수꾼 아마랏산과 싸우지 마세요.",
    ["The quarry is a kaldorei elite, level 27."] =
        "대상은 27레벨 정예 칼도레이입니다.",
    ["Exit Stonetalon Peak"] =
        "돌발톱 봉우리를 나가세요",
    ["Look for brown pinecones on the ground."] =
        "땅에 떨어진 갈색 솔방울을 찾으세요.",
    ["Steer clear of the elite windstrider."] =
        "정예 바람걸음이는 피하세요.",
    ["Basilisks and moving tree creatures share these spawn points."] =
        "바실리스크와 움직이는 나무 생물이 생성 위치를 공유합니다.",
    ["Monsters are found throughout the Charred Vale."] =
        "몬스터는 잿더미 계곡 곳곳에 있습니다.",
    ["Take the trail toward Sun Rock Retreat"] =
        "해바위 야영지 쪽 길로 가세요",
    ["Stay on the trail until the Charred Vale"] =
        "잿더미 계곡까지 길을 따라가세요",
    ["The NPC is on the tower's middle floor."] =
        "NPC는 탑의 중간층에 있습니다.",
    ["Flight master at Splintertree Post"] =
        "토막나무 주둔지 비행 조련사",
    ["The targets are night elves hiding in stealth."] =
        "대상은 은신한 나이트 엘프입니다.",
    ["Track Hidden makes them simpler to spot."] =
        "은신 추적을 쓰면 더 쉽게 찾을 수 있습니다.",
    ["Escort Torek and guard him."] =
        "토렉을 호위하며 지키세요.",
    ["Don't let him die."] =
        "죽지 않게 하세요.",
    ["Take the riverside trail, then climb this trail"] =
        "강가 길로 간 다음 이 길을 오르세요",
    ["The target is a panther with black fur."] =
        "대상은 검은 털의 표범입니다.",
    ["The target roams a wide route."] =
        "대상은 넓은 경로를 돌아다닙니다.",
    ["The target appears close to 62.4, 50.0 in Ashenvale."] =
        "대상은 잿빛 골짜기 62.4, 50.0 근처에 나타납니다.",
    ["Take the trail north into Thistlefur Hold"] =
        "북쪽 길로 Thistlefur Hold에 들어가세요",
    ["Search the brown crates built of timber."] =
        "목재로 만든 갈색 상자를 뒤지세요.",
    ["Mostly on the cavern's upper level."] =
        "주로 동굴 위층에 있습니다.",
    ["The NPC is on the cave's lowest level."] =
        "NPC는 동굴 맨 아래층에 있습니다.",
    ["Escort Ruul Snowhoof and keep him alive."] =
        "루울 스노우후프를 호위하며 살려 두세요.",
    ["Look for a gray druid-style bear."] =
        "드루이드처럼 생긴 회색 곰을 찾으세요.",
    ["The target is a watery being tinted a deeper green."] =
        "대상은 짙은 녹색을 띤 물의 존재입니다.",
    ["Together with the next turn-ins, this brings you to level 28."] =
        "다음 퀘스트 완료와 함께 28레벨이 됩니다.",
    ["Steer away from Silverwind Refuge."] =
        "실바람 산장은 피하세요.",
    ["Climb the trail, then return by road to Splintertree Post"] =
        "길을 오른 다음 큰길로 토막나무 주둔지에 돌아가세요",
    ["Escort Muglash and keep him safe."] =
        "머그래쉬를 호위하며 안전하게 지키세요.",
    ["If the item isn't usable yet, hold on a moment."] =
        "아직 아이템을 사용할 수 없으면 잠시 기다리세요.",
    ["Go into the Blackfathom Deeps instance"] =
        "검은심연의 나락 인스턴스에 들어가세요",
    ["In Blackfathom Deeps, naga enemies drop it."] =
        "검은심연의 나락에서 나가 적이 떨어뜨립니다.",
    ["The targets are all over the tunnels."] =
        "대상은 터널 곳곳에 있습니다.",
    ["Collect the azure shards along the cavern sides in Blackfathom Deeps."] =
        "검은심연의 나락 동굴 벽을 따라 있는 하늘색 파편을 모으세요.",
    ["Head to the Moonshrine Ruins for this."] =
        "이를 위해 Moonshrine Ruins로 가세요.",
    ["Head back to Splintertree Post"] =
        "토막나무 주둔지로 돌아가세요",
    ["Your quarry is a huge azure bird of level 31."] =
        "대상은 31레벨의 거대한 하늘색 새입니다.",
    ["The target circles over a wide area."] =
        "대상은 넓은 지역을 맴돕니다.",
    ["It appears near 78.0, 66.0 in Ashenvale."] =
        "잿빛 골짜기 78.0, 66.0 부근에 나타납니다.",
    ["Take a lift down to Thousand Needles, walk the road toward Freewind Post, then a lift back up"] =
        "승강기를 타고 버섯구름 봉우리로 내려가 길을 따라 높새바람 봉우리로 간 다음 승강기를 타고 다시 올라가세요",
    ["Fly to Freewind Post"] =
        "높새바람 봉우리로 날아가세요",
    ["A pair of level 30 foes stand guard over it."] =
        "30레벨 적 둘이 지키고 있습니다.",
    ["Use the teleporter to reach the Plateau"] =
        "순간이동기를 사용해 고원으로 가세요",
    ["Go back to Dorn Plainstalker"] =
        "도른 플레인스토커에게 돌아가세요",
    ["This won't kill you."] =
        "이것으로 죽지는 않습니다.",
    ["Kill Surveyors and Diggers."] =
        "감시관과 채굴꾼을 처치하세요.",
    ["Take the lift upward"] =
        "승강기를 타고 올라가세요",
    ["Look for big eggs."] =
        "큰 알을 찾으세요.",
    ["Keep away from Heartrazor."] =
        "칼날심장에게서 떨어져 있으세요.",
    ["Steelsnap is a brown hyena with 2 hyena escorts."] =
        "Steelsnap은 하이에나 호위 2마리를 거느린 갈색 하이에나입니다.",
    ["The target appears near 17.3, 22.2 in Thousand Needles."] =
        "대상은 버섯구름 봉우리 17.3, 22.2 근처에 나타납니다.",
    ["The target is a centaur, black in color."] =
        "대상은 검은색 켄타우로스입니다.",
    ["It roams a wide route."] =
        "넓은 경로를 돌아다닙니다.",
    ["Leave it out if you'd rather not hunt for it."] =
        "찾아다니기 싫다면 건너뛰세요.",
    ["His patrol crosses this spot two times."] =
        "그의 순찰 경로는 이곳을 두 번 지나갑니다.",
    ["Expect three foes to strike."] =
        "적 셋이 공격해 올 것에 대비하세요.",
    ["Fight off the foes that come at you"] =
        "덤벼드는 적을 물리치세요",
    ["Look for thorny plants."] =
        "가시가 있는 식물을 찾으세요.",
    ["Hard quests are coming up."] =
        "어려운 퀘스트가 이어집니다.",
    ["Climb the trail and cross the rope bridges"] =
        "길을 올라 밧줄 다리를 건너세요",
    ["The objective lies atop the mesa."] =
        "목표는 바위 고원 위에 있습니다.",
    ["The target is a level 28 elite."] =
        "대상은 28레벨 정예입니다.",
    ["You can defeat it alone without much trouble."] =
        "혼자서도 어렵지 않게 처치할 수 있습니다.",
    ["Escort Lakota Windsong safely to the end."] =
        "라코타 윈드송을 끝까지 안전하게 호위하세요.",
    ["On every plateau, a pair of foes spawns."] =
        "고원마다 적 둘이 나타납니다.",
    ["Be ready: this opponent is an elite at level 30."] =
        "대비하세요. 이 상대는 30레벨 정예입니다.",
    ["Leave it if it proves too hard."] =
        "너무 어려우면 건너뛰세요.",
    ["Climb the road into Feralas"] =
        "길을 올라 페랄라스로 가세요",
    ["Should you die, come back to life at Camp Mojache."] =
        "죽으면 모자케 야영지에서 되살아나세요.",
    ["Fly to Camp Mojache"] =
        "모자케 야영지로 날아가세요",
    ["Get Water Sapta done as well."] =
        "Water Sapta도 함께 완료하세요.",
    ["You'll need this to pick up an upcoming quest."] =
        "다음에 받을 퀘스트에 필요합니다.",
    ["Leap up and take the trail behind that tree"] =
        "뛰어올라 저 나무 뒤의 길로 가세요",
    ["Head north along the river to reach the NPC."] =
        "강을 따라 북쪽으로 가면 NPC가 있습니다.",
    ["Draw foes one at a time if you can."] =
        "가능하면 적을 하나씩 끌어오세요.",
    ["Do not take on the whole group together."] =
        "무리 전체와 한꺼번에 싸우지 마세요.",
    ["Descend the ramp, then stay on the trail"] =
        "비탈길을 내려간 다음 길을 따라가세요",
    ["Climb the trail to the cave's highest level"] =
        "길을 올라 동굴 맨 위층으로 가세요",
    ["When nearly dead, it calls two guards."] =
        "거의 죽어 갈 때 경비병 둘을 부릅니다.",
    ["Warden Belamoore stands guard over it."] =
        "관리인 벨라무어가 지키고 있습니다.",
    ["The target is a mage of level 36."] =
        "대상은 36레벨 마법사입니다.",
    ["Fight Kegan, breaking her line of sight with doors and stairways."] =
        "문과 계단으로 시야를 끊으며 케간과 싸우세요.",
    ["While Shield Guards glow, stop your melee attacks on them."] =
        "수호기사가 빛나는 동안에는 근접 공격을 멈추세요.",
    ["Expect heavy damage from it."] =
        "큰 피해를 입을 수 있습니다.",
    ["Together with the next turn-ins, this brings you to level 32."] =
        "다음 퀘스트 완료와 함께 32레벨이 됩니다.",
    ["Gather the big fungi."] =
        "큰 버섯을 모으세요.",
    ["The targets are out in front of the cavern."] =
        "대상은 동굴 앞에 있습니다.",
    ["Flight master at Hammerfall"] =
        "해머폴 비행 조련사",
    ["Stay away from Refuge Pointe."] =
        "임시 주둔지는 피하세요.",
    ["Together with the next turn-ins, this brings you to level 33."] =
        "다음 퀘스트 완료와 함께 33레벨이 됩니다.",
    ["Head out of the Apothecarium"] =
        "연금술 실험실을 나가세요",
    ["Hive Drones compete for these spawn points."] =
        "일꾼 실리시드와 생성 위치를 나눠 씁니다.",
    ["The NPC is on the building's ground level."] =
        "NPC는 건물 1층에 있습니다.",
    ["The quest giver is in the Dormitory."] =
        "퀘스트를 주는 NPC는 Dormitory에 있습니다.",
    ["Escort Kernobee to the portal at the dungeon's mouth."] =
        "케르노비를 던전 입구의 차원문까지 호위하세요.",
    ["Open the gray chest built of metal."] =
        "금속으로 만든 회색 상자를 여세요.",
    ["Close to the north wall."] =
        "북쪽 벽 가까이에 있습니다.",
    ["It shares a chamber with Mekgineer Thermaplugg."] =
        "멕기니어 텔마플러그와 같은 방에 있습니다.",
    ["Plan on killing monsters for quite some time."] =
        "꽤 오랫동안 몬스터를 잡을 각오를 하세요.",
    ["Other satyrs use the same spawn points."] =
        "다른 사티로스도 같은 생성 위치를 씁니다.",
    ["Take the trail toward Shadowprey Village"] =
        "그늘수렵 마을 쪽 길로 가세요",
    ["Fly to Shadowprey Village"] =
        "그늘수렵 마을로 날아가세요",
    ["Defeat every foe in this chamber before starting."] =
        "시작하기 전에 이 방의 적을 모두 처치하세요.",
    ["Target Burning Blade foes with the item."] =
        "불타는칼날단 적에게 아이템을 사용하세요.",
    ["Wait for the foe to be badly hurt, then apply it."] =
        "적이 크게 다칠 때까지 기다렸다가 사용하세요.",
    ["Look for big white clams."] =
        "큰 하얀 조개를 찾으세요.",
    ["Flight master at Grom'gol"] =
        "그롬골 주둔지 비행 조련사",
    ["They appear in the same spots as the panthers."] =
        "표범과 같은 위치에 나타납니다.",
    ["Watch for Shadowmaw Panthers; they are hidden by stealth."] =
        "그림자퓨마를 조심하세요. 은신해 있습니다.",
    ["Tigers compete for the same spawn points."] =
        "호랑이와 생성 위치를 나눠 씁니다.",
    ["The NPC is on the building's lowest floor"] =
        "NPC는 건물 맨 아래층에 있습니다",
    ["Climb the steps"] =
        "계단을 오르세요",
    ["You won't find an ammunition seller."] =
        "탄약 상인이 없습니다.",
    ["Guard \"Stinky\" Ignatz as you escort him."] =
        "\"말썽꾼\" 이그나츠를 호위하며 지키세요.",
    ["Hunt the orange spiders."] =
        "주황색 거미를 사냥하세요.",
    ["Watch out: Darkfang Lurkers hide in stealth."] =
        "조심하세요. 검은송곳니 늑대거미는 은신해 있습니다.",
    ["Escort Ogron, guarding him from attackers."] =
        "오그론을 호위하며 공격자로부터 지키세요.",
    ["Keep out of Theramore Isle."] =
        "테라모어 섬에는 들어가지 마세요.",
    ["Let yourself drown for a quick trip."] =
        "빨리 이동하려면 일부러 익사하세요.",
    ["Save it: the warrior's Whirlwind weapon questline asks for it."] =
        "보관하세요. 전사의 소용돌이 무기 연계 퀘스트에 필요합니다.",
    ["Alterac and Arathi"] =
        "알터랙과 아라시",
    ["Get ready to take down an elite of level 40 shortly."] =
        "곧 40레벨 정예를 처치할 준비를 하세요.",
    ["Quaff one potion right away so it is ready again later."] =
        "나중에 다시 쓸 수 있도록 지금 물약을 하나 마시세요.",
    ["It wanders to the mouth of the cave."] =
        "동굴 입구까지 돌아다닙니다.",
    ["Look on the upper floor as well."] =
        "위층도 찾아보세요.",
    ["Climb the slope, then leap the wall"] =
        "비탈을 오른 다음 벽을 뛰어넘으세요",
    ["Fly to Kargath"] =
        "카르가스로 날아가세요",
    ["Stranglethorn and Swamp of Sorrows"] =
        "가시덤불 골짜기와 슬픔의 늪",
    ["Go along the shore, then climb the trail"] =
        "물가를 따라간 다음 길을 오르세요",
    ["Keep clear of Darkshire."] =
        "다크샤이어는 피하세요.",
    ["Flight master at Stonard"] =
        "스토나드 비행 조련사",
    ["Look for assorted little brown items."] =
        "여러 가지 작은 갈색 물건을 찾으세요.",
    ["Look for purple rings made of rock."] =
        "돌로 된 보라색 고리를 찾으세요.",
    ["A guardian shows up."] =
        "수호자가 나타납니다.",
    ["Stay clear of Lord Azrethoc."] =
        "제왕 아즈레토크는 피하세요.",
    ["An elite winged fiend of level 40 with brown hide."] =
        "갈색 가죽의 40레벨 정예 날개 달린 괴물입니다.",
    ["The target wanders close by; look around."] =
        "대상이 근처를 돌아다니니 주변을 살펴보세요.",
    ["You can handle this alone without much trouble."] =
        "혼자서도 어렵지 않게 해낼 수 있습니다.",
    ["A tougher foe is coming up."] =
        "더 강한 적이 나옵니다.",
    ["Grab the loot."] =
        "전리품을 챙기세요.",
    ["The target is a crocodile with white scales."] =
        "대상은 하얀 비늘의 악어입니다.",
    ["The target roams a wide loop through the water."] =
        "대상은 물속에서 넓게 돌아다닙니다.",
    ["Accepting this starts a 2 hour countdown."] =
        "수락하면 2시간 제한 시간이 시작됩니다.",
    ["The timer keeps running while you're offline."] =
        "접속하지 않은 동안에도 시간이 흐릅니다.",
    ["Take this quest only when you have time to spare."] =
        "시간이 넉넉할 때만 이 퀘스트를 받으세요.",
    ["Watch out for a pair of stronger monsters here."] =
        "여기서는 더 강한 몬스터 둘을 조심하세요.",
    ["Look for the NPC dressed in red armor."] =
        "빨간 갑옷을 입은 NPC를 찾으세요.",
    ["Climb the trail to Gordunni Outpost"] =
        "길을 올라 골두니 전초기지로 가세요",
    ["Beside the shining blue rings on the ground."] =
        "땅 위의 빛나는 파란 고리 옆에 있습니다.",
    ["Look for earth mounds that pop up."] =
        "솟아오르는 흙더미를 찾으세요.",
    ["Ones holding the quest item shine blue."] =
        "퀘스트 아이템을 가진 것은 파랗게 빛납니다.",
    ["Fight the tauren."] =
        "타우렌과 싸우세요.",
    ["The target is a winged green bug, level 47."] =
        "대상은 47레벨의 날개 달린 녹색 벌레입니다.",
    ["You can likely beat it at your current level."] =
        "지금 레벨로도 이길 수 있을 것입니다.",
    ["Kill bugs."] =
        "벌레를 처치하세요.",
    ["Extra targets lurk in the bug caverns."] =
        "벌레 동굴에도 대상이 더 있습니다.",
    ["Stay on the road"] =
        "길을 따라가세요",
    ["The targets are ghosts that materialize."] =
        "대상은 실체화되는 유령입니다.",
    ["No drops come from Stagwings and Skystormers."] =
        "Stagwing과 Skystormer에게서는 나오지 않습니다.",
    ["Saves you some monster farming afterward."] =
        "나중에 몬스터 사냥을 조금 줄여 줍니다.",
    ["You need Chapter I as well as Chapter II."] =
        "제1장과 제2장이 모두 필요합니다.",
    ["It doesn't show up often."] =
        "자주 나타나지 않습니다.",
    ["The NPC waits on the house's upper-floor terrace."] =
        "NPC는 집 위층 테라스에서 기다립니다.",
    ["Take the road until the trail starts"] =
        "오솔길이 시작될 때까지 큰길로 가세요",
    ["Circle the mountain on the trail, then climb it"] =
        "길을 따라 산을 돈 다음 올라가세요",
    ["Kill the crocodiles."] =
        "악어를 처치하세요.",
    ["Stay out of Swamp Talker's way."] =
        "수다쟁이 늪지멀록을 피하세요.",
    ["Hunt down the gray murloc; it is level 50."] =
        "50레벨 회색 멀록을 사냥하세요.",
    ["Tanaris and Dustwallow"] =
        "타나리스와 먼지진흙 습지대",
    ["Watch out for foes hidden in stealth."] =
        "은신한 적을 조심하세요.",
    ["Look for brown eggs covered in spikes."] =
        "가시로 덮인 갈색 알을 찾으세요.",
    ["Buy plenty of arrows or bullets."] =
        "화살이나 탄환을 넉넉히 사세요.",
    ["Stock up first: nobody in the Hinterlands sells arrows or bullets for level 40."] =
        "미리 사 두세요. 동부 내륙지에는 40레벨용 화살이나 탄환을 파는 상인이 없습니다.",
    ["Take the road that circles the peak, then descend the trail"] =
        "봉우리를 도는 큰길로 간 다음 길을 내려가세요",
    ["Flight master at Revantusk Village"] =
        "레반터스크 마을 비행 조련사",
    ["A trio of enemies attacks."] =
        "적 셋이 공격합니다.",
    ["Look for a little silver pail holding tools."] =
        "도구가 담긴 작은 은색 양동이를 찾으세요.",
    ["The targets are big eagle-like beasts."] =
        "대상은 독수리처럼 생긴 큰 야수입니다.",
    ["Wolves and owlbeasts use these spawn spots as well."] =
        "늑대와 올빼미곰도 이 생성 위치를 씁니다.",
    ["Look for crates made of wood."] =
        "나무로 만든 상자를 찾으세요.",
    ["The targets are wolves hidden in stealth."] =
        "대상은 은신한 늑대입니다.",
    ["Steer clear of hostile Alliance NPCs."] =
        "적대적인 얼라이언스 NPC는 피하세요.",
    ["Warning: this turns on your PvP flag."] =
        "주의: PvP 상태가 됩니다.",
    ["Head into Shadra'Alor"] =
        "샤드라알로로 들어가세요",
    ["Get out of Shadra'Alor"] =
        "샤드라알로를 나가세요",
    ["Feralas and Un'Goro"] =
        "페랄라스와 운고로",
    ["The targets are hippogryphs."] =
        "대상은 히포그리프입니다.",
    ["Use it on the stone giant foes."] =
        "바위 거인 적에게 사용하세요.",
    ["You have 2 hours before it disappears."] =
        "사라지기 전까지 2시간이 있습니다.",
    ["Watch out: this foe is a level 50 elite."] =
        "조심하세요. 이 적은 50레벨 정예입니다.",
    ["You can likely do it alone."] =
        "혼자서도 할 수 있을 것입니다.",
    ["The NPC turns hostile and fights you."] =
        "NPC가 적대적으로 변해 공격합니다.",
    ["The target yields at roughly 30% health."] =
        "대상은 생명력이 약 30%가 되면 항복합니다.",
    ["The NPC roams the trail close to Kargath."] =
        "NPC는 카르가스 근처의 길을 돌아다닙니다.",
    ["The NPC gives the quest only while at this spot."] =
        "NPC는 이 자리에 있을 때만 퀘스트를 줍니다.",
    ["If the NPC is away, stay until he comes back."] =
        "NPC가 자리에 없으면 돌아올 때까지 기다리세요.",
    ["Burning Steppes and Azshara"] =
        "불타는 평원과 아즈샤라",
    ["Pass through Blackrock Mountain into Burning Steppes"] =
        "검은바위 산을 지나 불타는 평원으로 가세요",
    ["Fly to Flame Crest"] =
        "화염 마루로 날아가세요",
    ["It lies atop a stone slab."] =
        "석판 위에 놓여 있습니다.",
    ["The following quest needs you at level 52."] =
        "다음 퀘스트는 52레벨이 필요합니다.",
    ["Ammunition can't be bought here."] =
        "여기서는 탄약을 살 수 없습니다.",
    ["Flight master at Valormok"] =
        "발로르모크 비행 조련사",
    ["Look for a rectangular slab etched with green glyphs."] =
        "녹색 문양이 새겨진 직사각형 석판을 찾으세요.",
    ["Look for an oblong slab carved with pink glyphs."] =
        "분홍색 문양이 새겨진 길쭉한 석판을 찾으세요.",
    ["A rectangular slab carved with blue glyphs."] =
        "파란 문양이 새겨진 직사각형 석판입니다.",
    ["Seek a carved slab of rock bearing golden glyphs."] =
        "금색 문양이 새겨진 석판을 찾으세요.",
    ["The NPC is in the tower, which has several floors."] =
        "NPC는 여러 층으로 된 탑 안에 있습니다.",
    ["Felwood and Winterspring"] =
        "악령의 숲과 여명의 설원",
    ["Walk west beside the river"] =
        "강을 따라 서쪽으로 걸어가세요",
    ["Fly to Bloodvenom Post"] =
        "피멍울 초소로 날아가세요",
    ["Together with the next turn-ins, this brings you to level 53."] =
        "다음 퀘스트 완료와 함께 53레벨이 됩니다.",
    ["Hold on to it for a task in Un'Goro Crater later."] =
        "나중에 운고로 분화구에서 쓸 일이 있으니 보관하세요.",
    ["Get onto the massive incline."] =
        "거대한 비탈 위로 올라가세요.",
    ["Watch out for elite foes here."] =
        "여기서는 정예 적을 조심하세요.",
    ["Flee afterward."] =
        "그다음 달아나세요.",
    ["More than one crystal might be required."] =
        "수정이 하나 이상 필요할 수 있습니다.",
    ["The target shouts for Magus Rimtori once badly hurt."] =
        "대상은 크게 다치면 학자 림토리를 부릅니다.",
    ["A green cat, a Corrupted Saber, appears when you use it."] =
        "사용하면 녹색 고양이인 오염된 호랑이가 나타납니다.",
    ["Hold on until it begins to trail you."] =
        "당신을 따라오기 시작할 때까지 기다리세요.",
    ["The kitten is the green cat beside you."] =
        "새끼 고양이는 옆에 있는 녹색 고양이입니다.",
    ["Look beside Winna Hazzard."] =
        "위나 해저드 옆을 찾아보세요.",
    ["Hunt down an elite turtle of level 48 whose shell looks azure."] =
        "하늘색 등껍질의 48레벨 정예 거북을 사냥하세요.",
    ["The NPC wears a pale shirt and carries a lamp."] =
        "NPC는 밝은 셔츠를 입고 등불을 들고 있습니다.",
    ["Elite human foes walk patrols here; stay clear."] =
        "여기서는 정예 인간 적이 순찰하니 피하세요.",
    ["The NPC hides beneath the staircase."] =
        "NPC는 계단 아래에 숨어 있습니다.",
    ["You can also take it out of your bank."] =
        "은행에서 꺼내도 됩니다.",
    ["The target is a ghoul armed with a hayfork."] =
        "대상은 쇠스랑을 든 구울입니다.",
    ["It can appear at this spot."] =
        "이 자리에 나타날 수 있습니다.",
    ["One last lengthy stretch of monster farming."] =
        "마지막으로 긴 몬스터 사냥 구간입니다.",
    ["Hold on to it; a task in Un'Goro Crater calls for it later."] =
        "보관하세요. 운고로 분화구의 임무에 나중에 필요합니다.",
    -- Skyborne: the way off the isle
    ["Dalaran is reached through the Skyborne portal."] =
        "Skyborne 차원문을 통해 달라란으로 갑니다.",
    ["Take the Skyborne portal to Stormwind"] =
        "Skyborne 차원문을 타고 스톰윈드로 가세요",
    -- Ding - Items: Cozy Sleeping Bag (hand-written guide)
    ["Cozy Sleeping Bag"] =
        "아늑한 침낭",
    ["A trail of clues on both continents, open from level 14, that ends with a bedroll worth up to 3% more experience: no fights, only objects to click."] =
        "두 대륙에 걸친 단서를 따라가는 여정으로, 14레벨부터 가능하며 끝에는 경험치를 최대 3% 더 주는 침낭이 있습니다. 전투 없이 사물만 클릭하면 됩니다.",
    ["Westfall, west of Sentinel Hill: the burned-out remains beside the wrecked cart."] =
        "서부 몰락지대, 감시의 언덕 서쪽: 부서진 수레 옆의 불탄 잔해입니다.",
    ["The Barrens, by the road south of Camp Taurajo: the burned-out remains at the foot of the burnt tower."] =
        "불모의 땅, 타우라조 야영지 남쪽 길가: 불탄 탑 아래의 잔해입니다.",
    ["Horde land: stay clear of the guards."] =
        "호드 지역입니다: 경비병을 피하세요.",
    ["Alliance land: stay clear of the guards."] =
        "얼라이언스 지역입니다: 경비병을 피하세요.",
    ["Right there: the next clue, on the remains or on the plank nailed beside them."] =
        "바로 그 자리: 다음 단서는 잔해나 그 옆에 못 박힌 판자에 있습니다.",
    ["Path northeast of Sun Rock Retreat"] =
        "해바위 야영지 북동쪽 오솔길",
    ["The camp is up in the hills: follow this path west."] =
        "야영지는 언덕 위에 있습니다: 이 오솔길을 따라 서쪽으로 가세요.",
    ["At the end of the path, in the abandoned camp: the bedroll lying on a crate."] =
        "오솔길 끝의 버려진 야영지: 상자 위에 놓인 침낭입니다.",
    ["Optional: the wood and tinder from this reward relight the campfire beside it, a small quest the bag does not need."] =
        "선택 사항: 이 보상으로 받은 나무와 부싯깃으로 옆의 모닥불을 다시 피울 수 있습니다. 침낭에는 필요 없는 작은 퀘스트입니다.",
    ["Up the hill north of the camp: a mound of fresh dirt."] =
        "야영지 북쪽 언덕 위: 갓 파헤친 흙더미입니다.",
    ["Loch Modan, on top of the dam: the eagle figurine on the carved stone heads facing the Wetlands."] =
        "모단 호수, 댐 꼭대기: 저습지를 바라보는 석상 머리 위의 독수리 조각상입니다.",
    ["Cart against Thoradin's Wall"] =
        "소라딘의 성벽에 기댄 수레",
    ["On the Hillsbrad Foothills side: climb onto the cart, then up into the wall."] =
        "힐스브래드 구릉지 쪽: 수레 위로 올라간 다음 성벽 안으로 올라가세요.",
    ["The messenger bag hangs on the outer face of the wall."] =
        "전령 가방이 성벽 바깥쪽에 걸려 있습니다.",
    ["The satchel just below it holds the sleeping bag."] =
        "바로 아래의 배낭에 침낭이 들어 있습니다.",
    ["Use it outdoors and stay on it without moving: each minute of sleep adds 1% experience, up to 3%."] =
        "야외에서 사용하고 움직이지 말고 그 위에 머무르세요: 잠든 1분마다 경험치가 1%씩, 최대 3%까지 늘어납니다.",
    ["Try the sleeping bag"] =
        "침낭을 사용해 보세요",
    -- Ding - Leveling: what each trip is for (trainers, weapon masters, pets)
    ["Loot the beasts you kill on the way here"] =
        "여기로 오면서 처치한 야수의 전리품을 챙기세요",
    ["Learn First Aid from the trainer"] =
        "상급자에게서 응급치료를 배우세요",
    ["Learn Blacksmithing from the trainer"] =
        "상급자에게서 대장기술을 배우세요",
    ["Learn Mining from the trainer"] =
        "상급자에게서 채광을 배우세요",
    ["Learn Cooking from the trainer"] =
        "상급자에게서 요리를 배우세요",
    ["Learn Herbalism from the trainer"] =
        "상급자에게서 약초채집을 배우세요",
    ["Learn Thrown at the weapon master"] =
        "무기 전문가에게서 투척 무기를 배우세요",
    ["Learn Staves at the weapon master"] =
        "무기 전문가에게서 지팡이를 배우세요",
    ["Learn Swords at the weapon master"] =
        "무기 전문가에게서 한손 도검을 배우세요",
    ["Learn Maces at the weapon master"] =
        "무기 전문가에게서 한손 둔기를 배우세요",
    ["Learn Bows at the weapon master"] =
        "무기 전문가에게서 활을 배우세요",
    ["Learn Guns at the weapon master"] =
        "무기 전문가에게서 총을 배우세요",
    ["Learn Two-Handed Swords at the weapon master"] =
        "무기 전문가에게서 양손 도검을 배우세요",
    ["Learn Two-Handed Axes at the weapon master"] =
        "무기 전문가에게서 양손 도끼를 배우세요",
    ["Learn Two-Handed Maces at the weapon master"] =
        "무기 전문가에게서 양손 둔기를 배우세요",
    ["Learn Swords and Daggers at the weapon master"] =
        "무기 전문가에게서 한손 도검과 단검을 배우세요",
    ["Learn Swords and Staves at the weapon master"] =
        "무기 전문가에게서 한손 도검과 지팡이를 배우세요",
    ["Learn Bows and Staves at the weapon master"] =
        "무기 전문가에게서 활과 지팡이를 배우세요",
    ["Learn Guns and Maces at the weapon master"] =
        "무기 전문가에게서 총과 한손 둔기를 배우세요",
    ["Learn Guns and Two-Handed Axes at the weapon master"] =
        "무기 전문가에게서 총과 양손 도끼를 배우세요",
    ["Learn Two-Handed Swords and Staves at the weapon master"] =
        "무기 전문가에게서 양손 도검과 지팡이를 배우세요",
    ["Learn Two-Handed Axes and Two-Handed Maces at the weapon master"] =
        "무기 전문가에게서 양손 도끼와 양손 둔기를 배우세요",
    ["Learn Two-Handed Maces and Staves at the weapon master"] =
        "무기 전문가에게서 양손 둔기와 지팡이를 배우세요",
    ["Learn Crossbows and Two-Handed Swords at the weapon master"] =
        "무기 전문가에게서 석궁과 양손 도검을 배우세요",
    ["Learn Guns, Two-Handed Axes and Two-Handed Maces at the weapon master"] =
        "무기 전문가에게서 총, 양손 도끼, 양손 둔기를 배우세요",
    ["Tame a pet here"] =
        "여기서 소환수를 길들이세요",
    ["Tame a beast here to learn the next rank of Claw"] =
        "여기서 야수를 길들여 할퀴기의 다음 등급을 배우세요",
    ["Head to the big cage"] =
        "큰 우리로 가세요",
    ["Visit the caged quilboar"] =
        "우리에 갇힌 가시멧돼지를 찾아가세요",
    ["Go to the corrupted moonwell"] =
        "타락한 달샘으로 가세요",
    -- Ding - Leveling: where an object or a monster target is (notes)
    ["The object is indoors."] =
        "그 물체는 건물 안에 있습니다.",
    ["The object is indoors, one floor up."] =
        "그 물체는 건물 안 한 층 위에 있습니다.",
    ["The object is on the lower level, indoors."] =
        "그 물체는 건물 안 아래층에 있습니다.",
    ["The object is on the lower level within the bridge."] =
        "그 물체는 다리 안쪽 아래층에 있습니다.",
    ["The object is on the highest level of this structure."] =
        "그 물체는 이 건물의 꼭대기 층에 있습니다.",
    ["The object is up on the summit."] =
        "그 물체는 정상에 있습니다.",
    ["The object sits on the rocky shelf above."] =
        "그 물체는 위쪽 바위턱에 있습니다.",
    ["The target is indoors."] =
        "대상은 건물 안에 있습니다.",
    ["The target is indoors, one floor up."] =
        "대상은 건물 안 한 층 위에 있습니다.",
    ["The target is indoors at street level."] =
        "대상은 건물 안 1층에 있습니다.",
    ["The target is indoors, on the central storey."] =
        "대상은 건물 안 가운데 층에 있습니다.",
    ["The target is on the lower level, indoors."] =
        "대상은 건물 안 아래층에 있습니다.",
    ["The target is on the tower's highest floor."] =
        "대상은 탑 꼭대기 층에 있습니다.",
    ["The target is up on the summit."] =
        "대상은 정상에 있습니다.",
    ["The target is down in the Cleft of Shadow."] =
        "대상은 아래쪽 어둠의 틈에 있습니다.",
    ["The target can be indoors or out."] =
        "대상은 건물 안이나 밖에 있을 수 있습니다.",
    ["The target patrols a long route; look along it."] =
        "대상은 긴 경로를 순찰합니다. 경로를 따라 찾아보세요.",
    ["The target waits here, then strolls out onto the big branch close by."] =
        "대상은 여기서 기다리다가 근처의 큰 나뭇가지 위로 걸어 나갑니다.",
}
