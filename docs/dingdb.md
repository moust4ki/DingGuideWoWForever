# DingDB: an open game database for WoW Forever

DingDB is the game data Ding! runs on: Forever's quests, NPCs, objects and items, where they
are, who gives and takes back each quest, what each quest asks for, zones, dungeon entrances,
and their names in 9 languages. It ships inside Ding (`Ding/DB`), any addon can read it, and
anyone can correct it or add to it.

- **License**: GNU GPL v3, like Ding. Use it, change it and share it under the same terms.
- **Where it comes from**: the database of [Questie](https://github.com/Questie/Questie),
  through its [QuestieDB](https://github.com/Questie/QuestieDB) releases (GNU GPL v3, thanks
  to their authors), then DingDB's own corrections and additions (below). Each release used is
  written in `Ding/DB/DB.lua` (`source`); the credits are in `Ding/DB/CREDITS.md`.

Contents:

1. [Using it in an addon](#1-using-it-in-an-addon)
2. [The records](#2-the-records)
3. [Contributing corrections and additions](#3-contributing-corrections-and-additions)
4. [Updates](#4-updates)

## 1. Using it in an addon

DingDB comes with Ding: list Ding in your TOC, then read the global **`LibDingDB`** (the global
`DingDB` is Ding's own saved settings, not the library).

```toc
## Dependencies: Ding
```

(or `## OptionalDeps: Ding`, and test `LibDingDB` before using it).

| Function | Returns |
| --- | --- |
| `LibDingDB.Get(kind, id)` | a record: `{ id, fields by name, name, englishName }`, or `nil`. `kind`: `"quest"`, `"npc"`, `"object"` or `"item"`. `name` is in the client's language when DingDB has it. |
| `LibDingDB.Name(kind, id)` | the name in the client's language (English otherwise), or `nil` |
| `LibDingDB.Ids(kind)` | every id of a kind, sorted |
| `LibDingDB.UiMap(areaID)` | the UiMapID of an AreaID (the zone ids of quests and spawns in other databases) |
| `LibDingDB.Entrances(areaID[, side])` | a dungeon's entrances, `{ { uiMapID, x, y }, ... }`; `side = "Horde"` for the few battlegrounds whose entrance differs |
| `LibDingDB.source`, `LibDingDB.version` | the release DingDB was built from, the API's version |

Every answer is a fresh copy: change it as you like, Ding's data stays as it is.

```lua
local q = LibDingDB.Get("quest", 783)
print(q.name, q.requiredLevel)              -- "A Threat Within" (or the client's language), 1
local giver = LibDingDB.Get("npc", q.startedBy[1][1])
for uiMap, coords in pairs(giver.spawns) do
    for i = 1, #coords, 2 do print(uiMap, coords[i], coords[i + 1]) end   -- 1429 48.17 42.94
end
```

## 2. The records

Spawns are by **UiMapID**, with x and y in percent (0-100, two decimals):
`spawns = { [uiMapID] = { x1, y1, x2, y2, ... } }`. Ids are the game's (the same as Wowhead
Classic's and QuestieDB's). A missing number reads as `0` through Ding; through `LibDingDB`, a
missing field is `nil`.

**Quest**

| Field | Value |
| --- | --- |
| `name` | title (English in `englishName`) |
| `startedBy`, `finishedBy` | `{ npc ids?, object ids?, item ids? }`: who gives it, who takes it back |
| `requiredLevel`, `questLevel` | level to take it, level of the quest |
| `requiredRaces`, `requiredClasses` | bit masks (0: everyone); races Human 1, Orc 2, Dwarf 4, Night Elf 8, Undead 16, Tauren 32, Gnome 64, Troll 128; classes Warrior 1, Paladin 2, Hunter 4, Rogue 8, Priest 16, Shaman 64, Mage 128, Warlock 256, Druid 1024. Masks go beyond 32 bits: test them with arithmetic, `math.floor(mask / bit) % 2 == 1` |
| `objectives` | `{ [1] creatures, [2] objects, [3] items, [4] reputation, [5] kill credit, [6] spells }`, each a list of `{ id, text? }` (kill credit: `{ { npc ids }, credit npc id, text }`) |
| `triggerEnd` | `{ text, spawns }`: a place to reach |
| `sourceItemId` | the item the giver hands out with the quest |
| `preQuestSingle`, `preQuestGroup` | quests to turn in first: one of them, all of them |

**NPC**: `name`, `subName` (its subtitle, English), `minLevel`, `maxLevel`, `rank` (0 normal,
1 elite, 2 rare elite, 3 boss, 4 rare), `friendlyToFaction` (`"A"`, `"H"` or `"AH"`),
`npcFlags` (services: vendor 4, flight master 8, trainer 16, innkeeper 128, banker 256,
auctioneer 4096, stable master 8192, repair 16384...), `spawns`, `dungeon`, `weaponSkills`.

`weaponSkills` (DingDB's own, set by `tools/data/corrections/10_weapon_masters.lua`): the weapon
skills a weapon master teaches, as the game's skill line ids (43 Swords, 44 Axes, 45 Bows,
46 Guns, 54 Maces, 55 Two-Handed Swords, 136 Staves, 160 Two-Handed Maces, 172 Two-Handed
Axes, 173 Daggers, 176 Thrown, 226 Crossbows, 229 Polearms, 473 Fist Weapons).

**Object**: `name`, `spawns`, `dungeon`.

`dungeon` (NPC, object): the AreaID of the dungeon it is only found in, when none of its spawns is
on a map outside; `LibDingDB.Entrances(dungeon)` gives the way in, and `zones.dungeonNames` the
dungeon's English name. Ding leads to the entrance of such a target.

**Item**: `name`, `npcDrops` and `objectDrops` (who drops it), `vendors` (NPCs that sell it),
`class` and `subClass` (the game's item class and subclass: 0 consumable, 2 weapon, 4 armor,
5 reagent, 6 projectile with 2 arrow and 3 bullet, 7 trade goods, 15 miscellaneous...; no
value when Questie's data has none), `requiredLevel` (to use or wear it), `flags` (the game's
item flags, as Questie's data has them: food and drinks have none, poisons, lures, bandages
and explosives have one).

The files themselves (`Ding/DB/*.lua`) are positional records for size; `Ding.DB.LAYOUT` gives
each field's position. You may copy them into your own GPL project: keep `CREDITS.md`.

## 3. Contributing corrections and additions

Found a wrong place, a missing NPC, a Forever quest DingDB does not know? Correct it in
`tools/data/corrections/`. Each file is plain Lua data (no code runs: a file that calls
anything is refused), named `NN_topic.lua` and applied in name order, on top of Questie's data:

```lua
return {
    quests = {
        -- A field given replaces Questie's; the other fields stay.
        [783] = { requiredLevel = 1 },
        -- A quest new in Forever: every field it needs.
        [99049] = { name = "Threat from Below", questLevel = 11, requiredLevel = 9,
            startedBy = { { 275657 } }, finishedBy = { { 3142 } }, preQuestSingle = { 99048 } },
        -- false removes a record (a quest that does not exist in Forever).
        [12345] = false,
    },
    npcs = {
        [823] = { spawns = { [1429] = { 48.17, 42.94 } } },
        [3142] = { subName = false },          -- false removes one field
    },
    objects = { },
    items = { },
    -- Names in other languages (English is the record's `name`).
    names = {
        frFR = { quests = { [99049] = "Menace des profondeurs" } },
    },
}
```

- **What is missing**: `lua5.1 tools/audit_data.lua <QuestieDB export>` lists what Ding's guides
  need that DingDB lacks (a quest giver, an NPC or an objective with no place), apart from what
  is inside a dungeon or what the player makes appear.
- **Ids**: the game's, as on Wowhead Classic (`wowhead.com/classic/npc=823`).
- **Positions**: stand on the spot in game and type `/ding where`: it prints the UiMapID, x and
  y (`go = { 1429, 48.2, 42.9 }`), ready to copy.
- **Languages**: deDE, esES, esMX, frFR, koKR, ptBR, ruRU, zhCN, zhTW.
- **Check** your file: `lua5.1 tools/check_data.lua` lists every mistake (unknown field, wrong
  shape, a position outside 0-100...).
- **Build** DingDB again and run the tests (`tools/README.md`, section 1), then open a pull
  request. Not comfortable with that? Open an
  [issue](https://github.com/moust4ki/DingGuideWoWForever/issues) with the ids, the places and
  the names: we will add them.

Corrections stay when DingDB is rebuilt from a new QuestieDB release; when Questie fixes the
same thing, the correction can go.

## 4. Updates

On each new QuestieDB release, DingDB is built again from it (`tools/build_data.lua`), with the
corrections on top, and the whole test suite runs: `db_parity_test` checks that Ding gets the
same answers from DingDB as from QuestieDB (except where a correction changed something on
purpose), and the CI checks that `Ding/DB` is exactly what the tool writes from that release.
