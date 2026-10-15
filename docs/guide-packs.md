# Writing a guide pack for Ding

Ding is a guide engine: it reads a route of quests, shows each step, points the arrow and
moves on by itself as you accept, complete and turn in quests. Ding ships its own guide, and
anyone can write another one: a **guide pack**. A pack is a small addon of its own, with
only Lua files listing quest ids, places and notes. Once installed, it shows up in Ding's
settings next to Ding's guide.

This page explains how to build a pack, file by file, how to test it and how to share it.
A complete, working pack is in [`examples/DingExamplePack`](../examples/DingExamplePack):
copy it and start from there.

No addon needed to try a route: the same guide, as text, can be pasted in the game
(`/ding import`). [Create a guide with an AI](create-a-guide-with-ai.md) explains that
format, with a prompt ready to copy.

## Contents

1. [How a pack shows in the game](#1-how-a-pack-shows-in-the-game)
2. [The files of a pack](#2-the-files-of-a-pack)
3. [The .toc file](#3-the-toc-file)
4. [The pack: `Ding.RegisterGuidePack`](#4-the-pack-dingregisterguidepack)
5. [A section: `Ding.RegisterGuide`](#5-a-section-dingregisterguide)
6. [Steps](#6-steps)
7. [Translations](#7-translations)
8. [Finding quest ids and places](#8-finding-quest-ids-and-places)
9. [Testing in the game](#9-testing-in-the-game)
10. [Checking a pack offline](#10-checking-a-pack-offline)
11. [Sharing your pack](#11-sharing-your-pack)
12. [Rules](#12-rules)

## 1. How a pack shows in the game

In Ding's settings (`/ding config`, or the minimap button), the **Guide** tab has two lists:

- **Active guide**: one of Ding's own five guides ("Ding! - Leveling", the default, "Ding -
  Zones", "Ding! - Items", "Ding! - Class quests" and "Ding! - Dungeon quests") or one of the installed packs, with its author and the levels it
  covers for your character. A pack with nothing for your race or class is greyed (it can
  still be picked). The packs are grouped by [category](#4-the-pack-dingregisterguidepack):
  "Leveling (XP)" first, then "Items", and so on, each under a header that cannot be picked.
- **Section**: the parts of the chosen guide. In Ding! - Leveling, a section is a stretch of
  the route over one or a few zones ("Duskwood & Redridge Mountains (25-27)"); in Ding -
  Zones, a leveling zone ("Shadowglen (1-6)"); in Ding! - Items, an item worth getting off the
  route ("Cozy Sleeping Bag", a bedroll worth up to 3% more experience); in Ding! - Class
  quests, the quests of your class ("Druid quests"), the only section listed for you; in Ding! -
  Dungeon quests, a dungeon of your side ("The Deadmines (17-26)"), listed by level; a pack
  cuts its route as it likes. A pack of category `"class"` lists only the sections for the
  character's own class and side, a pack of category `"dungeon"` only those of the character's
  side.

Picking a pack starts its section for your character and level, taken up where you really
are (quests already done are passed). Going back to a pack you followed before (after an
item guide, for example) takes up the section and the step you were on, as long as that
section still has quests for your level. Ding remembers the pack of each character. If the
pack is disabled later, Ding goes back to its own guide; pick the pack again once it is
back, and Ding finds your place from your quests.

`/ding list` prints every pack and the ids of its sections.

## 2. The files of a pack

```
DingMyPack/                  the addon folder: same name as the .toc file
  DingMyPack.toc             what the game reads: name, dependency on Ding, file list
  Pack.lua                   the pack itself (title, author)
  Guides/
    01_FirstZone.lua         one file per section
    02_SecondZone.lua
  Locales/
    frFR.lua                 optional: translations of the notes, one file per language
  LICENSE                    the GNU GPL v3 text (see Rules)
```

Only the `.toc` name and the folder name are fixed (they must match). The other names are
yours: the `.toc` lists the files in the order the game loads them.

## 3. The .toc file

```
## Interface: 16001
## Title: Ding My Pack
## Notes: Leveling route for Night Elves, 1-20.
## Author: YourName
## Version: 1.0.0
## Dependencies: Ding
## X-License: GPL-3.0

Pack.lua
Guides\01_FirstZone.lua
Guides\02_SecondZone.lua
Locales\frFR.lua
```

- `## Interface: 16001` is the WoW Forever client (1.60). When the client changes, the game
  marks addons with an older number as "out of date".
- `## Dependencies: Ding` is required: the game then loads Ding first, so that the `Ding`
  global and its functions exist when your files run. Nothing else: Ding carries its own
  game data (QuestieDB is not needed).
- Order: `Pack.lua` first (the sections name the pack), then the sections, then the
  translations.

## 4. The pack: `Ding.RegisterGuidePack`

`Pack.lua` registers the pack once:

```lua
Ding.RegisterGuidePack({
    id     = "mypack",        -- required: unique and stable (lowercase, digits and "-" are safest)
    title  = "My route",      -- shown in the first list (default: the id)
    author = "YourName",      -- optional: shown as "by YourName"
    category = "leveling",    -- optional: the group of the list (default "leveling")
})
```

| Field | Required | Meaning |
| --- | --- | --- |
| `id` | yes | Unique among the installed packs, and stable: each character remembers it. `ding`, `ding-zones`, `ding-items`, `ding-class` and `ding-dungeons` are Ding's own packs. |
| `title` | no | Name shown in the settings. Write it in English, or pick it with `GetLocale()`. |
| `author` | no | Your name, shown after the title. |
| `category` | no | What the pack is for, the group it is listed under: `"leveling"` (the default: a route for experience), `"items"` (a quest chain for an item, a toy, a bag…), `"reputations"`, `"professions"`, `"class"`, `"dungeon"` (one section per dungeon, the player's side only). Any other value is listed under leveling (the validator warns). The player's option "Skip grey quests" only applies to leveling packs: the others are followed for their reward and keep every quest. |

Registering an id that is already taken is an error, shown by the game.

## 5. A section: `Ding.RegisterGuide`

Each file of `Guides/` registers one section:

```lua
Ding.RegisterGuide({
    pack     = "mypack",                -- required: the id of your pack
    id       = "mypack-01-shadowglen",  -- required: unique among all packs, stable
    title    = "Shadowglen (1-6)",      -- shown in the second list
    faction  = "Alliance",              -- "Alliance", "Horde", or nil for both
    races    = { "NightElf" },          -- nil for every race
    classes  = nil,                     -- e.g. { "HUNTER", "DRUID" }; nil for every class
    minLevel = 1, maxLevel = 6,         -- the levels the section is made for
    next     = "mypack-02-dolanaar",    -- the section that follows this one
    steps    = {
        { accept = { 456, 458 } },
        { complete = 456, note = "Nightsabers and boars around the tree." },
        { turnin = 456, accept = 457 },
    },
})
```

| Field | Required | Meaning |
| --- | --- | --- |
| `pack` | yes | Your pack's id. Without it, the section would be added to Ding's own guide. |
| `id` | yes | Unique among every pack and stable. Start it with your pack's id: `mypack-01-…`. |
| `title` | no | Name in the second list (default: the id). Translatable (see 7). |
| `faction` | no | `"Alliance"` or `"Horde"`. |
| `races` | no | Race names as the client gives them: `Human`, `Dwarf`, `NightElf`, `Gnome`, `Orc`, `Scourge` (Undead), `Tauren`, `Troll`, and Forever's `Skyborne` (found on both sides). |
| `classes` | no | `WARRIOR`, `PALADIN`, `HUNTER`, `ROGUE`, `PRIEST`, `SHAMAN`, `MAGE`, `WARLOCK`, `DRUID`. |
| `minLevel`, `maxLevel` | no | Levels of the section (default 1 and 60). Ding uses them to suggest a section, and past `maxLevel` it offers the player to go on to `next` ("Next section", "Turn in first" or "Stay"). |
| `next` | no | Id of the section to start when this one is done. It may be a section of another pack, Ding's included (`/ding list` gives the ids). For a race that picks its side later (Skyborne), one id per faction: `next = { Alliance = "mypack-05-darkshore", Horde = "mypack-05-barrens" }`; a character with no side yet (or a faction missing from the table) finishes the section there. |
| `steps` | yes | The list of steps (see 6), at least one. |
| `leftOut` | no | Quests this section leaves out on purpose, and why: `{ [quest id] = reason }` (see "Why", in 6). The panel beside an NPC's window says it when the NPC offers one. |

**Which section a character gets.** When a pack is picked, Ding takes, among the sections
for the character's faction, race and class, in the order of your `.toc`: the first one
started but not finished, else the first one whose levels contain the character's level.
List your sections in play order.

**Updating a pack.** Keep the ids. You can change steps freely: when a section changed since
the last session, Ding finds the player's place again from their quests. If a section id
disappears, the character gets the suggested section of your pack.

## 6. Steps

A step is a table of **actions**. The step is done when all its actions are; Ding then moves
to the next one by itself. Ding writes the text of each action in the player's language,
with the quest, NPC and item names from its game data: **a guide never writes names**, only ids.

| Key | Value | Done when |
| --- | --- | --- |
| `accept` | quest id or list of ids | the quest is in the quest log (or already turned in) |
| `complete` | quest id or list of ids | the quest's objectives are done (or it is turned in) |
| `turnin` | quest id or list of ids | the quest is turned in |
| `level` | number | the character reaches this level (Ding shows the experience and the kills left, and sends the arrow to monsters of the character's level near your next steps). Inside a level: `level = 12, xp = 4500` (level 12 plus 4,500 experience into it), or `level = 12.5` (half-way through level 12) |
| `go` | `{ uiMapId, x, y }`, x and y from 0 to 100 | the character is within `radius` yards (10 by default); a point at a dungeon's entrance is also reached once the character is inside an instance (no position there) |
| `sethearth` | name of the inn, as text | the player binds the hearthstone (the text names the inn). Only with the player's option "Manage the hearthstone" (on by default). |
| `train` | `true` or a text | a class trainer's window, opened during the step, is closed, or a spell is learned during the step (or "next"); the arrow goes to the nearest trainer of the player's class. Only with the player's option "Class trainer steps" (on by default). |
| `fly` | `true` or a text | a flight master's map opens, or a new flight path is discovered (or "next"); the arrow goes to the nearest flight master of the player's side. Only with the player's option "Flight path steps" (on by default). |
| `vendor` | `true` or a text | a merchant's window, opened during the step, is closed (or "next"); the arrow goes to the nearest vendor. Only with the player's option "Vendor and repair steps" (on by default). |
| `repair` | `true` or a text | the same, at the nearest repairer. Same option. |
| `hearth` | `true` | the player casts the hearthstone (the item button offers it), or presses "next". Only with "Manage the hearthstone" (on by default). |
| `deathskip` | `true` | the player died during the step and is alive again (spirit healer or corpse), or presses "next". Say where in `text`: "Die at the cave, revive at Dolanaar". Only with the player's option "Death skips" (off by default). |
| `text` | text | alone in a step: the player presses "next". With other actions: shown under them. With `go`: the label of the place. |

Goals without a quest (they combine with the keys above: the step is done when all of its
parts are). A "pair" is `{ id, count }`; write a list of pairs, `kill = { { 1984, 8 } }`
(one pair alone or a bare id are read too, but a list is never ambiguous):

| Key | Value | Done when | The arrow goes to |
| --- | --- | --- | --- |
| `kill` | list of pairs `{ npcId, count }` | each monster killed `count` times by the player since the step began (counted from the game's "X dies, you gain N experience" message: kills that give experience) | its spawns (an area, with the farming loop) |
| `collect` | list of pairs `{ itemId, count }` | the bags hold `count` of each (already held: done at once) | the monsters and objects that drop it |
| `buy` | list of `{ itemId, count, vendorNpcId }` (vendor optional) | the bags hold `count` of each | the vendor given, else the item's vendors, else the nearest vendor |
| `talk` | NPC id or list (any one) | that NPC's window opens (gossip, quest, merchant, trainer, flight map, bank) | the NPC |
| `gossip` | number: the dialogue line to pick, 1-based, in the order the dialogue lists them | the dialogue, opened during the step, closes. Ding names the line on a banner while it is open; it never clicks it. Use it with `talk` | |
| `useitem` | item id or list | each is used during the step (its spell cast, or its count down), or an objective of the step's `complete` quest advances. The item button offers it | |
| `object` | object id or list (any one) | a window opens within 20 yards of one of its spawns (loot, gossip, quest, book), or "next" | its spawns |
| `equip` | item id or list | each is worn. The item button offers it (using it from the bags wears it) | |
| `destroy` | item id or list | none left in the bags. Ding never destroys anything: the player does | |
| `bank` | item id or list | none left in the bags (put in the bank) | the bank the fewest seconds away, until its window opens |
| `unbank` | item id or list | it is in the bags again | the bank the fewest seconds away, until its window opens |
| `abandon` | quest id or list | the quest has left the log: the player abandons it in the game's quest log, Ding never does | |
| `keep` | item id or list | not a goal: from this step on, Ding never sells these items at a merchant, and the step says to keep them | |
| `spots` | list of `{ uiMapId, x, y }` | not a goal: your own places for the step's `kill`, `collect` and `object` goals, used instead of QuestieDB's spawns | those places |

Options of a step:

| Key | Meaning |
| --- | --- |
| `note` | A tip shown under the step. |
| `why` | Why your route makes this choice (see "Why" below): a text, or `{ kind = ..., ... }`. |
| `optional` | `true`: the step never blocks. Ding passes it when the player goes further, or when its quest never started (an item that never dropped). |
| `faction` | `"Alliance"` or `"Horde"`: in a section for both sides, the step only exists for that side (a race that picks its side on the way gets it once it has one). For a route that starts differently on each side and then goes on together. |
| `races`, `classes` | The step only exists for these races or classes (same names as above). |
| `radius` | Arrival distance of a `go` step, in yards. |
| `floor` | `"up"` (one floor up, upstairs, a balcony), `"top"` (the highest floor of a tower or a building) or `"down"` (a lower floor, a cellar, below ground): where the step's target is. The game gives no height, so on arrival the arrow would say "You're here" one floor too low; with `floor` it says "The NPC is one floor up" (or "It's one floor up" for an object or a place) and stays, and within 30 yards it adds "One floor up". Leave it out when the target may be on several floors. Not for a `go` step. |
| `use` | Item id or list of ids: the quest item button offers the first one in the bags. |
| `sticky` | Quest id or list of ids: from this step on, the unfinished objectives of these quests stay listed under every following step ("Still to do"), and their monsters are low-priority arrow targets, while the quest is in the log and not ready. For a quest done a little at a time along the route: `{ accept = 456, sticky = 456 }`. |
| `dungeon` | Name of the dungeon, as text: the step's quests are done inside it, with a group. The player chooses dungeon by dungeon in the settings (by default, the option "Dungeon quests", off): write **one exact name per dungeon, the same in every step of it** (in English: "The Deadmines"), since it is the name of that choice. |
| `elite` | `true`: the step's quests are against elite monsters. Only with the player's option "Elite quests" (off by default). |
| `when` | Conditions, all of which must hold, else the step is passed like a step for another race: `done` (quest id or list: turned in), `notdone`, `log` (in the quest log), `notlog`, `ready` (in the log, objectives done), `item` (in the bags: an id, `{ id, count }`, a list of ids that must all be held, or a list of pairs; a pair is two numbers whose second is below 1000), `noitem` (id), `minlevel`, `maxlevel` (the character's level, inclusive). `{ when = { log = 1234 }, turnin = 1234 }`. For "or" and "not" combinations, write several steps. |
| `noauto` | Quest id or list of ids: Ding never accepts these quests by itself (timed quests, escorts the player starts when ready); it still turns them in. |
| `revive` | On a `deathskip` step: `{ uiMapId, x, y }`, the spirit healer the ghost runs to (the arrow goes there instead of the corpse), or `"corpse"` (the default). |
| `patrol` | List of `{ uiMapId, x, y }`: the arrow goes from one point to the next and round again (each reached within `radius`). With `kill`, `collect` or `level`, until they are done; alone, until "next". |

**Steps behind an option.** A step with `sethearth`, `hearth`, `deathskip`, `dungeon` or
`elite` exists only when the player turned the matching option on (Route tab of the
settings); otherwise Ding passes it, like a step for another race. The whole step goes: put
these keys on steps of their own, and put `dungeon` or `elite` on **every** step of such a
quest (accept, complete and turn in), so that a player without the option never gets half of
it. Write the steps around them so that the route works both ways (a death skip followed by
a `go` to the same place: a player who walks gets there too).

Within a step, Ding lists the turn-ins first, then the accepts, then the objectives; the
arrow goes to the nearest of them. The steps without a quest (`train`, `fly`, `vendor`,
`repair`, `hearth`, `text`, and `go` when the player is not there) also pass once the player is
further in the guide: a later quest turned in, or accepted in the next steps. A step that
only travels (`go`, `fly` or `hearth`, nothing else) passes as soon as the step after it is
already done: nothing is left at the end of the trip. So keep a trip and what it leads to in
two steps, the trip first. Give every `go` a `text` that says where or what for (without one,
the window only shows the coordinates), and never follow a trip with the same trip: the
player is already there, the second one passes on arrival and repeats the line. Trips for
different classes to one place are fine (`classes` on each), one per character.

```lua
{ accept = { 456, 458 } },                                    -- two quests at once
{ complete = 456, note = "Nightsabers around the tree." },    -- a tip under the step
{ turnin = 456, accept = 457 },                               -- turn in, take the next one
{ level = 3, note = "Finish the level on boars." },           -- grind before going on
{ go = { 1438, 54.6, 33.0 }, text = "Walk north to the cave" },
{ train = true, note = "Your class trainer is inside Aldrassil." },
{ accept = 97236, optional = true, note = "If the fang dropped: use it from your bags." },
{ train = true, classes = { "WARLOCK" }, note = "New spells." },   -- one class only
{ sethearth = "Dolanaar", note = "The innkeeper is upstairs." },
{ hearth = true },                                                   -- back to the inn
{ deathskip = true, text = "Die near the cave, revive at the spirit healer" },
{ accept = 2922, dungeon = "Gnomeregan" },
{ accept = 228, elite = true, note = "Mor'Ladim is elite: find a group." },
{ text = "End of the route: pick Ding's guide again in the settings." },
```

**Why.** A player who does not see why the route sends them somewhere doubts it, and leaves
it. `why` says it in plain words, never as a color or a code. Keep it for the choices that
surprise (a trip to another zone and back, a quest taken now and turned in much later):
with `short = true`, one line under the step; otherwise only on demand, in the tooltip of the
step's rows (the mouse over a row, or X in focus mode), under "Why?". A step without `why`
says nothing more (no "Why?" in its tooltip either). The player can turn the
explanations off (Guide tab, "Guide explanations"). Say only what is true: a reason you do not
know is better left out.

- A text: `why = "The cave is safer at night."` (on demand), or
  `why = { text = "...", short = true }` (under the step). Translated like `note` (see 7).
- Figures, written in the player's language by Ding (estimates, said as such):
  - `{ kind = "detour", quest = 67, xp = 13000, seconds = 300, chain = 11, short = true }`: the
    step takes the player out of their way for `seconds` (beyond the direct way); turning in
    `quest` (or taking it: `action = "accept"`) brings `xp`, and opens `chain` more quests your
    route does next. Optional: `total` and `quests` (all the XP of the detour, its number of
    quests), `back = true` (back in the zone it left). Under the step: "Why this detour (about
    5 min): turning in “The Legend of Stalvan” opens a chain of quests worth a lot of XP (about
    13,000)." ("a lot of XP" from a quarter of the player's level).
  - `{ kind = "carry", quest = 79192, xp = 1100, seconds = 27720, continent = true, once = true }`:
    taken here, turned in `seconds` of route later (on another continent; `once`: the route never
    comes back here before).
  - `{ kind = "level", levels = { 28, 30 } }`: on a `level` step, the levels of the quests that
    follow.

A section's `leftOut` names the quests it does not take, so that the player beside an NPC
knows why ("The guide does not do this quest: <reason>."): `{ [quest id] = "text" }` (the end of
that sentence: "too far for the XP it brings"), or `{ kind = ... }` with `detour` (`xp`, `seconds`: too
little XP for the detour), `long` (`xp`, `seconds`: the detour is too long), `away` (the route
does not pass by its giver at a fitting level), `far` (its objectives are far from the route;
`turnin = true`: its turn-in), `log` (the quest log is full there), `prereq` (it follows a
quest the route does not do; `quest`: which), `version` (the route does another version of it),
`exclusive` (it rules out a quest the route does), `followup` (the route takes the quest it
leads to directly), `unsure` (the data does not tell what it asks for).

What Ding does for you, so steps stay short:

- the arrow points to the next NPC or the monsters of the objectives, from Ding's game data; a target
  in another zone is named with its zone (under the arrow and on the step's line), and the
  target is marked on the world map (the game's own map waypoint); a target only inside a
  dungeon leads to the dungeon's entrance ("Herod, in Scarlet Monastery");
- with automation on (the default), quests of the step are accepted and turned in when the
  player talks to the NPC;
- a quest above the player's level is shown in orange with its level;
- a quest the character cannot take yet (its required level is not reached) is flagged and
  does not block the step; a later step that works on it or turns it in asks to pick it up
  first;
- a quest whose prerequisite was never done sends the player to that prerequisite first;
- grey quests can be skipped (a setting of the player; leveling packs only);
- on a `level` step, the experience and kills left, and a monster to farm around the
  character's level: those of the quests in the log first, then those of your next steps;
- under any step, the objectives of the other quests in the log whose monsters are right
  around the player ("Along the way");
- among the spawns of the monsters or objects to kill or gather, the arrow leads in a loop
  from spawn to spawn (the minimap shows the stops), and a binding moves the arrow through the
  step's targets one after the other;
- at a merchant, grey items are sold and the gear repaired (options of the player), and the
  window warns when the bags are almost full;
- a binding targets the NPC or monster the arrow points to; another lists the nearest
  vendor, repairer, innkeeper, flight master and class trainer and leads there;
- new spells at the class trainer are pointed out at their level, and gear upgrades in the
  bags are offered on the item button;
- quest rewards: the best upgrade for the player's class is pointed out (taken with the
  player's option "Choose quest rewards"), else the one that sells for the most;
- the quests in the log your route never uses are listed for the player (Guide tab); from a
  quest shown in the window, the player can look for the step of your pack that deals with it
  and go there;
- the way there: when it is faster than walking, the arrow sends the player to a flight path
  (one they know, or one to learn on the way), a boat, a zeppelin, the tram, their hearthstone
  or a class teleport, around zones far above their level, and the window shows the itinerary
  with its time; flights are timed as they are taken; with the player's option "Take the
  flight automatically" (off by default), the planned flight is taken as the flight map opens;
  on a continent where no flight map was opened yet, a flight master nearby is pointed out. Keep
  `fly` and `hearth` steps
  for the trips your route plans on purpose (to set up the next zone); Ding finds the rest.

## 7. Translations

Write `title`, `text` and `note` in English: every player sees them, whatever their
language. To translate them, add one file per language to `Locales/` and list it in the
`.toc` after the sections:

```lua
-- Locales/frFR.lua
Ding.RegisterGuideTranslation("frFR", "mypack-01-shadowglen", {
    ["Shadowglen (1-6)"] = "Sombrevallée (1-6)",
    ["Nightsabers around the tree."] = "Des félins autour de l'arbre.",
})
```

- Arguments: the language, the section id, then `[English text] = translated text`.
- The key is the **exact** English text of the section. If you change the English text,
  change the key too, or the translation no longer applies.
- `title`, `text`, `note`, the place of a `sethearth` and the texts of `why` and `leftOut` are
  translated. A `sethearth` place keeps its English name in the section (Ding knows the inn by
  it); the translation is only what the window shows: `["Darkshire"] = "Sombre-Comté"`. `train`
  and `fly` texts are shown as written.
- A client in another language ignores the file. Languages: `frFR`, `deDE`, `esES` (also
  used by Latin American clients), `ptBR`, `koKR`, `zhCN`, `zhTW`.

## 8. Finding quest ids and places

**Quest ids** are the numbers QuestieDB and sites such as Wowhead Classic use
(`wowhead.com/classic/quest=456`). The quests new in WoW Forever are in QuestieDB too. With
the folders of section 10, Ding's `list_zone.lua` lists the quests of a zone a race can take,
sorted by level, with their prerequisites, who gives them and who takes them back (and where).
For Teldrassil (zone 141) and Night Elves:

```sh
lua5.1 Ding/tools/list_zone.lua QuestieDB/src/corrections/Forever/combined 141 NightElf
```

The zone number is the zone's AreaID, as QuestieDB uses it: Dun Morogh 1, Elwynn Forest 12,
Durotar 14, Tirisfal Glades 85, Teldrassil 141, Mulgore 215…

**Places.** Stand where the step should lead and type `/ding where`. Ding prints the line to
paste into your step, with the map of your zone:

```
go = { 1438, 54.6, 33.0 }, -- Teldrassil
```

Coordinates are those of the zone map (0 to 100). Inside a dungeon, the position is not
available.

## 9. Testing in the game

1. Copy your folder into `World of Warcraft/_forever_/Interface/AddOns/` (during the beta:
   `_classic_beta_`), next to `Ding`.
2. Start the game, or type `/reload` if it is running. Check that your pack is enabled in the
   addon list.
3. Open the settings (`/ding config`), **Guide** tab: pick your pack in the first list, then
   a section in the second one. `/ding guide mypack-01-shadowglen` starts a section directly.

If a file has a mistake, the game shows a Lua error when it loads (turn the errors on with
`/console scriptErrors 1`). Ding's own messages say what is wrong, for example
`Ding: guide mypack-01-shadowglen: unknown pack mypak (call Ding.RegisterGuidePack first)`.

Try the example pack first: copy `examples/DingExamplePack` the same way. It is two short
sections for the start of a Night Elf.

## 10. Checking a pack offline

Ding's validator replays your sections with the QuestieDB data, for every race and class
they are written for, and reports mistakes before anyone plays them: unknown quests,
quests of another race or class, a prerequisite not turned in earlier, a quest turned in
without being taken, a quest log above 20 quests, unknown items, coordinates outside 0-100,
the same trip twice in a row for a character, ids already used by Ding, untranslated texts;
a `go` without a `text` is a warning. It needs Lua 5.1 and Git.

```sh
git clone https://github.com/moust4ki/DingGuideWoWForever.git Ding
git clone --depth 1 https://github.com/Questie/QuestieDB.git QuestieDB
cd QuestieDB && lua5.1 tools/export-forever.lua --include-authored && cd ..
lua5.1 Ding/tools/check_guides.lua QuestieDB/src/corrections/Forever/combined --addon path/to/DingMyPack
```

The result ends with `Result: 0 error(s), 0 warning(s)` when everything is right. Errors
must be fixed; warnings are worth a look. A `next` into Ding's own guide is reported as
`info`.

On Windows without Lua, the QuestieDB repository has a Lua binary:
`QuestieDB/tools/lua-binary/lua.exe`.

## 11. Sharing your pack

- **Publish it** as an addon of its own, on CurseForge, Wago, GitHub or elsewhere: a zip
  with your folder at its root. On CurseForge, add Ding
  (`ding-xp-and-leveling-guide`) as a **required dependency** in the project's
  relations, so the CurseForge app installs it with your pack. Nothing else is needed.
- **Or share it as text**: `/ding export <section id>` (or `<pack id>`) gives your guide
  as text that anyone can paste with `/ding import`, no addon to install
  ([create-a-guide-with-ai.md](create-a-guide-with-ai.md)).
- **Get it listed**: open an issue on
  [Ding's GitHub](https://github.com/moust4ki/DingGuideWoWForever/issues) titled
  `Guide pack: <name>`, with a link to your pack, its races and its levels. Listed packs
  appear in Ding's README.
- **Improve Ding's own guide** instead: open an issue with what you found (quest id, step,
  what goes wrong). Ding's guide files are generated from the routes of `tools/routes/`:
  a pull request changes the route, not the files of `Ding/Guides/`.

## 12. Rules

- **License.** Ding is free software under the GNU GPL v3, and a guide pack built on it is
  released under the GPL v3 too: put the license text in a `LICENSE` file and
  `## X-License: GPL-3.0` in your `.toc`. Anyone may then use, change and share your pack
  under the same terms. Ding's own guides are GPL v3 as well: you may start from them.
- **Your own work.** Write your own route and your own notes. Do not copy the text or the
  routes of other guides (commercial guide addons, websites, books) unless their license
  allows it.
- **Ids only.** Quest, NPC and item names, levels and places come from Ding's game data when
  the game runs: a pack holds quest ids, item ids, coordinates and notes.
- **Stable ids.** Keep your pack id and your section ids from one version to the next.
