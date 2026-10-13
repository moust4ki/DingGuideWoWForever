-- Cozy Sleeping Bag (item 211527), "Ding - Items": a bedroll that adds up to 3% experience
-- after a short nap. A chain of clues clicked on objects, from level 14 (quest levels 22-32),
-- for both sides: the start (Westfall and the Barrens) runs one way for the Alliance and the
-- other way for the Horde, then Stonetalon Mountains (UiMap 1442), Loch Modan (1432) and
-- Thoradin's Wall, reached from Hillsbrad Foothills (1424), the bags in Arathi (1417).
-- Quest ids and objects checked against the QuestieDB Forever export: it records no
-- prerequisite for these quests, the steps keep the order. Texts are in English, translated
-- in Locales/Guides/<locale>/Items/; names come from QuestieDB.
Ding.RegisterGuide({
    id       = "items-cozy-sleeping-bag",
    pack     = "ding-items",
    title    = "Cozy Sleeping Bag",
    minLevel = 14, maxLevel = 60,
    steps    = {
        -- Each side starts at home and crosses to the other continent.
        { accept = 79008, faction = "Alliance",
          note = "A trail of clues on both continents, open from level 14, that ends with a bedroll worth up to 3% more experience: no fights, only objects to click."
              .. " Westfall, west of Sentinel Hill: the burned-out remains beside the wrecked cart." },
        { accept = 79007, faction = "Horde",
          note = "A trail of clues on both continents, open from level 14, that ends with a bedroll worth up to 3% more experience: no fights, only objects to click."
              .. " The Barrens, by the road south of Camp Taurajo: the burned-out remains at the foot of the burnt tower." },
        { turnin = 79008, faction = "Alliance",
          note = "The Barrens, by the road south of Camp Taurajo: the burned-out remains at the foot of the burnt tower."
              .. " Horde land: stay clear of the guards." },
        { turnin = 79007, faction = "Horde",
          note = "Westfall, west of Sentinel Hill: the burned-out remains beside the wrecked cart."
              .. " Alliance land: stay clear of the guards." },
        { accept = 79192,
          note = "Right there: the next clue, on the remains or on the plank nailed beside them." },
        -- Stonetalon Mountains: the camp is only reached by a path from the road.
        { go = { 1442, 50.9, 52.3 }, radius = 15, text = "Path northeast of Sun Rock Retreat",
          note = "The camp is up in the hills: follow this path west." },
        { turnin = 79192, accept = 79980,
          note = "At the end of the path, in the abandoned camp: the bedroll lying on a crate."
              .. " Optional: the wood and tinder from this reward relight the campfire beside it, a small quest the bag does not need." },
        { turnin = 79980, accept = 79974,
          note = "Up the hill north of the camp: a mound of fresh dirt." },
        -- Loch Modan, on the dam.
        { turnin = 79974, accept = 79975, faction = "Alliance",
          note = "Loch Modan, on top of the dam: the eagle figurine on the carved stone heads facing the Wetlands." },
        { turnin = 79974, accept = 79975, faction = "Horde",
          note = "Loch Modan, on top of the dam: the eagle figurine on the carved stone heads facing the Wetlands."
              .. " Alliance land: stay clear of the guards." },
        -- Thoradin's Wall: the way in is a cart leaning on the wall's Hillsbrad side.
        { go = { 1424, 87.3, 49.6 }, text = "Cart against Thoradin's Wall",
          note = "On the Hillsbrad Foothills side: climb onto the cart, then up into the wall." },
        { turnin = 79975, accept = 79976,
          note = "The messenger bag hangs on the outer face of the wall." },
        { turnin = 79976,
          note = "The satchel just below it holds the sleeping bag." },
        -- The item button offers the bag; using it ends the guide.
        { useitem = 211527, text = "Try the sleeping bag",
          note ="Use it outdoors and stay on it without moving: each minute of sleep adds 1% experience, up to 3%." },
    },
})
