# Create a guide with an AI

Ding can **import a guide written as text**: no addon to install, no file to copy. You paste
the text in the game, Ding checks every quest, NPC, object and place against its quest
database (built from Questie's), and the guide shows up next to Ding's own ones, for all your
characters.

Any AI chat can write that text for you, from facts it knows or that you give it. This page
gives the format in short, a complete real example, a prompt ready to copy, and what to do
when Ding finds mistakes.

## Contents

1. [In short](#1-in-short)
2. [The format](#2-the-format)
3. [A complete example: the Cozy Sleeping Bag](#3-a-complete-example-the-cozy-sleeping-bag)
4. [The prompt for the AI](#4-the-prompt-for-the-ai)
5. [Importing the guide](#5-importing-the-guide)
6. [When Ding finds mistakes](#6-when-ding-finds-mistakes)
7. [Export, share, change, delete](#7-export-share-change-delete)
8. [Rules](#8-rules)

## 1. In short

- A guide is **one Lua table**: the same keys as a guide pack
  ([guide-packs.md](guide-packs.md), sections 5 and 6), without the files around it.
- `/ding import` opens Ding's import window: paste the text (Ctrl+V), then **Import**.
- Ding lists what is wrong, with the line or the step. Errors block the import, warnings do
  not.
- In the settings, **Guide** tab, **Guides as text**: import, export the active guide,
  delete an imported one. With the gamepad: A, B, and Y to select a text for Ctrl+C.
- `/ding export` gives any guide as text (the active one by default; `/ding export <id>` for
  another, ids from `/ding list`), selected and ready for Ctrl+C.

## 2. The format

Two shapes. One guide:

```lua
{
    id       = "my-bag",              -- optional: Ding makes one ("user-...") if missing or taken
    title    = "Cozy Sleeping Bag",   -- the name in Ding's guide list
    category = "items",               -- "leveling" (default), "items", "reputations", "professions", "class"
    faction  = "Alliance",            -- optional: "Alliance" or "Horde"
    races    = { "NightElf" },        -- optional: Human, Dwarf, NightElf, Gnome, Orc, Scourge, Tauren, Troll
    classes  = { "HUNTER" },          -- optional: WARRIOR, PALADIN, HUNTER, ROGUE, PRIEST, SHAMAN, MAGE, WARLOCK, DRUID
    minLevel = 14, maxLevel = 60,     -- optional: the levels it is made for
    steps    = {
        { accept = 456 },
        { complete = 456, note = "Young nightsabers around the tree." },
        { turnin = 456, accept = 457 },
    },
}
```

Several guides that follow each other (a pack):

```lua
{
    pack   = { id = "my-route", title = "My route", author = "Me", category = "leveling" },
    guides = {
        { id = "my-route-1", title = "Part 1 (1-6)", next = "my-route-2", steps = { ... } },
        { id = "my-route-2", title = "Part 2 (6-10)", steps = { ... } },
    },
}
```

**Steps.** A step is done when all its actions are; Ding then moves on by itself. The main
keys (the full list, with every option, is in [guide-packs.md, section 6](guide-packs.md#6-steps)):

| Key | Value | Done when |
| --- | --- | --- |
| `accept`, `complete`, `turnin` | quest id, or a list `{ 456, 458 }` | the quest is taken, its objectives done, turned in |
| `go` | `{ uiMapId, x, y }`, x and y from 0 to 100 | the character is there |
| `level` | a number | the character reaches that level |
| `kill` | `{ { npcId, count } }` | that many killed |
| `collect` | `{ { itemId, count } }` | that many in the bags |
| `talk` | NPC id | that NPC's window opens |
| `object` | object id | a window opens next to that object (a chest, a book, a sign) |
| `useitem` | item id | the item is used (Ding's item button offers it) |
| `text` | a text | alone in a step: the player presses "next"; with `go`: the name of the place |
| `note` | a text | not an action: a tip shown under the step |
| `faction`, `races`, `classes` | as above | not an action: the step only exists for them |
| `optional` | `true` | not an action: the step never blocks |

Ding writes the names of quests, NPCs and items itself, in the player's language: **a guide
never writes names**, only ids. Your `title`, `text` and `note` are shown as you wrote them.

**When the database lacks something** (a new NPC or object of WoW Forever), give Ding a place
instead: `text` with the English name of the target and `go` with its coordinates, or
`spots = { { uiMapId, x, y } }` next to `kill`, `collect` or `object`. With `spots`, an NPC or
an object Ding does not know is only a warning.

**What the text may hold.** Tables `{ }`, texts in quotes, numbers, `true` and `false`,
comments (`--`), and `..` to join two texts. Nothing else: no functions, no variables, no
calls. Ding **reads** the text, it never runs it. Limits: 300 KB, 1000 steps per guide,
50 guides, 1000 characters per text.

**Coordinates.** Stand on the spot and type `/ding where`: Ding prints `go = { 1438, 54.6, 33.0 }`
for your position. The map ids of the zones:

| Map | Zone | Map | Zone | Map | Zone |
| --- | --- | --- | --- | --- | --- |
| 1411 | Durotar | 1426 | Dun Morogh | 1441 | Thousand Needles |
| 1412 | Mulgore | 1427 | Searing Gorge | 1442 | Stonetalon Mountains |
| 1413 | The Barrens | 1428 | Burning Steppes | 1443 | Desolace |
| 1416 | Alterac Mountains | 1429 | Elwynn Forest | 1444 | Feralas |
| 1417 | Arathi Highlands | 1430 | Deadwind Pass | 1445 | Dustwallow Marsh |
| 1418 | Badlands | 1431 | Duskwood | 1446 | Tanaris |
| 1419 | Blasted Lands | 1432 | Loch Modan | 1447 | Azshara |
| 1420 | Tirisfal Glades | 1433 | Redridge Mountains | 1448 | Felwood |
| 1421 | Silverpine Forest | 1434 | Stranglethorn Vale | 1449 | Un'Goro Crater |
| 1422 | Western Plaguelands | 1435 | Swamp of Sorrows | 1450 | Moonglade |
| 1423 | Eastern Plaguelands | 1436 | Westfall | 1451 | Silithus |
| 1424 | Hillsbrad Foothills | 1437 | Wetlands | 1452 | Winterspring |
| 1425 | The Hinterlands | 1438 | Teldrassil | 1439 | Darkshore |
| 1440 | Ashenvale | | | | |

**Ids.** Quest, NPC, object and item ids are the ones of Wowhead Classic
(`wowhead.com/classic/quest=456`) and of QuestieDB; the quests new in WoW Forever are in
QuestieDB too.

## 3. A complete example: the Cozy Sleeping Bag

A chain of clues on both continents, from level 14, that ends with a bedroll worth up to 3%
more experience. Quests 79008 (Alliance) or 79007 (Horde), then 79192, 79980, 79974, 79975
and 79976, all on objects (424005, 424012, 406918, 424006, ...); the reward is item 211527.
This is Ding's own "Ding! - Items" guide, as text: import it as it is to try the window.

<!-- example: tools/tests/import_test.lua imports this block and expects no error -->
```lua
{
    id = "example-cozy-sleeping-bag",
    title = "Cozy Sleeping Bag (example)",
    category = "items",
    minLevel = 14, maxLevel = 60,
    steps = {
        -- Each side starts at home and crosses to the other continent.
        { accept = 79008, faction = "Alliance",
          note = "Westfall, west of Sentinel Hill: the burned-out remains beside the wrecked cart." },
        { accept = 79007, faction = "Horde",
          note = "The Barrens, by the road south of Camp Taurajo: the burned-out remains at the foot of the burnt tower." },
        { turnin = 79008, faction = "Alliance",
          note = "The Barrens, south of Camp Taurajo: the remains at the foot of the burnt tower. Horde land: avoid the guards." },
        { turnin = 79007, faction = "Horde",
          note = "Westfall, west of Sentinel Hill: the remains beside the wrecked cart. Alliance land: avoid the guards." },
        { accept = 79192,
          note = "Right there: the next clue, on the remains or on the plank nailed beside them." },
        -- Stonetalon Mountains: the camp is only reached by a path from the road.
        { go = { 1442, 50.9, 52.3 }, radius = 15, text = "Path northeast of Sun Rock Retreat",
          note = "The camp is up in the hills: follow this path west." },
        { turnin = 79192, accept = 79980,
          note = "At the end of the path, in the abandoned camp: the bedroll lying on a crate." },
        { turnin = 79980, accept = 79974,
          note = "Up the hill north of the camp: a mound of fresh dirt." },
        -- Loch Modan, on the dam.
        { turnin = 79974, accept = 79975,
          note = "Loch Modan, on top of the dam: the eagle figurine on the carved stone heads facing the Wetlands." },
        -- Thoradin's Wall: the way in is a cart leaning on the wall's Hillsbrad side.
        { go = { 1424, 87.3, 49.6 }, text = "Cart against Thoradin's Wall",
          note = "On the Hillsbrad Foothills side: climb onto the cart, then up into the wall." },
        { turnin = 79975, accept = 79976,
          note = "The messenger bag hangs on the outer face of the wall." },
        { turnin = 79976,
          note = "The satchel just below it holds the sleeping bag." },
        { useitem = 211527, text = "Try the sleeping bag",
          note = "Use it outdoors and stay on it without moving: each minute of sleep adds 1% experience, up to 3%." },
    },
}
```

## 4. The prompt for the AI

Copy this, replace the last paragraph with what you want, and paste it in any AI chat.

```text
Write a guide for Ding, a leveling guide addon for World of Warcraft Classic (the WoW
Forever server, client 1.60). Answer with ONE Lua table and nothing else: no explanation
before or after it.

Facts only:
- Use the real ids of Wowhead Classic and QuestieDB: quest ids, NPC ids, object ids, item
  ids. Never invent an id. If you do not know one, write the step with `text` (the English
  name of the place or the target) and `go` (its coordinates) instead.
- Coordinates: { uiMapId, x, y } with x and y from 0 to 100 (Teldrassil is 1438, Westfall
  1436, The Barrens 1413, Stonetalon Mountains 1442, Loch Modan 1432).
- Keep the real order of the quests, and the faction and races they are for.
- Write every `title`, `text` and `note` yourself, in English, short, in your own words.
  Never copy text from a website, a guide or a book: only the facts.

The format, a single guide:
{
    title = "...", category = "leveling" or "items" or "reputations" or "professions" or "class",
    faction = "Alliance" or "Horde" (only if the guide is for one side),
    races = { "NightElf" } (optional), minLevel = 1, maxLevel = 60,
    steps = { { ... }, { ... } },
}
Step keys: accept / complete / turnin = quest id or { ids }; go = { uiMapId, x, y };
level = number; kill = { { npcId, count } }; collect = { { itemId, count } };
talk = npcId; object = objectId; useitem = itemId; text = "..."; note = "...";
faction = "Alliance" / "Horde" (a step for one side only); optional = true.
A step is done when all its actions are done. Never write names of quests, NPCs or
items: Ding shows them from their ids.
Allowed in the table: tables, texts in double quotes, numbers, true, false, -- comments.
No functions, no variables, no other code.

The guide I want: <describe it: the item, quest chain or zone, your faction, race, class and
level>.
```

## 5. Importing the guide

1. Copy the AI's answer. A code block with \`\`\`lua around the table is fine: Ding reads
   what is inside.
2. In the game: `/ding import` (or settings, **Guide** tab, **Guides as text**, **Import a
   guide**).
3. Paste with **Ctrl+V**, then **Import** (A on the gamepad, or a click).
4. Imported: **Follow this guide** switches to it. It is kept for all your characters and
   shows in the guide list under its category, marked "imported".

## 6. When Ding finds mistakes

Ding lists one line per problem, with where it is:

- `Line 12: ...` when the text cannot be read (a missing `}` or `,`, a text not closed);
- `Step 3: quest 79009 is not in the database` when a value is wrong;
- `Guide my-route-2, step 5: ...` in a pack.

**Errors** block the import; **warnings** (an item the database does not know, an id already
used that Ding changed) let it through.

To have the AI fix them: select the list (Y on the gamepad, or click in it then Ctrl+A),
copy it with **Ctrl+C**, and send it back:

```text
Ding refused the guide with these errors. Fix them, keep everything else the same, and
answer with the whole table again, nothing else:
<paste the errors here>
```

Frequent ones:

| Error | What to do |
| --- | --- |
| `quest 79009 is not in the database` | The id is wrong or invented: ask the AI to check it on Wowhead Classic. |
| `quest 456 is not open to this guide's races` | A quest of the other faction: fix `faction` or `races`, or the quest. |
| `map 1999 does not exist` | A wrong map id: use the table above or `/ding where`. |
| `go: coordinates outside 0-100` | Coordinates must be percents of the map, from 0 to 100. |
| `unknown key colour` | A key Ding does not know: a typo, or a key from another addon. |
| `print is not allowed: only tables, texts, numbers, true and false` | The AI wrote code: ask for the table only. |

## 7. Export, share, change, delete

- **Export**: `/ding export` (or **Export the active guide** on the settings page) shows the
  guide as text, already selected: Ctrl+C. **On one line** gives the same guide on a single
  line, for places that do not keep line breaks.
- **Share**: the text is the whole guide. Whoever imports it gets the same steps.
- **Change**: export it, change the text (by hand or with the AI), import it again: a guide
  with the same `id` replaces the imported one (Ding says so).
- **Delete**: settings, **Guide** tab, **Guides as text**, the guide, **Delete** (A twice, or
  two clicks). A character on that guide goes back to the guide it followed before.
- **Make it an addon**: a guide that deserves to be installed by many is better as a guide
  pack: [guide-packs.md](guide-packs.md). The steps are the same.

## 8. Rules

- **Facts are free, texts are yours.** Ids, coordinates and the order of quests are facts.
  Titles, texts and notes must be your own words (or the AI's own words): never copy the
  text of a website, a guide addon or a book.
- **Ids only.** Names, levels and places come from Ding's game data in the game; a guide holds
  ids, coordinates and notes.
- **What Ding accepts.** Every import is read as data and checked: nothing in a guide can
  run code in your game.
