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
    -- Ding - Leveling: why an item goes to the bank (notes)
    ["You need it later for \"The Legend of Stalvan\": keep it in the bank to free a bag slot."] =
        "나중에 \"스탈반의 전설\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Juice Delivery\": keep it in the bank to free a bag slot."] =
        "나중에 \"좀비 독주 배달\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"The Brassbolts Brothers\": keep it in the bank to free a bag slot."] =
        "나중에 \"브라스볼츠 형제\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"A Noble Brew\": keep it in the bank to free a bag slot."] =
        "나중에 \"귀족을 위한 술\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Soothing Turtle Bisque\": keep it in the bank to free a bag slot."] =
        "나중에 \"독특한 거북이 비스크\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Reassignment\": keep it in the bank to free a bag slot."] =
        "나중에 \"전출\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Parts for Kravel\": keep it in the bank to free a bag slot."] =
        "나중에 \"크레이블의 부품\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"Goblin Sponsorship\" and \"The Hidden Key\": keep them in the bank to free bag slots."] =
        "나중에 \"고블린 후원\", \"숨겨진 열쇠\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Chapter I\": keep it in the bank to free a bag slot."] =
        "나중에 \"제 1 장\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Chapter II\": keep it in the bank to free a bag slot."] =
        "나중에 \"제 2 장\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Chapter III\": keep it in the bank to free a bag slot."] =
        "나중에 \"제 3 장\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Chapter IV\": keep it in the bank to free a bag slot."] =
        "나중에 \"제 4 장\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"The Karnitol Shipwreck\": keep it in the bank to free a bag slot."] =
        "나중에 \"카니톨 난파선\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"Magical Analysis\" and \"Caught!\": keep them in the bank to free bag slots."] =
        "나중에 \"마법 분석\", \"화장실에 갇힌 사람\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Rumors for Kravel\": keep it in the bank to free a bag slot."] =
        "나중에 \"크레이블을 위한 소문\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Ongeku\": keep it in the bank to free a bag slot."] =
        "나중에 \"온게쿠\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Sunken Treasure\": keep it in the bank to free a bag slot."] =
        "나중에 \"가라앉은 보물\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"Back to Booty Bay\" and \"Safety First\": keep them in the bank to free bag slots."] =
        "나중에 \"무법항으로의 귀환\", \"안전 제일\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"Report Back to Fizzlebub\" and \"Rhapsody's Kalimdor Kocktail\": keep them in the bank to free bag slots."] =
        "나중에 \"피즐버브에게 돌아가기\", \"랩소디의 칼림도어 칵테일\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"The Borrower\", \"Screecher Spirits\", \"The Super Egg-O-Matic\" and \"Rhapsody's Kalimdor Kocktail\": keep them in the bank to free bag slots."] =
        "나중에 \"사진기 대여\", \"계곡천둥매의 영혼\", \"고성능 자동부화기\", \"랩소디의 칼림도어 칵테일\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"Crystals of Power\": keep them in the bank to free bag slots."] =
        "나중에 \"마력의 수정\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"Rhapsody's Tale\", \"The Super Snapper FX\", \"Whiskey Slim's Lost Grog\" and \"Favored of Elune?\": keep them in the bank to free bag slots."] =
        "나중에 \"랩소디의 이야기\", \"슈퍼 찰칵이 FX\", \"위스키 슬림의 잃어버린 술병\", \"엘룬의 피조물\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Deliver to MacKinley\": keep it in the bank to free a bag slot."] =
        "나중에 \"맥킨리에게 배달\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"The Bait for Lar'korwi\", \"Un'Goro Soil\", \"A Visit to Gregan\" and \"It's a Secret to Everybody\": keep them in the bank to free bag slots."] =
        "나중에 \"라르코르위를 위한 미끼\", \"운고로 흙\", \"그레간 방문\", \"아무도 모르는 비밀\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Rise of the Silithid\": keep it in the bank to free a bag slot."] =
        "나중에 \"실리시드의 출현\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"A Taste of Flame\": keep it in the bank to free a bag slot."] =
        "나중에 \"화염의 맛\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"Chasing A-Me 01\" and \"Arcane Runes\": keep them in the bank to free bag slots."] =
        "나중에 \"에이미 01 추적\", \"고대 룬\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"Good Natured Emma\", \"Arcane Runes\" and \"Sprinkle's Secret Ingredient\": keep them in the bank to free bag slots."] =
        "나중에 \"착한 엠마\", \"고대 룬\", \"스프링클의 비밀 재료\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"The Stone Circle\", \"Felbound Ancients\", \"A Little Slime Goes a Long Way\", \"Moontouched Wildkin\" and \"Meet at the Grave\": keep them in the bank to free bag slots."] =
        "나중에 \"돌무리\", \"저주받은 고대 수호자\", \"수액괴물 견본 수집\", \"달빛의 올빼미야수\", \"무덤에서의 만남\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Return to Tymor\": keep it in the bank to free a bag slot."] =
        "나중에 \"티모르에게 돌아가기\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"Aquementas\", \"The Everlook Report\", \"Duke Nicholas Zverenhoff\" and \"Troubled Spirits of Kel'Theril\": keep them in the bank to free bag slots."] =
        "나중에 \"아쿠에멘타스\", \"눈망루 마을 보고서\", \"공작 니콜라스 즈바른호프\", \"켈테릴의 고통받는 영혼\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Felnok Steelspring\": keep it in the bank to free a bag slot."] =
        "나중에 \"펠노크 스틸스프링\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Glyphed Oaken Branch\": keep it in the bank to free a bag slot."] =
        "나중에 \"문자가 새겨진 떡갈나무 가지\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"The Disruption Ends\" and \"Supplies for the Crossroads\": keep them in the bank to free bag slots."] =
        "나중에 \"습격의 종결\", \"크로스로드의 보급품\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Chen's Empty Keg\": keep it in the bank to free a bag slot."] =
        "나중에 \"첸의 빈 술통\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Egg Hunt\": keep it in the bank to free a bag slot."] =
        "나중에 \"알 사냥\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"Souvenirs of Death\" and \"Battle of Hillsbrad\": keep them in the bank to free bag slots."] =
        "나중에 \"죽음의 전리품\", \"힐스브래드 전투\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Frostmaw\": keep it in the bank to free a bag slot."] =
        "나중에 \"서리갈기 설인\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"The Swarm Grows\": keep it in the bank to free a bag slot."] =
        "나중에 \"곤충 떼의 위협\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"Martek the Exiled\" and \"Hemet Nesingwary\": keep them in the bank to free bag slots."] =
        "나중에 \"망명자 마르텍\", \"헤멧 네싱워리\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Caught!\": keep it in the bank to free a bag slot."] =
        "나중에 \"화장실에 갇힌 사람\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"The Black Shield\" and \"Into the Field\": keep them in the bank to free bag slots."] =
        "나중에 \"검은 방패\", \"사막으로\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"Tanaris Field Sampling\" and \"Screecher Spirits\": keep them in the bank to free bag slots."] =
        "나중에 \"타나리스 현장 견본 수집\", \"계곡천둥매의 영혼\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Back to Booty Bay\": keep it in the bank to free a bag slot."] =
        "나중에 \"무법항으로의 귀환\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"Deadmire\" and \"Safety First\": keep them in the bank to free bag slots."] =
        "나중에 \"붉은눈늪지악어\", \"안전 제일\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"Another Message to the Wildhammer\", \"Screecher Spirits\" and \"The Super Egg-O-Matic\": keep them in the bank to free bag slots."] =
        "나중에 \"또 다른 통첩장\", \"계곡천둥매의 영혼\", \"고성능 자동부화기\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Return to Witch Doctor Uzer'i\": keep it in the bank to free a bag slot."] =
        "나중에 \"의술사 우제리에게 돌아가기\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"The Atal'ai Exile\": keep it in the bank to free a bag slot."] =
        "나중에 \"추방된 아탈라이 트롤\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"Testing the Vessel\" and \"Report Back to Fizzlebub\": keep them in the bank to free bag slots."] =
        "나중에 \"단지 실험\", \"피즐버브에게 돌아가기\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Return to Apothecary Zinge\": keep it in the bank to free a bag slot."] =
        "나중에 \"연금술사 진게에게 돌아가기\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"The Stone Circle\" and \"Crystals of Power\": keep them in the bank to free bag slots."] =
        "나중에 \"돌무리\", \"마력의 수정\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"Ripple Delivery\", \"Whiskey Slim's Lost Grog\" and \"Seeping Corruption\": keep them in the bank to free bag slots."] =
        "나중에 \"리플 배달\", \"위스키 슬림의 잃어버린 술병\", \"스며드는 타락\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"Bungle in the Jungle\", \"The Bait for Lar'korwi\" and \"It's a Secret to Everybody\": keep them in the bank to free bag slots."] =
        "나중에 \"밀림 속 생물\", \"라르코르위를 위한 미끼\", \"아무도 모르는 비밀\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"Delivery to Magatha\" and \"Seeping Corruption\": keep them in the bank to free bag slots."] =
        "나중에 \"마가타에게 전달\", \"스며드는 타락\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Jes'rimon's Payment to Jediga\": keep it in the bank to free a bag slot."] =
        "나중에 \"제디가에 대한 제스리몬의 답례\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Meet at the Grave\": keep it in the bank to free a bag slot."] =
        "나중에 \"무덤에서의 만남\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"Delivery to Andron Gant\", \"A Grave Situation\" and \"Betrayed\": keep them in the bank to free bag slots."] =
        "나중에 \"안드론 건트에게 전달\", \"무덤의 상태\", \"배신\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need them later for \"The Everlook Report\" and \"Duke Nicholas Zverenhoff\": keep them in the bank to free bag slots."] =
        "나중에 \"눈망루 마을 보고서\", \"공작 니콜라스 즈바른호프\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    ["You need it later for \"Aquementas\": keep it in the bank to free a bag slot."] =
        "나중에 \"아쿠에멘타스\" 퀘스트에 필요합니다. 가방 칸을 비우도록 은행에 맡겨 두세요.",
    -- Places of the hearthstone steps (`sethearth`): the town, as this language names it (an
    -- inn's own name: its town).
    ["Astranaar"] =
        "아스트라나르",
    ["Auberdine"] =
        "아우버다인",
    ["Bloodhoof Village"] =
        "블러드후프 마을",
    ["Booty Bay"] =
        "무법항",
    ["Brill"] =
        "브릴",
    ["Camp Mojache"] =
        "모자케 야영지",
    ["Camp Taurajo"] =
        "타우라조 야영지",
    ["Cenarion Hold"] =
        "세나리온 요새",
    ["Coriella Calmbreeze"] =
        "Coriella Calmbreeze",
    ["Darkshire"] =
        "다크샤이어",
    ["Deepwater Tavern"] =
        "메네실 항구",
    ["Dolanaar"] =
        "돌라나르",
    ["Donaal Downbreeze"] =
        "Donaal Downbreeze",
    ["Everlook"] =
        "눈망루 마을",
    ["Feathermoon Stronghold"] =
        "페더문 요새",
    ["Freewind Post"] =
        "높새바람 봉우리",
    ["Gadgetzan"] =
        "가젯잔",
    ["Gallows' End Tavern"] =
        "브릴",
    ["Goldshire"] =
        "골드샤이어",
    ["Grom'gol"] =
        "그롬골 주둔지",
    ["Hammerfall"] =
        "해머폴",
    ["Ironforge"] =
        "아이언포지",
    ["Kargath"] =
        "카르가스",
    ["Kharanos"] =
        "카라노스",
    ["Lakeshire"] =
        "레이크샤이어",
    ["Light's Hope Chapel"] =
        "희망의 빛 예배당",
    ["Menethil Harbor"] =
        "메네실 항구",
    ["Nijel's Point"] =
        "나이젤의 야영지",
    ["Orgrimmar"] =
        "오그리마",
    ["Ratchet"] =
        "톱니항",
    ["Razor Hill"] =
        "칼바위 언덕",
    ["Revantusk Village"] =
        "레반터스크 마을",
    ["Sentinel Hill"] =
        "감시의 언덕",
    ["Shadowprey Village"] =
        "그늘수렵 마을",
    ["Southshore"] =
        "사우스쇼어",
    ["Splintertree Post"] =
        "토막나무 주둔지",
    ["Stonard"] =
        "스토나드",
    ["Stonetalon Peak"] =
        "돌발톱 봉우리",
    ["Stormwind City"] =
        "스톰윈드",
    ["Stoutlager Inn"] =
        "텔사마",
    ["Sun Rock Retreat"] =
        "해바위 야영지",
    ["Tarren Mill"] =
        "타렌 밀농장",
    ["The Crossroads"] =
        "크로스로드",
    ["The Sepulcher"] =
        "공동묘지",
    ["Thelsamar"] =
        "텔사마",
    ["Theramore"] =
        "테라모어",
    ["Theramore Isle"] =
        "테라모어 섬",
    ["Thunder Bluff"] =
        "썬더 블러프",
    ["Thunderbrew Distillery"] =
        "카라노스",
    -- Ding! - Class quests (hand-written guides)
    ["Druid quests"] =
        "드루이드 퀘스트",
    ["At level 10, your trainer teaches Teleport: Moonglade: the quick way to Moonglade and back, used all through this guide."] =
        "10레벨이 되면 상급자에게서 순간이동: 달의 숲을 배웁니다: 달의 숲을 빠르게 오가는 방법으로, 이 가이드 내내 사용합니다.",
    ["Denatharion, the druid trainer of the Cenarion Enclave in Darnassus, sends you to Mathrengyl next to him."] =
        "다르나서스 세나리온 자치령의 드루이드 상급자 데나타리온이 옆에 있는 마스렌길에게 보냅니다.",
    ["Mathrengyl Bearwalker, upstairs in the Cenarion Enclave."] =
        "마스렌길 베어워커는 세나리온 자치령 위층에 있습니다.",
    ["From level 10: the chain that teaches Bear Form."] =
        "10레벨부터: 곰 변신을 배우는 연계 퀘스트.",
    ["Dendrite Starblaze waits on the upper floor of the great house of Nighthaven."] =
        "덴드리트 스타블레이즈는 나이트헤이븐의 큰 건물 위층에서 기다립니다.",
    ["The Great Bear Spirit waits northwest of the village, up the hill path: listen to all it has to say."] =
        "거대한 곰의 혼은 마을 북서쪽, 언덕길 위에서 기다립니다: 하는 말을 끝까지 들으세요.",
    ["Sindrayl, the hippogryph master south of Nighthaven: take this flight path for your next trips here."] =
        "나이트헤이븐 남쪽의 히포그리프 조련사 신드라일: 다음에 여기 올 때를 위해 이 비행 경로를 익히세요.",
    ["Lunaclaw's cave, in the hills east of Auberdine"] =
        "아우버다인 동쪽 언덕의 초승달발톱 동굴",
    ["Deep in the cave, use the Cenarion Moondust by the moonkin stone: Lunaclaw appears. Defeat her, then speak to her spirit."] =
        "동굴 깊은 곳의 달빛야수 비석 옆에서 세나리온 달가루를 사용하세요: 초승달발톱이 나타납니다. 처치한 다음 그 영혼과 대화하세요.",
    ["Turning this in teaches Bear Form."] =
        "이 퀘스트를 완료하면 곰 변신을 배웁니다.",
    ["From level 10: the Skyborne quests of the bear spirit, on Zephras Isle."] =
        "10레벨부터: Zephras Isle에서 하는 곰의 혼 Skyborne 퀘스트.",
    ["Alfina Nightgaze, the druid trainer of Dalaran, gives it."] =
        "달라란의 드루이드 상급자 Alfina Nightgaze가 줍니다.",
    ["Opens the way to Moonglade, the home of the druids."] =
        "드루이드의 본거지인 달의 숲으로 가는 길을 엽니다.",
    ["Sheldras Moontree, the druid trainer of Stormwind, in the park."] =
        "셸드라스 문트리는 스톰윈드의 드루이드 상급자로, 공원에 있습니다.",
    ["Five Earthroot will be needed: an herb found along the roads, picked with Herbalism or bought at the auction house."] =
        "뱀뿌리 5개가 필요합니다: 길가에서 자라는 약초로, 약초채집으로 캐거나 경매장에서 삽니다.",
    ["From level 14: the chain that teaches Cure Poison."] =
        "14레벨부터: 해독을 배우는 연계 퀘스트.",
    ["Fill the sampler at the mouth of the Cliffspring Falls cave, northeast of Auberdine."] =
        "아우버다인 북동쪽, 절벽 폭포 동굴 입구에서 견본병을 채우세요.",
    ["Alanndarian Nightsong, in her house in Auberdine."] =
        "알란다리안 나이트송은 아우버다인의 자기 집에 있습니다.",
    ["The Lunar Fungus grows in the small caves of the hills east of Auberdine, near Lunaclaw's."] =
        "달버섯은 아우버다인 동쪽 언덕의 작은 동굴들, 초승달발톱 동굴 근처에서 자랍니다.",
    ["Sickly Deer wander the woods of Darkshore: use the salve on them."] =
        "병든 사슴이 어둠의 해안 숲을 돌아다닙니다: 사슴에게 연고를 사용하세요.",
    ["Turning this in teaches Cure Poison."] =
        "이 퀘스트를 완료하면 해독을 배웁니다.",
    ["From level 16: the chain that teaches Aquatic Form."] =
        "16레벨부터: 바다표범 변신을 배우는 연계 퀘스트.",
    ["The Shrine Bauble, a small wicker urn, lies on the bottom of Lake Elune'ara: dive around the shrine."] =
        "작은 고리버들 단지인 제단 구슬은 엘룬아라 호수 바닥에 있습니다: 제단 주변으로 잠수하세요.",
    ["Use the bauble at the Shrine of Remulos, by the lake."] =
        "호숫가의 레물로스의 제단에서 구슬을 사용하세요.",
    ["The first half of the pendant lies under the water off the north of Darkshore."] =
        "펜던트의 첫 번째 반쪽은 어둠의 해안 북쪽 앞바다 물속에 있습니다.",
    ["The second half lies under the water off the western coast of Westfall."] =
        "두 번째 반쪽은 서부 몰락지대 서쪽 해안 앞바다 물속에 있습니다.",
    ["Back at the Shrine of Remulos: use a half pendant there to make it whole."] =
        "레물로스의 제단으로 돌아가세요: 거기서 펜던트 반쪽을 사용해 하나로 합치세요.",
    ["Turning this in teaches Aquatic Form."] =
        "이 퀘스트를 완료하면 바다표범 변신을 배웁니다.",
    ["Night Elves get it from Mathrengyl Bearwalker in Darnassus."] =
        "나이트 엘프는 다르나서스의 마스렌길 베어워커에게서 받습니다.",
    ["From level 20: Forever's chain of the Great Cat Spirit, in Moonglade."] =
        "20레벨부터: 달의 숲에서 하는 Forever의 거대한 살쾡이의 혼 연계 퀘스트.",
    ["The Great Cat Spirit rests in the south of Moonglade."] =
        "거대한 살쾡이의 혼은 달의 숲 남쪽에서 쉬고 있습니다.",
    ["The three relics lie in the southeast of Moonglade."] =
        "유물 세 개는 달의 숲 남동쪽에 있습니다.",
    ["The Avatar of Saeyleenan waits in the south of Moonglade."] =
        "Avatar of Saeyleenan은 달의 숲 남쪽에서 기다립니다.",
    ["Mathrengyl Bearwalker, upstairs in the Cenarion Enclave of Darnassus."] =
        "마스렌길 베어워커는 다르나서스 세나리온 자치령 위층에 있습니다.",
    ["Any druid trainer of a capital gives it."] =
        "대도시의 드루이드 상급자라면 누구나 줍니다.",
    ["From level 50: Torwa Pathfinder's chain in Un'Goro Crater, which ends in the Temple of Atal'Hakkar."] =
        "50레벨부터: 운고로 분화구의 토르와 패스파인더 연계 퀘스트. 아탈학카르 신전에서 끝납니다.",
    ["Torwa Pathfinder camps on the eastern side of the crater."] =
        "토르와 패스파인더는 분화구 동쪽에서 야영하고 있습니다.",
    ["The Gorishi wasps of the hive in the south carry the stings; the Bloodcaps grow on red plants all over the crater."] =
        "남쪽 벌집의 고리쉬 말벌이 독침을 가지고 있고, 붉은갓버섯은 분화구 곳곳의 붉은 식물에서 자랍니다.",
    ["Use the barb on a devilsaur: they roam the open plains of the crater."] =
        "데빌사우루스에게 가시를 사용하세요: 데빌사우루스는 분화구의 탁 트인 평원을 돌아다닙니다.",
    ["Atal'alarion, the guardian of the idol in the temple, drops the Putrid Vine."] =
        "신전의 우상 수호자 아탈알라리온이 썩은 덩굴을 떨어뜨립니다.",
    ["Hunter quests"] =
        "사냥꾼 퀘스트",
    ["Dazalar, the hunter trainer of Dolanaar."] =
        "다잘라는 돌라나르의 사냥꾼 상급자입니다.",
    ["From level 10: three beasts to tame, then you can tame a pet of your own."] =
        "10레벨부터: 야수 세 마리를 길들인 다음, 자신의 소환수를 길들일 수 있습니다.",
    ["Use the taming rod on a Webwood Lurker, east of Dolanaar. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "돌라나르 동쪽의 나무그물 늑대거미에게 조련용 막대를 사용하세요. 길들이면 소환수를 해제하세요: 다시 덤벼드니 대비하세요.",
    ["Use the rod on a Nightsaber Stalker, west of Dolanaar, then dismiss it the same way."] =
        "돌라나르 서쪽의 긴발톱 흑호에게 막대를 사용한 다음, 같은 방법으로 해제하세요.",
    ["Use the rod on a Strigid Screecher, south of Dolanaar."] =
        "돌라나르 남쪽의 비명소리 스트리기드 올빼미에게 막대를 사용하세요.",
    ["Turning this in teaches Tame Beast: you can now keep a pet."] =
        "이 퀘스트를 완료하면 야수 길들이기를 배웁니다: 이제 소환수를 데리고 다닐 수 있습니다.",
    ["Jocaste, the hunter trainer of Darnassus, upstairs."] =
        "조카스테는 다르나서스의 사냥꾼 상급자로, 위층에 있습니다.",
    ["Your pet can now learn new skills."] =
        "이제 소환수가 새 기술을 배울 수 있습니다.",
    ["Grif Wildheart, the hunter trainer of Kharanos."] =
        "그리프 와일드하트는 카라노스의 사냥꾼 상급자입니다.",
    ["Use the taming rod on a Large Crag Boar, north of Kharanos. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "카라노스 북쪽의 큰 멧돼지에게 조련용 막대를 사용하세요. 길들이면 소환수를 해제하세요: 다시 덤벼드니 대비하세요.",
    ["Use the rod on a Snow Leopard, south of Kharanos, then dismiss it the same way."] =
        "카라노스 남쪽의 눈표범에게 막대를 사용한 다음, 같은 방법으로 해제하세요.",
    ["Use the rod on an Ice Claw Bear, in the hills south of Kharanos."] =
        "카라노스 남쪽 언덕의 얼음발톱흰곰에게 막대를 사용하세요.",
    ["Belia Thundergranite, the pet trainer of Ironforge, in the Hall of Arms."] =
        "빌리아 썬더그래니트는 아이언포지의 소환수 조련사로, 전투의 전당에 있습니다.",
    ["Josephine Carson, the hunter trainer of Goldshire."] =
        "Josephine Carson은 골드샤이어의 사냥꾼 상급자입니다.",
    ["Use the taming rod on a Rockhide Boar, in the southeast of Elwynn Forest. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "엘윈 숲 남동쪽의 돌가죽멧돼지에게 조련용 막대를 사용하세요. 길들이면 소환수를 해제하세요: 다시 덤벼드니 대비하세요.",
    ["Use the rod on a Gray Forest Wolf, in the east of the forest, then dismiss it the same way."] =
        "숲 동쪽의 회색 숲늑대에게 막대를 사용한 다음, 같은 방법으로 해제하세요.",
    ["Use the rod on a Young Forest Bear, in the west of the forest near Westbrook Garrison."] =
        "숲 서쪽, 서부 주둔지 근처의 새끼곰에게 막대를 사용하세요.",
    ["Isaac Chan, the pet trainer, stands next to Josephine."] =
        "소환수 조련사 Isaac Chan은 Josephine 옆에 서 있습니다.",
    ["Elayaa Easewind sends you to Quel'ana Quickgale."] =
        "Elayaa Easewind가 Quel'ana Quickgale에게 보냅니다.",
    ["Use the taming rod on a Windsong Crawler. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "Windsong Crawler에게 조련용 막대를 사용하세요. 길들이면 소환수를 해제하세요: 다시 덤벼드니 대비하세요.",
    ["Use the rod on an Ornery Galestrider, then dismiss it the same way."] =
        "Ornery Galestrider에게 막대를 사용한 다음, 같은 방법으로 해제하세요.",
    ["Use the rod on a Vuldren Alpha."] =
        "Vuldren Alpha에게 막대를 사용하세요.",
    ["Quel'dora Quickgale, the pet trainer, stands next to Quel'ana."] =
        "소환수 조련사 Quel'dora Quickgale은 Quel'ana 옆에 서 있습니다.",
    ["Any hunter trainer of a capital gives it."] =
        "대도시의 사냥꾼 상급자라면 누구나 줍니다.",
    ["From level 50: Ogtinc's chain in Azshara, which ends in the Temple of Atal'Hakkar."] =
        "50레벨부터: 아즈샤라의 오그틴크 연계 퀘스트. 아탈학카르 신전에서 끝납니다.",
    ["Ogtinc lives up a hill path in the middle of Azshara."] =
        "오그틴크는 아즈샤라 중앙의 언덕길 위에 살고 있습니다.",
    ["The Mosshoof Coursers of northern Azshara carry the antlers; only some do."] =
        "아즈샤라 북부의 덩치큰 이끼발굽순록 중 일부가 뿔을 가지고 있습니다.",
    ["Wavethrashers haunt the Azshara shoreline; not every one leaves a scale."] =
        "폭풍히드라가 아즈샤라 해안에 출몰합니다. 모두 비늘을 남기지는 않습니다.",
    ["Morphaz, one of the green dragons of the temple, drops the tooth."] =
        "신전의 녹색용 중 하나인 몰파즈가 이빨을 떨어뜨립니다.",
    ["Mage quests"] =
        "마법사 퀘스트",
    ["Zaldimar Wefhellt, the mage trainer of Goldshire, upstairs in the inn."] =
        "잘디마르 웨펠트는 골드샤이어의 마법사 상급자로, 여관 위층에 있습니다.",
    ["From level 10: your trainer's first errand, a few minutes from Goldshire."] =
        "10레벨부터: 골드샤이어에서 몇 분 거리에서 하는 상급자의 첫 심부름.",
    ["Jennea Cannon, upstairs in the Wizard's Sanctum of the Mage Quarter, in Stormwind."] =
        "제니아 캐논은 스톰윈드 마법사 지구의 마법사의 성소 위층에 있습니다.",
    ["Stand in the water of Mirror Lake, in the west of Elwynn Forest, and use the flask there."] =
        "엘윈 숲 서쪽의 거울 호수 물속에 서서 약병을 사용하세요.",
    ["Magis Sparkmantle, the mage trainer of Kharanos."] =
        "마지스 스파크맨틀은 카라노스의 마법사 상급자입니다.",
    ["From level 10: your trainer's first errand, in Dun Morogh."] =
        "10레벨부터: 던 모로에서 하는 상급자의 첫 심부름.",
    ["Bink, the mage trainer of Ironforge, in the Hall of Mysteries."] =
        "빙크는 아이언포지의 마법사 상급자로, 신비의 전당에 있습니다.",
    ["Bink's toolbox lies by the gates of Gnomeregan, in the west of Dun Morogh."] =
        "빙크의 공구 상자는 던 모로 서쪽, 놈리건 입구 옆에 있습니다.",
    ["From level 10: the Skyborne mage quests of Zephras Isle."] =
        "10레벨부터: Zephras Isle의 Skyborne 마법사 퀘스트.",
    ["The wind-infused boughs lie on the ground west of the camp."] =
        "바람이 깃든 나뭇가지는 야영지 서쪽 땅바닥에 있습니다.",
    ["Your mage trainer gives it."] =
        "마법사 상급자가 줍니다.",
    ["From level 15: a chain in Stormwind that ends with a robe for you."] =
        "15레벨부터: 스톰윈드의 연계 퀘스트. 끝에 로브를 받습니다.",
    ["The chest of coffers and the cantation lie in Jennea's tower."] =
        "속박의 상자와 현신의 주문서는 제니아의 탑에 있습니다.",
    ["The Blue Recluse, the inn of the Mage Quarter"] =
        "마법사 지구의 여관, 고독한 은둔자 선술집",
    ["Read the cantation to reveal a Rift Spawn, fight it until it is stunned, then use a coffer on it. Three hide in the inn, one of them downstairs."] =
        "현신의 주문서를 읽어 균열의 정령을 드러내고, 기절할 때까지 싸운 다음 속박의 상자를 사용하세요. 여관에 세 마리가 숨어 있고, 그중 하나는 아래층에 있습니다.",
    ["The Charged Rift Gem lies in the Silver Stream Mine, in the north of Loch Modan; the linen comes from humanoids anywhere."] =
        "충만한 균열석은 모단 호수 북쪽의 은여울 광산에 있습니다. 리넨은 어디서든 인간형 몬스터에게서 나옵니다.",
    ["Wynne Larson, the robe merchant of the Mage Quarter."] =
        "위니 라슨은 마법사 지구의 로브 상인입니다.",
    ["Your reward: the Manaweave Robe."] =
        "보상: 마나매듭 로브.",
    ["From level 26: a chain that ends with a second robe."] =
        "26레벨부터: 연계 퀘스트. 끝에 두 번째 로브를 받습니다.",
    ["High Sorcerer Andromath, at the top of the Wizard's Sanctum."] =
        "고위마술사 안드로매스는 마법사의 성소 꼭대기에 있습니다.",
    ["The book lies in the Tower of Ilgalar, in the east of Redridge Mountains."] =
        "책은 붉은마루 산맥 동쪽의 일갈라의 탑에 있습니다.",
    ["The spiders of the western woods of Duskwood carry the silk."] =
        "그늘숲 서쪽 숲의 거미가 비단을 가지고 있습니다.",
    ["Your reward: the Astral Knot Garment."] =
        "보상: 별매듭 로브.",
    ["Your capital's mage trainer gives it."] =
        "대도시의 마법사 상급자가 줍니다.",
    ["From level 30: Tabetha's quests in Dustwallow Marsh, which end with a mage's wand."] =
        "30레벨부터: 먼지진흙 습지대의 타베사 퀘스트. 끝에 마법사의 마법봉을 받습니다.",
    ["Tabetha lives on her farm in the south of Dustwallow Marsh."] =
        "타베사는 먼지진흙 습지대 남쪽의 자기 농장에 살고 있습니다.",
    ["Magus Tirth, at the Shimmering Flats of Thousand Needles, near the race track."] =
        "학자 틸스는 버섯구름 봉우리의 소금 평원, 경주로 근처에 있습니다.",
    ["\"Plucky\" Johnson, the chicken by the tent: beckon to him with the emote so he turns back into a man, then ask him for the phrase."] =
        "\"씩씩이\" 존슨은 천막 옆의 닭입니다: 손짓 감정 표현으로 사람으로 되돌린 다음 주문을 물어보세요.",
    ["Tabetha gives it too."] =
        "타베사도 줍니다.",
    ["The Witherbark trolls of eastern Arathi Highlands carry the totem sticks."] =
        "아라시 고원 동부의 마른나무껍질부족 트롤이 토템 막대를 가지고 있습니다.",
    ["Use the stick on the central stone of the Circle of Outer Binding, in Arathi Highlands; clear its guards first. The Jade is a gem found while mining, or at the auction house."] =
        "아라시 고원의 외부 봉인의 마법진 중앙에 있는 돌에 막대를 사용하세요. 먼저 경비병을 처치하세요. 비취는 채광 중에 나오는 보석이며, 경매장에서도 살 수 있습니다.",
    ["The book lies in the Library of the Scarlet Monastery."] =
        "책은 붉은십자군 수도원의 도서관에 있습니다.",
    ["Your reward: a mage's wand."] =
        "보상: 마법사의 마법봉.",
    ["From level 35: Tabetha's second chain, which goes through Uldaman."] =
        "35레벨부터: 울다만을 거치는 타베사의 두 번째 연계 퀘스트.",
    ["The Burning Blade summoners of Mannoroc Coven, in southern Desolace, carry the orb."] =
        "잊혀진 땅 남부, 만노로크 소굴의 불타는칼날단 소환사가 보주를 가지고 있습니다.",
    ["Right there: Tabetha frees the demon of the orb; defeat it."] =
        "바로 그 자리: 타베사가 보주의 악마를 풀어놓습니다. 처치하세요.",
    ["The Obsidian Sentinel of Uldaman holds the power source."] =
        "울다만의 흑요석 파수꾼이 마력원천을 가지고 있습니다.",
    ["Right there: destroy the mana surges as they appear around Tabetha."] =
        "바로 그 자리: 타베사 주변에 나타나는 마력의 폭풍을 파괴하세요.",
    ["From level 40: Tabetha's task in Zul'Farrak."] =
        "40레벨부터: 줄파락에서 하는 타베사의 임무.",
    ["Hydromancer Velratha, by the sacred pool of Zul'Farrak, drops the tiara."] =
        "줄파락의 신성한 연못 옆에 있는 유체술사 벨라타가 티아라를 떨어뜨립니다.",
    ["Your capital's master mage gives it."] =
        "대도시의 상급 마법사가 줍니다.",
    ["From level 50: Archmage Xylem's chain in Azshara, which ends in the Temple of Atal'Hakkar."] =
        "50레벨부터: 아즈샤라의 대마법사 실렘 연계 퀘스트. 아탈학카르 신전에서 끝납니다.",
    ["Sanath Lim-yo, at the foot of Archmage Xylem's tower in Azshara: talk to him to be sent up to the archmage."] =
        "사나스 림요는 아즈샤라에 있는 대마법사 실렘의 탑 아래에 있습니다: 대화하면 대마법사에게 올려 보내 줍니다.",
    ["The blood elves of the ruins in northeastern Azshara carry the dust."] =
        "아즈샤라 북동부 폐허의 블러드 엘프가 가루를 가지고 있습니다.",
    ["The Spitelash sirens of the western shore of Azshara carry the coral."] =
        "아즈샤라 서쪽 해안의 원한의꼬리일족 세이렌이 산호를 가지고 있습니다.",
    ["Morphaz, one of the green dragons of the temple, drops the shard."] =
        "신전의 녹색용 중 하나인 몰파즈가 파편을 떨어뜨립니다.",
    ["From level 60: Lorekeeper Lydros' quest, inside Dire Maul."] =
        "60레벨부터: 혈투의 전장 안에서 하는 현자 리드로스의 퀘스트.",
    ["Hydrospawn, a water elemental of Dire Maul, drops the essence."] =
        "혈투의 전장의 물의 정령 히드로스폰이 정수를 떨어뜨립니다.",
    ["Paladin quests"] =
        "성기사 퀘스트",
    ["Brother Wilhelm, the paladin trainer of Goldshire, sends you to Stormwind."] =
        "골드샤이어의 성기사 상급자 수사 빌헬름이 스톰윈드로 보냅니다.",
    ["Duthorian Rall, in the Cathedral of Light."] =
        "두소리안 랄은 빛의 대성당에 있습니다.",
    ["From level 12: the chain that teaches Redemption."] =
        "12레벨부터: 구원을 배우는 연계 퀘스트.",
    ["Read the Tome of Divinity from your bags to start the next quest."] =
        "가방에서 신앙의 고서를 읽어 다음 퀘스트를 시작하세요.",
    ["Stephanie Turner, a poor woman of Old Town."] =
        "스테파니 터너는 구 시가지의 가난한 여인입니다.",
    ["She needs Linen Cloth: humanoids carry it everywhere."] =
        "리넨 옷감이 필요합니다: 어디서든 인간형 몬스터가 가지고 있습니다.",
    ["Gazin Tenorm, in the Cathedral of Light."] =
        "가쟁 테놈은 빛의 대성당에 있습니다.",
    ["Henze Faulk lies lifeless in the east of Elwynn Forest: use the Symbol of Life on him."] =
        "헨즈 폴크는 엘윈 숲 동쪽에 숨진 채 누워 있습니다: 그에게 생명의 징표를 사용하세요.",
    ["The Defias around Henze carry the script."] =
        "헨즈 주변의 데피아즈단이 문서를 가지고 있습니다.",
    ["Turning this in teaches Redemption."] =
        "이 퀘스트를 완료하면 구원을 배웁니다.",
    ["Azar Stronghammer, the paladin trainer of Kharanos, sends you to Ironforge."] =
        "카라노스의 성기사 상급자 아자르 스트롱해머가 아이언포지로 보냅니다.",
    ["Tiza Battleforge, in the Mystic Ward of Ironforge."] =
        "타이자 배틀포지는 아이언포지의 마법 지구에 있습니다.",
    ["John Turner, a poor man who walks the streets of Ironforge."] =
        "존 터너는 아이언포지 거리를 걸어 다니는 가난한 남자입니다.",
    ["He needs Linen Cloth: humanoids carry it everywhere."] =
        "리넨 옷감이 필요합니다: 어디서든 인간형 몬스터가 가지고 있습니다.",
    ["Muiredon Battleforge, beside Tiza."] =
        "뮈레돈 배틀포지는 타이자 옆에 있습니다.",
    ["Narm Faulk lies lifeless in the east of Dun Morogh: use the Symbol of Life on him."] =
        "나름 폴크는 던 모로 동쪽에 숨진 채 누워 있습니다: 그에게 생명의 징표를 사용하세요.",
    ["The Dark Iron spies around Narm carry the script."] =
        "나름 주변의 검은무쇠단 비밀요원이 문서를 가지고 있습니다.",
    ["From level 20: the Tome of Valor, then the Test of Righteousness, which ends with Verigan's Fist, a two-handed mace."] =
        "20레벨부터: 용맹의 고서, 이어서 정의의 시험. 끝에 양손 둔기인 베리간의 망치를 받습니다.",
    ["Read the Tome of Valor from your bags to start the next quest."] =
        "가방에서 용맹의 고서를 읽어 다음 퀘스트를 시작하세요.",
    ["Duthorian Rall, in the Cathedral of Light of Stormwind."] =
        "두소리안 랄은 스톰윈드의 빛의 대성당에 있습니다.",
    ["Daphne Stilwell, at her house in the south of Westfall. Take her quest only when ready: three waves of Defias attack, then more."] =
        "대프니 스틸웰은 서부 몰락지대 남쪽의 자기 집에 있습니다. 준비가 됐을 때만 퀘스트를 받으세요: 데피아즈단이 세 차례 몰려온 뒤 더 옵니다.",
    ["Stay by Daphne until the last wave falls; a friend helps."] =
        "마지막 무리가 쓰러질 때까지 대프니 곁에 머무르세요. 동료가 있으면 도움이 됩니다.",
    ["Jordan Stilwell, outside the gates of Ironforge."] =
        "조던 스틸웰은 아이언포지 정문 밖에 있습니다.",
    ["Four items: the lumber from the Deadmines, the hammer from Shadowfang Keep, the ore from Loch Modan and the Kor Gem from Darkshore."] =
        "물건 네 개: 죽음의 폐광의 재목, 그림자송곳니 성채의 망치, 모단 호수의 광석, 어둠의 해안의 코르석.",
    ["Bailor Stonehand, in Thelsamar."] =
        "베일러 스톤핸드는 텔사마에 있습니다.",
    ["The ore lies in a crate by a tree stump, in the northeast of Loch Modan."] =
        "광석은 모단 호수 북동쪽, 나무 그루터기 옆의 상자 안에 있습니다.",
    ["Thundris Windweaver, in Auberdine."] =
        "툰드리스 윈드위버는 아우버다인에 있습니다.",
    ["The naga of the Blackfathom Deeps entrance, under the water of Zoram Strand in Ashenvale, carry the corrupted gem. They are elite: bring a group."] =
        "잿빛 골짜기 조람 해안의 물속, 검은심연의 나락 입구의 나가가 부정한 코르석을 가지고 있습니다. 정예이니 파티를 꾸려 가세요.",
    ["The goblin woodcarvers of the Deadmines carry the lumber."] =
        "죽음의 폐광의 고블린 목공이 재목을 가지고 있습니다.",
    ["Jordan's hammer lies in the stables of Shadowfang Keep."] =
        "조던의 망치는 그림자송곳니 성채의 마구간에 있습니다.",
    ["Your reward: Verigan's Fist."] =
        "보상: 베리간의 망치.",
    ["Delgren the Purifier, at Maestra's Post in Ashenvale."] =
        "수호자 델그렌은 잿빛 골짜기의 마에스트라 주둔지에 있습니다.",
    ["From level 22: Forever's paladin chain of Delgren the Purifier."] =
        "22레벨부터: 수호자 델그렌의 Forever 성기사 연계 퀘스트.",
    ["Katherine the Pure, in the Cathedral of Light of Stormwind."] =
        "성기사 캐서린은 스톰윈드의 빛의 대성당에 있습니다.",
    ["Ursula Deline, the warlock trainer of the Mage Quarter."] =
        "울슐라 델린은 마법사 지구의 흑마법사 상급자입니다.",
    ["The Blackrock orcs of Redridge Mountains carry the summoner's salt."] =
        "붉은마루 산맥의 검은바위부족 오크가 소환사의 소금을 가지고 있습니다.",
    ["The demons of Demon Fall Canyon, in the southeast of Ashenvale, carry the motes."] =
        "잿빛 골짜기 남동쪽, 악마벼락 협곡의 악마가 티끌을 가지고 있습니다.",
    ["Bring them to the Spear of Mannoroth, in the canyon."] =
        "협곡의 Spear of Mannoroth로 가져가세요.",
    ["From level 40: the quest of your warhorse."] =
        "40레벨부터: 전투마 퀘스트.",
    ["Turning this in teaches Summon Warhorse."] =
        "이 퀘스트를 완료하면 전투마 소환을 배웁니다.",
    ["Lord Grayson Shadowbreaker, in the Cathedral of Light."] =
        "그레이슨 섀도브레이커 경은 빛의 대성당에 있습니다.",
    ["From level 50: the chain of the Mightstone, which ends in the Temple of Atal'Hakkar."] =
        "50레벨부터: 퇴마석 연계 퀘스트. 아탈학카르 신전에서 끝납니다.",
    ["Commander Ashlam Valorfist, at Chillwind Camp in the Western Plaguelands."] =
        "사령관 아쉬람 발러피스트는 서부 역병지대의 서리바람 야영지에 있습니다.",
    ["The skeletons of the fields of Andorhal carry the scourgestones."] =
        "안도할 들판의 해골이 스컬지석을 가지고 있습니다.",
    ["High Priest Thel'danis walks around Chillwind Camp."] =
        "대사제 텔다니스는 서리바람 야영지 주변을 걸어 다닙니다.",
    ["The six troll bosses of the temple's upper ring each drop one feather: Gasher, Zul'Lor, Mijan, Hukku, Zolo and Loro."] =
        "신전 위층 둘레의 트롤 우두머리 여섯이 각각 깃털 하나를 떨어뜨립니다: 게이셔, 줄로, 마이잔, 후쿠, 졸로, 로로.",
    ["From level 60: the long chain of your charger. It asks for about 200 gold and goes through Stratholme, Dire Maul and Scholomance."] =
        "60레벨부터: 군마를 위한 긴 연계 퀘스트. 약 200골드가 들고 스트라솔름, 혈투의 전장, 스칼로맨스를 거칩니다.",
    ["High Priest Rohan, in the Mystic Ward of Ironforge: the sacrifice he asks for is gold."] =
        "대사제 로한은 아이언포지의 마법 지구에 있습니다: 그가 요구하는 희생은 골드입니다.",
    ["Use the censer on the Terrordale Spirits, in the northwest of the Eastern Plaguelands."] =
        "동부 역병지대 북서쪽의 테러데일 영혼에게 향로를 사용하세요.",
    ["Grimand Elmore, in the Dwarven District of Stormwind."] =
        "그리만트 엘모어는 스톰윈드의 드워프 지구에 있습니다.",
    ["Grimand wants gold, Arthas' Tears (a herb), Runecloth, an Arcanite Bar, and holy water from the supply crates of Stratholme."] =
        "그리만트는 골드, 아서스의 눈물 (약초), 룬무늬 옷감, 아케이나이트 주괴, 그리고 스트라솔름 보급품 상자의 성수를 원합니다.",
    ["Merideth Carlson, the horse breeder of Southshore, makes the horse feed."] =
        "사우스쇼어의 말 사육사 메리데스 칼슨이 말 사료를 만들어 줍니다.",
    ["The Enriched Manna Biscuits are sold by the Argent Dawn's quartermasters."] =
        "맛좋은 만나빵은 은빛 여명회 병참장교가 팝니다.",
    ["The Ancient Equine Spirit waits in western Dire Maul, past Tendris Warpwood."] =
        "고대 준마의 영혼은 혈투의 전장 서쪽, 굽이나무 텐드리스 너머에서 기다립니다.",
    ["An Azerothian Diamond and a Pristine Black Diamond: found while mining and on monsters of the Plaguelands, or at the auction house."] =
        "아제로스 다이아몬드와 온전한 검은 다이아몬드: 채광 중에, 그리고 역병지대 몬스터에게서 나오며, 경매장에서도 살 수 있습니다.",
    ["In Scholomance, use the Divination Scryer to call Death Knight Darkreaver, defeat him, then use the charger's soul on his fallen mount."] =
        "스칼로맨스에서 예언의 탐지기를 사용해 죽음의 기사 다크리버를 불러내 처치한 다음, 쓰러진 그의 탈것에 군마의 영혼을 사용하세요.",
    ["Your reward: Summon Charger, your epic mount."] =
        "보상: 영웅급 탈것인 군마 소환.",
    ["Priest quests"] =
        "사제 퀘스트",
    ["Priestess Anetta, the priest trainer of Northshire Abbey."] =
        "여사제 아네타는 노스샤이어 수도원의 사제 상급자입니다.",
    ["From level 5: heal a wounded guard, and get your first robe."] =
        "5레벨부터: 부상당한 경비병을 치유하고 첫 로브를 받으세요.",
    ["Priestess Josetta, the priest trainer of Goldshire."] =
        "여사제 조세타는 골드샤이어의 사제 상급자입니다.",
    ["Guard Roberts lies wounded east of Goldshire: heal him with Lesser Heal, then give him Power Word: Fortitude."] =
        "경비병 로버트가 골드샤이어 동쪽에 부상당한 채 누워 있습니다: 하급 치유로 치유한 다음 신의 권능: 인내를 걸어 주세요.",
    ["Branstock Khalder, the priest trainer of Coldridge Valley."] =
        "브란스토크 칼더는 눈마루 골짜기의 사제 상급자입니다.",
    ["From level 5: heal a wounded mountaineer, and get your first robe."] =
        "5레벨부터: 부상당한 산악경비대원을 치유하고 첫 로브를 받으세요.",
    ["Maxan Anvol, the priest trainer of Kharanos."] =
        "막산 앤볼은 카라노스의 사제 상급자입니다.",
    ["Mountaineer Dolf lies wounded near Kharanos: heal him with Lesser Heal, then give him Power Word: Fortitude."] =
        "산악경비대 돌프가 카라노스 근처에 부상당한 채 누워 있습니다: 하급 치유로 치유한 다음 신의 권능: 인내를 걸어 주세요.",
    ["Shanda, the priest trainer of Aldrassil, in Shadowglen."] =
        "샨다는 그늘 협곡 알드랏실의 사제 상급자입니다.",
    ["From level 5: heal a wounded sentinel, and get your first robe."] =
        "5레벨부터: 부상당한 파수꾼을 치유하고 첫 로브를 받으세요.",
    ["Laurna Morninglight, the priest trainer of Dolanaar."] =
        "라우르나 모닝라이트는 돌라나르의 사제 상급자입니다.",
    ["Sentinel Shaya lies wounded south of Dolanaar: heal her with Lesser Heal, then give her Power Word: Fortitude."] =
        "파수꾼 샤야가 돌라나르 남쪽에 부상당한 채 누워 있습니다: 하급 치유로 치유한 다음 신의 권능: 인내를 걸어 주세요.",
    ["From level 10: the quest that teaches Desperate Prayer."] =
        "10레벨부터: 구원의 기도를 배우는 퀘스트.",
    ["High Priestess Laurena, in the Cathedral of Light of Stormwind."] =
        "대여사제 로레나는 스톰윈드의 빛의 대성당에 있습니다.",
    ["Priestess Josetta gives it too."] =
        "여사제 조세타도 줍니다.",
    ["From level 10: Forever's quest of Divine Grace, for Humans."] =
        "10레벨부터: 인간을 위한 Forever의 Divine Grace 퀘스트.",
    ["From level 10: Forever's quest of Confounding Flash, for Gnomes."] =
        "10레벨부터: 노움을 위한 Forever의 Confounding Flash 퀘스트.",
    ["High Priestess Mims, in the Mystic Ward of Ironforge."] =
        "High Priestess Mims는 아이언포지의 마법 지구에 있습니다.",
    ["From level 10: the quest that teaches Starshards."] =
        "10레벨부터: 별조각을 배우는 퀘스트.",
    ["Priestess Alathea, in the Temple of the Moon of Darnassus."] =
        "여사제 알라시아는 다르나서스의 달의 신전에 있습니다.",
    ["From level 20: the quest that teaches Feedback."] =
        "20레벨부터: 역순환을 배우는 퀘스트.",
    ["High Priest Rohan, in the Mystic Ward of Ironforge."] =
        "대사제 로한은 아이언포지의 마법 지구에 있습니다.",
    ["From level 20: the quest that teaches Fear Ward."] =
        "20레벨부터: 공포의 수호물을 배우는 퀘스트.",
    ["From level 20: Forever's second Gnome priest quest."] =
        "20레벨부터: Forever의 두 번째 노움 사제 퀘스트.",
    ["From level 20: the quest that teaches Elune's Grace."] =
        "20레벨부터: 엘룬의 은총을 배우는 퀘스트.",
    ["Any priest trainer of a capital gives it."] =
        "대도시의 사제 상급자라면 누구나 줍니다.",
    ["The Mosshoof Coursers of northern Azshara carry the glands; only some do."] =
        "아즈샤라 북부의 덩치큰 이끼발굽순록 중 일부가 분비샘을 가지고 있습니다.",
    ["The undead of the Western Plaguelands and the Zanzil zombies of Stranglethorn carry the ichor."] =
        "서부 역병지대의 언데드와 가시덤불 골짜기의 잔질 좀비가 영액을 가지고 있습니다.",
    ["Morphaz, one of the green dragons of the temple, carries the blood."] =
        "신전의 녹색용 중 하나인 몰파즈가 피를 가지고 있습니다.",
    ["Greta Mosshoof, at the Emerald Sanctuary in Felwood."] =
        "그레타 모스후프는 악령의 숲의 에메랄드 성소에 있습니다.",
    ["Rogue quests"] =
        "도적 퀘스트",
    ["Hogral Bakkan, the rogue trainer of Kharanos."] =
        "호그럴 바칸은 카라노스의 도적 상급자입니다.",
    ["From level 10: a first errand for the rogues of Ironforge."] =
        "10레벨부터: 아이언포지 도적들을 위한 첫 심부름.",
    ["Hulfdan Blackbeard, in the Forlorn Cavern of Ironforge."] =
        "훌프단 블랙비어드는 아이언포지의 쓸쓸한 뒷골목에 있습니다.",
    ["Onin MacHammar stands on a platform in the west of Dun Morogh, near Gnomeregan."] =
        "오닌 맥해머는 던 모로 서쪽, 놈리건 근처의 발판 위에 서 있습니다.",
    ["Learn Pick Lock at your trainer, then practice on lockboxes until your skill reaches 75."] =
        "상급자에게서 자물쇠 따기를 배운 다음, 숙련도가 75가 될 때까지 잠긴 상자로 연습하세요.",
    ["From level 16: Pick Lock opens the chests and boxes of the quests to come."] =
        "16레벨부터: 자물쇠 따기로 앞으로 할 퀘스트의 궤짝과 상자를 엽니다.",
    ["Master Mathias Shaw, on the top floor of SI:7's headquarters, in Old Town."] =
        "단장 마티아스 쇼는 구 시가지 SI:7 본부의 꼭대기 층에 있습니다.",
    ["From level 20: the chain that teaches your poisons."] =
        "20레벨부터: 독 조제를 배우는 연계 퀘스트.",
    ["Agent Kearnen watches from a hill in the southeast of Westfall."] =
        "첩보원 켈넌은 서부 몰락지대 남동쪽 언덕에서 지켜보고 있습니다.",
    ["Pick the Defias Tower Key from the pocket of a Malformed Defias Drone, by the tower; then, upstairs, sap Klaven Mortwake before you open the chest."] =
        "탑 옆의 기괴한 데피아즈단 일꾼의 주머니에서 데피아즈단 탑 열쇠를 훔치세요. 그런 다음 위층에서 궤짝을 열기 전에 클라벤 몰트워크를 혼절시키세요.",
    ["The chest leaves a sickness on you: that is the next quest."] =
        "궤짝을 열면 병에 걸립니다: 그것이 다음 퀘스트입니다.",
    ["Doc Mixilpixil works in the cellar of SI:7's headquarters."] =
        "닥 믹실픽실은 SI:7 본부 지하에서 일합니다.",
    ["Lie down in front of him (the emote) so he can examine you."] =
        "그가 진찰할 수 있도록 그 앞에 누우세요 (눕기 감정 표현).",
    ["Turning this in teaches your poisons."] =
        "이 퀘스트를 완료하면 독 조제를 배웁니다.",
    ["Myrokos Silentform, at Ravenholdt Manor in the Alterac Mountains: the way in is a cave in the north of Hillsbrad Foothills."] =
        "미로코스 사일런트폼은 알터랙 산맥의 라벤홀트 장원에 있습니다: 힐스브래드 구릉지 북쪽의 동굴로 들어갑니다.",
    ["From level 24: Forever's Syndicate quests, at Ravenholdt Manor."] =
        "24레벨부터: 라벤홀트 장원에서 하는 Forever의 신디케이트 퀘스트.",
    ["Lord Tomas is hiding in the east of Hillsbrad Foothills."] =
        "Lord Tomas는 힐스브래드 구릉지 동쪽에 숨어 있습니다.",
    ["Any rogue trainer of a capital gives it."] =
        "대도시의 도적 상급자라면 누구나 줍니다.",
    ["From level 50: Lord Jorach Ravenholdt's chain, which ends in the Temple of Atal'Hakkar."] =
        "50레벨부터: 조라크 라벤홀트 경의 연계 퀘스트. 아탈학카르 신전에서 끝납니다.",
    ["Lord Jorach Ravenholdt, in Ravenholdt Manor."] =
        "조라크 라벤홀트 경은 라벤홀트 장원에 있습니다.",
    ["The Timbermaw shamans of northern Azshara carry the bag."] =
        "아즈샤라 북부의 나무구렁일족 주술사가 가방을 가지고 있습니다.",
    ["Archmage Xylem, at the top of his tower in Azshara: Sanath Lim-yo, at its foot, sends you up."] =
        "대마법사 실렘은 아즈샤라에 있는 자신의 탑 꼭대기에 있습니다: 탑 아래의 사나스 림요가 올려 보내 줍니다.",
    ["The Forest Oozes of northeastern Azshara carry the fragments."] =
        "아즈샤라 북동부의 숲수액괴물이 파편을 가지고 있습니다.",
    ["Morphaz, one of the green dragons of the temple, drops the key."] =
        "신전의 녹색용 중 하나인 몰파즈가 열쇠를 떨어뜨립니다.",
    ["Shaman quests"] =
        "주술사 퀘스트",
    ["Teo Hammerstorm, the shaman trainer of Coldridge Valley."] =
        "Teo Hammerstorm은 눈마루 골짜기의 주술사 상급자입니다.",
    ["From level 4: the Call of Earth, your first totem."] =
        "4레벨부터: 첫 번째 토템을 주는 대지의 부름.",
    ["The Frostmane trolls south of the valley carry the pendant."] =
        "골짜기 남쪽의 서리갈기트롤이 펜던트를 가지고 있습니다.",
    ["On the hill west of the valley: drink the Earth Sapta to see the Minor Manifestation of Earth."] =
        "골짜기 서쪽 언덕 위: 대지의 정기를 마셔 하급 대지의 현신을 보세요.",
    ["Turning this in teaches your first earth totem."] =
        "이 퀘스트를 완료하면 첫 번째 대지 토템을 배웁니다.",
    ["Ingrid Dunwald in Kharanos, or Eldrun Stormbreaker in Ironforge."] =
        "카라노스의 Ingrid Dunwald 또는 아이언포지의 Eldrun Stormbreaker.",
    ["From level 10: the Call of Fire, your first fire totem."] =
        "10레벨부터: 첫 번째 불 토템을 주는 불의 부름.",
    ["Bruegs Kindleborn, in the far east of Dun Morogh, by the road to Loch Modan."] =
        "Bruegs Kindleborn은 던 모로 동쪽 끝, 모단 호수로 가는 길가에 있습니다.",
    ["Braldir Ashmantle, on a hill in the southwest of Loch Modan."] =
        "Braldir Ashmantle은 모단 호수 남서쪽 언덕 위에 있습니다.",
    ["The Tunnel Rat geomancers of Loch Modan carry the Fire Tar; the Stonesplinter seers of the south carry the pouches."] =
        "모단 호수의 동굴쥐일족 흙점쟁이가 불붙인 타르를, 남쪽의 가루바위일족 점쟁이가 주머니를 가지고 있습니다.",
    ["Right by Braldir: call the Minor Manifestation of Fire at the brazier, then defeat it for its ember."] =
        "Braldir 바로 옆: 화로에서 하급 불의 현신을 불러낸 다음, 처치해서 불씨를 얻으세요.",
    ["Light the Brazier of the Dormant Flame with the ember."] =
        "불씨로 희미한 불씨의 화로에 불을 붙이세요.",
    ["Bruegs Kindleborn, in the far east of Dun Morogh."] =
        "Bruegs Kindleborn은 던 모로 동쪽 끝에 있습니다.",
    ["Turning this in teaches your first fire totem."] =
        "이 퀘스트를 완료하면 첫 번째 불 토템을 배웁니다.",
    ["Eldrun Stormbreaker, the shaman trainer of Ironforge."] =
        "Eldrun Stormbreaker는 아이언포지의 주술사 상급자입니다.",
    ["From level 20: the Call of Water, your first water totem."] =
        "20레벨부터: 첫 번째 물 토템을 주는 물의 부름.",
    ["Norric Lochthane, by the dam in the north of Loch Modan."] =
        "Norric Lochthane은 모단 호수 북쪽의 댐 옆에 있습니다.",
    ["Hervdana Saegrund, in the southeast of the Wetlands."] =
        "Hervdana Saegrund는 저습지 남동쪽에 있습니다.",
    ["Fill the waterskin where Hervdana's quest says: DingDB does not hold this place yet."] =
        "Hervdana의 퀘스트가 알려 주는 곳에서 물주머니를 채우세요: DingDB에는 아직 이 장소가 없습니다.",
    ["At the Forgotten Shrine of Westfall: call the corrupt manifestation of water, then defeat it for its bracers."] =
        "서부 몰락지대의 Forgotten Shrine: 타락한 물의 현신을 불러낸 다음, 처치해서 팔보호구를 얻으세요.",
    ["The Minor Manifestation of Water rises beside the shrine."] =
        "하급 물의 현신이 제단 옆에서 나타납니다.",
    ["Turning this in teaches your first water totem."] =
        "이 퀘스트를 완료하면 첫 번째 물 토템을 배웁니다.",
    ["From level 30: the Call of Air, your first air totem."] =
        "30레벨부터: 첫 번째 바람 토템을 주는 바람의 부름.",
    ["Veyric Thunderhame, in the north of Arathi Highlands."] =
        "Veyric Thunderhame은 아라시 고원 북쪽에 있습니다.",
    ["Turning this in teaches your first air totem."] =
        "이 퀘스트를 완료하면 첫 번째 바람 토템을 배웁니다.",
    ["From level 30: Veyric Thunderhame's elemental quests, to level 40."] =
        "30레벨부터: 40레벨까지 이어지는 Veyric Thunderhame의 정령 퀘스트.",
    ["Four twisted totems: from the Stonevault troggs of the Badlands, the Maraudine centaurs of Desolace, the Lost Ones of the Swamp of Sorrows and the Mirefin murlocs of Dustwallow Marsh."] =
        "뒤틀린 토템 네 개: 황야의 땅의 바위동굴일족 트로그, 잊혀진 땅의 마라우돈일족 켄타우로스, 슬픔의 늪의 드레노어 난민, 먼지진흙 습지대의 진흙아가미멀록에게서 얻습니다.",
    ["Charlga Razorflank, the crone of Razorfen Kraul, carries the note."] =
        "가시덩굴 우리의 노파 서슬깃 차를가가 쪽지를 가지고 있습니다.",
    ["The Ravaging Tempests of western Thousand Needles carry the eye."] =
        "버섯구름 봉우리 서부의 Ravaging Tempest가 눈을 가지고 있습니다.",
    ["Bath'rah the Windwatcher, in the hills of the Alterac Mountains."] =
        "바람의감시자 바스라는 알터랙 산맥의 언덕에 있습니다.",
    ["Warlock quests"] =
        "흑마법사 퀘스트",
    ["Drusilla La Salle, the warlock trainer of Northshire Abbey."] =
        "드루실라 라 살르는 노스샤이어 수도원의 흑마법사 상급자입니다.",
    ["Your trainer's first errand, around Northshire Abbey."] =
        "노스샤이어 수도원 주변에서 하는 상급자의 첫 심부름.",
    ["The stolen books lie in the kobold camp east of the abbey."] =
        "도둑맞은 책은 수도원 동쪽의 코볼트 야영지에 있습니다.",
    ["Alamar Grimm, the warlock trainer of Coldridge Valley."] =
        "알라마 그림은 눈마루 골짜기의 흑마법사 상급자입니다.",
    ["Your trainer's first errand, around Coldridge Valley."] =
        "눈마루 골짜기 주변에서 하는 상급자의 첫 심부름.",
    ["The Frostmane novices of the troll cave in the south of the valley carry the charm."] =
        "골짜기 남쪽 트롤 동굴의 서리갈기부족 견습마법사가 부적을 가지고 있습니다.",
    ["Remen Marcot, in the inn of Goldshire, sends you to Stormwind."] =
        "골드샤이어 여관의 레멘 마르콧이 스톰윈드로 보냅니다.",
    ["Lago Blackwrench, in the Forlorn Cavern of Ironforge, sends you to Stormwind."] =
        "아이언포지 쓸쓸한 뒷골목의 라고 블랙렌치가 스톰윈드로 보냅니다.",
    ["Gakin the Darkbinder, in the cellar of the Slaughtered Lamb, in the Mage Quarter of Stormwind."] =
        "대흑마법사 게이킨은 스톰윈드 마법사 지구의 어둠의 희생양 선술집 지하에 있습니다.",
    ["From level 10: the chain that teaches Summon Voidwalker."] =
        "10레벨부터: 보이드워커 소환을 배우는 연계 퀘스트.",
    ["Surena Caledon hides in a house of the Brackwell Pumpkin Patch, in the east of Elwynn Forest."] =
        "슈레나 캘리돈은 엘윈 숲 동쪽, 브랙웰 호박밭의 집에 숨어 있습니다.",
    ["Down the stairs of the Slaughtered Lamb's crypt: use the choker on the summoning circle, then defeat the voidwalker."] =
        "어둠의 희생양 선술집 지하 묘실의 계단 아래: 소환의 마법진에 목걸이를 사용한 다음 보이드워커를 처치하세요.",
    ["Turning this in teaches Summon Voidwalker."] =
        "이 퀘스트를 완료하면 보이드워커 소환을 배웁니다.",
    ["Gakin the Darkbinder, in the cellar of the Slaughtered Lamb."] =
        "대흑마법사 게이킨은 어둠의 희생양 선술집 지하에 있습니다.",
    ["From level 20: the chain that teaches Summon Succubus."] =
        "20레벨부터: 서큐버스 소환을 배우는 연계 퀘스트.",
    ["Takar the Seer, north of Camp Taurajo in the Barrens: Horde land, stay clear of the guards."] =
        "현자 타카르는 불모의 땅 타우라조 야영지 북쪽에 있습니다: 호드 지역이니 경비병을 피하세요.",
    ["The Heartswood grows in the north of Ashenvale, near the Horde's lumber camp."] =
        "사랑나무는 잿빛 골짜기 북쪽, 호드 벌목장 근처에서 자랍니다.",
    ["In the Slaughtered Lamb's crypt again: use the heartswood core on the summoning circle, then defeat the succubus."] =
        "다시 어둠의 희생양 선술집 지하 묘실: 소환의 마법진에 사랑나무 줄기를 사용한 다음 서큐버스를 처치하세요.",
    ["Turning this in teaches Summon Succubus."] =
        "이 퀘스트를 완료하면 서큐버스 소환을 배웁니다.",
    ["From level 30: the chain that teaches Summon Felhunter."] =
        "30레벨부터: 지옥사냥개 소환을 배우는 연계 퀘스트.",
    ["Strahad Farsan, in Ratchet."] =
        "스트라드 파선은 톱니항에 있습니다.",
    ["Krom Stoutarm, in the Hall of Explorers of Ironforge."] =
        "크롬 스타우트암은 아이언포지의 탐험가의 전당에 있습니다.",
    ["The moldy tome lies in the southwest of Hillsbrad Foothills; the tattered manuscript, in a damaged chest of western Thousand Needles."] =
        "곰팡이 슨 고서는 힐스브래드 구릉지 남서쪽에, 너덜너덜한 필사본은 버섯구름 봉우리 서부의 부서진 궤짝 안에 있습니다.",
    ["The Dragonmaw orcs of the Wetlands carry the rod."] =
        "저습지의 용아귀부족 오크가 마법봉을 가지고 있습니다.",
    ["Right by Strahad: use the tome on the summoning circle, then defeat the felhunter."] =
        "스트라드 바로 옆: 소환의 마법진에 고서를 사용한 다음 지옥사냥개를 처치하세요.",
    ["Turning this in teaches Summon Felhunter."] =
        "이 퀘스트를 완료하면 지옥사냥개 소환을 배웁니다.",
    ["Demisette Cloyce, in the Slaughtered Lamb of Stormwind."] =
        "드미제트 클로이스는 스톰윈드의 어둠의 희생양 선술집에 있습니다.",
    ["From level 40: the quest of your felsteed."] =
        "40레벨부터: 지옥마 퀘스트.",
    ["Turning this in teaches Summon Felsteed."] =
        "이 퀘스트를 완료하면 지옥마 소환을 배웁니다.",
    ["Niby the Almighty and Impsy wait in a small camp of central Felwood."] =
        "전지전능한 나이비와 임프시는 악령의 숲 중부의 작은 야영지에서 기다립니다.",
    ["From level 50: the demonic quests of Niby and Impsy, in Felwood."] =
        "50레벨부터: 악령의 숲에서 하는 나이비와 임프시의 악마 퀘스트.",
    ["Felcloth drops from demons and satyrs, Azshara's above all; the auction house sells it too."] =
        "지옥 옷감은 악마와 사티로스에게서 나오며, 특히 아즈샤라에서 잘 나옵니다. 경매장에서도 팝니다.",
    ["The Irontree treants of northern Felwood carry the rotting wood; the oozes of the Bloodvenom river, the essence."] =
        "악령의 숲 북부의 강철나무정령이 썩은 나무를, 피멍울 강의 수액괴물이 정수를 가지고 있습니다.",
    ["Three essences: from the satyrs of Jaedenar in Felwood, the Legashi satyrs of Azshara, and the felguards by the Dark Portal in the Blasted Lands."] =
        "정수 세 개: 악령의 숲 자에데나르의 사티로스, 아즈샤라의 레가쉬 사티로스, 저주받은 땅 어둠의 문 옆의 지옥군단병에게서 얻습니다.",
    ["North of the camp, by the remains of Kroshius: use the item Impsy gives you to wake him, then defeat him."] =
        "야영지 북쪽, 크로쉬우스의 유해 옆: 임프시가 준 아이템을 사용해 깨운 다음 처치하세요.",
    ["Spackle Thornberry, the demon trainer of the Slaughtered Lamb."] =
        "스파클 손베리는 어둠의 희생양 선술집의 악마 조련사입니다.",
    ["From level 60: the long chain of your dreadsteed. It asks for costly materials and goes through Scholomance and Dire Maul."] =
        "60레벨부터: 공포마를 위한 긴 연계 퀘스트. 값비싼 재료가 필요하며 스칼로맨스와 혈투의 전장을 거칩니다.",
    ["Mor'zul Bloodbringer, in the west of the Burning Steppes."] =
        "모르줄 블러드브링어는 불타는 평원 서쪽에 있습니다.",
    ["The owlbeasts of Winterspring carry the blood."] =
        "여명의 설원의 올빼미야수가 피를 가지고 있습니다.",
    ["Gorzeeki Wildeyes, right by Mor'zul."] =
        "고르지키 와일드아이즈는 모르줄 바로 옆에 있습니다.",
    ["Mor'zul gives these three."] =
        "이 세 퀘스트는 모르줄이 줍니다.",
    ["These three ask for an alchemist's elixir, an enchanter's shard with ore of the Burning Steppes, and scales of black dragonkin: make them, find them, or buy them at the auction house."] =
        "이 세 퀘스트에는 연금술사의 비약, 불타는 평원의 광석과 함께 쓰는 마법부여사의 결정, 검은용족의 비늘이 필요합니다: 직접 만들거나, 찾거나, 경매장에서 사세요.",
    ["An Arcanite Bar: an alchemist makes it, or the auction house sells it."] =
        "아케이나이트 주괴: 연금술사가 만들거나 경매장에서 팝니다.",
    ["Lord Banehollow, in the shrine of Jaedenar, in Felwood."] =
        "군주 베인할로우는 악령의 숲 자에데나르의 성소에 있습니다.",
    ["Ulathek hides in Jaedenar too: defeat him for his heart."] =
        "울라텍도 자에데나르에 숨어 있습니다: 처치해서 심장을 얻으세요.",
    ["Ur'dan sells the stardust, right by Lord Banehollow."] =
        "군주 베인할로우 바로 옆의 우르단이 별가루를 팝니다.",
    ["In the alchemy lab of Scholomance, use the imp in a jar and let it do its work."] =
        "스칼로맨스의 연금술 실험실에서 단지 안에 든 임프를 사용하고 임프가 일을 마치게 두세요.",
    ["In Dire Maul, summon the Xorothian Dreadsteed with the ritual items and defeat it; then speak to its spirit."] =
        "혈투의 전장에서 의식 물품으로 소로시안 공포마를 소환해 처치한 다음, 그 영혼과 대화하세요.",
    ["Your reward: Summon Dreadsteed, your epic mount."] =
        "보상: 영웅급 탈것인 공포마 소환.",
    ["Warrior quests"] =
        "전사 퀘스트",
    ["Lyria Du Lac, the warrior trainer of Goldshire."] =
        "리리아 뒤 라크는 골드샤이어의 전사 상급자입니다.",
    ["From level 10: the chain that teaches Defensive Stance."] =
        "10레벨부터: 방어 태세를 배우는 연계 퀘스트.",
    ["Harry Burlguard, in the tavern of Old Town, in Stormwind."] =
        "해리 벌가드는 스톰윈드 구 시가지의 선술집에 있습니다.",
    ["Bartleby, a drunk in the same tavern: he attacks as soon as you take his quest."] =
        "바틀비는 같은 선술집의 술꾼입니다: 퀘스트를 받자마자 공격해 옵니다.",
    ["Turning this in teaches Defensive Stance."] =
        "이 퀘스트를 완료하면 방어 태세를 배웁니다.",
    ["Granis Swiftaxe, the warrior trainer of Kharanos."] =
        "그라니스 스위프트액스는 카라노스의 전사 상급자입니다.",
    ["Muren Stormpike, upstairs in the Hall of Arms of Ironforge."] =
        "무렌 스톰파이크는 아이언포지 전투의 전당 위층에 있습니다.",
    ["Vejrek waits in a Frostmane hut in the west of Dun Morogh."] =
        "베즈렉은 던 모로 서쪽의 서리갈기부족 오두막에서 기다립니다.",
    ["Kyra Windblade, the warrior trainer of Dolanaar."] =
        "키라 윈드블레이드는 돌라나르의 전사 상급자입니다.",
    ["Elanaria, on the Warrior's Terrace of Darnassus."] =
        "엘라나리아는 다르나서스의 전사의 정원에 있습니다.",
    ["Vorlus Vilehoof roams with the satyrs southwest of Dolanaar."] =
        "볼루스 바일후프는 돌라나르 남서쪽에서 사티로스와 함께 돌아다닙니다.",
    ["Seena Skybreaker, the warrior trainer of Zephras Isle."] =
        "Seena Skybreaker는 Zephras Isle의 전사 상급자입니다.",
    ["From level 10: the Skyborne warrior quest of Zephras Isle."] =
        "10레벨부터: Zephras Isle의 Skyborne 전사 퀘스트.",
    ["Zaal Stormshield carries the bulwark, in the north of the isle."] =
        "섬 북쪽의 Zaal Stormshield가 방벽을 가지고 있습니다.",
    ["Your capital's warrior trainer gives it."] =
        "대도시의 전사 상급자가 줍니다.",
    ["From level 30: the chain that teaches Berserker Stance."] =
        "30레벨부터: 광폭 태세를 배우는 연계 퀘스트.",
    ["Klannoc Macleod, on Fray Island, off the coast of the Barrens."] =
        "클라녹 맥클라우드는 불모의 땅 앞바다의 격투의 섬에 있습니다.",
    ["Step on the grate of the arena: six fighters come one at a time, then Big Will."] =
        "투기장의 쇠창살 위에 올라서세요: 투사 여섯 명이 한 명씩 나온 다음 싸움꾼 윌이 나옵니다.",
    ["Turning this in teaches Berserker Stance."] =
        "이 퀘스트를 완료하면 광폭 태세를 배웁니다.",
    ["From level 30: Bath'rah's chain, which ends with a Whirlwind weapon of your choice."] =
        "30레벨부터: 바스라의 연계 퀘스트. 끝에 원하는 소용돌이 무기를 받습니다.",
    ["Eight Liferoot: an herb, picked with Herbalism or bought at the auction house."] =
        "생명의 뿌리 8개: 약초로, 약초채집으로 캐거나 경매장에서 삽니다.",
    ["The Drywhisker kobolds of eastern Arathi Highlands carry the three charms."] =
        "아라시 고원 동부의 마른수염 코볼트가 부적 세 개를 가지고 있습니다.",
    ["At Bath'rah's cauldron, right by him: put the three charms in it."] =
        "바스라 바로 옆의 가마솥: 부적 세 개를 넣으세요.",
    ["The Bloodscalp trolls of northern Stranglethorn carry the tusks."] =
        "가시덤불 골짜기 북부의 붉은머리부족 트롤이 엄니를 가지고 있습니다.",
    ["Follow Bath'rah to the summoning, then defeat Cyclonian for its heart: a strong foe, bring help."] =
        "바스라를 따라 소환 장소로 간 다음, 사이클로니안을 처치해 심장을 얻으세요: 강한 적이니 도움을 받으세요.",
    ["Your reward: a Whirlwind weapon of your choice."] =
        "보상: 원하는 소용돌이 무기.",
    ["From level 50: the Fallen Hero's chain, which ends in the Temple of Atal'Hakkar."] =
        "50레벨부터: 영웅의 넋 연계 퀘스트. 아탈학카르 신전에서 끝납니다.",
    ["The Fallen Hero of the Horde, a spirit in the west of the Swamp of Sorrows."] =
        "호드 영웅의 넋은 슬픔의 늪 서쪽에 있는 영혼입니다.",
    ["The Helboars of the Blasted Lands."] =
        "저주받은 땅의 지옥멧돼지.",
    ["The Shadowsworn of the Blasted Lands, by the Dark Portal; they come back quickly."] =
        "저주받은 땅 어둠의 문 옆의 어둠의혈맹. 금방 다시 나타납니다.",
    ["Gennia Runetotem, the druid trainer of Bloodhoof Village, sends you to Thunder Bluff."] =
        "블러드후프 마을의 드루이드 상급자 제니아 룬토템이 썬더 블러프로 보냅니다.",
    ["Turak Runetotem, in the Elder Rise of Thunder Bluff."] =
        "투락 룬토템은 썬더 블러프의 장로의 봉우리에 있습니다.",
    ["Faustron, the wind rider master southwest of Nighthaven: take this flight path for your next trips here."] =
        "나이트헤이븐 남서쪽의 와이번 조련사 파우스트론: 다음에 여기 올 때를 위해 이 비행 경로를 익히세요.",
    ["Lunaclaw's spot, west of Camp Taurajo in the Barrens"] =
        "불모의 땅 타우라조 야영지 서쪽, 초승달발톱이 있는 곳",
    ["Use the Cenarion Lunardust by the moonkin stone: Lunaclaw appears. Defeat her, then speak to her spirit."] =
        "달빛야수 비석 옆에서 세나리온 달가루를 사용하세요: 초승달발톱이 나타납니다. 처치한 다음 그 영혼과 대화하세요.",
    ["Muln Earthfury gives it, in the northwest of Mulgore."] =
        "멀고어 북서쪽의 Muln Earthfury가 줍니다.",
    ["Fill the sampler in the bubbling pool at the top of Dreadmist Peak: three acolytes attack right after, so clear the top first or bring help."] =
        "공포의 안개봉우리 꼭대기의 부글거리는 웅덩이에서 견본병을 채우세요: 바로 뒤에 수행사제 세 명이 공격하니, 먼저 꼭대기를 정리하거나 도움을 받으세요.",
    ["Tonga Runetotem, just south of the Crossroads."] =
        "통가 룬토템은 크로스로드 바로 남쪽에 있습니다.",
    ["The kodos of the northern Barrens carry the Kodo Horns."] =
        "불모의 땅 북부의 코도가 코도 뿔을 가지고 있습니다.",
    ["Sickly Gazelles graze in the north of the Barrens: use the salve on them."] =
        "병든 가젤이 불모의 땅 북부에서 풀을 뜯습니다: 가젤에게 연고를 사용하세요.",
    ["The first half of the pendant lies under the water in the far north of the Barrens."] =
        "펜던트의 첫 번째 반쪽은 불모의 땅 최북단의 물속에 있습니다.",
    ["The second half lies under the water off the coast of Silverpine Forest."] =
        "두 번째 반쪽은 은빛소나무 숲 앞바다 물속에 있습니다.",
    ["Turak Runetotem gives it, in the Elder Rise of Thunder Bluff."] =
        "썬더 블러프 장로의 봉우리의 투락 룬토템이 줍니다.",
    ["Thotar, the hunter trainer of Razor Hill."] =
        "소타르는 칼바위 언덕의 사냥꾼 상급자입니다.",
    ["Use the taming rod on a Dire Mottled Boar, south of Razor Hill. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "칼바위 언덕 남쪽의 사나운 점박이멧돼지에게 조련용 막대를 사용하세요. 길들이면 소환수를 해제하세요: 다시 덤벼드니 대비하세요.",
    ["Use the rod on a Surf Crawler, on the southern shore of Durotar, then dismiss it the same way."] =
        "듀로타 남쪽 해안의 붉은톱니게에게 막대를 사용한 다음, 같은 방법으로 해제하세요.",
    ["Use the rod on an Armored Scorpid, northwest of Razor Hill."] =
        "칼바위 언덕 북서쪽의 등껍질전갈에게 막대를 사용하세요.",
    ["Ormak Grimshot, the hunter trainer of Orgrimmar, in the Valley of Honor."] =
        "오르막 그림샷은 오그리마의 사냥꾼 상급자로, 명예의 골짜기에 있습니다.",
    ["Yaw Sharpmane, the hunter trainer of Bloodhoof Village."] =
        "요 샤프메인은 블러드후프 마을의 사냥꾼 상급자입니다.",
    ["Use the taming rod on an Adult Plainstrider, north of the village. Once it is tamed, dismiss it: it turns on you again, so be ready."] =
        "마을 북쪽의 다자란 초원타조에게 조련용 막대를 사용하세요. 길들이면 소환수를 해제하세요: 다시 덤벼드니 대비하세요.",
    ["Use the rod on a Prairie Stalker, southeast of the village, then dismiss it the same way."] =
        "마을 남동쪽의 긴발톱 초원늑대에게 막대를 사용한 다음, 같은 방법으로 해제하세요.",
    ["Use the rod on a Swoop, in the plains north of the village."] =
        "마을 북쪽 평원의 검독수리에게 막대를 사용하세요.",
    ["Holt Thunderhorn, the hunter trainer of Thunder Bluff, on the Hunter Rise."] =
        "홀트 썬더혼은 썬더 블러프의 사냥꾼 상급자로, 수렵의 봉우리에 있습니다.",
    ["Uthel'nay, the mage trainer of Orgrimmar, in the Valley of Spirits."] =
        "우텔나이는 오그리마의 마법사 상급자로, 정기의 골짜기에 있습니다.",
    ["From level 10: your trainer's first errand, in Durotar."] =
        "10레벨부터: 듀로타에서 하는 상급자의 첫 심부름.",
    ["Un'Thuwa, the mage trainer of Sen'jin Village."] =
        "운투와는 센진 마을의 마법사 상급자입니다.",
    ["The Ju-Ju Heaps stand on the Echo Isles, off the southern coast."] =
        "주주 해골은 남쪽 해안 앞바다의 메아리 섬에 있습니다.",
    ["Cain Firesong, the mage trainer of Brill."] =
        "케인 파이어송은 브릴의 마법사 상급자입니다.",
    ["From level 10: your trainer's first errand, in Tirisfal Glades."] =
        "10레벨부터: 티리스팔 숲에서 하는 상급자의 첫 심부름.",
    ["Anastasia Hartwell, the mage trainer of the Undercity, in the Magic Quarter."] =
        "아나스타샤 하트웰은 언더시티의 마법사 상급자로, 마법 지구에 있습니다.",
    ["The snapdragons grow by the farm of the Balnirs, in the east of Tirisfal Glades."] =
        "금어초는 티리스팔 숲 동쪽, 발니르 농장 옆에서 자랍니다.",
    ["From level 15: a chain in the Undercity that ends with a robe for you."] =
        "15레벨부터: 언더시티의 연계 퀘스트. 끝에 로브를 받습니다.",
    ["The chest of coffers and the cantation lie beside Anastasia."] =
        "속박의 상자와 현신의 주문서는 아나스타샤 옆에 있습니다.",
    ["The alchemist shop of the Undercity"] =
        "언더시티의 연금술 상점",
    ["Read the cantation to reveal a Rift Spawn, fight it until it is stunned, then use a coffer on it."] =
        "현신의 주문서를 읽어 균열의 정령을 드러내고, 기절할 때까지 싸운 다음 속박의 상자를 사용하세요.",
    ["The Dalaran mages of Ambermill, in Silverpine Forest, carry the mana gems; the linen comes from humanoids anywhere."] =
        "은빛소나무 숲 앰버밀의 달라란 마법사가 마나석을 가지고 있습니다. 리넨은 어디서든 인간형 몬스터에게서 나옵니다.",
    ["Josef Gregorian, the tailor of the Undercity's Rogues' Quarter."] =
        "조셉 그레고리안은 언더시티 도적 지구의 재봉사입니다.",
    ["Your reward: the Spellfire Robes."] =
        "보상: 마법불꽃 로브.",
    ["Deino, the mage trainer of Orgrimmar, in the Valley of Spirits."] =
        "다이노는 오그리마의 마법사 상급자로, 정기의 골짜기에 있습니다.",
    ["Fill the flask at the waterfall of Xavian, in eastern Ashenvale: take the path up from the south."] =
        "잿빛 골짜기 동부, 사비안의 폭포에서 약병을 채우세요: 남쪽에서 올라가는 길을 이용하세요.",
    ["The Laughing Sisters, nymphs of the woods of central Ashenvale, carry the hair."] =
        "잿빛 골짜기 중부 숲의 님프인 미소띤 자매가 머리카락을 가지고 있습니다.",
    ["Kil'hala, the tailor of the Crossroads."] =
        "킬할라는 크로스로드의 재봉사입니다.",
    ["Your reward: the Nether-lace Garment."] =
        "보상: 황천의 로브.",
    ["Shadow Priest Sarvis, at the start of Deathknell."] =
        "어둠의사제 사비스는 데스넬 시작 지점에 있습니다.",
    ["The Forsaken paladin's story, a chain added by Forever, starts in Deathknell."] =
        "Forever가 추가한 연계 퀘스트인 포세이큰 성기사 이야기는 데스넬에서 시작됩니다.",
    ["Aramis Hammerhand, the paladin trainer of Deathknell."] =
        "Aramis Hammerhand는 데스넬의 성기사 상급자입니다.",
    ["Shari Stilwell, the paladin trainer of Brill."] =
        "Shari Stilwell은 브릴의 성기사 상급자입니다.",
    ["Breton Samuels, at the outpost in the west of Tirisfal Glades."] =
        "Breton Samuels는 티리스팔 숲 서쪽의 전초기지에 있습니다.",
    ["Jorin Croge, a few steps away."] =
        "Jorin Croge는 몇 걸음 떨어진 곳에 있습니다.",
    ["The Vile Fin murlocs of the western coast."] =
        "서쪽 해안의 썩은지느러미멀록.",
    ["The lumber piles lie on the western coast, south of the murlocs."] =
        "목재 더미는 서쪽 해안, 멀록이 있는 곳 남쪽에 있습니다.",
    ["Danitha Morr, at the outpost."] =
        "Danitha Morr는 전초기지에 있습니다.",
    ["The Tarnished gather on the western coast; Rudolph Gelhardt, their paladin, carries the head the quest asks for."] =
        "서쪽 해안에 Tarnished가 모여 있습니다. 그들의 성기사 Rudolph Gelhardt가 퀘스트에 필요한 머리를 가지고 있습니다.",
    ["Lady Sylvanas Windrunner, in the Royal Quarter of the Undercity."] =
        "여군주 실바나스 윈드러너는 언더시티의 왕실 지구에 있습니다.",
    ["Danitha Morr, at the outpost in the west of Tirisfal Glades."] =
        "Danitha Morr는 티리스팔 숲 서쪽의 전초기지에 있습니다.",
    ["From level 12: the lessons in divinity, the next chapter of the Forsaken paladin's story."] =
        "12레벨부터: 포세이큰 성기사 이야기의 다음 장인 신앙의 가르침.",
    ["Tanis Alderwood, in the Undercity."] =
        "Tanis Alderwood는 언더시티에 있습니다.",
    ["Tanis needs Linen Cloth: humanoids carry it everywhere."] =
        "Tanis는 리넨 옷감이 필요합니다: 어디서든 인간형 몬스터가 가지고 있습니다.",
    ["Deathguard Billmuth, at the outpost."] =
        "Deathguard Billmuth는 전초기지에 있습니다.",
    ["Deathguard Falgan, in the east of Tirisfal Glades, near the Scarlet watch post."] =
        "Deathguard Falgan은 티리스팔 숲 동쪽, 붉은십자군 감시초소 근처에 있습니다.",
    ["The Scarlet zealots and friars of the watch post carry the attack plans."] =
        "감시초소의 붉은십자군 광신도와 수사가 공격 계획서를 가지고 있습니다.",
    ["From level 18: the story goes on in Silverpine Forest, around a moonsilver blade."] =
        "18레벨부터: 이야기는 은빛소나무 숲에서 달빛 은으로 만든 칼날을 중심으로 이어집니다.",
    ["Trevan Rol, at the Sepulcher."] =
        "Trevan Rol은 공동묘지에 있습니다.",
    ["Deathguard Baldren, at the Sepulcher."] =
        "Deathguard Baldren은 공동묘지에 있습니다.",
    ["The charred remains lie in the east of Silverpine Forest, facing Fenris Isle."] =
        "불탄 잔해는 은빛소나무 숲 동쪽, 펜리스 섬 맞은편에 있습니다.",
    ["Lumina Windsinger, held in Fenris Keep."] =
        "Lumina Windsinger는 펜리스 요새에 갇혀 있습니다.",
    ["The Rot Hide gnolls of Fenris Isle carry the key."] =
        "펜리스 섬의 썩은가죽 놀이 열쇠를 가지고 있습니다.",
    ["Lumina Windsinger waits again at the Sepulcher."] =
        "Lumina Windsinger는 다시 공동묘지에서 기다립니다.",
    ["Old Fire-Eye prowls the south of Silverpine Forest."] =
        "Old Fire-Eye는 은빛소나무 숲 남쪽을 배회합니다.",
    ["Ott, the weaponsmith of Tarren Mill."] =
        "Ott는 타렌 밀농장의 무기제작자입니다.",
    ["Ulric Frostveil, at Zoram'gar Outpost on the coast of Ashenvale."] =
        "Ulric Frostveil은 잿빛 골짜기 해안의 조람가르 전초기지에 있습니다.",
    ["From level 20: Ulric Frostveil's quest of the Kor Gem, in Ashenvale."] =
        "20레벨부터: 잿빛 골짜기에서 하는 Ulric Frostveil의 코르석 퀘스트.",
    ["The naga of the Blackfathom Deeps entrance, under the water of Zoram Strand, carry the corrupted gem. They are elite: bring a group."] =
        "조람 해안 물속, 검은심연의 나락 입구의 나가가 부정한 코르석을 가지고 있습니다. 정예이니 파티를 꾸려 가세요.",
    ["Ken'jai, the priest trainer of the Valley of Trials."] =
        "켄자이는 시험의 골짜기의 사제 상급자입니다.",
    ["From level 5: heal a wounded grunt, and get your first robe."] =
        "5레벨부터: 부상당한 그런트를 치유하고 첫 로브를 받으세요.",
    ["Tai'jin, the priest trainer of Razor Hill."] =
        "타이진은 칼바위 언덕의 사제 상급자입니다.",
    ["Grunt Kor'ja lies wounded south of Razor Hill: heal her with Lesser Heal, then give her Power Word: Fortitude."] =
        "그런트 코르자가 칼바위 언덕 남쪽에 부상당한 채 누워 있습니다: 하급 치유로 치유한 다음 신의 권능: 인내를 걸어 주세요.",
    ["Dark Cleric Duesten, the priest trainer of Deathknell."] =
        "어둠의사제 듀스텐은 데스넬의 사제 상급자입니다.",
    ["From level 5: heal a wounded deathguard, and get your first robe."] =
        "5레벨부터: 부상당한 죽음의경비병을 치유하고 첫 로브를 받으세요.",
    ["Dark Cleric Beryl, the priest trainer of Brill."] =
        "어둠의사제 베릴은 브릴의 사제 상급자입니다.",
    ["Deathguard Kel lies wounded north of Brill: heal him with Lesser Heal, then give him Power Word: Fortitude."] =
        "죽음의경비병 켈이 브릴 북쪽에 부상당한 채 누워 있습니다: 하급 치유로 치유한 다음 신의 권능: 인내를 걸어 주세요.",
    ["From level 10: the quest that teaches Hex of Weakness."] =
        "10레벨부터: 약화의 주술을 배우는 퀘스트.",
    ["Ur'kyo, the priest trainer of Orgrimmar, in the Valley of Spirits."] =
        "우르쿄는 오그리마의 사제 상급자로, 정기의 골짜기에 있습니다.",
    ["Aelthalyste, the priest trainer of the Undercity, in the War Quarter."] =
        "애살리스테는 언더시티의 사제 상급자로, 전쟁 지구에 있습니다.",
    ["From level 10: the quest that teaches Touch of Weakness."] =
        "10레벨부터: 무력의 손길을 배우는 퀘스트.",
    ["From level 20: the quest that teaches Shadowguard."] =
        "20레벨부터: 어둠의 수호를 배우는 퀘스트.",
    ["From level 20: the quest that teaches Devouring Plague."] =
        "20레벨부터: 파멸의 역병을 배우는 퀘스트.",
    ["Learn Pick Lock at your trainer, then practice on lockboxes until your skill reaches 75: Gallywix's lockbox, at 20, needs it."] =
        "상급자에게서 자물쇠 따기를 배운 다음, 숙련도가 75가 될 때까지 잠긴 상자로 연습하세요: 20레벨에 여는 갤리윅스의 자물쇠 상자에 필요합니다.",
    ["Shenthul, in a tent of the Cleft of Shadow, in Orgrimmar."] =
        "셴툴은 오그리마 어둠의 틈의 천막 안에 있습니다.",
    ["Shenthul greets you with a hand sign: answer it with the salute emote."] =
        "셴툴이 손짓으로 인사합니다: 경례 감정 표현으로 답하세요.",
    ["By the Venture Co. tower in the far north of the Barrens: target Taskmaster Fizzule, fire the flare gun twice, then salute him."] =
        "불모의 땅 최북단의 투자개발회사 탑 옆: 감독관 피줄을 대상으로 지정하고 섬광탄포를 두 번 쏜 다음 그에게 경례하세요.",
    ["In the tower: pick Silixiz's key from his pocket, kill the guards floor by floor, Gallywix at the top, then open his lockbox."] =
        "탑 안: 실릭시즈의 주머니에서 열쇠를 훔치고, 층마다 경비병을 처치하고 꼭대기의 갤리윅스도 처치한 다음, 그의 자물쇠 상자를 여세요.",
    ["The lockbox leaves a sickness on you: Shenthul sends you to be cured."] =
        "자물쇠 상자를 열면 병에 걸립니다: 셴툴이 치료받으라고 보냅니다.",
    ["Serge Hinott, the alchemist of Tarren Mill."] =
        "서지 히노트는 타렌 밀농장의 연금술사입니다.",
    ["Stay by Serge while he prepares the cure."] =
        "서지가 치료제를 준비하는 동안 곁에 머무르세요.",
    ["Canaga Earthcaller, in the Valley of Trials."] =
        "카나가 어스콜러는 시험의 골짜기에 있습니다.",
    ["The Felstalkers of the valley carry the hooves."] =
        "골짜기의 하급 지옥사냥개가 발굽을 가지고 있습니다.",
    ["Up the hill path south of the valley: drink the Earth Sapta to see the Minor Manifestation of Earth."] =
        "골짜기 남쪽의 언덕길 위: 대지의 정기를 마셔 하급 대지의 현신을 보세요.",
    ["Seer Ravenfeather, in Camp Narache."] =
        "예언자 레이븐페더는 나라체 야영지에 있습니다.",
    ["The Bristleback shamans east of the camp carry the salve."] =
        "야영지 동쪽의 뾰족털일족 주술사가 연고를 가지고 있습니다.",
    ["On the hill south of the camp: drink the Earth Sapta to see the Minor Manifestation of Earth."] =
        "야영지 남쪽 언덕 위: 대지의 정기를 마셔 하급 대지의 현신을 보세요.",
    ["Windshaper Boro, on Zephras Isle."] =
        "Windshaper Boro는 Zephras Isle에 있습니다.",
    ["Drink the Earth Sapta to see the Minor Manifestation of Earth, east of Boro."] =
        "Boro 동쪽에서 대지의 정기를 마셔 하급 대지의 현신을 보세요.",
    ["Swart, the shaman trainer of Razor Hill."] =
        "스워트는 칼바위 언덕의 주술사 상급자입니다.",
    ["Narm Skychaser, the shaman trainer of Bloodhoof Village."] =
        "나름 스카이체이서는 블러드후프 마을의 주술사 상급자입니다.",
    ["Kranal Fiss, at the Far Watch Post on the border of the Barrens."] =
        "크라날 피스는 불모의 땅 경계의 전초 기지에 있습니다.",
    ["Telf Joolam, on top of a mountain in the west of Durotar."] =
        "텔프 줄람은 듀로타 서쪽의 산꼭대기에 있습니다.",
    ["The Razormane of the northern Barrens carry the Fire Tar; the Burning Blade cultists of the cave north of Razor Hill carry the pouches."] =
        "불모의 땅 북부의 서슬갈기일족이 불붙인 타르를, 칼바위 언덕 북쪽 동굴의 불타는칼날단 이교도가 주머니를 가지고 있습니다.",
    ["Right by Telf: drink the Fire Sapta, then defeat the Minor Manifestation of Fire for its ember."] =
        "텔프 바로 옆: 불의 정기를 마신 다음, 하급 불의 현신을 처치해 불씨를 얻으세요.",
    ["Sessaria Skystride, on Zephras Isle."] =
        "Sessaria Skystride는 Zephras Isle에 있습니다.",
    ["Olariaan Swiftburn, in the south of the isle."] =
        "Olariaan Swiftburn은 섬 남쪽에 있습니다.",
    ["Skypriest Faladiel carries the heart."] =
        "Skypriest Faladiel이 심장을 가지고 있습니다.",
    ["Kuramaa, the spirit of mischief, carries the mask."] =
        "장난의 정령 Kuramaa가 가면을 가지고 있습니다.",
    ["Light the Brazier of Offering by Olariaan, then the Brazier of Eternal Flame by Sessaria."] =
        "Olariaan 옆의 Brazier of Offering에 불을 붙인 다음, Sessaria 옆의 Brazier of Eternal Flame에 불을 붙이세요.",
    ["Searn Firewarder, in the Valley of Wisdom of Orgrimmar."] =
        "시안 파이어워더는 오그리마의 지혜의 골짜기에 있습니다.",
    ["Xanis Flameweaver, on the Elder Rise of Thunder Bluff."] =
        "사니스 프레임위버는 썬더 블러프의 장로의 봉우리에 있습니다.",
    ["Islen Waterseer, by the coast east of the Barrens."] =
        "이슬렌 워터시어는 불모의 땅 동쪽 해안가에 있습니다.",
    ["Brine, in the south of the Barrens."] =
        "브린은 불모의 땅 남쪽에 있습니다.",
    ["Fill the waterskin at the quilboar watering hole, right by Brine."] =
        "브린 바로 옆의 가시멧돼지 물웅덩이에서 물주머니를 채우세요.",
    ["Fill it at the Spring Well of Tarren Mill, in Hillsbrad Foothills."] =
        "힐스브래드 구릉지 타렌 밀농장의 우물에서 채우세요.",
    ["Fill it at the ruins of the Stardust Fountain, in the south of Ashenvale."] =
        "잿빛 골짜기 남쪽, 별가루의 폐허에 있는 분수에서 채우세요.",
    ["By the Brazier of Everfount, in the lake of Silverpine Forest: use the brazier's water, then defeat the corrupt manifestation for its bracers."] =
        "은빛소나무 숲 호수의 영원의 샘 제단 옆: 제단의 물을 사용한 다음, 타락한 현신을 처치해 팔보호구를 얻으세요.",
    ["The Minor Manifestation of Water rises beside the brazier."] =
        "하급 물의 현신이 제단 옆에서 나타납니다.",
    ["Prate Cloudseer, on a mesa in the middle of Thousand Needles."] =
        "프레이트 클라우드시어는 버섯구름 봉우리 중앙의 바위 고원 위에 있습니다.",
    ["Rau Cliffrunner, at Freewind Post."] =
        "라우 클리프러너는 높새바람 봉우리에 있습니다.",
    ["From level 33: Forever's elemental quests of Rau Cliffrunner, in Thousand Needles."] =
        "33레벨부터: 버섯구름 봉우리에서 하는 라우 클리프러너의 Forever 정령 퀘스트.",
    ["Beram Skychaser in Thunder Bluff, or Sagorne Creststrider in Orgrimmar."] =
        "썬더 블러프의 베람 스카이체이서 또는 오그리마의 사고른 크레스트스트라이더.",
    ["From level 50: Bath'rah the Windwatcher's chain, which ends in the Temple of Atal'Hakkar."] =
        "50레벨부터: 바람의감시자 바스라의 연계 퀘스트. 아탈학카르 신전에서 끝납니다.",
    ["One Elemental Earth, Fire, Water and Air: elementals drop them, or the auction house sells them."] =
        "대지의 원소, 불의 원소, 물의 원소, 바람의 원소 각 1개: 정령이 떨어뜨리거나 경매장에서 팝니다.",
    ["The spiders and the bears of the Western Plaguelands carry the eyes and the claws."] =
        "서부 역병지대의 거미와 곰이 눈과 발톱을 가지고 있습니다.",
    ["Ruzan, in the Valley of Trials."] =
        "루잔은 시험의 골짜기에 있습니다.",
    ["Your trainer's first errand, in the Valley of Trials."] =
        "시험의 골짜기에서 하는 상급자의 첫 심부름.",
    ["The Vile Familiars of the cave south of the valley carry the heads."] =
        "골짜기 남쪽 동굴의 악마의 하수인이 머리를 가지고 있습니다.",
    ["Zureetha Fargaze, beside Ruzan."] =
        "주리타 파게이즈는 루잔 옆에 있습니다.",
    ["Venya Marthand, in Deathknell."] =
        "벤야 말선드는 데스넬에 있습니다.",
    ["Your trainer's first errand, in Deathknell."] =
        "데스넬에서 하는 상급자의 첫 심부름.",
    ["The Rattlecage Skeletons east of Deathknell carry the skulls."] =
        "데스넬 동쪽의 덜그럭거리는 해골이 두개골을 가지고 있습니다.",
    ["Ophek, in Razor Hill, sends you to Orgrimmar."] =
        "칼바위 언덕의 오페크가 오그리마로 보냅니다.",
    ["Gan'rul Bloodeye, in the Cleft of Shadow of Orgrimmar."] =
        "간룰 블러드아이는 오그리마의 어둠의 틈에 있습니다.",
    ["The Tablet of Verga lies in the Burning Blade stash at the back of Skull Rock, in the north of Durotar."] =
        "베르가의 서판은 듀로타 북쪽, 해골 바위굴 안쪽의 불타는칼날단 은닉처에 있습니다.",
    ["Right by Gan'rul: use the glyphs on the summoning circle, then defeat the voidwalker."] =
        "간룰 바로 옆: 소환의 마법진에 소환의 문양을 사용한 다음 보이드워커를 처치하세요.",
    ["Ageron Kargal, in Brill, sends you to the Undercity."] =
        "브릴의 아제론 카갈이 언더시티로 보냅니다.",
    ["Carendin Halgar, in the Magic Quarter of the Undercity."] =
        "카렌딘 할가르는 언더시티의 마법 지구에 있습니다.",
    ["Egalin's Grimoire lies in Perrine's chest, in the house south of Brill."] =
        "에갈린의 흑마법서는 브릴 남쪽 집에 있는 페린의 궤짝 안에 있습니다.",
    ["Right by Carendin: use the runes on the summoning circle, then defeat the voidwalker."] =
        "카렌딘 바로 옆: 소환의 마법진에 소환의 룬을 사용한 다음 보이드워커를 처치하세요.",
    ["Cazul, in the Cleft of Shadow."] =
        "카줄은 어둠의 틈에 있습니다.",
    ["Zankaja, in the Valley of Spirits of Orgrimmar."] =
        "잔카자는 오그리마의 정기의 골짜기에 있습니다.",
    ["Gazrog, at the Crossroads."] =
        "가즈록은 크로스로드에 있습니다.",
    ["Ken'zigla, at the camp of Malaka'jin in the far south of Stonetalon Mountains."] =
        "켄지글라는 돌발톱 산맥 최남단의 말라카진 야영지에 있습니다.",
    ["Grunt Logmar, by the road north of Camp Taurajo."] =
        "그런트 로그마르는 타우라조 야영지 북쪽 길가에 있습니다.",
    ["Grunt Dogran is held by the Kolkar in the Barrens: give him the draught."] =
        "그런트 도그란은 불모의 땅에서 콜카르일족에게 붙잡혀 있습니다: 그에게 물약을 주세요.",
    ["Right by Gan'rul: use Dogran's pendant on the summoning circle, then defeat the succubus."] =
        "간룰 바로 옆: 소환의 마법진에 도그란의 펜던트를 사용한 다음 서큐버스를 처치하세요.",
    ["Jorah Annison, in the Magic Quarter of the Undercity."] =
        "조라 애니슨은 언더시티의 마법 지구에 있습니다.",
    ["The Dragonmaw orcs of the Wetlands carry the rod: Alliance land, stay clear of the guards."] =
        "저습지의 용아귀부족 오크가 마법봉을 가지고 있습니다: 얼라이언스 지역이니 경비병을 피하세요.",
    ["Zevrost, the warlock trainer of the Cleft of Shadow."] =
        "제브로스트는 어둠의 틈의 흑마법사 상급자입니다.",
    ["Kurgul, the demon trainer of the Cleft of Shadow."] =
        "쿠르굴은 어둠의 틈의 악마 조련사입니다.",
    ["Your warrior trainer, in Razor Hill or Bloodhoof Village, sends you to Uzzek."] =
        "칼바위 언덕이나 블러드후프 마을의 전사 상급자가 우제크에게 보냅니다.",
    ["Uzzek, at the Far Watch Post on the border of the Barrens."] =
        "우제크는 불모의 땅 경계의 전초 기지에 있습니다.",
    ["From level 10: the quest that teaches Defensive Stance."] =
        "10레벨부터: 방어 태세를 배우는 퀘스트.",
    ["The Thunder Lizards of the north of Durotar carry the scales."] =
        "듀로타 북부의 천둥도마뱀이 비늘을 가지고 있습니다.",
    ["Thun'grim Firegaze, on a hill east of the Crossroads."] =
        "툰그림 파이어게이즈는 크로스로드 동쪽 언덕 위에 있습니다.",
    ["The steel bars lie in the Razormane camp below the hill."] =
        "강철 주괴는 언덕 아래의 서슬갈기일족 야영지에 있습니다.",
    ["Austil de Mon, the warrior trainer of Brill."] =
        "오스틸 드 몽은 브릴의 전사 상급자입니다.",
    ["Deathguard Dillinger, in Brill."] =
        "죽음의경비병 딜링거는 브릴에 있습니다.",
    ["Open the mausoleum north of Brill: Ulag the Cleaver comes out."] =
        "브릴 북쪽의 납골당을 여세요: 학살자 울라그가 나옵니다.",
    ["Coleman Farthing, in the inn of Brill."] =
        "콜만 파딩은 브릴 여관에 있습니다.",
    ["The four heirlooms lie in the crypt of the Agamand Mills, in the northwest of Tirisfal Glades."] =
        "가보 네 개는 티리스팔 숲 북서쪽, 아가만드 방앗간의 지하 묘실에 있습니다.",
    -- Ding! - Dungeon quests (hand-written guides)
    ["The Hall of Thanes"] =
        "영주의 전당",
    ["Afadra Dunwall and Thom Filch, in the west of Ironforge."] =
        "Afadra Dunwall과 Thom Filch는 아이언포지 서쪽에 있습니다.",
    ["Two quests of the hall: a leather belt or mail bracers, cloth gloves or an off-hand tome."] =
        "전당의 퀘스트 두 개: 가죽 허리띠 또는 사슬 손목보호구, 천 장갑 또는 보조장비 고서.",
    ["The Dark Iron spies of the east of Dun Morogh may drop a Dark Iron map: read it."] =
        "던 모로 동쪽의 검은무쇠단 비밀요원이 검은무쇠단 지도를 떨어뜨릴 수 있습니다: 지도를 읽으세요.",
    ["The Dark Iron map opens Old Ironforge Incursion: a gun, a wand or a two-handed mace."] =
        "검은무쇠단 지도는 Old Ironforge Incursion 퀘스트로 이어집니다: 총, 마법봉 또는 양손 둔기.",
    ["Earthseer Farsen, in the east of Dun Morogh."] =
        "Earthseer Farsen은 던 모로 동쪽에 있습니다.",
    ["Enter the Hall of Thanes"] =
        "영주의 전당에 들어가세요",
    ["The hall lies beneath Old Ironforge, in the west of the city."] =
        "전당은 도시 서쪽, 옛 아이언포지 아래에 있습니다.",
    ["Kill the enraged apparitions and the tormented souls of the hall, then put the spirit of Anvilmar to rest."] =
        "전당의 성난 망령과 고통받는 영혼을 처치한 다음, 앤빌마의 영혼을 잠재우세요.",
    ["The dwarven heirlooms lie around the hall."] =
        "드워프 가보는 전당 곳곳에 있습니다.",
    ["The Treaty of Understanding lies in the hall: take it, then read it."] =
        "Treaty of Understanding은 전당 안에 있습니다: 집어서 읽으세요.",
    ["Durgen Dirgehammer carries the head the quest asks for."] =
        "Durgen Dirgehammer가 퀘스트에 필요한 머리를 가지고 있습니다.",
    ["Afadra Dunwall and Thom Filch, in Ironforge."] =
        "Afadra Dunwall과 Thom Filch는 아이언포지에 있습니다.",
    ["King Magni Bronzebeard, in the High Seat of Ironforge."] =
        "국왕 마그니 브론즈비어드는 아이언포지의 왕좌의 방에 있습니다.",
    ["King Magni Bronzebeard."] =
        "국왕 마그니 브론즈비어드.",
    ["Wailing Caverns"] =
        "통곡의 동굴",
    ["Mebok Mizzyrix, in Ratchet."] =
        "메보크 미지릭스는 톱니항에 있습니다.",
    ["Raptor Horns opens Smart Drinks, a quest of the caverns."] =
        "랩터 뿔은 동굴 퀘스트인 영리해지는 음료로 이어집니다.",
    ["Crane Operator Bigglefuzz, on the docks of Ratchet."] =
        "기중기 기사 비글퍼즈는 톱니항 부두에 있습니다.",
    ["The sunscale raptors roam the plains between the Crossroads and Ratchet."] =
        "열대초원랩터가 크로스로드와 톱니항 사이의 평원을 돌아다닙니다.",
    ["Nalpak and Ebru stand in a cave on the caverns' hill: climb the hill from the east, follow the trail and drop onto the rock ledge."] =
        "날팍과 에브루는 동굴 언덕의 작은 굴 안에 있습니다: 동쪽에서 언덕을 올라 오솔길을 따라간 다음 바위 턱으로 뛰어내리세요.",
    ["Two quests of the deviate creatures; their rewards include a bag, leather leggings, mail gauntlets or a wand."] =
        "돌연변이 생물 퀘스트 두 개. 보상으로 가방, 가죽 다리보호구, 사슬 건틀릿 또는 마법봉이 있습니다.",
    ["Mad Magglish, a goblin who stays hidden, walks the caves around the dungeon's door."] =
        "숨어 지내는 고블린인 광기의 매글리시는 던전 입구 주변의 동굴을 돌아다닙니다.",
    ["Enter Wailing Caverns"] =
        "통곡의 동굴에 들어가세요",
    ["The mouth of the caverns opens on the hill above the Lushwater Oasis."] =
        "동굴 입구는 생명의 오아시스 위쪽 언덕에 있습니다.",
    ["Every deviate creature drops hides: raptors, lashers and snakes, from the first halls on."] =
        "모든 돌연변이 생물이 통가죽을 떨어뜨립니다: 첫 구역부터 랩터, 덩굴손, 뱀이 나옵니다.",
    ["The ectoplasms, living oozes of the caverns, drop the essence."] =
        "동굴에 사는 수액괴물인 세포괴물이 정수를 떨어뜨립니다.",
    ["Ravagers and vipers fill the first halls; shamblers and dreadfangs come further in."] =
        "첫 구역에는 약탈자랩터와 독사가 가득하고, 더 안쪽에는 늪괴물과 송곳니천둥매가 나옵니다.",
    ["Mutanus the Devourer may drop the Glowing Shard: he appears after the Disciple of Naralex's ritual, which starts once the four Fanglords are dead."] =
        "걸신들린 무타누스가 빛나는 조각을 떨어뜨릴 수 있습니다: 무타누스는 나랄렉스의 신도가 올리는 의식 뒤에 나타나며, 의식은 송곳니 군주 넷이 모두 죽으면 시작됩니다.",
    ["Nalpak and Ebru, in their cave on the caverns' hill."] =
        "날팍과 에브루는 동굴 언덕의 작은 굴 안에 있습니다.",
    ["Mebok Mizzyrix and Crane Operator Bigglefuzz, in Ratchet."] =
        "메보크 미지릭스와 기중기 기사 비글퍼즈는 톱니항에 있습니다.",
    ["Sputtervalve, in Ratchet, knows what the shard is."] =
        "톱니항의 스퍼터밸브가 조각의 정체를 알고 있습니다.",
    ["Falla Sagewind, on top of the caverns' hill."] =
        "팔라 세이지윈드는 동굴 언덕 꼭대기에 있습니다.",
    ["Mathrengyl Bearwalker, in the Cenarion Enclave of Darnassus."] =
        "마스렌길 베어워커는 다르나서스의 세나리온 자치령에 있습니다.",
    ["The Deadmines"] =
        "죽음의 폐광",
    ["Wilder Thistlenettle, in the Dwarven District of Stormwind."] =
        "빌더 시슬네틀은 스톰윈드의 드워프 지구에 있습니다.",
    ["Two quests of the mine under Moonbrook; their rewards include a two-handed axe and cloth, leather or mail armor."] =
        "달빛시내 마을 아래 광산의 퀘스트 두 개. 보상으로 양손 도끼와 천, 가죽 또는 사슬 방어구가 있습니다.",
    ["Shoni the Shilent, in the Dwarven District."] =
        "소리없는 쇼니는 드워프 지구에 있습니다.",
    ["Reward: armor of leather or mail, or a wand."] =
        "보상: 가죽 또는 사슬 방어구, 또는 마법봉.",
    ["Gryan Stoutmantle, in the tower of Sentinel Hill, in Westfall."] =
        "그라이언 스타우트맨틀은 서부 몰락지대 감시의 언덕의 탑에 있습니다.",
    ["A long chain of six quests between Westfall, Redridge and Stormwind: it leads to VanCleef, whose head brings mail leggings, a leather tunic or a staff."] =
        "서부 몰락지대, 붉은마루 산맥, 스톰윈드를 오가는 퀘스트 6개짜리 긴 연계 퀘스트: 밴클리프로 이어지며, 그의 머리를 가져가면 사슬 다리보호구, 가죽 튜닉 또는 지팡이를 받습니다.",
    ["Alba Fairmoon, south-west of Sentinel Hill."] =
        "Alba Fairmoon은 감시의 언덕 남서쪽에 있습니다.",
    ["A quest of the mine under Moonbrook, ended at the Deadmines' exit."] =
        "달빛시내 마을 아래 광산의 퀘스트로, 죽음의 폐광 출구에서 완료합니다.",
    ["Wiley the Black, in the inn of Lakeshire, in Redridge."] =
        "악당 와일리는 붉은마루 산맥 레이크샤이어의 여관에 있습니다.",
    ["Gryan Stoutmantle, at Sentinel Hill."] =
        "그라이언 스타우트맨틀은 감시의 언덕에 있습니다.",
    ["Master Mathias Shaw, in the SI:7 house of Old Town, in Stormwind."] =
        "단장 마티아스 쇼는 스톰윈드 구 시가지의 SI:7 건물에 있습니다.",
    ["The Defias Messenger walks the road to Moonbrook; he carries the message."] =
        "데피아즈단 전령이 달빛시내 마을로 가는 길을 걸어 다닙니다. 전령이 전갈을 가지고 있습니다.",
    ["Follow the Defias Traitor to Moonbrook; Defias attack on the way."] =
        "데피아즈단 변절자를 따라 달빛시내 마을로 가세요. 가는 길에 데피아즈단이 공격해 옵니다.",
    ["Scout Riell, at the top of the Sentinel Hill tower."] =
        "정찰병 리엘은 감시의 언덕 탑 꼭대기에 있습니다.",
    ["Reward: a weapon of your choice."] =
        "보상: 원하는 무기.",
    ["Go down into the mine under Moonbrook"] =
        "달빛시내 마을 아래 광산으로 내려가세요",
    ["The mine opens inside a house in the middle of Moonbrook."] =
        "광산 입구는 달빛시내 마을 한가운데의 집 안에 있습니다.",
    ["Foreman Thistlenettle and the undead miners roam the mine's tunnels, before the dungeon's door."] =
        "현장감독 시슬네틀과 언데드 광부들이 던전 입구 앞의 광산 굴을 돌아다닙니다.",
    ["Plant the explosives by the forge hidden in the Deadmines."] =
        "죽음의 폐광에 숨겨진 용광로 옆에 폭약을 설치하세요.",
    ["Every Defias of the dungeon may drop a bandana."] =
        "던전의 데피아즈단은 누구나 복면을 떨어뜨릴 수 있습니다.",
    ["Sneed's Shredder, the second boss, in the goblins' lumber cave, drops the Gnoam Sprecklesprocket."] =
        "고블린 벌목 동굴에 있는 두 번째 우두머리 스니드의 벌목기가 노암 톱니구동장치를 떨어뜨립니다.",
    ["Edwin VanCleef, the last boss, waits on the deck of the Defias ship at the end of the cave."] =
        "마지막 우두머리 에드윈 밴클리프는 동굴 끝, 데피아즈단 배의 갑판에서 기다립니다.",
    ["VanCleef drops a letter: read it to take its quest."] =
        "밴클리프가 편지를 떨어뜨립니다: 편지를 읽어 퀘스트를 받으세요.",
    ["Alba Fairmoon waits at the Deadmines' exit, on the coast south-west of Moonbrook."] =
        "Alba Fairmoon은 달빛시내 마을 남서쪽 해안, 죽음의 폐광 출구에서 기다립니다.",
    ["Use her detonator, then tell her."] =
        "그녀의 기폭 장치를 사용한 다음 그녀에게 알리세요.",
    ["Gryan Stoutmantle and Scout Riell, in the Sentinel Hill tower."] =
        "그라이언 스타우트맨틀과 정찰병 리엘은 감시의 언덕 탑에 있습니다.",
    ["Baros Alexston, in the City Hall of the Cathedral Square."] =
        "바로스 알렉스턴은 대성당 광장의 시청에 있습니다.",
    ["Bazil Thredd leads to the Stockade's riots."] =
        "바질 스레드 퀘스트는 지하감옥 폭동으로 이어집니다.",
    ["Warden Thelwater, at the door of the Stockade, in Stormwind."] =
        "교도소장 델워터는 스톰윈드의 지하감옥 입구에 있습니다.",
    ["Ruins of Lordaeron"] =
        "로데론의 폐허",
    ["Enter the Ruins of Lordaeron"] =
        "로데론의 폐허에 들어가세요",
    ["The ruins rise above Undercity, in Tirisfal Glades: Horde land, keep your guard up."] =
        "폐허는 티리스팔 숲의 언더시티 위에 있습니다: 호드 지역이니 경계를 늦추지 마세요.",
    ["The undead of the ruins may drop a bloodied insignia: read it."] =
        "폐허의 언데드가 피 묻은 휘장을 떨어뜨릴 수 있습니다: 휘장을 읽으세요.",
    ["Reward: leather leggings or mail armor."] =
        "보상: 가죽 다리보호구 또는 사슬 방어구.",
    ["Ten insignias, from the undead of the ruins."] =
        "폐허의 언데드에게서 얻는 휘장 10개.",
    ["The Crest of Lordaeron lies in the ruins: take it, then read it."] =
        "Crest of Lordaeron은 폐허 안에 있습니다: 집어서 읽으세요.",
    ["Reward: a small sack of gems."] =
        "보상: 작은 보석 자루.",
    ["Edward Heartweaver's last letter lies in the ruins: read it."] =
        "Edward Heartweaver의 마지막 편지가 폐허 안에 있습니다: 편지를 읽으세요.",
    ["General Marcus Jonathan, at the gate of Stormwind."] =
        "장군 마커스 조나단은 스톰윈드 정문에 있습니다.",
    ["Lady Dena Kennedy, in Stormwind."] =
        "Lady Dena Kennedy는 스톰윈드에 있습니다.",
    ["Orphan Matron Nightingale, at the orphanage of Stormwind."] =
        "보육원 원장님 나이팅게일은 스톰윈드 보육원에 있습니다.",
    ["Blackfathom Deeps"] =
        "검은심연의 나락",
    ["Argos Nightwhisper, in Stormwind."] =
        "아르고스 나이트위스퍼는 스톰윈드에 있습니다.",
    ["Optional: a lead to Auberdine, worth about 1,450 XP once there."] =
        "선택 사항: 아우버다인으로 안내하는 퀘스트로, 도착하면 약 1,450 경험치를 줍니다.",
    ["Gerrig Bonegrip, in the Forlorn Cavern of Ironforge."] =
        "게릭 본그립은 아이언포지의 쓸쓸한 뒷골목에 있습니다.",
    ["Reward: a ring."] =
        "보상: 반지.",
    ["Gershala Nightwhisper, in Auberdine, in Darkshore."] =
        "게르샬라 나이트위스퍼는 어둠의 해안의 아우버다인에 있습니다.",
    ["Gershala Nightwhisper, in Auberdine."] =
        "게르샬라 나이트위스퍼는 아우버다인에 있습니다.",
    ["Reward: cloth, leather or mail armor."] =
        "보상: 천, 가죽 또는 사슬 방어구.",
    ["Argent Guard Manados and Dawnwatcher Shaedlass, in Darnassus."] =
        "은빛경비병 마나도스와 새벽감시자 섀드라스는 다르나서스에 있습니다.",
    ["Two quests of the Argent Dawn: the second leads to Twilight Lord Kelris and a wand, a shield or leather armor."] =
        "은빛 여명회의 퀘스트 두 개: 두 번째 퀘스트는 황혼의 군주 켈리스로 이어지며, 마법봉, 방패 또는 가죽 방어구를 줍니다.",
    ["Enter Blackfathom Deeps"] =
        "검은심연의 나락에 들어가세요",
    ["The deeps open in ruins half under water, on the coast of Ashenvale's Zoram Strand."] =
        "나락 입구는 잿빛 골짜기 조람 해안의, 반쯤 물에 잠긴 폐허에 있습니다.",
    ["The Blackfathom and Fallenroot creatures carry the brain stems, from the cave before the dungeon's door on."] =
        "검은심연과 썩은뿌리 생물이 뇌간을 가지고 있습니다. 던전 입구 앞 동굴부터 나옵니다.",
    ["The manuscript lies in a chest under the water, by Ghamoo-ra, the first boss, in the Pool of Ask'ar."] =
        "초본은 아스카르 웅덩이의 첫 번째 우두머리 가무라 옆, 물속 상자 안에 있습니다.",
    ["Argent Guard Thaelrid waits in an underwater cave south-west of the Pool of Ask'ar."] =
        "은빛경비병 타엘리드는 아스카르 웅덩이 남서쪽의 물속 동굴에서 기다립니다.",
    ["Every Twilight cultist of the deeps may drop a pendant."] =
        "나락의 황혼의망치단 이교도는 누구나 펜던트를 떨어뜨릴 수 있습니다.",
    ["Twilight Lord Kelris, the fourth boss, holds the Moonshrine Sanctum."] =
        "네 번째 우두머리 황혼의 군주 켈리스가 달의 성소를 지키고 있습니다.",
    ["Argent Guard Manados, in Darnassus."] =
        "은빛경비병 마나도스는 다르나서스에 있습니다.",
    ["Dawnwatcher Selgorm, beside him in Darnassus."] =
        "새벽감시자 셀고름은 다르나서스에서 그 옆에 있습니다.",
    ["The Stockade"] =
        "스톰윈드 지하감옥",
    ["Motley Garmason, at Dun Modr, in the north of the Wetlands."] =
        "모틀리 가마슨은 저습지 북쪽의 던 모드르에 있습니다.",
    ["Far north in the Wetlands: it opens The Fury Runs Deep, whose reward is a two-handed mace or a leather belt."] =
        "저습지 북쪽 끝에 있습니다: 격노 퀘스트로 이어지며, 그 보상은 양손 둔기 또는 가죽 허리띠입니다.",
    ["The Dark Iron dwarves camp around Dun Modr."] =
        "검은무쇠단 드워프가 던 모드르 주변에서 야영하고 있습니다.",
    ["Guard Berton, in Lakeshire, in Redridge."] =
        "경비병 베르턴은 붉은마루 산맥의 레이크샤이어에 있습니다.",
    ["Reward: a staff, a sword or a two-handed mace."] =
        "보상: 지팡이, 검 또는 양손 둔기.",
    ["Councilman Millstipe, in the town hall of Darkshire, in Duskwood."] =
        "원로 밀스타이프는 그늘숲 다크샤이어의 마을 회관에 있습니다.",
    ["Nikova Raskol, in Old Town, in Stormwind."] =
        "니코바 라스콜은 스톰윈드 구 시가지에 있습니다.",
    ["Warden Thelwater, at the door of the Stockade."] =
        "교도소장 델워터는 지하감옥 입구에 있습니다.",
    ["Warden Thelwater asks for Bazil Thredd's head."] =
        "교도소장 델워터가 바질 스레드의 머리를 요구합니다.",
    ["Enter the Stockade"] =
        "지하감옥에 들어가세요",
    ["The prison's door is by Warden Thelwater, in Stormwind."] =
        "감옥 입구는 스톰윈드의 교도소장 델워터 옆에 있습니다.",
    ["Targorr the Dread, the first boss, sits in a cell near the start."] =
        "첫 번째 우두머리 흉악범 타고르는 입구 근처의 감방에 있습니다.",
    ["Kam Deepfury: go north, then east; he waits in the second small cell on the left."] =
        "캄 딥퓨리: 북쪽으로 간 다음 동쪽으로 가세요. 왼쪽 두 번째 작은 감방에서 기다립니다.",
    ["Bazil Thredd waits at the end of the east corridor."] =
        "바질 스레드는 동쪽 복도 끝에서 기다립니다.",
    ["Dextren Ward waits at the end of the west corridor."] =
        "덱스트렌 워드는 서쪽 복도 끝에서 기다립니다.",
    ["The prisoners, convicts and insurgents fill every cell; the Defias among them drop the bandanas."] =
        "복역수, 무기징역수, 반역자가 모든 감방을 채우고 있습니다. 그중 데피아즈단이 복면을 떨어뜨립니다.",
    ["Optional: nine more quests in Stormwind; the last brings a ring and about 3,750 XP."] =
        "선택 사항: 스톰윈드에서 퀘스트 9개가 더 이어집니다. 마지막 퀘스트에서 반지와 약 3,750 경험치를 받습니다.",
    ["Baros Alexston, in the City Hall."] =
        "바로스 알렉스턴은 시청에 있습니다.",
    ["Master Mathias Shaw, in the SI:7 house of Old Town."] =
        "단장 마티아스 쇼는 구 시가지의 SI:7 건물에 있습니다.",
    ["Elling Trias, in the cheese shop of the Trade District."] =
        "엘링 트리아스는 상업 지구의 치즈 가게에 있습니다.",
    ["Tyrion, near Stormwind Keep."] =
        "티리온은 스톰윈드 왕궁 근처에 있습니다.",
    ["Three silk cloth, and two of Clara's fresh apples, from a basket north-west of Goldshire, in Elwynn Forest."] =
        "비단 옷감 3개, 그리고 엘윈 숲 골드샤이어 북서쪽의 바구니에서 얻는 클라라의 싱싱한 사과 2개.",
    ["Wait in the garden by Stormwind Keep until Lord Gregor Lescovar and Marzon the Silent Blade have talked, then defeat both."] =
        "스톰윈드 왕궁 옆 정원에서 그레골 라스코발 경과 소리없는검객 마르존이 대화를 마칠 때까지 기다린 다음, 둘 다 처치하세요.",
    ["Elling Trias, in the cheese shop."] =
        "엘링 트리아스는 치즈 가게에 있습니다.",
    ["Master Mathias Shaw, in the SI:7 house."] =
        "단장 마티아스 쇼는 SI:7 건물에 있습니다.",
    ["Lady Katrana Prestor, beside the king in Stormwind Keep."] =
        "여군주 카트라나 프레스톨은 스톰윈드 왕궁에서 국왕 옆에 있습니다.",
    ["Nikova Raskol, in Old Town."] =
        "니코바 라스콜은 구 시가지에 있습니다.",
    ["Guard Berton, in Lakeshire."] =
        "경비병 베르턴은 레이크샤이어에 있습니다.",
    ["Councilman Millstipe, in Darkshire."] =
        "원로 밀스타이프는 다크샤이어에 있습니다.",
    ["Motley Garmason, at Dun Modr."] =
        "모틀리 가마슨은 던 모드르에 있습니다.",
    ["Excavation Site: Wetlands"] =
        "발굴 현장: 저습지",
    ["James Halloran, the tanner of Menethil Harbor, in the Wetlands."] =
        "제임스 할로란은 저습지 메네실 항구의 무두장이입니다.",
    ["Caitlin Grassman, in Menethil Harbor."] =
        "케이틀린 그라스만은 메네실 항구에 있습니다.",
    ["Optional: the guide does not know yet who ends this search; its follow-up brings a satchel of potions."] =
        "선택 사항: 이 수색을 누구에게 완료하는지 가이드가 아직 모릅니다. 후속 퀘스트에서 물약 가방을 받습니다.",
    ["Rethiel the Greenwarden, in the middle of the Wetlands."] =
        "신록의수호자 레시엘은 저습지 한가운데에 있습니다.",
    ["Reward: an axe, and about 3,200 XP."] =
        "보상: 도끼, 그리고 약 3,200 경험치.",
    ["Dorin Songblade, the armorer of Lakeshire, in Redridge."] =
        "도린 송블레이드는 붉은마루 산맥 레이크샤이어의 방어구 제작자입니다.",
    ["Optional: the guide does not know yet who ends this search."] =
        "선택 사항: 이 수색을 누구에게 완료하는지 가이드가 아직 모릅니다.",
    ["Enter the Excavation Site"] =
        "발굴 현장에 들어가세요",
    ["The excavation site opens by the dig in the middle of the Wetlands."] =
        "발굴 현장 입구는 저습지 한가운데의 발굴지 옆에 있습니다.",
    ["Four thicket raptor hides, from the raptors of the site."] =
        "발굴 현장의 랩터에게서 얻는 덤불 랩터 가죽 4개.",
    ["A Highland Horror carries the root core."] =
        "Highland Horror가 뿌리 핵을 가지고 있습니다.",
    ["Ardin Grassman, somewhere in the site."] =
        "Ardin Grassman은 발굴 현장 어딘가에 있습니다.",
    ["Daewyn, somewhere in the site."] =
        "Daewyn은 발굴 현장 어딘가에 있습니다.",
    ["The relic guardians may drop a Titan relic: read it."] =
        "유물 수호자가 티탄 유물을 떨어뜨릴 수 있습니다: 유물을 읽으세요.",
    ["The Titan relic leads to Ironforge's explorers: a staff or a two-handed mace."] =
        "티탄 유물은 아이언포지의 탐험가들에게로 이어집니다: 지팡이 또는 양손 둔기.",
    ["Prospector Whelgar, at his excavation camp in the Wetlands."] =
        "발굴조사단장 웰가르는 저습지의 자기 발굴 야영지에 있습니다.",
    ["Rethiel the Greenwarden."] =
        "신록의수호자 레시엘.",
    ["James Halloran, in Menethil Harbor."] =
        "제임스 할로란은 메네실 항구에 있습니다.",
    ["Dorin Songblade, in Lakeshire."] =
        "도린 송블레이드는 레이크샤이어에 있습니다.",
    ["High Explorer Magellas, in the Hall of Explorers of Ironforge."] =
        "선임탐험가 마겔라스는 아이언포지의 탐험가의 전당에 있습니다.",
    ["Gnomeregan"] =
        "놈리건",
    ["Shoni the Shilent, in the Dwarven District of Stormwind."] =
        "소리없는 쇼니는 스톰윈드의 드워프 지구에 있습니다.",
    ["Reward: cloth or leather gloves, or an axe."] =
        "보상: 천 또는 가죽 장갑, 또는 도끼.",
    ["Brother Sarno, in the Cathedral of Light."] =
        "수사 세르노는 빛의 대성당에 있습니다.",
    ["Optional: a lead to Tinkmaster Overspark in Ironforge."] =
        "선택 사항: 아이언포지의 수석땜장이 오버스파크에게 안내하는 퀘스트.",
    ["Tinkmaster Overspark, in Tinker Town, in Ironforge."] =
        "수석땜장이 오버스파크는 아이언포지의 땜장이 마을에 있습니다.",
    ["Tinkmaster Overspark, in Tinker Town."] =
        "수석땜장이 오버스파크는 땜장이 마을에 있습니다.",
    ["Master Mechanic Castpipe, Klockmort Spannerspan and High Tinker Mekkatorque, in Tinker Town."] =
        "수석수리공 캐스트파이프, 클락몰트 스패너스판, 땜장이왕 멕카토크는 땜장이 마을에 있습니다.",
    ["Tinker Town's quests: Data Rescue brings a two-handed mace or a cloak, The Grand Betrayal cloth, leather or mail armor."] =
        "땜장이 마을의 퀘스트: 자료 회수에서는 양손 둔기 또는 망토를, 대배반에서는 천, 가죽 또는 사슬 방어구를 받습니다.",
    ["Gnoarn, in Tinker Town."] =
        "노아른은 땜장이 마을에 있습니다.",
    ["Ozzie Togglevolt, in Kharanos, in Dun Morogh."] =
        "오지 토글볼트는 던 모로의 카라노스에 있습니다.",
    ["Use the empty phial on the irradiated troggs that roam the gates of Gnomeregan."] =
        "놈리건 입구를 돌아다니는 오염된 트로그에게 빈 채집병을 사용하세요.",
    ["Back to Ozzie Togglevolt, in Kharanos."] =
        "카라노스의 오지 토글볼트에게 돌아가세요.",
    ["Enter Gnomeregan"] =
        "놈리건에 들어가세요",
    ["The gates of Gnomeregan stand in the west of Dun Morogh."] =
        "놈리건 입구는 던 모로 서쪽에 있습니다.",
    ["Techbot, the first boss, waits just inside: he drops the memory core."] =
        "첫 번째 우두머리 첨단로봇은 입구 바로 안쪽에서 기다립니다: 기억회로를 떨어뜨립니다.",
    ["The tall, square machines of the city hold the artificials; every mechanical creature may drop the guts."] =
        "도시의 키 큰 네모난 기계 안에 인공장치가 들어 있습니다. 기계 생물은 누구나 부속품을 떨어뜨릴 수 있습니다.",
    ["Use the heavy phial on a living irradiated slime, in the lower Hall of Gears; the fallout does not last long."] =
        "톱니바퀴 전당 아래층에서 살아 있는 방사능 진흙괴물에게 무거운 채집병을 사용하세요. 폐기물은 오래가지 않습니다.",
    ["The addled leper gnomes drop the white card; the four Matrix Punchographs, from A to D, turn it yellow, blue, red, then prismatic: A on the way in, B at the bottom of the Dormitory, C on the Launch Bay's platform (Electrocutioner 6000's key opens it), D in the lower Engineering Labs."] =
        "정신이상의 오염된 노움이 흰색 카드를 떨어뜨립니다. A부터 D까지 네 대의 Matrix Punchograph가 카드를 차례로 노란색, 파란색, 빨간색, 마지막으로 오색으로 바꿉니다: A는 들어가는 길에, B는 기숙사 맨 아래에, C는 발사대의 단 위에 (기계화 문지기 6000의 열쇠로 열립니다), D는 기계공학 연구실 아래층에 있습니다.",
    ["Kernobee, a gnome held inside the city."] =
        "케르노비는 도시 안에 붙잡혀 있는 노움입니다.",
    ["Optional: an escort, turned in at Booty Bay, far away; it rewards bracers or shoulders."] =
        "선택 사항: 호위 퀘스트로, 멀리 떨어진 무법항에서 완료합니다. 보상은 손목보호구 또는 어깨보호구입니다.",
    ["Lead Kernobee to the Clean Zone, by the dungeon's back door."] =
        "케르노비를 던전 뒷문 옆의 정화 구역까지 데려가세요.",
    ["The Dark Iron agents may drop a grimy ring: use it."] =
        "검은무쇠단 첩보원이 꼬질꼬질한 반지를 떨어뜨릴 수 있습니다: 반지를 사용하세요.",
    ["Put it in the Sparklematic 5200, a cleaning machine of the city."] =
        "도시의 세척 기계인 삐까뻔쩍세척기 5200에 반지를 넣으세요.",
    ["Mekgineer Thermaplugg, the last boss, waits in the Tinkers' Court."] =
        "마지막 우두머리 멕기니어 텔마플러그는 땜장이 궁정에서 기다립니다.",
    ["Ozzie Togglevolt, in Kharanos."] =
        "오지 토글볼트는 카라노스에 있습니다.",
    ["Tinker Town, in Ironforge."] =
        "아이언포지의 땜장이 마을.",
    ["Talvash del Kissel, in the Mystic Ward of Ironforge."] =
        "탈바쉬 델 키젤은 아이언포지의 마법 지구에 있습니다.",
    ["A gold ring, for a silver bar, a moss agate and 30 silver."] =
        "금반지: 은 주괴, 이끼 마노, 30실버를 내고 받습니다.",
    ["A silver bar and a moss agate: from mining, or the auction house."] =
        "은 주괴와 이끼 마노: 채광으로 얻거나 경매장에서 사세요.",
    ["Scooty, the goblin engineer of Booty Bay, in Stranglethorn Vale."] =
        "스쿠티는 가시덤불 골짜기 무법항의 고블린 기술자입니다.",
    ["Razorfen Kraul"] =
        "가시덩굴 우리",
    ["Veyric Thunderhame, in the north-east of Arathi Highlands."] =
        "Veyric Thunderhame은 아라시 고원 북동쪽에 있습니다.",
    ["Shamans: Charlga Razorflank carries the note this quest asks for."] =
        "주술사: 서슬깃 차를가가 이 퀘스트에 필요한 쪽지를 가지고 있습니다.",
    ["Reward: a small container of gems."] =
        "보상: 작은 보석 상자.",
    ["Take the crate with holes and the owner's manual beside Mebok, and read the manual."] =
        "메보크 옆의 구멍 난 상자와 사용 설명서를 챙기고, 설명서를 읽으세요.",
    ["The journal lies by a body in the north-west of Thousand Needles, below the Great Lift: read it."] =
        "일지는 버섯구름 봉우리 북서쪽, 구름 승강장 아래의 시체 옆에 있습니다: 일지를 읽으세요.",
    ["Henrig Lonebrow's journal opens The Crone of the Kraul: cloth shoulders, mail belt or a shield."] =
        "헨리그 론브로우의 일지는 가시덩굴 우리의 대모 퀘스트로 이어집니다: 천 어깨보호구, 사슬 허리띠 또는 방패.",
    ["Falfindel Waywarder, at Thalanaar, on the eastern edge of Feralas."] =
        "팔핀델 웨이워더는 페랄라스 동쪽 끝의 탈라나르에 있습니다.",
    ["Enter Razorfen Kraul"] =
        "가시덩굴 우리에 들어가세요",
    ["The kraul's thorny mound rises in the far south of the Barrens."] =
        "가시덩굴 우리의 가시 언덕은 불모의 땅 남쪽 끝에 솟아 있습니다.",
    ["Past Overlord Ramtusk, open the crate to call the gopher and use the stick on it: it digs up the tubers."] =
        "대군주 램터스크를 지나 상자를 열어 땅다람쥐를 부르고, 땅다람쥐에게 막대를 사용하세요: 덩이줄기를 파냅니다.",
    ["Charlga Razorflank, the last boss, holds the top of the kraul."] =
        "마지막 우두머리 서슬깃 차를가가 가시덩굴 우리 꼭대기를 지키고 있습니다.",
    ["Heralath Fallowbrook lies in the tent on the left, below Charlga Razorflank's platform."] =
        "헤랄라스 팰로우브룩은 서슬깃 차를가의 단 아래, 왼쪽 천막 안에 누워 있습니다.",
    ["Reward: boots of leather or mail, or a cloak."] =
        "보상: 가죽 또는 사슬 장화, 또는 망토.",
    ["Willix the Importer waits beside Heralath's tent."] =
        "수입업자 윌릭스는 헤랄라스의 천막 옆에서 기다립니다.",
    ["Reward: a ring of your choice."] =
        "보상: 원하는 반지.",
    ["Lead Willix back to the entrance; quilboar attack on the way."] =
        "윌릭스를 입구까지 데려가세요. 가는 길에 가시멧돼지가 공격해 옵니다.",
    ["Every Razorfen quilboar may drop Treshala's pendant."] =
        "가시덩굴일족 가시멧돼지는 누구나 트레샬라의 펜던트를 떨어뜨릴 수 있습니다.",
    ["Falfindel Waywarder, at Thalanaar."] =
        "팔핀델 웨이워더는 탈라나르에 있습니다.",
    ["Treshala Fallowbrook, in Darnassus."] =
        "트레샬라 팰로우브룩은 다르나서스에 있습니다.",
    ["Veyric Thunderhame, in Arathi Highlands."] =
        "Veyric Thunderhame은 아라시 고원에 있습니다.",
    ["City of Dalaran"] =
        "달라란 시",
    ["Shylamiir, the herbalism trainer of Stormwind, and High Sorcerer Andromath, in the Mage Quarter."] =
        "스톰윈드의 약초채집 상급자 샤이라미르와 고위마술사 안드로매스는 마법사 지구에 있습니다.",
    ["Two quests of the city from Stormwind: the blossom brings a cloak or a mail belt."] =
        "스톰윈드에서 받는 도시 퀘스트 두 개: 꽃 퀘스트에서 망토 또는 사슬 허리띠를 받습니다.",
    ["Emissary Jacques, in Hillsbrad Foothills."] =
        "Emissary Jacques는 힐스브래드 구릉지에 있습니다.",
    ["The Image of Archmage Modera, by the walls of Dalaran, at the eastern edge of Silverpine Forest."] =
        "Image of Archmage Modera는 은빛소나무 숲 동쪽 끝, 달라란 성벽 옆에 있습니다.",
    ["The Image of Archmage Modera."] =
        "Image of Archmage Modera.",
    ["Archmage Modera's quests: a pendant or an off-hand rod, and an introduction to the Kirin Tor."] =
        "Archmage Modera의 퀘스트: 펜던트 또는 보조장비 마법봉, 그리고 키린 토 소개.",
    ["Enter the City of Dalaran"] =
        "달라란 시에 들어가세요",
    ["The city lies under its dome, in the west of the Alterac Mountains."] =
        "도시는 알터랙 산맥 서쪽, 돔 아래에 있습니다.",
    ["Eight seeking remnants, eight saturated remnants and eight mana echoes, inside the city."] =
        "도시 안의 추적하는 잔재 8마리, 포화된 잔재 8마리, 마나 메아리 8마리.",
    ["The arcane mote, inside the city."] =
        "도시 안의 비전 티끌.",
    ["A fel infused blossom, inside the city."] =
        "도시 안의 지옥 기운이 깃든 꽃.",
    ["The mana elemental, inside the city."] =
        "도시 안의 마나 정령.",
    ["Archmage Celindra, in the City of Dalaran."] =
        "Archmage Celindra는 달라란 시에 있습니다.",
    ["The Image of Archmage Modera, by the walls of Dalaran."] =
        "Image of Archmage Modera는 달라란 성벽 옆에 있습니다.",
    ["Shylamiir and High Sorcerer Andromath, in Stormwind."] =
        "샤이라미르와 고위마술사 안드로매스는 스톰윈드에 있습니다.",
    ["Scarlet Monastery"] =
        "붉은십자군 수도원",
    ["Brother Crowley, in the Cathedral of Light of Stormwind."] =
        "수사 크롤리는 스톰윈드의 빛의 대성당에 있습니다.",
    ["Optional: a lead to Brother Anton in Desolace."] =
        "선택 사항: 잊혀진 땅의 수사 안톤에게 안내하는 퀘스트.",
    ["Librarian Mae Paledust, in the Hall of Explorers of Ironforge."] =
        "사서 메이 페일더스트는 아이언포지의 탐험가의 전당에 있습니다.",
    ["Reward: a necklace, and about 3,550 XP."] =
        "보상: 목걸이, 그리고 약 3,550 경험치.",
    ["Brother Anton, at Nijel's Point, in Desolace."] =
        "수사 안톤은 잊혀진 땅의 나이젤의 야영지에 있습니다.",
    ["Brother Anton, at Nijel's Point."] =
        "수사 안톤은 나이젤의 야영지에 있습니다.",
    ["Down the Scarlet Path, in Desolace then Southshore, opens In the Name of the Light: a weapon or an off-hand orb, and about 4,700 XP."] =
        "잊혀진 땅에서 사우스쇼어로 이어지는 붉은십자군의 길은 빛의 이름으로! 퀘스트로 이어집니다: 무기 또는 보조장비 보주, 그리고 약 4,700 경험치.",
    ["The undead ravagers roam the south-east of Desolace."] =
        "언데드 약탈자가 잊혀진 땅 남동쪽을 돌아다닙니다.",
    ["Raleigh the Devout, in the inn of Southshore, in Hillsbrad Foothills."] =
        "경건한 신자 랄레이는 힐스브래드 구릉지 사우스쇼어의 여관에 있습니다.",
    ["Magus Olvek, in the west of the Alterac Mountains."] =
        "Magus Olvek은 알터랙 산맥 서쪽에 있습니다.",
    ["About 3,200 XP."] =
        "약 3,200 경험치.",
    ["Enter the Scarlet Monastery"] =
        "붉은십자군 수도원에 들어가세요",
    ["The monastery stands in the far east of Tirisfal Glades; its four wings, Graveyard, Library, Armory and Cathedral, each have their own door."] =
        "수도원은 티리스팔 숲 동쪽 끝에 있습니다. 묘지, 도서관, 무기고, 대성당 네 구역에는 각각 입구가 따로 있습니다.",
    ["Magus Olvek's book lies somewhere in the monastery."] =
        "Magus Olvek의 책은 수도원 어딘가에 있습니다.",
    ["Library: the book lies on the floor under a window, on the left of the room after the Gallery of Treasures."] =
        "도서관: 책은 보물 전시실 다음 방 왼쪽, 창문 아래 바닥에 있습니다.",
    ["Houndmaster Loksey, the Library's first boss; Herod, the Armory's only boss; Scarlet Commander Mograine and High Inquisitor Whitemane, at the end of the Cathedral. Arcanist Doan's chest, at the end of the Library, holds the Scarlet Key that opens the Armory and the Cathedral."] =
        "도서관의 첫 번째 우두머리는 사냥개조련사 록시, 무기고의 유일한 우두머리는 헤로드, 대성당 끝에는 붉은십자군 사령관 모그레인과 종교재판관 화이트메인이 있습니다. 도서관 끝에 있는 신비술사 도안의 상자에 무기고와 대성당을 여는 붉은십자군 열쇠가 들어 있습니다.",
    ["Magus Olvek, in the Alterac Mountains."] =
        "Magus Olvek은 알터랙 산맥에 있습니다.",
    ["Raleigh the Devout, in Southshore."] =
        "경건한 신자 랄레이는 사우스쇼어에 있습니다.",
    ["Librarian Mae Paledust, in Ironforge."] =
        "사서 메이 페일더스트는 아이언포지에 있습니다.",
    ["Razorfen Downs"] =
        "가시덩굴 구릉",
    ["Archbishop Benedictus, in the Cathedral of Light of Stormwind."] =
        "대주교 베네딕투스는 스톰윈드의 빛의 대성당에 있습니다.",
    ["Reward: a sword or a talisman, and about 4,300 XP."] =
        "보상: 검 또는 부적, 그리고 약 4,300 경험치.",
    ["Myriam Moonsinger, outside Razorfen Downs, in the far south of the Barrens."] =
        "미리암 문싱어는 불모의 땅 남쪽 끝, 가시덩굴 구릉 밖에 있습니다.",
    ["About 3,450 XP, without entering the downs."] =
        "약 3,450 경험치. 구릉 안에 들어가지 않아도 됩니다.",
    ["The Razorfen battleguards, thornweavers and Death's Head cultists guard the slopes before the downs."] =
        "가시덩굴일족 전투호위병, 가시마술사, 죽음의 머리교 신도가 구릉 앞 비탈을 지키고 있습니다.",
    ["Myriam Moonsinger."] =
        "미리암 문싱어.",
    ["Enter Razorfen Downs"] =
        "가시덩굴 구릉에 들어가세요",
    ["The downs' entrance is by Myriam Moonsinger, at the foot of the great thorn mound."] =
        "구릉 입구는 거대한 가시 언덕 기슭, 미리암 문싱어 옆에 있습니다.",
    ["Belnistrasz waits in the Holding Pen, on the north side of the Murder Pens; taking his second quest starts his ritual at once."] =
        "벨리스트라즈는 학살의 우리 북쪽의 감금 우리에서 기다립니다. 그의 두 번째 퀘스트를 받으면 바로 의식이 시작됩니다.",
    ["Belnistrasz's ritual: a ring, and about 4,250 XP."] =
        "벨리스트라즈의 의식: 반지, 그리고 약 4,250 경험치.",
    ["Defend Belnistrasz while he works: waves of quilboar and undead come. Then use his brazier, in the same room."] =
        "벨리스트라즈가 의식을 진행하는 동안 그를 지키세요: 가시멧돼지와 언데드가 차례로 몰려옵니다. 그런 다음 같은 방에 있는 그의 화로를 사용하세요.",
    ["Amnennar the Coldbringer, the last boss, waits at the top of the Spiral of Thorns."] =
        "마지막 우두머리 혹한의 암네나르는 가시 나선 꼭대기에서 기다립니다.",
    ["Archbishop Benedictus, in Stormwind."] =
        "대주교 베네딕투스는 스톰윈드에 있습니다.",
    ["Uldaman"] =
        "울다만",
    ["Prospector Stormpike, in the Hall of Explorers of Ironforge."] =
        "발굴조사단장 스톰파이크는 아이언포지의 탐험가의 전당에 있습니다.",
    ["The Lost Dwarves leads to the Hidden Chamber: a two-handed axe or a lodestar, and about 3,900 XP."] =
        "길 잃은 드워프는 비밀 석실 퀘스트로 이어집니다: 양손 도끼 또는 등불, 그리고 약 3,900 경험치.",
    ["Krom Stoutarm, in the Hall of Explorers."] =
        "크롬 스타우트암은 탐험가의 전당에 있습니다.",
    ["About 3,600 XP for a chest at Uldaman's gates."] =
        "울다만 입구의 상자 하나로 약 3,600 경험치.",
    ["Prospector Ironband, at his excavation site in the south-east of Loch Modan."] =
        "발굴조사단장 아이언밴드는 모단 호수 남동쪽의 자기 발굴 현장에 있습니다.",
    ["Find Agmond leads to Agmond's Fate: gloves of cloth, leather or mail."] =
        "아그몬드 찾기는 아그몬드의 운명 퀘스트로 이어집니다: 천, 가죽 또는 사슬 장갑.",
    ["Ghak Healtouch, in Thelsamar."] =
        "가크 힐터치는 텔사마에 있습니다.",
    ["It opens Uldaman Reagent Run: restorative potions and about 3,450 XP."] =
        "울다만에서 재료 찾기 퀘스트로 이어집니다: 회복 물약, 그리고 약 3,450 경험치.",
    ["Rigglefuzz, in the middle of the Badlands."] =
        "리글퍼즈는 황야의 땅 한가운데에 있습니다.",
    ["Reward: leather or mail bracers, cloth boots or a shield."] =
        "보상: 가죽 또는 사슬 손목보호구, 천 장화 또는 방패.",
    ["Theldurin the Lost, in the south of the Badlands."] =
        "실성한 텔두린은 황야의 땅 남쪽에 있습니다.",
    ["Reward: a cloth robe."] =
        "보상: 천 로브.",
    ["A crumpled map lies on the ground in the north of the Badlands."] =
        "구겨진 지도가 황야의 땅 북쪽 땅바닥에 떨어져 있습니다.",
    ["A long chain of nine quests between the Badlands and Ironforge: it ends inside Uldaman with the Lost Tablets of Will, a medal and about 5,850 XP."] =
        "황야의 땅과 아이언포지를 오가는 퀘스트 9개짜리 긴 연계 퀘스트: 울다만 안에서 잃어버린 결의의 서판으로 끝나며, 메달과 약 5,850 경험치를 받습니다.",
    ["Prospector Ryedol, a short walk south of the map."] =
        "발굴조사단장 라이돌은 지도에서 남쪽으로 조금 걸어가면 있습니다.",
    ["A battered dwarven skeleton lies in the middle of the Badlands."] =
        "황야의 땅 한가운데에 낡은 드워프 해골이 놓여 있습니다.",
    ["Murdaloc and the Stonevault troggs camp just south of the skeleton."] =
        "멀달록과 바위동굴일족 트로그가 해골 바로 남쪽에서 야영하고 있습니다.",
    ["The buzzards and crag coyotes of the Badlands drop the gizzards and fangs."] =
        "황야의 땅의 대머리수리와 바위산코요테가 모래주머니와 송곳니를 떨어뜨립니다.",
    ["Hammertoe Grez, by the gates of Uldaman, in the north of the Badlands."] =
        "해머토 그레즈는 황야의 땅 북쪽, 울다만 입구 옆에 있습니다.",
    ["Magregan Deepshadow, a Shadowforge dwarf by the gates, carries the amulet; the tablet lies in an ancient chest close by."] =
        "입구 옆의 어둠괴철로단 드워프 마그레간 딥섀도가 아뮬렛을 가지고 있고, 서판은 근처의 고대 상자 안에 있습니다.",
    ["The Shadowforge dwarves around the gates drop the power stones."] =
        "입구 주변의 어둠괴철로단 드워프가 마력석을 떨어뜨립니다.",
    ["The Shadowforge dwarves may also drop a shattered necklace: use it."] =
        "어둠괴철로단 드워프는 부서진 목걸이도 떨어뜨릴 수 있습니다: 목걸이를 사용하세요.",
    ["Hammertoe Grez."] =
        "해머토 그레즈.",
    ["Prospector Ryedol."] =
        "발굴조사단장 라이돌.",
    ["Theldurin the Lost."] =
        "실성한 텔두린.",
    ["Prospector Ironband, in Loch Modan."] =
        "발굴조사단장 아이언밴드는 모단 호수에 있습니다.",
    ["Historian Karnik, in the Hall of Explorers of Ironforge."] =
        "역사학자 카르닉은 아이언포지의 탐험가의 전당에 있습니다.",
    ["Advisor Belgrum, in the Hall of Explorers."] =
        "조언자 벨그룸은 탐험가의 전당에 있습니다.",
    ["Historian Karnik."] =
        "역사학자 카르닉.",
    ["Talvash's chain ends inside Uldaman with a necklace and about 5,600 XP."] =
        "탈바쉬의 연계 퀘스트는 울다만 안에서 끝나며, 목걸이와 약 5,600 경험치를 줍니다.",
    ["Five silver bars: from mining, or the auction house."] =
        "은 주괴 5개: 채광으로 얻거나 경매장에서 사세요.",
    ["Ambassador Infernus walks with the Dark Iron dwarves south of Uldaman's gates."] =
        "사자 인페르누스는 울다만 입구 남쪽에서 검은무쇠단 드워프와 함께 돌아다닙니다.",
    ["Krom Stoutarm's chest stands in the dig south-west of Uldaman's gates."] =
        "크롬 스타우트암의 상자는 울다만 입구 남서쪽의 발굴지에 있습니다.",
    ["Carved stone urns lie around the dig and inside Uldaman."] =
        "조각된 돌 항아리는 발굴지 주변과 울다만 안에 있습니다.",
    ["Magenta cap clusters grow on the cave walls, south-west of the gates and inside."] =
        "자홍색 버섯 덩어리는 입구 남서쪽과 던전 안의 동굴 벽에서 자랍니다.",
    ["Advisor Belgrum, in the Hall of Explorers of Ironforge."] =
        "조언자 벨그룸은 아이언포지의 탐험가의 전당에 있습니다.",
    ["Enter Uldaman"] =
        "울다만에 들어가세요",
    ["The dungeon's door is at the back of the cave by Hammertoe Grez's dig."] =
        "던전 입구는 해머토 그레즈의 발굴지 옆 동굴 안쪽 끝에 있습니다.",
    ["A dead paladin rests just off the first great hall, down its second right-hand passage."] =
        "죽은 성기사는 첫 번째 큰 전당에서 오른쪽 두 번째 통로로 조금 들어간 곳에 누워 있습니다.",
    ["Baelog, the first boss, in Dig Two: the left corridor, then the room to the south."] =
        "첫 번째 우두머리 밸로그는 제2 발굴지에 있습니다: 왼쪽 복도로 간 다음 남쪽 방으로 가세요.",
    ["The Tablet of Will stands against a wall of Dig Three."] =
        "결의의 서판은 제3 발굴지의 벽에 기대어 서 있습니다.",
    ["The Gni'kiv Medallion lies in Baelog's chest, Revelosh drops the Shaft of Tsol: join them into the Staff of Prehistoria, use it in the Map Chamber, then step into Ironaya's room."] =
        "그니키브 메달은 밸로그의 상자 안에 있고, 레벨로쉬가 티솔의 자루를 떨어뜨립니다: 둘을 합쳐 잃어버린 역사의 지팡이를 만들고, 지도의 방에서 사용한 다음 아이로나야의 방으로 들어가세요.",
    ["The topaz is in a conspicuous urn south-east of Dig Two, the ruby in a stone chest north-west of Dig Three (it calls monsters), the sapphire on Grimlok at the end of the Stone Vault."] =
        "토파즈는 제2 발굴지 남동쪽의 눈에 띄는 항아리 안에, 루비는 제3 발굴지 북서쪽의 돌 상자 안에 (몬스터를 불러냅니다), 사파이어는 돌 금고 끝의 그림로크에게 있습니다.",
    ["Use Talvash's phial at his scrying bowl, in the dungeon."] =
        "던전 안에 있는 탈바쉬의 점술 그릇에서 탈바쉬의 약병을 사용하세요.",
    ["Archaedas, the last boss, guards the Hall of the Crafters: he drops the power source."] =
        "마지막 우두머리 아카에다스가 장인의 전당을 지키고 있습니다: 마력원천을 떨어뜨립니다.",
    ["The Discs of Norgannon, in the room behind Archaedas."] =
        "아카에다스 뒤쪽 방에 있는 노르간논의 원반.",
    ["Optional: the Discs of Norgannon, behind Archaedas, tell their story; it ends in Ironforge with potions or a bag."] =
        "선택 사항: 아카에다스 뒤의 노르간논의 원반이 이야기를 들려줍니다. 아이언포지에서 끝나며 물약 또는 가방을 받습니다.",
    ["Prospector Stormpike and Krom Stoutarm, in the Hall of Explorers of Ironforge."] =
        "발굴조사단장 스톰파이크와 크롬 스타우트암은 아이언포지의 탐험가의 전당에 있습니다.",
    ["Talvash del Kissel, in the Mystic Ward."] =
        "탈바쉬 델 키젤은 마법 지구에 있습니다.",
    ["High Explorer Magellas, in the Hall of Explorers."] =
        "선임탐험가 마겔라스는 탐험가의 전당에 있습니다.",
    ["Dinita Stonemantle, in Ironforge."] =
        "디니타 스톤맨틀은 아이언포지에 있습니다.",
    ["Zul'Farrak"] =
        "줄파락",
    ["Gryphon Master Talonaxe, at Aerie Peak, in the Hinterlands."] =
        "그리핀 조련사 탈론액스는 동부 내륙지의 맹금의 봉우리에 있습니다.",
    ["Optional: a chain of seven quests between the Hinterlands, the Blasted Lands and the city; the last one, an elite fight to the top of Jintha'Alor, brings a mace or leather leggings."] =
        "선택 사항: 동부 내륙지, 저주받은 땅, 그리고 이 도시를 오가는 퀘스트 7개짜리 연계 퀘스트. 마지막 퀘스트는 진타알로 꼭대기까지 정예와 싸우며 올라가야 하며, 둔기 또는 가죽 다리보호구를 줍니다.",
    ["The Witherbark cages stand in the troll camps of the south-west of the Hinterlands."] =
        "마른나무껍질부족 우리는 동부 내륙지 남서쪽의 트롤 야영지에 있습니다.",
    ["Search the Altar of Zul, in the middle of the trolls' ruins in the south of the Hinterlands."] =
        "동부 내륙지 남쪽 트롤 폐허 한가운데의 줄의 제단을 조사하세요.",
    ["Thadius Grimshade, at the top of Nethergarde Keep, in the Blasted Lands."] =
        "샤디우스 그림섀이드는 저주받은 땅 네더가드 요새 꼭대기에 있습니다.",
    ["Your mage trainer, in a capital."] =
        "대도시의 마법사 상급자.",
    ["Tabetha, in her house in the middle of Dustwallow Marsh."] =
        "타베사는 먼지진흙 습지대 한가운데의 자기 집에 있습니다.",
    ["Reward: a staff or plate shoulders."] =
        "보상: 지팡이 또는 판금 어깨보호구.",
    ["Wizzle Brassbolts, at the racetrack of the Shimmering Flats, in Thousand Needles."] =
        "위즐 브라스볼츠는 버섯구름 봉우리 소금 평원의 경주로에 있습니다.",
    ["Reward: a carrot on a stick, which makes your mount faster."] =
        "보상: 탈것을 더 빠르게 해 주는 당근 달린 지팡이.",
    ["Tran'rek, Trenton Lighthammer and Chief Engineer Bilgewhizzle, in Gadgetzan, in Tanaris."] =
        "트란렉, 트렌튼 라이트해머, 선임기술자 빌지위즐은 타나리스의 가젯잔에 있습니다.",
    ["Gadgetzan's quests: the Divino-matic Rod brings a ring or a leather helm; the other two, about 3,900 XP each."] =
        "가젯잔의 퀘스트: 자동 탐사막대 퀘스트에서는 반지 또는 가죽 투구를, 나머지 두 퀘스트에서는 각각 약 3,900 경험치를 받습니다.",
    ["Yeh'kinya, at Steamwheedle Port, on the east coast of Tanaris."] =
        "예킨야는 타나리스 동쪽 해안의 스팀휘들 항구에 있습니다.",
    ["It opens The Prophecy of Mosh'aru, about 5,250 XP."] =
        "모쉬아루의 예언 퀘스트로 이어집니다. 약 5,250 경험치.",
    ["Kill the vale screechers of Feralas and use Yeh'kinya's bramble on their bodies."] =
        "페랄라스의 계곡천둥매를 처치하고 그 시체에 예킨야의 나뭇가지를 사용하세요.",
    ["Yeh'kinya, at Steamwheedle Port."] =
        "예킨야는 스팀휘들 항구에 있습니다.",
    ["Enter Zul'Farrak"] =
        "줄파락에 들어가세요",
    ["The city's gate is in the north-west of Tanaris."] =
        "도시 입구는 타나리스 북서쪽에 있습니다.",
    ["The scarabs drop the shells; most of them crowd Theka the Martyr's chamber."] =
        "왕쇠똥구리가 껍질을 떨어뜨립니다. 대부분 순교자 데카의 방에 몰려 있습니다.",
    ["Theka the Martyr, the second boss, in the scarabs' room to the north, holds the first tablet; Hydromancer Velratha, by the pool to the south-east, the second."] =
        "북쪽 왕쇠똥구리 방의 두 번째 우두머리 순교자 데카가 첫 번째 서판을, 남동쪽 연못가의 유체술사 벨라타가 두 번째 서판을 가지고 있습니다.",
    ["Hydromancer Velratha also wears the Tiara of the Deep."] =
        "유체술사 벨라타는 심연의 티아라도 쓰고 있습니다.",
    ["Gahz'rilla rises from the pool when its gong is struck with the Mallet of Zul'Farrak, made in the Hinterlands: one of the group needs it."] =
        "동부 내륙지에서 만드는 줄파락의 나무망치로 징을 울리면 가즈릴라가 연못에서 솟아오릅니다: 파티원 중 한 명은 망치가 있어야 합니다.",
    ["Nekrum Gutchewer joins the fight at the top of the pyramid, when the prisoners are freed."] =
        "피라미드 꼭대기에서 포로들이 풀려나면 네크룸 거트츄어가 싸움에 끼어듭니다.",
    ["Sergeant Bly, one of the prisoners at the top of the pyramid: free them, defend them, then he turns on you."] =
        "하사관 블라이는 피라미드 꼭대기에 있는 포로 중 한 명입니다: 포로들을 풀어 주고 지켜 주면, 그 뒤에 블라이가 덤벼듭니다.",
    ["Every troll of the city may drop a troll temper; it can take more than one run."] =
        "도시의 트롤은 누구나 트롤 경화제를 떨어뜨릴 수 있습니다. 한 번 도는 것으로는 부족할 수 있습니다.",
    ["Tran'rek, Trenton Lighthammer and Chief Engineer Bilgewhizzle, in Gadgetzan."] =
        "트란렉, 트렌튼 라이트해머, 선임기술자 빌지위즐은 가젯잔에 있습니다.",
    ["Optional: an egg in the Hinterlands; it opens The God Hakkar, a quest of the Temple of Atal'Hakkar."] =
        "선택 사항: 동부 내륙지의 알. 아탈학카르 신전 퀘스트인 학카르의 화신으로 이어집니다.",
    ["Wizzle Brassbolts, at the Shimmering Flats."] =
        "위즐 브라스볼츠는 소금 평원에 있습니다.",
    ["Tabetha, in Dustwallow Marsh."] =
        "타베사는 먼지진흙 습지대에 있습니다.",
    ["Thadius Grimshade, in Nethergarde Keep."] =
        "샤디우스 그림섀이드는 네더가드 요새에 있습니다.",
    ["Wait while Thadius Grimshade performs his divination."] =
        "샤디우스 그림섀이드가 점을 치는 동안 기다리세요.",
    ["Gryphon Master Talonaxe, at Aerie Peak."] =
        "그리핀 조련사 탈론액스는 맹금의 봉우리에 있습니다.",
    ["Vile Priestess Hexx, at the top of Jintha'Alor, carries the key to Sharpbeak's cage: elite trolls all the way up."] =
        "진타알로 꼭대기의 타락한 여사제 헥스가 뾰족부리의 우리 열쇠를 가지고 있습니다: 올라가는 길 내내 정예 트롤이 있습니다.",
    ["The Ancient Egg lies at the top of Jintha'Alor too."] =
        "고대의 알도 진타알로 꼭대기에 있습니다.",
    ["Gryphon Master Talonaxe."] =
        "그리핀 조련사 탈론액스.",
    ["Maraudon"] =
        "마라우돈",
    ["Archmage Tervosh, in his tower in Theramore, in Dustwallow Marsh."] =
        "대마법사 테르보쉬는 먼지진흙 습지대 테라모어의 자기 탑에 있습니다.",
    ["Reward: a pendant of your choice."] =
        "보상: 원하는 펜던트.",
    ["Talendria and Keeper Marandis, at Nijel's Point, in the north of Desolace."] =
        "탈렌드리아와 수호자 마란디스는 잊혀진 땅 북쪽의 나이젤의 야영지에 있습니다.",
    ["Nijel's Point's two quests: a ring, plate gauntlets or a leather belt; then Theradras's end brings a sword, a staff or a bow."] =
        "나이젤의 야영지의 퀘스트 두 개: 반지, 판금 건틀릿 또는 가죽 허리띠. 그다음 테라드라스를 쓰러뜨리면 검, 지팡이 또는 활을 받습니다.",
    ["Willow, in the middle of Desolace."] =
        "윌로우는 잊혀진 땅 한가운데에 있습니다.",
    ["Reward: cloth, leather, mail or plate armor."] =
        "보상: 천, 가죽, 사슬 또는 판금 방어구.",
    ["The Centaur Pariah, an outcast in the south of Desolace."] =
        "켄타우로스 추방자는 잊혀진 땅 남쪽에 사는 외톨이입니다.",
    ["About 5,450 XP."] =
        "약 5,450 경험치.",
    ["Cavindra, on the path to Maraudon, in the west of Desolace."] =
        "카빈드라는 잊혀진 땅 서쪽, 마라우돈으로 가는 길에 있습니다.",
    ["Legends of Maraudon leads to the Scepter of Celebras, a shortcut into the inner falls."] =
        "마라우돈의 전설은 셀레브라스의 홀로 이어집니다. 셀레브라스의 홀은 안쪽 폭포로 가는 지름길입니다.",
    ["Enter Maraudon"] =
        "마라우돈에 들어가세요",
    ["Maraudon's caves open in the west of Desolace; inside, an orange and a purple wing lead down to the inner falls."] =
        "마라우돈의 동굴 입구는 잊혀진 땅 서쪽에 있습니다. 안에서는 주황색 구역과 보라색 구역이 아래쪽의 안쪽 폭포로 이어집니다.",
    ["The Shadowshard elementals of the outer caves drop the fragments."] =
        "바깥 동굴의 음영석정령이 조각을 떨어뜨립니다.",
    ["Fill the vial at the orange crystal pool, in the caves before the Orange wing; in the wing, use it on the stumps with red tops: the Noxxious scions come out."] =
        "주황색 구역 앞 동굴의 주황색 수정 웅덩이에서 약병을 채우세요. 구역 안에서 윗부분이 붉은 그루터기에 약병을 사용하면 녹시온의 후예가 나옵니다.",
    ["Every creature of Maraudon may drop a crystal carving."] =
        "마라우돈의 생물은 누구나 수정 조각품을 떨어뜨릴 수 있습니다.",
    ["Use the Amulet of Spirits on the Spirit of Veng, who walks the Orange wing, then kill Veng; then on the Spirit of Maraudos in the Purple wing's grotto, then kill Maraudos. Join the two gems."] =
        "주황색 구역을 돌아다니는 벵의 영혼에게 영혼의 아뮬렛을 사용한 다음 벵을 처치하세요. 이어서 보라색 구역 동굴의 마라우도스의 영혼에게 사용한 다음 마라우도스를 처치하세요. 보석 두 개를 합치세요.",
    ["Noxxion, the Orange wing's first boss, drops the rod; Lord Vyletongue, in a small room north of his seat in the Purple wing, the diamond."] =
        "주황색 구역의 첫 번째 우두머리 녹시온이 막대를 떨어뜨립니다. 보라색 구역에서 자기 자리 북쪽의 작은 방에 있는 군주 바일텅이 다이아몬드를 떨어뜨립니다.",
    ["Kill Celebras the Cursed, on the island of the Poison Falls: Celebras the Redeemed appears."] =
        "독의 폭포 섬에 있는 저주받은 셀레브라스를 처치하세요: 회복된 셀레브라스가 나타납니다.",
    ["Follow Celebras to his stone and wait for his incantation."] =
        "셀레브라스를 따라 그의 돌까지 간 다음 주문을 마칠 때까지 기다리세요.",
    ["Celebras the Redeemed, by his stone."] =
        "회복된 셀레브라스는 자기 돌 옆에 있습니다.",
    ["Princess Theradras, the last boss, waits at the end of Zaetar's Grave, south and down the waterfall."] =
        "마지막 우두머리 공주 테라드라스는 남쪽 폭포 아래, 재타르의 무덤 끝에서 기다립니다.",
    ["Zaetar's Spirit appears in the middle of Theradras's room."] =
        "테라드라스의 방 한가운데에 재타르의 영혼이 나타납니다.",
    ["About 6,100 XP; the seed goes to Moonglade."] =
        "약 6,100 경험치. 씨앗은 달의 숲으로 가져갑니다.",
    ["The Centaur Pariah, in the south of Desolace."] =
        "켄타우로스 추방자는 잊혀진 땅 남쪽에 있습니다.",
    ["Talendria and Keeper Marandis, at Nijel's Point."] =
        "탈렌드리아와 수호자 마란디스는 나이젤의 야영지에 있습니다.",
    ["Archmage Tervosh, in Theramore."] =
        "대마법사 테르보쉬는 테라모어에 있습니다.",
    ["Keeper Remulos, at the Shrine of Remulos, in Moonglade."] =
        "수호자 레물로스는 달의 숲의 레물로스의 제단에 있습니다.",
    ["The Temple of Atal'Hakkar"] =
        "아탈학카르 신전",
    ["Brohann Caskbelly, in the Dwarven District of Stormwind."] =
        "브로한 캐스크벨리는 스톰윈드의 드워프 지구에 있습니다.",
    ["Optional: a chain of eight quests from Stormwind to the Hinterlands, Tanaris and Feralas; it opens Into the Temple of Atal'Hakkar, a talisman and about 7,100 XP."] =
        "선택 사항: 스톰윈드에서 동부 내륙지, 타나리스, 페랄라스로 이어지는 퀘스트 8개짜리 연계 퀘스트. '아탈학카르 신전으로' 퀘스트로 이어지며, 부적과 약 7,100 경험치를 줍니다.",
    ["Find the temple: the ruins in the Pool of Tears, in the east of the Swamp of Sorrows."] =
        "신전을 찾으세요: 슬픔의 늪 동쪽, 눈물의 연못에 있는 폐허입니다.",
    ["Brohann Caskbelly, in Stormwind."] =
        "브로한 캐스크벨리는 스톰윈드에 있습니다.",
    ["Falstad Wildhammer, at Aerie Peak, in the Hinterlands."] =
        "폴스타트 와일드해머는 동부 내륙지의 맹금의 봉우리에 있습니다.",
    ["Rhapsody Shindigger, on the road east of Aerie Peak."] =
        "랩소디 신디거는 맹금의 봉우리 동쪽 길가에 있습니다.",
    ["The Atal'ai Exile, in the south of the Hinterlands."] =
        "추방된 아탈라이트롤은 동부 내륙지 남쪽에 있습니다.",
    ["Reward: cloth leggings or a mail helm, and about 6,550 XP."] =
        "보상: 천 다리보호구 또는 사슬 투구, 그리고 약 6,550 경험치.",
    ["Muigin, at Marshal's Refuge, in Un'Goro Crater."] =
        "무이긴은 운고로 분화구의 마샬의 야영지에 있습니다.",
    ["Muigin's chain leads to the temple's haze."] =
        "무이긴의 연계 퀘스트는 신전의 아지랑이로 이어집니다.",
    ["The bloodpetal plants of Un'Goro drop the petals."] =
        "운고로의 붉은꽃잎덩굴손이 꽃잎을 떨어뜨립니다.",
    ["Gregan Brewspewer, in the north of Feralas."] =
        "그레간 브루스퓨는 페랄라스 북쪽에 있습니다.",
    ["Angelas Moonbreeze, at Feathermoon Stronghold, in Feralas."] =
        "안젤라스 문브리즈는 페랄라스의 페더문 요새에 있습니다.",
    ["Marvon's chain opens two quests of the temple; one rewards a Hakkari urn."] =
        "마본의 연계 퀘스트는 신전 퀘스트 두 개로 이어집니다. 그중 하나의 보상은 학카르의 단지입니다.",
    ["Groddoc and ironfur livers in Feralas, roc gizzards in Tanaris."] =
        "그로독 고릴라 간과 무쇠곰 간은 페랄라스에서, 로크 모래주머니는 타나리스에서 얻습니다.",
    ["Marvon Rivetseeker, in Tanaris, south of Gadgetzan."] =
        "마본 리벳시커는 타나리스, 가젯잔 남쪽에 있습니다.",
    ["Marvon's chest, in his old workshop in Ratchet, holds the stone circle."] =
        "톱니항에 있는 마본의 옛 작업장의 궤짝에 돌무리가 들어 있습니다.",
    ["Marvon Rivetseeker, in Tanaris."] =
        "마본 리벳시커는 타나리스에 있습니다.",
    ["Yeh'kinya, at Steamwheedle Port, in Tanaris."] =
        "예킨야는 타나리스의 스팀휘들 항구에 있습니다.",
    ["The Ancient Egg lies at the top of Jintha'Alor, in the Hinterlands, among elite trolls."] =
        "고대의 알은 동부 내륙지 진타알로 꼭대기, 정예 트롤들 사이에 있습니다.",
    ["Reward: a plate helm, a cloth circlet or a dagger, and about 7,900 XP."] =
        "보상: 판금 투구, 천 머리장식 또는 단검, 그리고 약 7,900 경험치.",
    ["Rhapsody Shindigger, in the Hinterlands."] =
        "랩소디 신디거는 동부 내륙지에 있습니다.",
    ["The Atal'ai tablets lie in the ruins around the Pool of Tears, and inside the temple."] =
        "아탈라이 서판은 눈물의 연못 주변 폐허와 신전 안에 있습니다.",
    ["Enter the Temple of Atal'Hakkar"] =
        "아탈학카르 신전에 들어가세요",
    ["The temple lies sunken in the Pool of Tears, in the east of the Swamp of Sorrows: swim down to the ruins' stairs."] =
        "신전은 슬픔의 늪 동쪽의 눈물의 연못에 가라앉아 있습니다: 폐허의 계단까지 헤엄쳐 내려가세요.",
    ["The murk worms, deep lurkers and oozes of the temple drop the haze."] =
        "신전의 진흙미늘벌레, 지하껍질괴물, 수액괴물이 아지랑이를 떨어뜨립니다.",
    ["Hall of Serpents: use the six statues in this order: south, north, south-west, south-east, north-west, north-east; Atal'alarion appears. The Idol of Hakkar stands in the middle of the Pit of Refuse."] =
        "뱀의 전당: 석상 여섯 개를 남쪽, 북쪽, 남서쪽, 남동쪽, 북서쪽, 북동쪽 순서로 사용하세요. 아탈알라리온이 나타납니다. 학카르 신상은 쓰레기 구덩이 한가운데에 있습니다.",
    ["Climb the stairs of the Pit of Refuse: the Altar of Hakkar waits up there."] =
        "쓰레기 구덩이의 계단을 올라가세요: 위에 학카르 제단이 있습니다.",
    ["Kill the six troll elites on the balconies first: Jammal'an's barrier falls; he waits south-east of the Pit of Sacrifice."] =
        "먼저 발코니의 정예 트롤 여섯을 처치하세요: 잠말란의 보호막이 사라집니다. 잠말란은 희생의 구덩이 남동쪽에서 기다립니다.",
    ["The Shade of Eranikus, at the end of the south path, may drop his essence: use it."] =
        "남쪽 길 끝의 에라니쿠스의 사령이 정수를 떨어뜨릴 수 있습니다: 정수를 사용하세요.",
    ["The Essence Font, in the north-east corner of his room."] =
        "그의 방 북동쪽 구석에 있는 정수의 샘.",
    ["Use the Oathstone of Ysera's Dragonflight it gives you."] =
        "거기서 받은 이세라 용군단의 서약의 돌을 사용하세요.",
    ["Keep the Chained Essence of Eranikus, the font's reward: Itharius asks for it."] =
        "정수의 샘의 보상인 속박된 에라니쿠스의 정수를 버리지 말고 가지고 있으세요: 이타리우스가 요구합니다.",
    ["Use the Egg of Hakkar by the skeleton in the Sanctum of the Fallen God, south-west: Hakkari bloodkeepers come, their blood puts out the four eternal flames, then the Avatar of Hakkar comes; his essence fills the egg."] =
        "남서쪽 몰락한 신의 성소에 있는 해골 옆에서 학카르의 알을 사용하세요: 학카르 수호천둥매가 몰려오고, 그 피로 영원의 불꽃 네 개를 끄면 학카르의 화신이 나타납니다. 화신의 정수가 알을 채웁니다.",
    ["Itharius, a green dragon in the south-west of the Swamp of Sorrows."] =
        "이타리우스는 슬픔의 늪 남서쪽에 있는 녹색용입니다.",
    ["The Atal'ai Exile, in the Hinterlands."] =
        "추방된 아탈라이트롤은 동부 내륙지에 있습니다.",
    ["The beasts of Un'Goro drop the bloodpetal sprouts."] =
        "운고로의 야수가 붉은꽃잎 씨앗을 떨어뜨립니다.",
    ["Umbranse the Spiritspeaker, in the east of Winterspring."] =
        "영매 엄브런스는 여명의 설원 동쪽에 있습니다.",
    ["Blackrock Depths"] =
        "검은바위 나락",
    ["Royal Historian Archesonus, in the Hall of Explorers of Ironforge."] =
        "왕실사학자 아케소누스는 아이언포지의 탐험가의 전당에 있습니다.",
    ["The royal historian's chain leads to Kharan Mighthammer, then to the emperor and the princess: King Magni's reward and about 9,650 XP at its end."] =
        "왕실사학자의 연계 퀘스트는 카란 마이트해머로, 이어서 제왕과 공주로 이어집니다: 끝에 국왕 마그니의 보상과 약 9,650 경험치를 받습니다.",
    ["Listen to the royal historian."] =
        "왕실사학자의 이야기를 들으세요.",
    ["Ragnar Thunderbrew, in Kharanos, in Dun Morogh."] =
        "라그나르 썬더브루는 던 모로의 카라노스에 있습니다.",
    ["Reward: a two-handed axe or a mace, or dark dwarven lager."] =
        "보상: 양손 도끼 또는 둔기, 또는 검은 드워프 맥주.",
    ["Kalaran Windblade, in the middle of the Searing Gorge."] =
        "칼라란 윈드블레이드는 이글거리는 협곡 한가운데에 있습니다.",
    ["Optional: ten quests in the Searing Gorge before A Taste of Flame, which brings a cloth cape or sash or leather shoulders."] =
        "선택 사항: 화염의 맛 전에 이글거리는 협곡에서 퀘스트 10개를 합니다. 화염의 맛에서는 천 망토나 장식띠, 또는 가죽 어깨보호구를 받습니다.",
    ["Listen to Kalaran Windblade's story."] =
        "칼라란 윈드블레이드의 이야기를 들으세요.",
    ["The fire elementals of the Searing Gorge drop the hearts of flame; the golems, the oil."] =
        "이글거리는 협곡의 불의 정령이 화염의 심장을, 골렘이 기름을 떨어뜨립니다.",
    ["The Dark Iron dwarves of the gorge carry the thorium plated daggers."] =
        "협곡의 검은무쇠단 드워프가 토륨 도금 단검을 가지고 있습니다.",
    ["The Twilight cultists of the gorge carry the symbols of Ragnaros."] =
        "협곡의 황혼의망치단 이교도가 라그나로스의 상징을 가지고 있습니다.",
    ["Listen to Kalaran Windblade."] =
        "칼라란 윈드블레이드의 이야기를 들으세요.",
    ["Use the Torch of Retribution beside Kalaran."] =
        "칼라란 옆의 응보의 횃불을 사용하세요.",
    ["Squire Maltrake, beside Kalaran."] =
        "수습기사 몰트레이크는 칼라란 옆에 있습니다.",
    ["Light the four sentry braziers on the Dark Iron watchtowers of the gorge."] =
        "협곡의 검은무쇠단 감시탑에 있는 감시의 화롯불 네 개에 불을 붙이세요.",
    ["The Hoard of the Black Dragonflight, beside Squire Maltrake."] =
        "수습기사 몰트레이크 옆의 검은용군단의 보물.",
    ["The ghost of Franclorn Forgewright, inside Blackrock Mountain, by the way down to the depths."] =
        "프랑클론 포지라이트의 유령은 검은바위 산 안, 나락으로 내려가는 길 옆에 있습니다.",
    ["Franclorn's quest brings the Shadowforge Key, which opens doors of the depths."] =
        "프랑클론의 퀘스트에서 나락의 문을 여는 어둠괴철로단 열쇠를 받습니다.",
    ["Use the Thaurissan relic in the ruins of Thaurissan, in the middle of the Burning Steppes."] =
        "불타는 평원 한가운데의 타우릿산의 폐허에서 타우릿산 유물을 사용하세요.",
    ["Yuka Screwspigot and Maxwort Uberglint, at Flame Crest, in the north of the Burning Steppes."] =
        "유카 스크류스피곳과 맥스워트 우버글린트는 불타는 평원 북쪽의 화염 마루에 있습니다.",
    ["Flame Crest's two quests: Ribbly's head brings leather shoulders, cloth boots or mail armor."] =
        "화염 마루의 퀘스트 두 개: 리블리의 머리를 가져가면 가죽 어깨보호구, 천 장화 또는 사슬 방어구를 받습니다.",
    ["Jalinda Sprig and Oralius, at Morgan's Vigil, in the east of the Burning Steppes."] =
        "잘린다 스프리그와 랄리우스는 불타는 평원 동쪽의 모건의 터에 있습니다.",
    ["Morgan's Vigil's quests: Incendius! brings armor of any kind, The Good Stuff a fanny pack of loot."] =
        "모건의 터의 퀘스트: 인센디우스!에서는 종류를 가리지 않는 방어구를, 좋은 물건에서는 전리품이 든 벨트주머니를 받습니다.",
    ["Cyrus Therepentous, in the far east of the Burning Steppes."] =
        "키루스 테레펜터스는 불타는 평원 동쪽 끝에 있습니다.",
    ["A frenzied black drake of the steppes drops the molt; then talk to Cyrus."] =
        "평원의 광포한 검은 비룡이 허물을 떨어뜨립니다. 그런 다음 키루스와 대화하세요.",
    ["Helendis Riverhorn, at Morgan's Vigil."] =
        "헬렌디스 리버혼은 모건의 터에 있습니다.",
    ["Optional: eight quests between the steppes, Lakeshire and Stormwind before Marshal Windsor, whose Jail Break! brings a sword or a dagger among its rewards, and about 7,750 XP."] =
        "선택 사항: 치안대장 윈저에 앞서 평원, 레이크샤이어, 스톰윈드를 오가는 퀘스트 8개를 합니다. 윈저의 탈옥! 보상 중에는 검 또는 단검이 있으며, 약 7,750 경험치를 줍니다.",
    ["The black dragonkin of the steppes' north."] =
        "평원 북쪽의 검은용족.",
    ["Magistrate Solomon, in the town hall of Lakeshire, in Redridge."] =
        "집정관 솔로몬은 붉은마루 산맥 레이크샤이어의 마을 회관에 있습니다.",
    ["Highlord Bolvar Fordragon, in Stormwind Keep."] =
        "대영주 볼바르 폴드라곤은 스톰윈드 왕궁에 있습니다.",
    ["Talk to Lady Katrana Prestor, beside the king."] =
        "국왕 옆의 여군주 카트라나 프레스톨과 대화하세요.",
    ["Magistrate Solomon, in Lakeshire."] =
        "집정관 솔로몬은 레이크샤이어에 있습니다.",
    ["Marshal Maxwell, at Morgan's Vigil."] =
        "치안대장 맥스웰은 모건의 터에 있습니다.",
    ["Talk to Ragged John, at Flame Crest."] =
        "화염 마루의 털보 존과 대화하세요.",
    ["Royal Historian Archesonus, in Ironforge."] =
        "왕실사학자 아케소누스는 아이언포지에 있습니다.",
    ["Overmaster Pyron walks the bottom of Blackrock Mountain, before the depths' door."] =
        "멸망의 파이론은 검은바위 산 아래쪽, 나락 입구 앞을 돌아다닙니다.",
    ["Enter Blackrock Depths"] =
        "검은바위 나락에 들어가세요",
    ["Blackrock Mountain opens in the west of the Burning Steppes; inside, the depths' door is at the bottom of the mountain."] =
        "검은바위 산 입구는 불타는 평원 서쪽에 있습니다. 산 안에서 나락 입구는 산 맨 아래에 있습니다.",
    ["High Interrogator Gerstahn, in a back room on the right of the Detention Block, carries the cell key; Kharan Mighthammer sits in the second cell on the right of the tunnel."] =
        "감금 구역 오른쪽 안쪽 방의 대심문관 게르스탄이 감방 열쇠를 가지고 있습니다. 카란 마이트해머는 통로 오른쪽 두 번째 감방에 있습니다.",
    ["Let Kharan tell his story."] =
        "카란이 이야기를 마칠 때까지 들으세요.",
    ["Marshal Windsor, two cells further."] =
        "치안대장 윈저는 감방 두 칸 더 안쪽에 있습니다.",
    ["The Anvilrage dwarves of the first rooms may drop a crumpled note: read it."] =
        "첫 방들의 성난모루단 드워프가 꼬깃꼬깃한 쪽지를 떨어뜨릴 수 있습니다: 쪽지를 읽으세요.",
    ["Marshal Windsor, in his cell."] =
        "치안대장 윈저는 자기 감방에 있습니다.",
    ["Fineous Darkvire, in the lower Hall of Crafting, carries Ironfel; the Monument of Franclorn Forgewright stands at the dead end past the Shrine of Thaurissan."] =
        "제작의 전당 아래층의 파이너스 다크바이어가 무쇠지옥을 가지고 있습니다. 프랑클론 포지라이트의 기념비는 타우릿산의 제단을 지나 막다른 곳에 있습니다.",
    ["The Monument of Franclorn Forgewright."] =
        "프랑클론 포지라이트의 기념비.",
    ["Bael'Gar waits at the end of the Dark Iron Highway: use Cyrus's molt on his body."] =
        "밸가르는 검은무쇠 대로 끝에서 기다립니다: 그의 시체에 키루스의 허물을 사용하세요.",
    ["General Angerforge, down the stairs of the West Garrison, and Golem Lord Argelmach, in the Manufactory, carry Windsor's lost information."] =
        "서부 주둔지 계단 아래의 사령관 앵거포지와 제조소의 골렘 군주 아젤마크가 윈저의 잃어버린 정보를 가지고 있습니다.",
    ["Free Marshal Windsor and follow him through the Detention Block and the Halls of the Law."] =
        "치안대장 윈저를 풀어 주고 감금 구역과 법의 전당을 지나 그를 따라가세요.",
    ["Mistress Nagmara, in the Grim Guzzler tavern."] =
        "지배인 나그마라는 험상궂은 주정뱅이 선술집에 있습니다.",
    ["Optional: Mistress Nagmara's love potion needs herbs, silver veins of giants and water of Un'Goro's hot springs; it brings cloth bracers or a leather belt."] =
        "선택 사항: 지배인 나그마라의 사랑의 묘약에는 약초, 거인의 은 광석, 운고로 온천의 물이 필요합니다. 천 손목보호구 또는 가죽 허리띠를 받습니다.",
    ["Ribbly Screwspigot sits at the bottom of the Grim Guzzler: talk to him, then fight him."] =
        "리블리 스크류스피곳은 험상궂은 주정뱅이 선술집 아래층에 있습니다: 대화한 다음 싸우세요.",
    ["Break the three Thunderbrew lager kegs in a side room of the lower Grim Guzzler: Hurley Blackbreath comes."] =
        "험상궂은 주정뱅이 선술집 아래층 옆방의 썬더브루 맥주통 세 개를 부수세요: 헐레이 블랙브레스가 나타납니다.",
    ["The relic coffer keys drop from the dwarves; the twelve coffers of the Black Vault call Watchman Doomgrip, who opens the Heart's vault."] =
        "드워프가 유물 금고 열쇠를 떨어뜨립니다. 검은 금고의 금고 열두 개를 열면 보초 둠그립이 나타나며, 그가 산의 정수가 든 금고를 엽니다.",
    ["The Anvilrage dwarves drop the fanny packs."] =
        "성난모루단 드워프가 벨트주머니를 떨어뜨립니다.",
    ["King Magni Bronzebeard, in Ironforge."] =
        "국왕 마그니 브론즈비어드는 아이언포지에 있습니다.",
    ["Jalinda Sprig, at Morgan's Vigil."] =
        "잘린다 스프리그는 모건의 터에 있습니다.",
    ["Gromsblood, from herbalism or the auction house; giant silver veins from the giants of Azshara; the vial filled at the Golakka Hot Springs of Un'Goro Crater."] =
        "그롬의 피는 약초채집으로 얻거나 경매장에서 사고, 거대한 은 광석은 아즈샤라의 거인에게서 얻고, 약병은 운고로 분화구의 골락카 간헐천에서 채웁니다.",
    ["Enter Blackrock Depths again"] =
        "다시 검은바위 나락에 들어가세요",
    ["Lord Incendius waits at the Black Anvil, in Shadowforge City."] =
        "불의군주 인센디우스는 어둠괴철로 도시의 검은 모루에서 기다립니다.",
    ["Mistress Nagmara, in the Grim Guzzler."] =
        "지배인 나그마라는 험상궂은 주정뱅이 선술집에 있습니다.",
    ["Emperor Dagran Thaurissan, the last boss, sits in the Imperial Seat: keep Princess Moira alive while you fight him."] =
        "마지막 우두머리 제왕 다그란 타우릿산은 제왕의 왕좌에 앉아 있습니다: 그와 싸우는 동안 공주 모이라가 죽지 않게 하세요.",
    ["Princess Moira Bronzebeard, in the Imperial Seat."] =
        "공주 모이라 브론즈비어드는 제왕의 왕좌에 있습니다.",
    ["Yuka Screwspigot and Maxwort Uberglint, at Flame Crest."] =
        "유카 스크류스피곳과 맥스워트 우버글린트는 화염 마루에 있습니다.",
    ["Cyrus Therepentous, in the far east of the steppes."] =
        "키루스 테레펜터스는 평원 동쪽 끝에 있습니다.",
    ["Jalinda Sprig and Oralius, at Morgan's Vigil."] =
        "잘린다 스프리그와 랄리우스는 모건의 터에 있습니다.",
    ["Marshal Maxwell."] =
        "치안대장 맥스웰.",
    ["Ragnar Thunderbrew, in Kharanos."] =
        "라그나르 썬더브루는 카라노스에 있습니다.",
    ["Blackrock Spire"] =
        "검은바위 첨탑",
    ["Prospector Ironboot, at Steamwheedle Port, in Tanaris."] =
        "발굴조사단장 아이언부트는 타나리스의 스팀휘들 항구에 있습니다.",
    ["Yeh'kinya's chain from Zul'Farrak and the sunken temple goes on: two tablets in the Eastern Plaguelands, two inside the spire, then a cloak."] =
        "줄파락과 가라앉은 사원에서 이어진 예킨야의 연계 퀘스트가 계속됩니다: 동부 역병지대에서 서판 두 개, 첨탑 안에서 두 개를 찾은 다음 망토를 받습니다.",
    ["The third and fourth tablets lie in the troll ruins of the north of the Eastern Plaguelands."] =
        "세 번째와 네 번째 서판은 동부 역병지대 북쪽의 트롤 폐허에 있습니다.",
    ["Prospector Ironboot, at Steamwheedle Port."] =
        "발굴조사단장 아이언부트는 스팀휘들 항구에 있습니다.",
    ["Kibler, at Flame Crest, in the north of the Burning Steppes."] =
        "키블러는 불타는 평원 북쪽의 화염 마루에 있습니다.",
    ["Kibler's two quests: a worg pup or a smolderweb spider, pets that follow you."] =
        "키블러의 퀘스트 두 개: 따라다니는 애완동물인 새끼 검은늑대 또는 불그물거미.",
    ["Ragged John, at Flame Crest."] =
        "털보 존은 화염 마루에 있습니다.",
    ["Reward: Ragged John's neverending cup, and about 9,950 XP."] =
        "보상: 털보 존의 마법 술잔, 그리고 약 9,950 경험치.",
    ["Helendis Riverhorn, at Morgan's Vigil, in the east of the Burning Steppes."] =
        "헬렌디스 리버혼은 불타는 평원 동쪽의 모건의 터에 있습니다.",
    ["Reward: a cloth robe, a leather jerkin or a mail breastplate."] =
        "보상: 천 로브, 가죽 조끼 또는 사슬 흉갑.",
    ["Enter Blackrock Spire"] =
        "검은바위 첨탑에 들어가세요",
    ["Blackrock Mountain opens in the west of the Burning Steppes; inside, the spire's door is at the top of the mountain."] =
        "검은바위 산 입구는 불타는 평원 서쪽에 있습니다. 산 안에서 첨탑 입구는 산 꼭대기에 있습니다.",
    ["Warosh, a troll who walks near the spire's entrance."] =
        "와로쉬는 첨탑 입구 근처를 걸어 다니는 트롤입니다.",
    ["Reward: a charm, after a fight with Urok Doomhowl."] =
        "보상: 우로크 둠하울과 싸운 뒤 받는 부적.",
    ["Vaelan, a Scarshield infiltrator, stands up the ramp near the spire's entrance."] =
        "방패부대 잠입자인 밸란은 첨탑 입구 근처의 비탈길 위에 서 있습니다.",
    ["Optional: the Seal of Ascension, the key to the Upper Spire, a raid of ten; its last part is in Dustwallow Marsh."] =
        "선택 사항: 10인 공격대 던전인 검은바위 첨탑 상층의 열쇠, 승천의 인장. 마지막 단계는 먼지진흙 습지대에서 진행합니다.",
    ["Bijou hides down in the trench after Hordemar City's second bridge."] =
        "비쥬는 호드마르 시의 두 번째 다리를 지나 참호 아래에 숨어 있습니다.",
    ["Bijou's chain leads to Maxwell's Mission: armor of any kind, after a second visit."] =
        "비쥬의 연계 퀘스트는 맥스웰의 임무로 이어집니다: 두 번째로 방문한 뒤 종류를 가리지 않는 방어구를 받습니다.",
    ["Her belongings lie in a chest on the bottom tier of Hordemar City; it can also stand as far as the Skitterweb Tunnels."] =
        "그녀의 소지품은 호드마르 시 맨 아래층의 상자 안에 있습니다. 상자가 멀리 잰걸음거미 굴에 있을 수도 있습니다.",
    ["Back to Bijou."] =
        "비쥬에게 돌아가세요.",
    ["The fifth tablet hangs on a wall of Shadow Hunter Vosh'gajin's room, the sixth on a wall of War Master Voone's room."] =
        "다섯 번째 서판은 어둠사냥꾼 보쉬가진의 방 벽에, 여섯 번째 서판은 대장군 부네의 방 벽에 걸려 있습니다.",
    ["Take the Roughshod Pike from a weapon rack on the left wall after Hordemar City's second bridge, join it to Highlord Omokk's head, and use it on the skull pile up the ramp past Mother Smolderweb: ogres come, then Urok Doomhowl."] =
        "호드마르 시의 두 번째 다리를 지나 왼쪽 벽의 무기 거치대에서 날카로운 장창을 가져가 대군주 오모크의 머리와 합친 다음, 여왕 불그물거미를 지나 비탈길 위의 해골 더미에 사용하세요: 오우거들이 나온 다음 우로크 둠하울이 나옵니다.",
    ["The spire spider eggs lie in the upper Skitterweb Tunnels."] =
        "첨탑 거미알은 잰걸음거미 굴 위쪽에 있습니다.",
    ["Use the empty cage on a Bloodaxe worg pup, in Halycon's room."] =
        "할리콘의 방에서 도끼부대 새끼 검은늑대에게 빈 우리를 사용하세요.",
    ["Halycon, the worgs' mother, holds Halycon's Lair."] =
        "검은늑대의 어미 할리콘이 할리콘의 굴을 지키고 있습니다.",
    ["The Scarshield dwarves drop the unadorned seal; Highlord Omokk, north of Mok'Doom, may drop the Spirestone gem, War Master Voone, at the bottom of Tazz'Alaor, the Smolderthorn gem, and Overlord Wyrmthalak, the last boss, the Bloodaxe gem."] =
        "방패부대 드워프가 가공하지 않은 인장을 떨어뜨립니다. 목둠 북쪽의 대군주 오모크는 뾰족바위일족 보석을, 타즈알라오르 아래쪽의 대장군 부네는 가시불꽃부족 보석을, 마지막 우두머리 대군주 웜타라크는 도끼부대 보석을 떨어뜨릴 수 있습니다.",
    ["Vaelan, near the entrance."] =
        "밸란은 입구 근처에 있습니다.",
    ["Warosh, near the entrance."] =
        "와로쉬는 입구 근처에 있습니다.",
    ["Let Mother Smolderweb poison you and do not cure it: the poison must last until Ragged John, at Flame Crest."] =
        "여왕 불그물거미의 독에 걸린 다음 치료하지 마세요: 화염 마루의 털보 존에게 갈 때까지 독이 남아 있어야 합니다.",
    ["Enter Blackrock Spire again"] =
        "다시 검은바위 첨탑에 들어가세요",
    ["Highlord Omokk, north of Mok'Doom; War Master Voone, at the bottom of Tazz'Alaor; Overlord Wyrmthalak, the last boss, in the Chamber of Battle."] =
        "대군주 오모크는 목둠 북쪽에, 대장군 부네는 타즈알라오르 아래쪽에, 마지막 우두머리 대군주 웜타라크는 전투의 방에 있습니다.",
    ["Kibler and Ragged John, at Flame Crest."] =
        "키블러와 털보 존은 화염 마루에 있습니다.",
    ["Helendis Riverhorn and Marshal Maxwell, at Morgan's Vigil."] =
        "헬렌디스 리버혼과 치안대장 맥스웰은 모건의 터에 있습니다.",
    ["Beat Emberstrife, a dragon of the Wyrmbog in Dustwallow Marsh, until his will breaks, then place the seal before him."] =
        "먼지진흙 습지대 용의 늪에 사는 용 엠버스트라이프의 의지가 꺾일 때까지 싸운 다음, 그 앞에 인장을 놓으세요.",
    ["Vaelan, near the spire's entrance."] =
        "밸란은 첨탑 입구 근처에 있습니다.",
    ["Yeh'kinya, beside him."] =
        "예킨야는 그 옆에 있습니다.",
    ["Dire Maul"] =
        "혈투의 전장",
    ["A herald of your capital: Crier Goodman in Stormwind, Courier Hammerfall in Ironforge, Herald Moonstalker in Darnassus."] =
        "대도시의 전령: 스톰윈드의 포고꾼 굿맨, 아이언포지의 급사 해머폴, 다르나서스의 전령 문스토커.",
    ["Optional: a lead to Feathermoon Stronghold, about 1,500 XP."] =
        "선택 사항: 페더문 요새로 안내하는 퀘스트, 약 1,500 경험치.",
    ["Latronicus Moonspear, at Feathermoon Stronghold, in Feralas."] =
        "라트로니쿠스 문스피어는 페랄라스의 페더문 요새에 있습니다.",
    ["Latronicus Moonspear and Scholar Runethorn, at Feathermoon Stronghold."] =
        "라트로니쿠스 문스피어와 학자 룬쏜은 페더문 요새에 있습니다.",
    ["Lethtendris's Web brings a dagger; Elven Legends, about 8,300 XP for a search in the library."] =
        "레스텐드리스의 그물에서는 단검을 받고, 엘프의 전설에서는 도서관을 조사해 약 8,300 경험치를 받습니다.",
    ["Azj'Tordin, at Lariss Pavilion, in the east of Feralas."] =
        "아즈토르딘은 페랄라스 동쪽의 라리스 정자에 있습니다.",
    ["Reward: a two-handed sword or leather boots; Pusillin also drops the Crescent Key, which opens the west and north wings."] =
        "보상: 양손 검 또는 가죽 장화. 푸실린은 서쪽과 북쪽 구역을 여는 초승달 열쇠도 떨어뜨립니다.",
    ["Rabine Saturna, in Nighthaven, in Moonglade."] =
        "라빈 사투르나는 달의 숲의 나이트헤이븐에 있습니다.",
    ["Optional: a reliquary in Silithus for Rabine Saturna in Moonglade, then a shard of the Felvine: a shield or an off-hand lexicon."] =
        "선택 사항: 실리더스의 성물함을 달의 숲의 라빈 사투르나에게 가져간 다음, 악령덩굴 조각을 가져갑니다: 방패 또는 보조장비 사전.",
    ["The Reliquary of Purity lies in the ruins of Southwind Village, in Silithus."] =
        "정화의 성물함은 실리더스의 남풍 마을 폐허에 있습니다.",
    ["Rabine Saturna, in Nighthaven."] =
        "라빈 사투르나는 나이트헤이븐에 있습니다.",
    ["Enter Dire Maul"] =
        "혈투의 전장에 들어가세요",
    ["The ruins of Dire Maul stand in the middle of Feralas; the east, west and north wings each have their own door."] =
        "혈투의 전장 폐허는 페랄라스 한가운데에 있습니다. 동쪽, 서쪽, 북쪽 구역에는 각각 입구가 따로 있습니다.",
    ["East: talk to Pusillin each time he stops; he runs five times, then fights on a small platform up a ramp and drops the book."] =
        "동쪽: 푸실린이 멈출 때마다 말을 거세요. 다섯 번 도망친 다음 비탈길 위의 작은 단에서 싸우며, 책을 떨어뜨립니다.",
    ["East: Lethtendris waits on the upper level of the room left of the ramps between the Hidden Reach and the Warpwood Quarter."] =
        "동쪽: 레스텐드리스는 숨겨진 구역과 굽이나무 지구 사이 비탈길 왼쪽 방의 위층에서 기다립니다.",
    ["East: kill Zevrim Thornhoof, then Ironbark the Redeemed, in the Conservatory, opens the door to Alzzin the Wildshaper; after Alzzin, use the reliquary by the twisted vine."] =
        "동쪽: 제브림 쏜후프를 처치하면 온실의 회복된 무쇠껍질이 칼날바람 알진에게 가는 문을 엽니다. 알진을 처치한 뒤 뒤틀린 덩굴 옆에서 성물함을 사용하세요.",
    ["West: the Shen'dralar Ancient stands above the platform over Tendris Warpwood."] =
        "서쪽: 셴드랄라 고대인은 굽이나무 텐드리스가 있는 단 위쪽에 서 있습니다.",
    ["About 9,950 XP; its treasure, a chest in the library, brings a two-handed mace, a mail helm or leather boots."] =
        "약 9,950 경험치. 도서관에 있는 보물 상자에서 양손 둔기, 사슬 투구 또는 가죽 장화를 얻습니다.",
    ["West: destroy the five pylons of the Capital Gardens, the Court of the Highborne and the Prison; Immol'thar waits in the Prison, behind Tendris (the Crescent Key opens it); Prince Tortheldrin, under the entry platform of the Athenaeum."] =
        "서쪽: 수도 정원, 명가 궁정, 감옥에 있는 수정탑 다섯 개를 파괴하세요. 이몰타르는 텐드리스 뒤쪽 감옥에서 기다리고 (초승달 열쇠로 엽니다), 왕자 토르텔드린은 학술원 입구 단 아래에 있습니다.",
    ["West: the treasure is a big stone chest under the ramp of the Athenaeum."] =
        "서쪽: 보물은 학술원 비탈길 아래의 커다란 돌 상자입니다.",
    ["West: through the Conservatory Door (the Crescent Key opens it), the remains lie by a dead elf and a bookcase, in the north of the Athenaeum."] =
        "서쪽: 온실 문 (초승달 열쇠로 엽니다)을 지나면, 학술원 북쪽의 죽은 엘프와 책장 옆에 유해가 있습니다.",
    ["North: Knot Thimblejack is chained in the north-east corner of the Halls of Destruction."] =
        "북쪽: 노트 팀블잭은 파괴의 전당 북동쪽 구석에 사슬로 묶여 있습니다.",
    ["About 6,600 XP for a key the Gordok guards carry."] =
        "고르독 경비병이 가진 열쇠 하나로 약 6,600 경험치.",
    ["Optional: the Gordok Ogre Suit needs runecloth, rugged leather and rune threads."] =
        "선택 사항: 고르독 오우거 위장복에는 룬무늬 옷감, 질긴 가죽, 룬 실이 필요합니다.",
    ["North: the Gordok guards Mol'dar, Slip'kik and Fengus, and Captain Kromcrush, carry the shackle key."] =
        "북쪽: 고르독 경비병 몰다르, 슬립킥, 펜구스와 대장 크롬크러쉬가 족쇄 열쇠를 가지고 있습니다.",
    ["Knot Thimblejack."] =
        "노트 팀블잭.",
    ["North: the ogre tannin lies up the ramp above Knot, in the north-west corner: one per group."] =
        "북쪽: 오우거 무두질 약품은 노트 위쪽 비탈길 위, 북서쪽 구석에 있습니다: 파티당 하나뿐입니다.",
    ["North: Captain Kromcrush, once King Gordok is dead."] =
        "북쪽: 왕 고르독이 죽은 뒤의 대장 크롬크러쉬.",
    ["Optional, after a tribute run (King Gordok dead, his guards alive): gloves of any kind."] =
        "선택 사항, 공물 공략 뒤 (왕 고르독은 죽고 경비병은 살아 있는 상태): 종류를 가리지 않는 장갑.",
    ["The Gauntlet of Gordok Might lies in the Prince's chest, in the Athenaeum of the west wing."] =
        "권력의 고르독 건틀릿은 서쪽 구역 학술원에 있는 왕자의 상자 안에 있습니다.",
    ["North: Stomper Kreeg, after a tribute run."] =
        "북쪽: 공물 공략 뒤의 천둥발 크리그.",
    ["Azj'Tordin, at Lariss Pavilion."] =
        "아즈토르딘은 라리스 정자에 있습니다.",
    ["Latronicus Moonspear, at Feathermoon Stronghold."] =
        "라트로니쿠스 문스피어는 페더문 요새에 있습니다.",
    ["Scholar Runethorn, at Feathermoon Stronghold."] =
        "학자 룬쏜은 페더문 요새에 있습니다.",
    ["Scholomance"] =
        "스칼로맨스",
    ["Commander Ashlam Valorfist, at Chillwind Camp, in the Western Plaguelands."] =
        "사령관 아쉬람 발러피스트는 서부 역병지대의 서리바람 야영지에 있습니다.",
    ["Optional: the chain of the Skeleton Key, which opens Scholomance's door: one key per group is enough. It goes through the Plaguelands, Gadgetzan and Un'Goro."] =
        "선택 사항: 스칼로맨스의 문을 여는 해골 열쇠 연계 퀘스트: 열쇠는 파티당 하나면 충분합니다. 역병지대, 가젯잔, 운고로를 거칩니다.",
    ["The skeletal flayers and slavering ghouls of Sorrow Hill, in the south of the Western Plaguelands."] =
        "서부 역병지대 남쪽 슬픔의 언덕의 해골 타작꾼과 걸신들린 구울.",
    ["Mark the four watchtowers of Andorhal with the beacon torch, standing in each doorway."] =
        "안도할의 감시탑 네 곳의 출입구에 각각 서서 신호 횃불로 표시하세요.",
    ["Alchemist Arbington, at Chillwind Camp."] =
        "연금술사 알빙턴은 서리바람 야영지에 있습니다.",
    ["The undead of the Western Plaguelands drop the skeletal fragments."] =
        "서부 역병지대의 언데드가 해골 파편을 떨어뜨립니다.",
    ["Krinkle Goodsteel, in Gadgetzan, in Tanaris: bring 15 gold."] =
        "크린클 굿스틸은 타나리스의 가젯잔에 있습니다: 15골드를 챙겨 가세요.",
    ["Bring two thorium bars to the top of Fire Plume Ridge, in Un'Goro Crater, and use the mold by the lava lake."] =
        "토륨 주괴 2개를 운고로 분화구 불기둥 마루 꼭대기로 가져가 용암 호수 옆에서 거푸집을 사용하세요.",
    ["Araj the Summoner stands in the middle of Andorhal."] =
        "소환사 아라즈는 안도할 한가운데에 서 있습니다.",
    ["Betina Bigglezink, at Light's Hope Chapel, in the Eastern Plaguelands."] =
        "베티나 비글징크는 동부 역병지대의 희망의 빛 예배당에 있습니다.",
    ["About 6,200 XP; a hatchling may drop a scale that starts another quest."] =
        "약 6,200 경험치. 새끼용이 다른 퀘스트를 시작하는 비늘을 떨어뜨릴 수 있습니다.",
    ["Weldon Barov, at Chillwind Camp."] =
        "웰던 바로브는 서리바람 야영지에 있습니다.",
    ["The Barov fortune: four deeds inside the school; its follow-up sends you to kill Alexi Barov in the Horde's Bulwark."] =
        "바로브 가문의 재산: 학교 안의 증서 네 장. 후속 퀘스트에서는 호드의 보루에 있는 알렉시 바로브를 처치하러 갑니다.",
    ["Eva Sarkhoff, in Caer Darrow, on the island of Darrowmere Lake."] =
        "에바 사크호프는 다로우미어 호수 섬의 카엘 다로우에 있습니다.",
    ["Eva Sarkhoff's chain: three parts inside the school, then Kirtonos the Herald and a sword or an off-hand item among its rewards."] =
        "에바 사크호프의 연계 퀘스트: 학교 안에서 세 단계를 진행한 다음 사자 키르토노스로 이어지며, 보상 중에는 검 또는 보조장비가 있습니다.",
    ["Enter Scholomance"] =
        "스칼로맨스에 들어가세요",
    ["The school stands on the island of Caer Darrow, in Darrowmere Lake, in the south-east of the Western Plaguelands."] =
        "학교는 서부 역병지대 남동쪽, 다로우미어 호수의 카엘 다로우 섬에 있습니다.",
    ["The deeds: Southshore's on a table north-east of the Reliquary; Tarren Mill's on a table on the left at the entry of the Great Ossuary; Brill's on a ledge south-west of the Laboratory; Caer Darrow's on a table east of the Barov Family Vault."] =
        "증서: 사우스쇼어 증서는 성유물 보관실 북동쪽 탁자 위에, 타렌 밀농장 증서는 대납골당 입구 왼쪽 탁자 위에, 브릴 증서는 실험실 남서쪽 선반 위에, 카엘 다로우 증서는 바로브 가문 납골당 동쪽 탁자 위에 있습니다.",
    ["The plagued hatchlings fill a room of the Great Ossuary."] =
        "역병 걸린 작은 새끼용이 대납골당의 한 방을 가득 채우고 있습니다.",
    ["A hatchling may drop a healthy dragon scale: use it."] =
        "새끼용이 건강한 용 비늘을 떨어뜨릴 수 있습니다: 비늘을 사용하세요.",
    ["Doctor Theolen Krastinov, in the east of the upper Headmaster's Study: kill him, then burn the two piles of remains, to the north and the south-east of his room."] =
        "학자 테올렌 크라스티노브는 교장의 연구실 위층 동쪽에 있습니다: 그를 처치한 다음, 그의 방 북쪽과 남동쪽에 있는 유해 더미 두 개를 태우세요.",
    ["Eva Sarkhoff, in Caer Darrow."] =
        "에바 사크호프는 카엘 다로우에 있습니다.",
    ["Enter Scholomance again"] =
        "다시 스칼로맨스에 들어가세요",
    ["Jandice Barov waits in the north-east of the room down the stairs, on the right of the second big room."] =
        "잔다이스 바로브는 두 번째 큰 방 오른쪽의 계단 아래 방, 그 북동쪽에서 기다립니다.",
    ["Rattlegore, at the bottom of the Great Ossuary, drops the Viewing Room key; put the Blood of Innocents in the brazier on the balcony on the right of the Chamber of Summoning: Kirtonos the Herald comes."] =
        "대납골당 맨 아래의 들창어금니가 강당 열쇠를 떨어뜨립니다. 소환의 방 오른쪽 발코니의 화로에 순결한 피를 넣으세요: 사자 키르토노스가 나타납니다.",
    ["Betina Bigglezink, at Light's Hope Chapel."] =
        "베티나 비글징크는 희망의 빛 예배당에 있습니다.",
    ["Optional: an assassination in the other side's camp, among its guards; it brings the Barov Peasant Caller."] =
        "선택 사항: 상대 진영의 야영지에서 경비병들 사이에 있는 대상을 암살하는 퀘스트로, 바로브의 종을 줍니다.",
    ["Alexi Barov stands among the guards of the Bulwark, the Horde's camp in the north of the Western Plaguelands."] =
        "알렉시 바로브는 서부 역병지대 북쪽의 호드 야영지인 보루의 경비병들 사이에 서 있습니다.",
    ["Magistrate Marduke, in Caer Darrow."] =
        "집정관 마르듀크는 카엘 다로우에 있습니다.",
    ["Optional: a chain through Stromgarde, Light's Hope and the Baron's room of Stratholme, back to the school's last boss; it brings a sword, a dagger, a cloth crown or a shield and about 9,950 XP."] =
        "선택 사항: 스트롬가드, 희망의 빛, 스트라솔름의 남작의 방을 거쳐 학교의 마지막 우두머리에게 돌아오는 연계 퀘스트. 검, 단검, 천 왕관 또는 방패와 약 9,950 경험치를 줍니다.",
    ["The Keepsake of Remembrance lies in the ruins of Stromgarde, in Arathi Highlands."] =
        "추억의 유품은 아라시 고원의 스트롬가드 폐허에 있습니다.",
    ["Leonid Barthalomew the Revered, at Light's Hope Chapel."] =
        "존경받는 리어니드 바돌로매는 희망의 빛 예배당에 있습니다.",
    ["Stratholme: place the keepsake on the unholy ground of Baron Rivendare's room."] =
        "스트라솔름: 남작 리븐데어의 방에 있는 부정한 땅에 유품을 놓으세요.",
    ["Ras Frostwhisper waits in the Laboratory: use the Soulbound Keepsake on him."] =
        "라스 프로스트위스퍼는 실험실에서 기다립니다: 그에게 영혼이 씌인 유품을 사용하세요.",
    ["Stratholme"] =
        "스트라솔름",
    ["Smokey LaRue and Leonid Barthalomew the Revered, at Light's Hope Chapel, in the east of the Eastern Plaguelands."] =
        "스모키 라루와 존경받는 리어니드 바돌로매는 동부 역병지대 동쪽의 희망의 빛 예배당에 있습니다.",
    ["Smokey LaRue's tobacco brings a lighter (a trinket); Leonid's holy water, a cloth crown, a ring or potions."] =
        "스모키 라루의 담배 퀘스트에서는 라이터 (장신구)를, 리어니드의 성수 퀘스트에서는 천 왕관, 반지 또는 물약을 받습니다.",
    ["Betina's flesh samples open The Active Agent: a choice of two trinkets."] =
        "베티나의 살점 표본 퀘스트는 활성 역병 인자로 이어집니다: 장신구 두 개 중 하나를 고릅니다.",
    ["Duke Nicholas Zverenhoff, at Light's Hope Chapel."] =
        "공작 니콜라스 즈바른호프는 희망의 빛 예배당에 있습니다.",
    ["Duke Nicholas's chain leads to Balnazzar, then Baron Rivendare, then the Argent Hold: a sword, a staff or a shield."] =
        "공작 니콜라스의 연계 퀘스트는 발나자르, 남작 리븐데어, 그리고 여명회의 궤로 이어집니다: 검, 지팡이 또는 방패.",
    ["Caretaker Alen, at Light's Hope Chapel."] =
        "관리인 알렌은 희망의 빛 예배당에 있습니다.",
    ["Egan's restless souls bring about 8,300 XP."] =
        "에간의 잠 못드는 영혼 퀘스트로 약 8,300 경험치를 받습니다.",
    ["Tirion Fordring, in his hut by the lake on the western edge of the Eastern Plaguelands."] =
        "티리온 폴드링은 동부 역병지대 서쪽 끝 호숫가의 자기 오두막에 있습니다.",
    ["Optional: Tirion Fordring's long chain across both Plaguelands and Caer Darrow; its painting hangs in the city, and its end, In Dreams, brings armor, a warhammer or jewelry and about 9,950 XP."] =
        "선택 사항: 두 역병지대와 카엘 다로우를 오가는 티리온 폴드링의 긴 연계 퀘스트. 연계에 필요한 그림은 도시 안에 걸려 있으며, 마지막 퀘스트인 탤런의 꿈에서 방어구, 전투망치 또는 장신구와 약 9,950 경험치를 받습니다.",
    ["The plaguehounds, plaguebats and carrion grubs of the Eastern Plaguelands."] =
        "동부 역병지대의 역병사냥개, 역병박쥐, 청소부구더기.",
    ["Listen to Tirion Fordring."] =
        "티리온 폴드링의 이야기를 들으세요.",
    ["Taelan's hammer lies in the Undercroft, at the southern end of the Eastern Plaguelands."] =
        "탤런의 망치는 동부 역병지대 남쪽 끝의 지하 납골당에 있습니다.",
    ["The Symbol of Lost Honor lies in Northdale, in the north-east of the Eastern Plaguelands."] =
        "실추된 명예의 상징은 동부 역병지대 북동쪽의 노스데일에 있습니다.",
    ["Artist Renfray, in Caer Darrow, in the Western Plaguelands."] =
        "화가 렌프레이는 서부 역병지대의 카엘 다로우에 있습니다.",
    ["Egan, by the road to Stratholme's gate, in the north-west of the Eastern Plaguelands."] =
        "에간은 동부 역병지대 북서쪽, 스트라솔름 정문으로 가는 길가에 있습니다.",
    ["Enter Stratholme"] =
        "스트라솔름에 들어가세요",
    ["The city's main gate, in the north of the Eastern Plaguelands, opens on the Scarlet side."] =
        "동부 역병지대 북쪽에 있는 도시 정문은 붉은십자군 쪽으로 이어집니다.",
    ["King's Square: take the box of tobacco in Ezra Grimm's smoke shop; Ezra Grimm comes for it."] =
        "왕의 광장: 에즈라 그림의 담배 가게에서 담배 상자를 가져가세요. 에즈라 그림이 담배를 찾으러 나타납니다.",
    ["The supply crates along the city's walls hold the holy water; some call monsters."] =
        "도시 성벽을 따라 놓인 보급품 상자에 성수가 들어 있습니다. 몇몇은 몬스터를 불러냅니다.",
    ["Every creature of the city may drop a flesh sample."] =
        "도시의 생물은 누구나 살점 표본을 떨어뜨릴 수 있습니다.",
    ["Use Egan's blaster on the spectral citizens, then again on the restless souls that break free."] =
        "시민의 유령에게 에간의 제령포를 사용한 다음, 풀려난 잠 못드는 영혼에게 다시 사용하세요.",
    ["Archivist Galford waits near the end of the Scarlet Bastion: kill him and burn the book on his table."] =
        "기록관 갈포드는 붉은십자군 요새 끝 근처에서 기다립니다: 그를 처치하고 탁자 위의 책을 태우세요.",
    ["The painting hangs in Galford's room."] =
        "그림은 갈포드의 방에 걸려 있습니다.",
    ["Balnazzar, at the end of the Scarlet Bastion, drops his head: use it."] =
        "붉은십자군 요새 끝의 발나자르가 자기 머리를 떨어뜨립니다: 머리를 사용하세요.",
    ["Aurius waits in a chapel by the service entrance, the other gate of the city."] =
        "아우리우스는 도시의 또 다른 문인 공무용 입구 옆 예배당에서 기다립니다.",
    ["Optional: Aurius's medallion makes him join the fight against Baron Rivendare: a choice of two trinkets."] =
        "선택 사항: 아우리우스에게 메달을 주면 그가 남작 리븐데어와의 싸움에 함께합니다: 장신구 두 개 중 하나를 고릅니다.",
    ["The medallion lies in Malor's strongbox, in Malor the Zealous's room of the Hall of Lights: the Scarlet Key, or a rogue, opens the Bastion's door."] =
        "메달은 빛의 전당에 있는 광신자 말로의 방, 말로의 금고 안에 있습니다: 요새의 문은 붉은십자군 열쇠나 도적이 열 수 있습니다.",
    ["Aurius, in his chapel."] =
        "아우리우스는 자기 예배당에 있습니다.",
    ["Smokey LaRue and Leonid Barthalomew the Revered, at Light's Hope Chapel."] =
        "스모키 라루와 존경받는 리어니드 바돌로매는 희망의 빛 예배당에 있습니다.",
    ["Enter Stratholme by the service entrance"] =
        "공무용 입구로 스트라솔름에 들어가세요",
    ["The service entrance, east of the main gate, opens on the side of Baron Rivendare."] =
        "정문 동쪽의 공무용 입구는 남작 리븐데어 쪽으로 이어집니다.",
    ["The new Scourge data lies in one of the three ziggurats of the Gauntlet."] =
        "새 스컬지 자료는 시련의 길에 있는 지구라트 세 곳 중 한 곳에 있습니다.",
    ["Baron Rivendare waits downstairs in the building of Slaughter Square."] =
        "남작 리븐데어는 학살의 광장 건물 아래층에서 기다립니다.",
    ["Aurius appears in the Baron's room and fights at your side."] =
        "아우리우스가 남작의 방에 나타나 함께 싸웁니다.",
    ["Lord Maxwell Tyrosus, inside Light's Hope Chapel."] =
        "맥스웰 티로서스 경은 희망의 빛 예배당 안에 있습니다.",
    ["Open the Argent Hold, inside the chapel."] =
        "예배당 안의 여명회의 궤를 여세요.",
    ["Egan, by the road to Stratholme."] =
        "에간은 스트라솔름으로 가는 길가에 있습니다.",
    ["Tirion Fordring, in his hut."] =
        "티리온 폴드링은 자기 오두막에 있습니다.",
    ["Myranda the Hag, at Uther's Tomb, in the Western Plaguelands."] =
        "노파 미란다는 서부 역병지대의 우서의 무덤에 있습니다.",
    ["Under Myranda's Scarlet illusion, walk into Hearthglen and give Tirion's gift to Highlord Taelan Fordring."] =
        "미란다의 붉은십자군 환영을 쓴 채 하스글렌으로 걸어 들어가 대영주 탤런 폴드링에게 티리온의 선물을 주세요.",
    ["Lead Taelan Fordring out of Hearthglen; the Scarlet give chase."] =
        "탤런 폴드링을 하스글렌 밖으로 데려가세요. 붉은십자군이 뒤쫓아옵니다.",
    ["Tirion Fordring."] =
        "티리온 폴드링.",
    ["Ragefire Chasm"] =
        "성난불길 협곡",
    ["Rahauro, on the Elder Rise of Thunder Bluff."] =
        "라하우로는 썬더 블러프의 장로의 봉우리에 있습니다.",
    ["The lost satchel's quest ends with bracers of cloth, leather or mail."] =
        "잃어버린 가방 퀘스트는 천, 가죽 또는 사슬 손목보호구로 끝납니다.",
    ["Varimathras, beside Sylvanas in the Royal Quarter of Undercity."] =
        "바리마트라스는 언더시티 왕실 지구의 실바나스 옆에 있습니다.",
    ["Optional: given in Undercity, a zeppelin ride each way. Rewards leggings of cloth, leather or mail."] =
        "선택 사항: 언더시티에서 받는 퀘스트로, 오갈 때 비행선을 타야 합니다. 보상은 천, 가죽 또는 사슬 다리보호구입니다.",
    ["Thrall, in Grommash Hold, in the Valley of Wisdom."] =
        "스랄은 지혜의 골짜기의 그롬마쉬 요새에 있습니다.",
    ["Thrall's chain of four quests ends with a weapon of your choice."] =
        "스랄의 퀘스트 4개짜리 연계 퀘스트는 원하는 무기로 끝납니다.",
    ["The Burning Blade cultists of the Cleft of Shadow carry the insignia."] =
        "어둠의 틈의 불타는칼날단 이교도가 휘장을 가지고 있습니다.",
    ["Talk to Neeru Fireblade, in the Darkbriar Lodge of the Cleft of Shadow."] =
        "어둠의 틈 어둠찔레 오두막의 네루 파이어블레이드와 대화하세요.",
    ["Neeru Fireblade also asks for the heart of the chasm's beast."] =
        "네루 파이어블레이드는 협곡에 사는 야수의 심장도 요구합니다.",
    ["Back to Thrall, in Grommash Hold."] =
        "그롬마쉬 요새의 스랄에게 돌아가세요.",
    ["Enter Ragefire Chasm"] =
        "성난불길 협곡에 들어가세요",
    ["The entrance is a cave in the Cleft of Shadow, in the middle of Orgrimmar."] =
        "입구는 오그리마 한가운데, 어둠의 틈에 있는 동굴입니다.",
    ["Ragefire troggs and their shamans fill the first caves."] =
        "첫 동굴들은 성난불길 트로그와 그 주술사로 가득합니다.",
    ["Maur Grimtotem's body lies in a small cave on the right, past the big trogg cave."] =
        "마우르 그림토템의 시체는 큰 트로그 동굴을 지나 오른쪽의 작은 동굴에 있습니다.",
    ["The Searing Blade cultists and warlocks carry both books."] =
        "이글거리는 칼날단 이교도와 흑마법사가 책 두 권을 모두 가지고 있습니다.",
    ["Taragaman the Hungerer, the chasm's second boss, guards a lava cave."] =
        "협곡의 두 번째 우두머리 욕망의 타라가만이 용암 동굴을 지키고 있습니다.",
    ["Jergosh the Invoker is the third boss; Bazzalan waits at the very end of the chasm."] =
        "기원사 제로쉬는 세 번째 우두머리입니다. 바잘란은 협곡 맨 끝에서 기다립니다.",
    ["Thrall, in Grommash Hold."] =
        "스랄은 그롬마쉬 요새에 있습니다.",
    ["Neeru Fireblade, in the Cleft of Shadow."] =
        "네루 파이어블레이드는 어둠의 틈에 있습니다.",
    ["Your reward: an axe, a mace, a dagger or a staff of Orgrimmar."] =
        "보상: 오그리마의 도끼, 둔기, 단검 또는 지팡이.",
    ["Varimathras, in the Royal Quarter of Undercity."] =
        "바리마트라스는 언더시티의 왕실 지구에 있습니다.",
    ["Tonga Runetotem, at the Crossroads."] =
        "통가 룬토템은 크로스로드에 있습니다.",
    ["Tonga's three oases open Leaders of the Fang, the caverns' main quest: a weapon of your choice."] =
        "통가의 오아시스 퀘스트 세 개는 동굴의 주요 퀘스트인 송곳니의 드루이드 우두머리로 이어집니다: 원하는 무기.",
    ["The Forgotten Pools lie north-west of the Crossroads, north of the caverns' hill."] =
        "잊혀진 웅덩이는 크로스로드 북서쪽, 동굴 언덕 북쪽에 있습니다.",
    ["The Stagnant Oasis lies south-east of the Crossroads: use the bubbling fissure in its water."] =
        "죽은 오아시스는 크로스로드 남동쪽에 있습니다: 물속의 거품 나는 균열을 사용하세요.",
    ["The snapjaw turtles of the Lushwater Oasis, at the foot of the caverns' hill."] =
        "동굴 언덕 기슭, 생명의 오아시스의 무쇠턱거북.",
    ["Apothecary Zamah, in the Pools of Vision under the Spirit Rise."] =
        "연금술사 자마는 정기의 봉우리 아래 예언의 웅덩이에 있습니다.",
    ["Reward: a piece of cloth, leather or mail armor."] =
        "보상: 천, 가죽 또는 사슬 방어구 하나.",
    ["Arch Druid Hamuul Runetotem, on the Elder Rise."] =
        "대드루이드 하뮬 룬토템은 장로의 봉우리에 있습니다.",
    ["Nara Wildmane, on the Elder Rise."] =
        "나라 와일드메인은 장로의 봉우리에 있습니다.",
    ["Serpentbloom: small green shrubs with violet flowers, in the caves before the door and inside."] =
        "불뱀꽃: 보라색 꽃이 핀 작은 초록 덤불로, 입구 앞 동굴과 던전 안에 있습니다.",
    ["The four Fanglords each drop a gem: Lady Anacondra and Lord Cobrahn first, then Lord Pythas, and Lord Serpentis last."] =
        "송곳니 군주 넷이 각각 보석을 떨어뜨립니다: 먼저 여군주 아나콘드라와 군주 코브란, 그다음 군주 피타스, 마지막으로 군주 서펜티스.",
    ["Nara Wildmane, on the Elder Rise of Thunder Bluff."] =
        "나라 와일드메인은 썬더 블러프의 장로의 봉우리에 있습니다.",
    ["Your reward: a staff, a mace or a sword."] =
        "보상: 지팡이, 둔기 또는 검.",
    ["Apothecary Zamah, in the Pools of Vision."] =
        "연금술사 자마는 예언의 웅덩이에 있습니다.",
    ["Tabitha Heartweaver, at the Sepulcher, in Silverpine Forest."] =
        "Tabitha Heartweaver는 은빛소나무 숲의 공동묘지에 있습니다.",
    ["Reward: a dagger or cloth cuffs."] =
        "보상: 단검 또는 천 손목보호구.",
    ["Deathguard Kristof, in Brill, in Tirisfal Glades."] =
        "Deathguard Kristof는 티리스팔 숲의 브릴에 있습니다.",
    ["Reward: a two-handed axe or a staff."] =
        "보상: 양손 도끼 또는 지팡이.",
    ["Morbin Lightbane, in Undercity."] =
        "Morbin Lightbane은 언더시티에 있습니다.",
    ["Reward: leather armor or a mace."] =
        "보상: 가죽 방어구 또는 둔기.",
    ["Theodore Griffs, in Undercity."] =
        "시어도어 그리프스는 언더시티에 있습니다.",
    ["Reward: cloth gloves or a sword."] =
        "보상: 천 장갑 또는 검.",
    ["The ruins rise above Undercity, in Tirisfal Glades."] =
        "폐허는 티리스팔 숲의 언더시티 위에 있습니다.",
    ["Look for Edward Heartweaver in the ruins."] =
        "폐허에서 Edward Heartweaver를 찾으세요.",
    ["Twenty-five intact limbs, from the undead of the ruins."] =
        "폐허의 언데드에게서 얻는 온전한 팔다리 25개.",
    ["Rath'mael waits in the ruins."] =
        "Rath'mael은 폐허에서 기다립니다.",
    ["Witherfang carries the highly toxic strain."] =
        "Witherfang이 맹독성 균주를 가지고 있습니다.",
    ["The Baron may drop an abominable head: read it."] =
        "남작이 흉측한 머리를 떨어뜨릴 수 있습니다: 머리를 읽으세요.",
    ["Oran Snakewrithe, in Undercity."] =
        "오란 스네이크레이드는 언더시티에 있습니다.",
    ["Master Apothecary Faranell, in the Apothecarium of Undercity."] =
        "수석 연금술사 파라넬은 언더시티의 연금술 실험실에 있습니다.",
    ["Optional: Faranell's Unending Torment goes on in Undercity; its last part has a two-handed sword among its rewards."] =
        "선택 사항: 파라넬의 Unending Torment 퀘스트는 언더시티에서 계속됩니다. 마지막 단계의 보상 중에는 양손 검이 있습니다.",
    ["A toxic skullcap from Tawny Grisette in the Trade Quarter, blisterweed near the herbalism trainer, and an essence of agony from the poison vendor of the Rogues' Quarter."] =
        "상업 지구의 타우니 그리제트에게서 독성 해골버섯, 약초채집 상급자 근처에서 물집풀, 도적 지구의 독 상인에게서 고통의 정수.",
    ["Inject the hissing serum into the system above Othmar's body."] =
        "Othmar의 몸 위에 있는 장치에 쉭쉭거리는 혈청을 주입하세요.",
    ["Bring the Baron's head to Othmar's body, the unfinished abomination."] =
        "남작의 머리를 미완성 누더기골렘인 Othmar의 몸으로 가져가세요.",
    ["Master Apothecary Faranell."] =
        "수석 연금술사 파라넬.",
    ["Deathguard Kristof, in Brill."] =
        "Deathguard Kristof는 브릴에 있습니다.",
    ["Tabitha Heartweaver, at the Sepulcher."] =
        "Tabitha Heartweaver는 공동묘지에 있습니다.",
    ["Shadowfang Keep"] =
        "그림자송곳니 성채",
    ["Keeper Bel'dugur, in Undercity."] =
        "관리인 벨두거는 언더시티에 있습니다.",
    ["Dalar Dawnweaver, at the Sepulcher, in Silverpine Forest."] =
        "달라 던위버는 은빛소나무 숲의 공동묘지에 있습니다.",
    ["Reward: a ring and about 3,300 XP."] =
        "보상: 반지와 약 3,300 경험치.",
    ["High Executor Hadrec, at the Sepulcher."] =
        "고위집행관 하드렉은 공동묘지에 있습니다.",
    ["Reward: shoulders of cloth, leather or mail."] =
        "보상: 천, 가죽 또는 사슬 어깨보호구.",
    ["Enter Shadowfang Keep"] =
        "그림자송곳니 성채에 들어가세요",
    ["The keep stands south of the Sepulcher."] =
        "성채는 공동묘지 남쪽에 있습니다.",
    ["Deathstalker Vincent lies in the courtyard: Deathstalker Adamant, freed after Rethilgore, opens its door."] =
        "죽음의추적자 빈센트는 안뜰에 쓰러져 있습니다: 레실고어를 처치한 뒤 풀려난 죽음의추적자 아다만트가 안뜰 문을 엽니다.",
    ["The Book of Ur, a blue book, stands on a bookshelf on the left of Fenrus the Devourer's room."] =
        "파란 책인 우르의 책은 파멸의 펜루스의 방 왼쪽 책장에 꽂혀 있습니다.",
    ["Archmage Arugal, the last boss, waits at the top of the keep."] =
        "마지막 우두머리 대마법사 아루갈은 성채 꼭대기에서 기다립니다.",
    ["Dalar Dawnweaver, at the Sepulcher."] =
        "달라 던위버는 공동묘지에 있습니다.",
    ["Tsunaman, at Sun Rock Retreat, in Stonetalon Mountains."] =
        "츄나만은 돌발톱 산맥의 해바위 야영지에 있습니다.",
    ["Optional: a lead from Stonetalon to Zoram'gar Outpost."] =
        "선택 사항: 돌발톱에서 조람가르 전초기지로 안내하는 퀘스트.",
    ["Je'neu Sancrea, at Zoram'gar Outpost, on Ashenvale's coast."] =
        "제네우 생크리는 잿빛 골짜기 해안의 조람가르 전초기지에 있습니다.",
    ["Je'neu Sancrea, at Zoram'gar Outpost."] =
        "제네우 생크리는 조람가르 전초기지에 있습니다.",
    ["The Earthen Ring's quests: Amongst the Ruins wakes Baron Aquanis, whose drop starts a quest with a sword among its rewards."] =
        "대지 고리회의 퀘스트: 폐허 사이로를 하면 군주 아쿠아니스가 깨어나며, 그가 떨어뜨리는 물건으로 시작하는 퀘스트의 보상 중에는 검이 있습니다.",
    ["The deeps open in ruins half under water, on the coast of Zoram Strand."] =
        "나락 입구는 조람 해안의, 반쯤 물에 잠긴 폐허에 있습니다.",
    ["The Sapphires of Aku'Mai grow on the walls of the cave before the dungeon's door."] =
        "아쿠마이의 사파이어는 던전 입구 앞 동굴 벽에서 자랍니다.",
    ["The Blackfathom tide priestesses of that cave may drop a damp note: read it."] =
        "그 동굴의 검은심연의 바다여사제가 젖은 쪽지를 떨어뜨릴 수 있습니다: 쪽지를 읽으세요.",
    ["Back to Je'neu Sancrea, at Zoram'gar Outpost, before the dungeon."] =
        "던전에 들어가기 전에 조람가르 전초기지의 제네우 생크리에게 돌아가세요.",
    ["Reward: a wand, a shield or leather armor."] =
        "보상: 마법봉, 방패 또는 가죽 방어구.",
    ["Lorgus Jett walks the nooks on the west side, south of the Pool of Ask'ar."] =
        "로구스 제트는 아스카르 웅덩이 남쪽, 서쪽의 구석진 곳들을 돌아다닙니다.",
    ["The Fathom Stone lies under the water in the middle of the Moonshrine Ruins, under the walkway before Kelris; taking its core wakes Baron Aquanis."] =
        "심연의 돌은 켈리스 앞 통로 아래, 달의 신전 폐허 한가운데의 물속에 있습니다. 그 핵을 가져가면 군주 아쿠아니스가 깨어납니다.",
    ["Baron Aquanis may drop a Strange Water Globe: use it."] =
        "군주 아쿠아니스가 이상한 물구슬을 떨어뜨릴 수 있습니다: 물구슬을 사용하세요.",
    ["Bashana Runetotem, on the Elder Rise of Thunder Bluff."] =
        "바샤나 룬토템은 썬더 블러프의 장로의 봉우리에 있습니다.",
    ["Borstan, the meat vendor of Orgrimmar."] =
        "보르스탄은 오그리마의 고기 상인입니다.",
    ["Reward: a dagger or a satchel of potions."] =
        "보상: 단검 또는 물약 가방.",
    ["Zaruk, at Hammerfall, in Arathi Highlands."] =
        "자루크는 아라시 고원의 해머폴에 있습니다.",
    ["Dragonmaw Rumors leads to Open the Maw, inside the site."] =
        "Dragonmaw Rumors는 발굴 현장 안에서 하는 Open the Maw 퀘스트로 이어집니다.",
    ["The Deathstalker Agent hides in the hills above the Dragonmaw camp, in the Wetlands."] =
        "죽음의 추적자는 저습지 용아귀부족 야영지 위쪽 언덕에 숨어 있습니다.",
    ["Thicket raptor meat, from the raptors of the site."] =
        "발굴 현장의 랩터에게서 얻는 덤불 랩터 고기.",
    ["The Dragonmaw forces of the site, their thaumaturgists among them."] =
        "발굴 현장의 용아귀부족 병력으로, 기적술사도 포함됩니다.",
    ["The Titan relic leads to the Earthen Ring: a staff or a two-handed mace."] =
        "티탄 유물은 대지 고리회로 이어집니다: 지팡이 또는 양손 둔기.",
    ["The Deathstalker Agent, above the Dragonmaw camp."] =
        "죽음의 추적자는 용아귀부족 야영지 위쪽에 있습니다.",
    ["Borstan, in Orgrimmar."] =
        "보르스탄은 오그리마에 있습니다.",
    ["Muln Earthfury, on the Skywatcher Plateau, in the north-west of Mulgore."] =
        "Muln Earthfury는 멀고어 북서쪽의 하늘감시자 고원에 있습니다.",
    ["Nogg, in his machine shop in the Valley of Honor of Orgrimmar."] =
        "노그는 오그리마 명예의 골짜기에 있는 자기 기계 공작소에 있습니다.",
    ["Sovik, beside Nogg."] =
        "소빅은 노그 옆에 있습니다.",
    ["Scooty's transponder sends you straight to Gnomeregan, far in Dun Morogh, and stays yours."] =
        "스쿠티의 전송기는 멀리 던 모로에 있는 놈리건으로 곧장 보내 주며, 계속 가지고 있을 수 있습니다.",
    ["Wait for Scooty to set up the transponder."] =
        "스쿠티가 전송기를 설치할 때까지 기다리세요.",
    ["The transponder leaves you by the gates of Gnomeregan, in the west of Dun Morogh."] =
        "전송기를 쓰면 던 모로 서쪽, 놈리건 입구 옆에 도착합니다.",
    ["Optional: an escort, turned in at Booty Bay; it rewards bracers or shoulders."] =
        "선택 사항: 호위 퀘스트로, 무법항에서 완료합니다. 보상은 손목보호구 또는 어깨보호구입니다.",
    ["The last boss, Mekgineer Thermaplugg, carries the code of his safe, set in the far wall of the Tinkers' Court next to the third pillar counting from the right."] =
        "마지막 우두머리 멕기니어 텔마플러그가 금고 비밀번호를 가지고 있습니다. 금고는 땜장이 궁정 안쪽 벽, 오른쪽에서 세 번째 기둥 옆에 있습니다.",
    ["Scooty, in Booty Bay."] =
        "스쿠티는 무법항에 있습니다.",
    ["Nogg, in Orgrimmar."] =
        "노그는 오그리마에 있습니다.",
    ["It opens Hearts of Zeal, a quest of the Scarlet Monastery."] =
        "붉은십자군 수도원 퀘스트인 열정의 증거로 이어집니다.",
    ["Auld Stonespire, in Thunder Bluff."] =
        "아울드 스톤스파이어는 썬더 블러프에 있습니다.",
    ["Reward: cloth shoulders, a mail belt or a shield, and about 4,050 XP."] =
        "보상: 천 어깨보호구, 사슬 허리띠 또는 방패, 그리고 약 4,050 경험치.",
    ["Rau Cliffrunner, at Freewind Post, in Thousand Needles."] =
        "라우 클리프러너는 버섯구름 봉우리의 높새바람 봉우리에 있습니다.",
    ["The kraul bats of the cave west of the bridges drop the guano."] =
        "다리 서쪽 동굴의 동굴박쥐가 배설물을 떨어뜨립니다.",
    ["Charlga may drop a small scroll: read it."] =
        "차를가가 작은 두루마리를 떨어뜨릴 수 있습니다: 두루마리를 읽으세요.",
    ["Willix the Importer waits in a tent below Charlga's platform."] =
        "수입업자 윌릭스는 차를가의 단 아래 천막에서 기다립니다.",
    ["Master Apothecary Faranell, in Undercity."] =
        "수석 연금술사 파라넬은 언더시티에 있습니다.",
    ["It opens An Unholy Alliance, a quest of Razorfen Downs."] =
        "가시덩굴 구릉 퀘스트인 사악한 동맹으로 이어집니다.",
    ["Doctor Martin Felben, in the Apothecarium of Undercity."] =
        "박사 마틴 펠벤은 언더시티의 연금술 실험실에 있습니다.",
    ["Reward: a wand or a cloak."] =
        "보상: 마법봉 또는 망토.",
    ["Melisara and Magus Wordeen Voidglare, in Tarren Mill, in Hillsbrad Foothills."] =
        "멜리사라와 학자 워딘 보이드글레어는 힐스브래드 구릉지의 타렌 밀농장에 있습니다.",
    ["Tarren Mill's quests: The Grave Knight brings leather boots or mail bracers."] =
        "타렌 밀농장의 퀘스트: The Grave Knight에서 가죽 장화 또는 사슬 손목보호구를 받습니다.",
    ["Reward: a staff or mail shoulders."] =
        "보상: 지팡이 또는 사슬 어깨보호구.",
    ["Atrexis the Grave Knight, inside the city."] =
        "도시 안의 Atrexis the Grave Knight.",
    ["Six cracked sentry cores, from the fragmented sentries of the city."] =
        "도시의 조각난 파수병에게서 얻는 금 간 파수병 핵 6개.",
    ["Magus Wordeen Voidglare and Melisara, in Tarren Mill."] =
        "학자 워딘 보이드글레어와 멜리사라는 타렌 밀농장에 있습니다.",
    ["Doctor Martin Felben, in Undercity."] =
        "박사 마틴 펠벤은 언더시티에 있습니다.",
    ["Dorn Plainstalker, in Thousand Needles."] =
        "도른 플레인스토커는 버섯구름 봉우리에 있습니다.",
    ["Optional: a chain of ten quests through Thousand Needles, Stonetalon, Ashenvale and Undercity, up to a book of the monastery; it ends with a mace or a wand and about 4,200 XP."] =
        "선택 사항: 버섯구름 봉우리, 돌발톱, 잿빛 골짜기, 언더시티를 거쳐 수도원의 책까지 이어지는 퀘스트 10개짜리 연계 퀘스트. 끝에 둔기 또는 마법봉과 약 4,200 경험치를 받습니다.",
    ["Leap from the wooden planks over the canyon, in the west of Thousand Needles."] =
        "버섯구름 봉우리 서쪽, 협곡 위의 나무 발판에서 뛰어내리세요.",
    ["Grenka Bloodscreech, a harpy of the west of Thousand Needles."] =
        "그렌카 블러드스크리치는 버섯구름 봉우리 서쪽의 하피입니다.",
    ["Rok'Alim the Pounder, an elemental of the north-west of Thousand Needles."] =
        "돌주먹 로크알림은 버섯구름 봉우리 북서쪽의 정령입니다.",
    ["Braug Dimspirit, in the east of Stonetalon Mountains."] =
        "브라우그 딤스피릿은 돌발톱 산맥 동쪽에 있습니다.",
    ["The Legacy of the Aspects, a book in the south-east of Ashenvale."] =
        "잿빛 골짜기 남동쪽에 있는 책, 고대의 유산.",
    ["Braug Dimspirit, in Stonetalon."] =
        "브라우그 딤스피릿은 돌발톱에 있습니다.",
    ["Braug Dimspirit asks a question: give him the right answer."] =
        "브라우그 딤스피릿이 질문을 합니다: 올바른 답을 고르세요.",
    ["Sage Truthseeker, in Thunder Bluff."] =
        "현자 트루스시커는 썬더 블러프에 있습니다.",
    ["Reward: a shield or an off-hand orb, and about 3,550 XP."] =
        "보상: 방패 또는 보조장비 보주, 그리고 약 3,550 경험치.",
    ["Parqual Fintallas, in Undercity."] =
        "파쿠알 핀탈라스는 언더시티에 있습니다.",
    ["Reward: a sword, an off-hand cane or a necklace, and about 5,150 XP."] =
        "보상: 검, 보조장비 지팡이 또는 목걸이, 그리고 약 5,150 경험치.",
    ["Master Apothecary Faranell, in the Apothecarium."] =
        "수석 연금술사 파라넬은 연금술 실험실에 있습니다.",
    ["Graveyard: Vorrel Sengutz lies on a table on the right of the Chamber of Atonement, by Interrogator Vishas."] =
        "묘지: 보렐 센구츠는 속죄의 방 오른쪽, 심문관 비샤스 옆의 탁자 위에 누워 있습니다.",
    ["Reward: a cloth cape or shoulders, or leather boots; the ring it asks for is in the Alterac Mountains."] =
        "보상: 천 망토 또는 어깨보호구, 또는 가죽 장화. 퀘스트에 필요한 반지는 알터랙 산맥에 있습니다.",
    ["Every Scarlet of the monastery may drop a heart."] =
        "수도원의 붉은십자군은 누구나 심장을 떨어뜨릴 수 있습니다.",
    ["Library: the book rests on a table, in the first side room on the left as you walk the Gallery of Treasures."] =
        "도서관: 책은 보물 전시실을 따라가다 왼쪽 첫 번째 곁방의 탁자 위에 있습니다.",
    ["Library: the Compendium stands on a bookcase on the left wall at the entrance of the Athenaeum."] =
        "도서관: 타락의 개요는 학술원 입구 왼쪽 벽의 책장에 꽂혀 있습니다.",
    ["Parqual Fintallas asks a question: give him the right answer."] =
        "파쿠알 핀탈라스가 질문을 합니다: 올바른 답을 고르세요.",
    ["Varimathras, in the Royal Quarter."] =
        "바리마트라스는 왕실 지구에 있습니다.",
    ["Nancy Vishas, an elite, keeps the ring in a house of the Alterac Mountains."] =
        "정예인 낸시 비샤스가 알터랙 산맥의 한 집에서 반지를 가지고 있습니다.",
    ["Monika Sengutz, in Tarren Mill, in Hillsbrad Foothills."] =
        "모니카 센구츠는 힐스브래드 구릉지의 타렌 밀농장에 있습니다.",
    ["Andrew Brownell, in Undercity."] =
        "앤드류 브로넬은 언더시티에 있습니다.",
    ["Reward: a mace, a gun, a cloth robe or a leather chest."] =
        "보상: 둔기, 총, 천 로브 또는 가죽 가슴보호구.",
    ["Ambassador Malcin walks among the quilboar outside the downs."] =
        "사절 말킨은 구릉 밖의 가시멧돼지들 사이를 돌아다닙니다.",
    ["Patrick Garrett, in Undercity."] =
        "패트릭 가레트는 언더시티에 있습니다.",
    ["Dran Droffers, in the Drag of Orgrimmar."] =
        "드란 드로퍼스는 오그리마의 골목길에 있습니다.",
    ["Dran Droffers's chain goes back and forth between Orgrimmar, Kargath and Uldaman: it ends with a necklace and about 5,600 XP."] =
        "드란 드로퍼스의 연계 퀘스트는 오그리마, 카르가스, 울다만을 오갑니다: 끝에 목걸이와 약 5,600 경험치를 받습니다.",
    ["Jarkal Mossmeld, at Kargath, in the west of the Badlands."] =
        "자칼 모스멜드는 황야의 땅 서쪽의 카르가스에 있습니다.",
    ["The tablet lies in an ancient chest by the gates of Uldaman, in the north of the Badlands."] =
        "서판은 황야의 땅 북쪽, 울다만 입구 옆의 고대 상자 안에 있습니다.",
    ["The Shadowforge dwarves around the gates drop the power stones and the shattered necklace."] =
        "입구 주변의 어둠괴철로단 드워프가 마력석과 부서진 목걸이를 떨어뜨립니다.",
    ["The Garrett family chest stands in the dig west of Uldaman's gates."] =
        "가레트 가문의 상자는 울다만 입구 서쪽의 발굴지에 있습니다.",
    ["Jarkal Mossmeld, at Kargath."] =
        "자칼 모스멜드는 카르가스에 있습니다.",
    ["Dran Droffers, in Orgrimmar."] =
        "드란 드로퍼스는 오그리마에 있습니다.",
    ["Magenta cap clusters grow on the cave walls, south-west of Uldaman's gates and inside."] =
        "자홍색 버섯 덩어리는 울다만 입구 남서쪽과 던전 안의 동굴 벽에서 자랍니다.",
    ["The dungeon's door is at the back of the cave by the dig at Uldaman's gates."] =
        "던전 입구는 울다만 입구의 발굴지 옆 동굴 안쪽 끝에 있습니다.",
    ["A dead paladin rests just off the first great hall, down its second right-hand passage; then head out for Kargath."] =
        "죽은 성기사는 첫 번째 큰 전당에서 오른쪽 두 번째 통로로 조금 들어간 곳에 누워 있습니다. 그런 다음 밖으로 나가 카르가스로 향하세요.",
    ["Enter Uldaman again"] =
        "다시 울다만에 들어가세요",
    ["The topaz is in a conspicuous urn south-east of Dig Two, the ruby in a stone chest north-west of Dig Three (it calls monsters), the sapphire on Grimlok at the end of the Stone Vault; Archaedas, the last boss, in the Hall of the Crafters, drops the power source."] =
        "토파즈는 제2 발굴지 남동쪽의 눈에 띄는 항아리 안에, 루비는 제3 발굴지 북서쪽의 돌 상자 안에 (몬스터를 불러냅니다), 사파이어는 돌 금고 끝의 그림로크에게 있습니다. 장인의 전당에 있는 마지막 우두머리 아카에다스가 마력원천을 떨어뜨립니다.",
    ["Optional: the Discs of Norgannon, behind Archaedas, tell their story; it ends in Thunder Bluff with potions or a bag."] =
        "선택 사항: 아카에다스 뒤의 노르간논의 원반이 이야기를 들려줍니다. 썬더 블러프에서 끝나며 물약 또는 가방을 받습니다.",
    ["Bena Winterhoof, in Thunder Bluff."] =
        "베나 윈터후프는 썬더 블러프에 있습니다.",
    ["Venom bottles stand in the Witherbark trolls' camps of the south-west of the Hinterlands."] =
        "독병은 동부 내륙지 남서쪽의 마른나무껍질부족 트롤 야영지에 있습니다.",
    ["Optional: a chain of six quests between the Hinterlands, Tarren Mill, Durotar and the city; it ends with a shield, a mail chest or a cloth robe."] =
        "선택 사항: 동부 내륙지, 타렌 밀농장, 듀로타, 그리고 이 도시를 오가는 퀘스트 6개짜리 연계 퀘스트. 끝에 방패, 사슬 가슴보호구 또는 천 로브를 받습니다.",
    ["Apothecary Lydon, in Tarren Mill, in Hillsbrad Foothills."] =
        "연금술사 라이던은 힐스브래드 구릉지의 타렌 밀농장에 있습니다.",
    ["The Witherbark broodguards, spiders of the Hinterlands' troll camps, carry the sacs."] =
        "동부 내륙지 트롤 야영지의 거미인 마른나무껍질부족 혈거미가 주머니를 가지고 있습니다.",
    ["Apothecary Lydon, in Tarren Mill."] =
        "연금술사 라이던은 타렌 밀농장에 있습니다.",
    ["Master Gadrin, in Sen'jin Village, in Durotar."] =
        "장로 가드린은 듀로타의 센진 마을에 있습니다.",
    ["A tablet stands in the middle of the scarabs' chamber: read the spider god's name on it."] =
        "왕쇠똥구리 방 한가운데에 서판이 있습니다: 서판에 적힌 거미 신의 이름을 읽으세요.",
    ["Master Gadrin, in Sen'jin Village."] =
        "장로 가드린은 센진 마을에 있습니다.",
    ["Defeat Shadra at her altar of Shadra'Alor, in the south-west of the Hinterlands, and take her venom."] =
        "동부 내륙지 남서쪽 샤드라알로의 제단에서 샤드라를 쓰러뜨리고 그 독을 얻으세요.",
    ["Uthel'nay, in the Valley of Spirits of Orgrimmar."] =
        "우텔나이는 오그리마의 정기의 골짜기에 있습니다.",
    ["Vark Battlescar and Selendra, at Shadowprey Village, on the west coast of Desolace."] =
        "바르크 배틀스카와 셀렌드라는 잊혀진 땅 서쪽 해안의 그늘수렵 마을에 있습니다.",
    ["Shadowprey Village's two quests: a ring, plate gauntlets or a leather belt; then Theradras's end brings a sword, a staff or a bow."] =
        "그늘수렵 마을의 퀘스트 두 개: 반지, 판금 건틀릿 또는 가죽 허리띠. 그다음 테라드라스를 쓰러뜨리면 검, 지팡이 또는 활을 받습니다.",
    ["Vark Battlescar and Selendra, at Shadowprey Village."] =
        "바르크 배틀스카와 셀렌드라는 그늘수렵 마을에 있습니다.",
    ["Uthel'nay, in Orgrimmar."] =
        "우텔나이는 오그리마에 있습니다.",
    ["Fel'zerul, in Stonard, in the Swamp of Sorrows."] =
        "펠제룰은 슬픔의 늪의 스토나드에 있습니다.",
    ["Fel'zerul's chain goes to the Hinterlands and back: it opens The Temple of Atal'Hakkar, a talisman and about 5,900 XP."] =
        "펠제룰의 연계 퀘스트는 동부 내륙지에 다녀오는 여정입니다: 아탈학카르 신전 퀘스트로 이어지며, 부적과 약 5,900 경험치를 줍니다.",
    ["The Atal'ai artifacts lie in the ruins around the Pool of Tears, in the east of the swamp."] =
        "아탈라이 유물은 늪 동쪽, 눈물의 연못 주변 폐허에 있습니다.",
    ["Fel'zerul, in Stonard."] =
        "펠제룰은 스토나드에 있습니다.",
    ["Jammal'an the Prophet: cloth leggings or a mail helm, and about 6,550 XP."] =
        "예언자 잠말란: 천 다리보호구 또는 사슬 투구, 그리고 약 6,550 경험치.",
    ["Witch Doctor Uzer'i, at Camp Mojache, in Feralas."] =
        "의술사 우제리는 페랄라스의 모자케 야영지에 있습니다.",
    ["Larion, at Marshal's Refuge, in Un'Goro Crater."] =
        "라리온은 운고로 분화구의 마샬의 야영지에 있습니다.",
    ["Larion's chain leads to the temple's haze; its end brings a bloodpetal zapper."] =
        "라리온의 연계 퀘스트는 신전의 아지랑이로 이어지며, 끝에 붉은꽃잎 구제장치를 받습니다.",
    ["The bloodpetal plants of Un'Goro."] =
        "운고로의 붉은꽃잎덩굴손.",
    ["Liv Rizzlefix, in Ratchet."] =
        "리브 리즐픽스는 톱니항에 있습니다.",
    ["Every Atal'ai troll of the temple may drop a fetish."] =
        "신전의 아탈라이 트롤은 누구나 우상을 떨어뜨릴 수 있습니다.",
    ["Apothecary Zinge, in the Apothecarium of Undercity."] =
        "연금술사 진게는 언더시티의 연금술 실험실에 있습니다.",
    ["Optional: a lead from Undercity to Vivian Lagrave, at Kargath."] =
        "선택 사항: 언더시티에서 카르가스의 비비안 라그레이브에게 안내하는 퀘스트.",
    ["Shadowmage Vivian Lagrave, at Kargath, in the west of the Badlands."] =
        "어둠마법사 비비안 라그레이브는 황야의 땅 서쪽의 카르가스에 있습니다.",
    ["Shadowmage Vivian Lagrave, at Kargath."] =
        "어둠마법사 비비안 라그레이브는 카르가스에 있습니다.",
    ["Reward: a two-handed axe, a mace or potions."] =
        "보상: 양손 도끼, 둔기 또는 물약.",
    ["Thunderheart, at Kargath."] =
        "썬더하트는 카르가스에 있습니다.",
    ["Thunderheart's chain: Disharmony of Fire brings armor of any kind, and opens Commander Gor'shak and The Last Element."] =
        "썬더하트의 연계 퀘스트: 불의 부조화에서 종류를 가리지 않는 방어구를 받고, 사령관 고르샤크와 마지막 원소 퀘스트로 이어집니다.",
    ["Hierophant Theodora Mulvadania, at Kargath."] =
        "제사장 테오도라 뮬바다니아는 카르가스에 있습니다.",
    ["The Rise of the Machines ends inside the depths with armor of any kind, and about 6,200 XP."] =
        "기계들의 봉기는 나락 안에서 끝나며, 종류를 가리지 않는 방어구와 약 6,200 경험치를 줍니다.",
    ["The WANTED poster, at Kargath."] =
        "카르가스의 현상수배 벽보.",
    ["The wanted posters lead to General Angerforge, and a medallion."] =
        "현상수배 벽보는 사령관 앵거포지로 이어지며, 메달을 줍니다.",
    ["The war reavers and obsidian elementals of the Badlands drop the shards."] =
        "황야의 땅의 전투절단기와 흑요석 정령이 파편을 떨어뜨립니다.",
    ["Lotwil Veriatus, in the west of the Badlands."] =
        "로트윌 베리아투스는 황야의 땅 서쪽에 있습니다.",
    ["Galamav the Marksman, at Kargath."] =
        "명사수 갈라마브는 카르가스에 있습니다.",
    ["Commander Gor'shak's chain leads to Thrall, the emperor and the princess: about 9,950 XP at its end, and Thrall's reward."] =
        "사령관 고르샤크의 연계 퀘스트는 스랄, 제왕, 공주로 이어집니다: 끝에 약 9,950 경험치와 스랄의 보상을 받습니다.",
    ["Blackrock Mountain opens in the south of the Searing Gorge; inside, the depths' door is at the bottom of the mountain."] =
        "검은바위 산 입구는 이글거리는 협곡 남쪽에 있습니다. 산 안에서 나락 입구는 산 맨 아래에 있습니다.",
    ["High Interrogator Gerstahn, in a back room on the right of the Detention Block, carries the cell key; Commander Gor'shak sits in the first cell on the left of the tunnel."] =
        "감금 구역 오른쪽 안쪽 방의 대심문관 게르스탄이 감방 열쇠를 가지고 있습니다. 사령관 고르샤크는 통로 왼쪽 첫 번째 감방에 있습니다.",
    ["Defend Gor'shak against two waves of guards."] =
        "두 차례 몰려오는 경비병으로부터 고르샤크를 지키세요.",
    ["Talk to Kharan Mighthammer, in the first cell on the left across the hallway."] =
        "복도 건너편 왼쪽 첫 번째 감방의 카란 마이트해머와 대화하세요.",
    ["The Anvilrage guardsmen, wardens and footmen of the Detention Block and the halls."] =
        "감금 구역과 전당들의 성난모루단 경비병, 교도관, 보병.",
    ["Lord Incendius waits at the Black Anvil, in Shadowforge City: he carries the Tablet of Kurniya."] =
        "불의군주 인센디우스는 어둠괴철로 도시의 검은 모루에서 기다립니다: 쿠르니야의 서판을 가지고 있습니다.",
    ["Golem Lord Argelmach waits in the Manufactory; his golems and constructs drop the cores and the essences."] =
        "골렘 군주 아젤마크는 제조소에서 기다립니다. 그의 골렘과 피조물이 핵과 정수를 떨어뜨립니다.",
    ["Warlord Goretooth, at Kargath."] =
        "장군 고어투스는 카르가스에 있습니다.",
    ["The KILL ON SIGHT poster, at Kargath."] =
        "카르가스의 사살 지령 벽보.",
    ["Thrall, in Grommash Hold, in Orgrimmar."] =
        "스랄은 오그리마의 그롬마쉬 요새에 있습니다.",
    ["The Anvilrage medics, soldiers and officers of the halls."] =
        "전당들의 성난모루단 간호병, 병사, 장교.",
    ["Warlord Goretooth, then Lexlort, at Kargath."] =
        "카르가스의 장군 고어투스, 그다음 렉스로트.",
    ["Grark Lorkrub, held in the Blackrock Stronghold of the Burning Steppes."] =
        "그랄크 로크럽은 불타는 평원의 검은바위 요새에 붙잡혀 있습니다.",
    ["Optional: an escort in the Burning Steppes, then a third visit for General Angerforge: a medallion and about 7,750 XP."] =
        "선택 사항: 불타는 평원에서 호위를 한 다음, 사령관 앵거포지를 잡으러 세 번째로 방문합니다: 메달과 약 7,750 경험치.",
    ["Bind Grark Lorkrub with the shackles and lead him through Blackrock Mountain to the Searing Gorge."] =
        "족쇄로 그랄크 로크럽을 묶고 검은바위 산을 지나 이글거리는 협곡까지 데려가세요.",
    ["Lexlort, then Warlord Goretooth, at Kargath."] =
        "카르가스의 렉스로트, 그다음 장군 고어투스.",
    ["Enter Blackrock Depths a third time"] =
        "세 번째로 검은바위 나락에 들어가세요",
    ["General Angerforge waits down the stairs of the West Garrison."] =
        "사령관 앵거포지는 서부 주둔지 계단 아래에서 기다립니다.",
    ["Galamav the Marksman, at Kargath, in the west of the Badlands."] =
        "명사수 갈라마브는 황야의 땅 서쪽의 카르가스에 있습니다.",
    ["Lexlort, at Kargath."] =
        "렉스로트는 카르가스에 있습니다.",
    ["Lexlort's chain: Bijou's report brings cloth gloves or a mail belt."] =
        "렉스로트의 연계 퀘스트: 비쥬의 보고서를 가져가면 천 장갑 또는 사슬 허리띠를 받습니다.",
    ["Reward: armor of any kind, for the spire's three generals and their documents."] =
        "보상: 종류를 가리지 않는 방어구. 첨탑의 장군 셋과 그들의 문서가 대상입니다.",
    ["Blackrock Mountain opens in the south of the Searing Gorge; inside, the spire's door is at the top of the mountain."] =
        "검은바위 산 입구는 이글거리는 협곡 남쪽에 있습니다. 산 안에서 첨탑 입구는 산 꼭대기에 있습니다.",
    ["Highlord Omokk, north of Mok'Doom; War Master Voone, at the bottom of Tazz'Alaor; Overlord Wyrmthalak, the last boss, in the Chamber of Battle. The documents lie in one of their rooms, or by Urok's tribute pile."] =
        "대군주 오모크는 목둠 북쪽에, 대장군 부네는 타즈알라오르 아래쪽에, 마지막 우두머리 대군주 웜타라크는 전투의 방에 있습니다. 문서는 이들의 방 중 한 곳이나 우로크의 공물 더미 옆에 있습니다.",
    ["Galamav the Marksman, Lexlort and Warlord Goretooth, at Kargath."] =
        "명사수 갈라마브, 렉스로트, 장군 고어투스는 카르가스에 있습니다.",
    ["A herald of your capital: Harbinger Balthazad, Warcaller Gorlach or Bluff Runner Windstrider."] =
        "대도시의 전령: 선구자 발타자드, 징집관 고를라취 또는 포고꾼 윈드스트라이더.",
    ["Optional: a lead to Camp Mojache, about 1,500 XP."] =
        "선택 사항: 모자케 야영지로 안내하는 퀘스트, 약 1,500 경험치.",
    ["Talo Thornhoof, at Camp Mojache, in Feralas."] =
        "탈로 쏜후프는 페랄라스의 모자케 야영지에 있습니다.",
    ["Talo Thornhoof and Sage Korolusk, at Camp Mojache."] =
        "탈로 쏜후프와 현자 코로루스크는 모자케 야영지에 있습니다.",
    ["Talo Thornhoof, at Camp Mojache."] =
        "탈로 쏜후프는 모자케 야영지에 있습니다.",
    ["Sage Korolusk, at Camp Mojache."] =
        "현자 코로루스크는 모자케 야영지에 있습니다.",
    ["Harbinger Balthazad, in the Valley of Honor of Orgrimmar."] =
        "선구자 발타자드는 오그리마의 명예의 골짜기에 있습니다.",
    ["High Executor Derrington, at the Bulwark, in the Western Plaguelands."] =
        "고위집행관 델링턴은 서부 역병지대의 보루에 있습니다.",
    ["Burn the Scarlet command tent between Felstone Field and Dalson's Tears, and plant the Scourge banner there."] =
        "펠스톤 농장과 달슨의 눈물 사이에 있는 붉은십자군 지휘 천막을 불태우고, 그곳에 스컬지 깃발을 꽂으세요.",
    ["Apothecary Dithers, at the Bulwark."] =
        "연금술사 디더스는 보루에 있습니다.",
    ["Apothecary Dithers, at the Bulwark, in the Western Plaguelands."] =
        "연금술사 디더스는 서부 역병지대의 보루에 있습니다.",
    ["Alexi Barov, at the Bulwark."] =
        "알렉시 바로브는 보루에 있습니다.",
    ["The Barov fortune: four deeds inside the school; its follow-up sends you to kill Weldon Barov in the Alliance's Chillwind Camp."] =
        "바로브 가문의 재산: 학교 안의 증서 네 장. 후속 퀘스트에서는 얼라이언스의 서리바람 야영지에 있는 웰던 바로브를 처치하러 갑니다.",
    ["Weldon Barov stands among the guards of Chillwind Camp, the Alliance's camp in the west of the Western Plaguelands."] =
        "웰던 바로브는 서부 역병지대 서쪽의 얼라이언스 야영지인 서리바람 야영지의 경비병들 사이에 서 있습니다.",
    ["Nathanos Blightcaller, at Marris Stead, in the south-west of the Eastern Plaguelands."] =
        "나타노스 블라이트콜러는 동부 역병지대 남서쪽의 마리스 농장에 있습니다.",
    ["Optional: Nathanos Blightcaller's chain in the Eastern Plaguelands, up to Ramstein the Gorger inside the city: about 6,600 XP at its end."] =
        "선택 사항: 동부 역병지대에서 진행하는 나타노스 블라이트콜러의 연계 퀘스트로, 도시 안의 먹보 람스타인까지 이어집니다: 끝에 약 6,600 경험치를 받습니다.",
    ["Corin's Crossing, to the east: collect the living rot in ten minutes, then grind it with the mortar."] =
        "동쪽의 코린의 교차로: 10분 안에 살아 있는 부패물을 모은 다음 막자사발로 빻으세요.",
    ["The plaguebats of the Eastern Plaguelands."] =
        "동부 역병지대의 역병박쥐.",
    ["The Quel'Thalas Registry lies in the Quel'Lithien lodge, on the northern border."] =
        "쿠엘탈라스 기록부는 북쪽 경계의 쿠엘리시엔 오두막에 있습니다.",
    ["Duskwing, a bat, roams the country; Borelgore walks the northern wastes."] =
        "박쥐인 그늘날개는 일대를 돌아다니고, 피고름구더기는 북쪽 황무지를 돌아다닙니다.",
    ["Ramstein the Gorger comes into Slaughter Square once it is cleared."] =
        "학살의 광장을 정리하면 먹보 람스타인이 광장으로 들어옵니다.",
    ["Nathanos Blightcaller, at Marris Stead."] =
        "나타노스 블라이트콜러는 마리스 농장에 있습니다.",
}
