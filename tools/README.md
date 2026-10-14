# Offline tools

Lua 5.1 scripts that read QuestieDB's **Forever** export. They are used to write and check
the guides; nothing here is loaded by the game.

| Script | Purpose |
| --- | --- |
| `list_zone.lua` | Lists the quests of a zone available to a race, sorted by level |
| `check_guides.lua` | Replays the guides and checks quests, prerequisites, quest log |
| `smoke_test.lua` | Runs the addon with a simulated WoW API and plays the guides |
| `run_tests.lua` | Runs the unit tests in `tests/` |
| `panel_snapshot.lua` | Writes the guide window as plain text for a scenario, in a language (section 5) |
| `panel_scenarios.lua` | Shared module: the guide window's scenarios (Leveling guides, reports in game) |
| `wow_mock.lua` | Shared module: simulated WoW API, in-memory QuestieDB, loading of Ding |
| `testlib.lua` | Shared module: small unit test framework |
| `draft_guide.lua` | Writes the guides of a route (`routes/*.lua`) from the export |
| `build_data.lua` | Writes Ding's game database (`Ding/DB`) from a QuestieDB release (section 1) |
| `check_data.lua` | Checks DingDB's corrections (`data/corrections/*.lua`, docs/dingdb.md) |
| `audit_data.lua` | What the guides need that DingDB lacks (places of givers, NPCs, objectives) |
| `write_leveling.lua` | Writes Ding! - Leveling from the Leveling routes (`routes/leveling/*.lua`) (section 7) |
| `audit_free_quests.lua` | Free quests the Leveling routes leave out (almost no time on their way for their XP), and the steps that add them to a route (section 8) |
| `fit_windows.lua` | Re-cuts the level windows of a route from the simulation: each guide starts where the previous one ends |
| `route_model.lua` | Shared module: the optimizer's time and XP model (parameters to recalibrate) |
| `route_data.lua` | Shared module: map geometry, spawn groups, target counts, drop rates |
| `route_solver.lua` | Shared module: simulation of a tour, greedy tour, local search |
| `route_travel.lua` | Shared module: travel network (flight masters of the faction, boats, zeppelins, tram), inn names |
| `route_work.lua` | Shared module: spawn groups of an objective, ways to do a quest's objectives |
| `route_free.lua` | Shared module: free quests of a simulated Leveling route (section 8) |
| `questiedb_export.lua` | Shared module: reading the export, field indexes, masks |
| `media/textures.py` | Python 3, no dependencies: draws the kit texture missing from the handoff and puts the origin of the TGAs at the bottom (`python3 tools/media/textures.py Ding/Media/Textures`) |
| `translate_guides.lua` | Writes the translations of each guide in the TOC, one per language (`Ding/Locales/Guides/<locale>/`), from the `routes/locales/<locale>.lua` dictionaries, and their lines in `Ding.toc` (`lua5.1 tools/translate_guides.lua [locale...]`); exit code 1 if a translation is missing |
| `guide_texts.lua` | Shared module: language dictionaries, translation of a note sentence by sentence, writing of the translation files |
| `check_package.py` | Python 3, no dependencies: checks the zip built by the BigWigs packager before publishing (`python3 tools/check_package.py .release/Ding-*.zip`, from the repository root) |
| `docs/icon/*.svg` | The icon's vector sources (logo, minimap button, gold arrow, CurseForge avatar): `logo64` / `logo32`, `minimap_icon64` / `minimap_icon32` and `arrow_gold` in `Ding/Media/Textures` are exports of them, in their own colors |

## 1. Getting the QuestieDB export

You need a **Lua 5.1** interpreter (`lua5.1` on Debian/Ubuntu, package `lua5.1`).
QuestieDB also ships binaries in `tools/lua-binary/` of its repository (`lua.exe` on
Windows, which `run_tests.lua` also works with).

Clone QuestieDB **outside the Ding repository**, at the release `Ding/DB` was built from (its
tag is in `Ding/DB/DB.lua`, `source`), then run the export from its root:

```sh
git clone --depth 1 --branch v1.0.6 https://github.com/Questie/QuestieDB.git ../QuestieDB
cd ../QuestieDB
lua5.1 tools/export-forever.lua --include-authored
```

The export writes `src/corrections/Forever/combined/forever{Quest,Npc,Item,Object}DB.lua`.
Each file returns a table `{ [id] = { positional fields } }`; the field indexes are in
`src/meta/*Meta.lua` (quest: 1 name, 2 giver, 3 turn-in, 4 required level, 5 quest level,
6 races, 10 objectives, 12-13 prerequisites, 17 zone…).
Run the export again after each `git pull` of QuestieDB.

**Ding's game database.** Ding does not need the QuestieDB addon in game: it carries
`Ding/DB`, written from that export by `build_data.lua` (Questie's data is GPL v3; the credits
are in `Ding/DB/CREDITS.md`). On each new QuestieDB release:

```sh
git -C ../QuestieDB fetch --tags && git -C ../QuestieDB checkout vX.Y.Z
(cd ../QuestieDB && lua5.1 tools/export-forever.lua --include-authored)
lua5.1 tools/build_data.lua ../QuestieDB/src/corrections/Forever/combined --source "QuestieDB vX.Y.Z"
```

then run the whole suite with that export: `db_parity_test` checks that Ding gets the same
answers from `Ding/DB` and from QuestieDB, and CI clones the release named in `Ding/DB/DB.lua`.
`build_data.lua` keeps only the fields `Core/Data.lua` reads, converts the spawns from AreaIDs
to UiMapIDs, and writes the names of each language in `Ding/DB/Locales/<locale>.lua`.

Below, `$QDB` stands for this folder:

```sh
QDB=../QuestieDB/src/corrections/Forever/combined
```

## 2. Listing the quests of a zone

```sh
lua5.1 tools/list_zone.lua $QDB <areaId> <race bit | race name>
lua5.1 tools/list_zone.lua $QDB 141 8          # Teldrassil, Night Elf
lua5.1 tools/list_zone.lua $QDB 141 NightElf   # same
```

- `areaId`: zone id (AreaTable), for example 141 Teldrassil, 148 Darkshore,
  12 Elwynn Forest, 1 Dun Morogh, 14 Durotar, 215 Mulgore, 85 Tirisfal Glades.
- Race bits: Human 1, Orc 2, Dwarf 4, Night Elf 8, Undead 16,
  Tauren 32, Gnome 64, Troll 128.

A quest is listed if its zone is `areaId`, or if its giver (NPC, object, or monster that
drops the starting item) spawns in that zone: the quests of a subzone such as
Shadowglen (188) therefore show up with Teldrassil (141).

Columns: id, quest level, required level, name, prerequisites
(`a|b`: either one; `a+b`: all of them; `active:n`: quest n in the quest log),
giver => turn-in with coordinates (`+n`: other spawns), then the special cases
(classes, `repeatable`, zone or category when it is not `areaId`). Output in English:
the tool is also offered to guide pack authors (`docs/guide-packs.md`).

## 3. Checking the guides

```sh
lua5.1 tools/check_guides.lua $QDB                 # guides listed in Ding/Ding.toc
lua5.1 tools/check_guides.lua $QDB my_guide.lua    # specific files
lua5.1 tools/check_guides.lua $QDB --addon examples/DingExamplePack   # a guide pack
```

The messages are in English: this is also the validator for pack authors
(`docs/guide-packs.md`, section 10). With `--addon`, the script loads the files of the pack's
`.toc`, checks its `Ding.RegisterGuidePack` and the `pack` of each section (missing, unknown,
id `ding`), rejects a section id already used by one of Ding's guides (those are read for
their ids only) and accepts a `next` pointing to one of Ding's guides (`info`). The required
translations are those of the languages the pack translates.

The script loads the guides with a fake `Ding.RegisterGuide`, chains them through `next`
and replays them in order, once per race (and per class if some steps depend on it).
It reports:

- **errors**: unknown quest, quest reserved for another race or class, prerequisites not
  turned in earlier in the chain, exclusive quest already taken, quest completed or turned in
  without having been accepted, quest accepted twice, quest log above 20 quests, malformed
  step, `next` loop;
- **warnings**: unknown key (typo), next guide not found, quest turned in without a
  `complete` step although it has objectives, required level above the guide;
- **translations** (warnings): guide with no translation in a shipped language, English text
  (`title`, `text`, `note`) not translated, translation whose English text no longer exists;
  a translation of an unknown guide is an error;
- **info**: maximum size of the quest log and quests still in progress at the end of the
  chain.

Exit code: 0 with no errors, 1 if there are errors, 2 if the command line is incorrect.

`optional` steps count as done: the quest log is therefore evaluated in the worst case.

Goals and conditions (`kill`, `collect`, `buy`, `talk`, `gossip`, `spots`, `patrol`,
`revive`, `xp`, `when`...) are checked for their shape (errors) and their NPC, item and
object ids against QuestieDB (warnings). A step under `when` is a branch: it is replayed when
its conditions hold, or cannot be known offline (items in the bags, the player's level), and
all its quest actions can be played; it is passed otherwise. `abandon` takes quests out of
the log. `when.item` is read as the engine reads it: an id, a pair `{ itemId, count }` (the
count below 1000), a list of ids (all held) or a list of pairs; any other shape is an error.

A turn-in that needs an item the player brings from elsewhere (one vendors sell, or one
nothing drops), for a quest no `complete` step works on, is an error unless the item was
bought earlier in the chain (`buy`), given by a quest turned in before, or the turn-in step
applies only while the item is held (`when = { item = id }`): without it, the player would
be stuck on the step. A turn-in that applies only once the quest is ready (`when.ready`), or
only with one of its items held, needs no `complete` step (no warning).

## 4. Offline test bench

```sh
lua5.1 tools/smoke_test.lua $QDB                  # prints the panel after each step
lua5.1 tools/smoke_test.lua $QDB --quiet          # problems only
lua5.1 tools/smoke_test.lua $QDB --skip-optional  # optional quests never start
lua5.1 tools/smoke_test.lua $QDB --locale enUS    # English client (frFR by default)
lua5.1 tools/smoke_test.lua $QDB --tomtom         # with a simulated TomTom (its arrow replaces Ding's)
lua5.1 tools/smoke_test.lua $QDB --only class-    # only the chains whose id starts so (here: the class guides)
```

Loads the files of `Ding/Ding.toc` with a simulated WoW API (frames, quest log, maps) and a
QuestieDB built from the export, then plays each guide chain like a player: accept, complete,
turn in, level up, walk to the `go` points.
It then drives the settings window **with simulated gamepad presses only** (first launch,
assigning a button with a conflict, every element of the five tabs, confirmations, move mode
with key repeat, combat, dungeon, collapsed version).

It reports Lua errors (including inside events), unknown frame methods (typos),
contradictory anchors, steps that do not complete on their own, temporary bindings left
behind and panel anomalies. Non-zero exit code if there is a problem.

Each guide starts at no less than its minimum level (the player kills monsters on the way).

It does not replace a test in game: the API is simulated (the arrow is not checked,
objectives are filled in one go, XP is approximate).

## 5. Unit tests

```sh
lua5.1 tools/run_tests.lua $QDB           # every tools/tests/*_test.lua file
lua5.1 tools/run_tests.lua $QDB engine    # only those whose name contains "engine"
```

Each file runs in its own process: it loads Ding once with the simulated API
(`wow_mock.lua`), then each test starts over from a fresh character (`T.reset`). `T.quests`
puts quests in the quest log without side effects; `T.eq`, `T.ok` and `T.fails` check. A
Lua error in an event fails the current test.

The unit tests only load the shipped guides they name (Shadowglen by default,
`testlib(arg[1], { guides = { ... } })`): adding guides to Ding does not change their results.
The test bench scenarios play Shadowglen by its id, not "the first guide".

The unit tests check the fine-grained logic (when a step is done, choice of the guide,
validation of the guides); the test bench checks the whole run with the gamepad.

**The guide window as text.** `panel_snapshot.lua` puts the game and the guide in the state of a
scenario of `panel_scenarios.lua` (a section and its step, the character, where they stand, the
quests turned in or in the log with their counts, the window's width, focus mode...) and writes
what the window shows: the title, the step bar, every row with its look in words ("red
background, red diamond icon, counter 0/13 red"), its sub-lines, its card (hover, or X in
focus mode) and the step menu. The looks are those of a theme (`--theme`, Ding dark by
default: the colors the rows were first described with); `a12-fragments` and `a11-minimized`
are kept in the other themes too (`<scenario>@<theme>.txt`).

```sh
lua5.1 tools/panel_snapshot.lua $QDB --list                    # the scenarios
lua5.1 tools/panel_snapshot.lua $QDB a12-cursed-crew-ahead     # one, in French
lua5.1 tools/panel_snapshot.lua $QDB --locale enUS             # all of them, in English
lua5.1 tools/panel_snapshot.lua $QDB --write tools/tests/snapshots   # the French snapshots again
lua5.1 tools/panel_snapshot.lua $QDB a12-fragments a11-minimized --theme halo --write tools/tests/snapshots
```

`tests/panel_snapshot_test.lua` compares the French text with `tests/snapshots/<scenario>.txt`:
any change of the window shows in a review; after an intended change, write the snapshots again
(last command) and read their diff. `tests/panel_rules_test.lua` (French) and
`panel_rules_enus_test.lua` (English) check the rules of the window (SPEC, "Guide window:
rules"), one test per rule, on the same scenarios (`tests/panel_rules.lua`).

## 6. Generating the guides of a route

```sh
lua5.1 tools/draft_guide.lua $QDB tools/routes/human.lua              # writes Ding/Guides/Human/*.lua
lua5.1 tools/draft_guide.lua $QDB tools/routes/alliance.lua --report  # before/after table per guide
lua5.1 tools/draft_guide.lua $QDB tools/routes/nightelf.lua --out /tmp/draft --trace
```

| Option | Purpose |
| --- | --- |
| `--out <dir>` | writes somewhere other than `Ding/Guides` (translations in `<dir>/Locales`) |
| `--report` | per guide: distance, estimated time, XP, XP/h, quests removed by the optimizer and why |
| `--trace` | every action of the chosen tour, then the quests left out during selection |
| `--iterations <n>` | number of local search moves per guide (20,000 by default) |
| `--greedy` | no optimization: the "nearest first" tour of earlier versions |
| `--quest-above <n>` | quests at most `n` levels above the simulated player (2 by default) |
| `--mob-above <n>` | objective monsters at most `n` levels above the simulated player (1 by default) |
| `--grind-stop <s>` | grinding stops of a guide, in seconds, at most for a quest a later guide needs (3,600 by default) |
| `--fit` | each guide starts at the level the previous one reached, not at its `minLevel`; prints the windows that chain without grinding |
| `--dry-run` | writes no file (simulation and reports only) |

A **route** (`tools/routes/*.lua`) is our own work: the sequence of guides of a track
(races, zones, level range, quests to add or leave out, travel notes). For each guide, the
script picks the zone's quests, builds a first tour the way a player would, then improves it
for **XP per hour**.

- **Quest selection**: giver in the zone (`areas`, and inside `box` for a starting valley),
  open to every race of the track, no profession, reputation or event, open to every class
  (or to all but one, which gets its own variant: its steps, and those of any follow-up that
  depends on it only through that variant, carry `classes = { … }`), not repeatable, level
  within the range (`minQuestLevel`, `maxQuestLevel`), objectives found in the zone and not
  elite, turned in within the zone, in a city of `extraAreas` or in one of the next two guides
  (`carry`). A quest that is too low comes back if it opens a chain that was kept. A quest
  started by an item becomes optional, unless it opens a chain; it is left out if QuestieDB
  gives the starting item a drop chance below 10 %.
- **Travel** (`route_travel.lua`): world distance (yards, Forever map geometry read from
  QuestieDB's `data/Forever/conversion.json`) at 7 yards/s, × 1.25 for detours, mount at
  level 40; flight paths from level 14 between the flight masters of the faction (QuestieDB's
  NPC flags) in the zones known so far (capitals, the route's zones up to this guide,
  `knownAreas`); boats, zeppelins and the Deeprun Tram between land masses and continents
  (docks placed by us, 5 1/2 minutes with the wait). A trip is the best of the straight walk
  and walk, network, walk; shortest paths are computed once per speed class and trips are
  cached. **Hearthstone** (`route_solver.lua`): to the bound inn when it is ready and saves
  a minute (30 s, once an hour); binding at each inn of the guide's zones is an action the
  search adds where it saves time (`sethearth` step), each use a `hearth` step.
- **Model** (`route_model.lua`, `PARAMS` table). Objectives: number of targets read from
  the quest text ("Kill 10 Kobold Vermin"; "a/an/the <name>", or a name mentioned in a text without a
  number, counts as one), 8 otherwise; at most 60 monsters per item to loot; drop rates from
  QuestieDB (60 % otherwise); time per target (combat, rest, walking to the next one
  depending on the density of the spawn group) and waiting for respawns when the group is too
  small. Each spawn group has the level of the monsters found there (an item may drop from
  monsters of several levels: the weakest ones get their own groups too). Quest XP from the
  `QuestXP` table (reduced beyond 5 levels), monster XP from the Classic formula. All these
  figures are estimates, to be recalibrated with `DingDB.timings`.
- **First tour** (`route_solver.lua`): the player always goes to the nearest action (accept,
  complete, turn in), keeps the quest log under 18 quests, takes a quest only when its
  monsters will be within reach a level later at most (a log full of quests whose monsters are
  still too strong blocks the tour), waits at most one level, and never beyond the guide's
  maximum level, when a quest or its monsters require it. This is the "before" column of the
  report.
- **Optimization**: simulated annealing on the sequence of actions (move an action or a
  block, swap, reverse a segment, remove or add a quest with its chain, remove then reinsert a
  few neighboring quests), then reinsertion of the left-out quests that pay off and a final
  polish. Every rule is checked by simulation: prerequisites, exclusive quests, required level
  (simulated XP), gray quests (which the engine would skip), quest log, quests started by an
  item (picked up while killing the monsters of another quest), quests carried from one guide
  to the next. Fixed seed derived from the guide's id: two runs write the same files.
- **Criterion**: the time to reach the guide's maximum level, making up the missing XP by
  grinding (from 50 s per monster at level 5 to 70 s at level 60, searching included). A
  quest is therefore kept if it pays off faster than grinding, detour included: too far away
  or too long, it is removed. Monsters killed for a quest never count for more than grinding
  (nothing to gain by killing them twice instead of grouping two quests), a grinding stop in
  the middle of a guide (`level` step) counts as lost time plus 15 minutes (a wall, Yendi's
  feedback: fewer, longer stops rather than one per level), and the tour must end near the
  start of the next guide (its hub: where most of its quests start, or `start`).
- **Levels** (Yendi's rule, 12/10/2026): a quest is taken at most **2 levels above the
  player** (`PARAMS.questAbove`; its required level, a limit of the game, never above), its
  monsters fought at most **1 level above** (`PARAMS.mobAbove`, average of their range,
  rounded down, in the spawn group chosen). The level is simulated with the quests' XP in
  full (the game's own figures) and 90 % of the monsters' XP (`PARAMS.killXPMargin`: counts,
  drop rates and levels are estimates; so is the XP of a quest missing from the `QuestXP`
  table). A quest that is too high is done later in the guide, once the level is reached;
  otherwise it is offered to the next guide ("deferred", then "deferred from <guide>" in the
  next guide's report), and removed if it still does not pay off there. A `level` step
  ("Finish the level on nearby monsters before moving on.") comes before the quests it
  unlocks when no other quest gets the player there and the stop pays off; for a quest that a
  later guide needs (never dropped by the search), the stops of a guide add up to an hour at
  most (`PARAMS.maxGrindStop`): further, it waits for a later guide. A guide ends with a
  `level` step when the simulated level does not reach the next guide's minimum: in game, it
  completes on its own if the player is already at that level. The route's last guide
  reports the grinding left up to its maximum level, without a step. Each step carries the
  simulated level as a comment (`-- level N`); `tests/guide_levels_test.lua` checks that no
  quest is accepted above `N + 2` nor below its required level, and that the monsters of
  each quest worked on are within `N + 1` somewhere in the guide's zones.
- **Steps**: neighboring actions (100 yards, 250 for objectives) form a step, in the order
  turn in, accept, complete; objectives join a step only while their monsters stay within
  reach of its level. `intro` and `notes` add our advice; in a guide over several zones, the
  first step in each zone gets that zone's intro (`zoneIntrosFrom`: the zone routes it comes
  from; a starting valley's intro, a guide with a `box`, only inside its box), unless the
  previous guide left the player there. Route texts never go on a step behind an option.
- **Extras** (`extras = true` in the route): dungeon quests (`route_data.lua` questDungeon:
  an objective found only inside one of the dungeons of DUNGEONS, or a quest of a dungeon's
  zone that fights monsters or triggers an event, which QuestieDB sometimes places at the
  entrance) and elite quests, tagged `dungeon = "<name>"` or `elite = true` for Ding's
  options (off by default). A dungeon quest is never part of the tour, which never counts on
  an extra either: one is
  offered after the first step that passes by its giver at its level, once the guide has
  turned in its prerequisites, when its ender is in the same town (accept, objectives and
  turn-in in a row) and no quest of the route needs it.
- **Class quests** (`classQuests = true`, with `extras`): a quest for one class (its
  `requiredClasses`, its class category in QuestieDB's sorts, `questiedb_export.lua`
  CLASS_SORTS, or its class trainer) is offered like an extra, on steps
  `classes = { "<CLASS>" }`, its ender anywhere in the guide's zones; the next quest of a
  class chain may follow right after.
- **The way out** (`finish` of a guide): steps written as they are after the tour (and its
  level step), e.g. the Skyborne exit quest turned in at Dalaran, then the portal there; their
  quests stay out of the tour.
- **Death skips** (`deathSkips = true`): before a long trip (3 minutes saved at least) whose
  end is close to the graveyard nearest to the place left (QuestieDB's spirit healers), a
  step `deathskip = true` with its text; not above level 10 when objectives come during the
  resurrection sickness. Ding's option, off by default.

**Level windows** (`minLevel`, `maxLevel` of each guide): a guide whose minimum level is
above what the previous one reaches ends that one with a `level` step. `fit_windows.lua`
cuts the windows from the simulation instead:

```sh
lua5.1 tools/fit_windows.lua $QDB tools/routes/human.lua   # rewrites the windows of the route
```

It runs `draft_guide.lua --fit --dry-run` (each guide starts where the previous one ended),
then writes `minLevel` = the level reached when the guide starts, `maxLevel` = the next
guide's `minLevel`, again until nothing moves (the window is also the optimizer's target).
The route's first `minLevel` stays, and so does the last `maxLevel` of a route that leads
nowhere. Run it again after a change of the model or of a route, tracks first: the first
`minLevel` of a trunk is the lowest level its tracks reach. With `--fit`, the selection no
longer depends on the window (quests up to level 60, any required level). The title of a
guide is the zone named by the route plus its window: "Westfall (11-16)".

In the route, `include` forces a quest (even outside the filters, even gray, even reserved
for certain classes): the optimizer
never removes it, nor what it depends on, even if that means grinding to reach it; `exclude`
leaves it out. The quests that a later guide of the route needs (prerequisites) are not
removed either, unless their level is out of reach: they then wait for the next guide. `seed`
changes the seed of the search, `start = { areaId, x, y }` the starting point of a guide.
`faction` gives the faction of the written guides ("Alliance" by default, "Horde" for Horde
routes), `pack` their guide pack (`ding-zones` for the zone guides; none: Ding's default
pack, Leveling). `areaMinQuestLevel = { [areaId] = level }` keeps only the quests of a zone
from that level on. `multiZone = true` (a guide over many zones): the first tour waits for a
level only when it opens three quests at least (or for a short stop), there is always
another zone to go to.

A zone shared between the race tracks and the common trunk (The Barrens, Stonetalon
Mountains, Silverpine Forest on the Horde side) is split by quest level: the tracks stop at
level 19 quests (`maxQuestLevel`), the trunk starts at 20 (`minQuestLevel`) and leaves out
(`exclude`) the quests whose chain starts below 20, whether or not a track may have done them
(`lowChains` in `routes/horde.lua`). This way no quest is taken twice, whatever the race.

Titles and notes are in English in the guide; the script also writes their translations
(dictionaries of `routes/locales/`, which name each zone once: the level range of a title is
kept as it is) into `Ding/Locales/Guides/<locale>/`.

The script only writes quest ids and our notes. Running the script again rewrites the
files: a lasting change is made in the route (`include`, `exclude`, `notes`), then
everything is checked again with `check_guides.lua` and `smoke_test.lua`.

**Two packs.** Ding's default pack, **Ding! - Leveling**, comes from the Leveling routes
(`tools/routes/leveling/<faction>.lua`, written by `write_leveling.lua`, see 7). The zone routes
below write the **Ding! - Zones** pack, one guide per zone (`pack = "ding-zones"`), which keeps
the ids of the first versions (characters keep their progress).

The zone tracks:

| Route | Races | Guides |
| --- | --- | --- |
| `human.lua` | Human | Northshire, Elwynn, Westfall, Loch Modan (1-18) |
| `dwarf_gnome.lua` | Dwarf, Gnome | Coldridge Valley, Dun Morogh, Loch Modan, Westfall (1-18) |
| `nightelf.lua` | Night Elf | Teldrassil, Darkshore, Loch Modan (6-21), after the hand-written Shadowglen |
| `alliance.lua` | all | common trunk 18-60, from Redridge to Silithus (Blasted Lands at 48) |
| `orc_troll.lua` | Orc, Troll | Valley of Trials, Durotar, The Barrens (1-19) |
| `tauren.lua` | Tauren | Camp Narache, Mulgore, The Barrens (1-19) |
| `undead.lua` | Undead | Deathknell, Tirisfal Glades, Silverpine Forest, The Barrens (1-20) |
| `horde.lua` | all (Horde) | common trunk 19-60, from The Barrens to Silithus |

## 7. Ding! - Leveling from the Leveling routes

```sh
lua5.1 tools/write_leveling.lua $QDB tools/routes/leveling/alliance.lua [--report] [--dry-run] [--no-additions]
                                  [--deviation] [--free-quests <file>] [--why]
lua5.1 tools/write_leveling.lua $QDB tools/routes/leveling/horde.lua
lua5.1 tools/translate_guides.lua
```

`tools/routes/leveling/<faction>.lua` holds the Leveling route of a faction: its sections (race
starts, then the shared sections up to 60), each with its zones, level range and steps in
Ding's keys: quests, travel, and the goals and conditions of `docs/guide-packs.md` (`talk`,
`kill`, `collect`, `spots`, `patrol`, `useitem`, `buy`, `vendor`, `sticky`, `when`, `revive`,
`level` + `xp`...), plus `gossipOption` / `gossipText` (a dialogue option's id and English
text, kept as data until `gossip` takes them). That order is kept, and `write_leveling.lua` changes it as little as possible for
Forever:

- **Tags**: a quest done in a dungeon or against elites carries `dungeon` / `elite` on every
  one of its steps (split from the untagged quests of a step), and so do its follow-ups; the
  `go` to a death skip's place joins the shortcut (`deathskip = true`).
- **Repairs**, replayed for every race and class of the faction with the rules of
  `check_guides.lua`: a quest missing from Forever, closed to the race or class, already
  done, never turned in later by the route, or exclusive with one done is left out for them;
  a missing prerequisite whose giver stands on the same map is done right before; one still
  in the log makes the quest wait for its turn-in. A step whose quest only some races or
  classes keep is restricted to them (`races`, `classes`); repairs, then removals, are
  replayed until nothing changes.
- **Goals and conditions** are written as they are. A step under `when` is a branch: the
  replay plays it only when its conditions hold and all its actions can be played (as
  `check_guides.lua` does), and keeps it as written otherwise, without repairs. `abandon`
  frees room in the log; `sticky` keeps only the quests each race and class has taken by
  then. A route's `when.item` list of one pair is written as that pair, or its id.
- **Carried items**: a quest whose turn-in needs an item brought from elsewhere (one the route
  buys, one vendors sell, or one nothing drops) is turned in under `when = { item = id }`, and
  accepted under it too when the route buys the item and no step works on the quest; its
  follow-ups, through the chain, are accepted once it is turned in (`when = { done = q }`)
  and turned in or worked while in the log (`when = { log = q }`). A player without the item
  (a section started midway, a purchase skipped) passes the chain instead of being stuck.
- **Done along the way**: a quest that no step works on for every race and class is turned
  in once ready (`when = { ready = q }`), passed otherwise, and so are its follow-ups. The
  simulation turns these in without working them, and does not count on an item found
  elsewhere (pages, crafts) unless the route buys it.
- **How a section begins** (`tools/routes/leveling/travel.lua`, our texts): its `intro` (the zone
  and its hub) on the first step and, when the section before ends elsewhere, a go step to
  the first quest giver that applies to every race (`travel`, the step's text). A section
  that opens with the route's own go keeps it, with the intro.
- **Forever's own quests** (absent from QuestieDB's Classic data and from the route) are
  inserted where the detour is smallest, in route order, after their prerequisites, with
  room in the quest log, at a level that fits: required level reached, quest at most +2,
  monsters at most +1, not grey. Only they follow the caps (`guide_levels_test`).
- **Simulation** of each race as a warrior (travel of `route_travel.lua`, the inns of the
  route, `level` + `xp` or a fractional level, conditions, time spent with NPCs): the
  `-- level N` of a step is the lowest level a race reaches there.
- **A trip right after the same trip**: a `go` that only travels, to the place where the
  character's previous step (no `when` on it) already took it, is left out for that character:
  the steps in between are for other races or classes. Left out for everyone it applies to, it
  goes (unless it has a note); else it is restricted (`races`, `classes`) when they can name
  the others. Every `go` of a route says where or why in its `text`: `check_guides.lua` warns
  about a `go` without one and fails on the same trip twice in a row.

A route note says "the NPC" only on a step with someone to see there (a quest giver or ender,
an NPC to talk to, a service); for objects it says "the object", for monsters "the target".
"This one roams" stays for targets that move: a quest giver with a path in QuestieDB, a
`patrol`, monsters. A `bank` or `unbank` step is the banker's own step or comes right after
it (a bank goal has no place of its own), and a `bank` note names the later quests that need
the items. An item gathered for a later quest is a `collect` (with `keep`), not an `unbank`.
`leveling_guides_test` checks all of this on the guides.

A `fly` or `train` label becomes the step's `text` (texts are translated). `--report` lists
the repairs, the quests left out with their reason, the Forever quests added and those that
found no place. The route stays the place to change anything: the guides are written again
on each run.

**Races that join on the way** (`entries = { Skyborne = { section = id, level = n } }` in a
Leveling route): the Skyborne have a side from creation (one race bit per side,
`questiedb_export.lua` RACE_FACTION_BITS, and Zephras Isle's quests for one side or both).
Each side has its Skyborne start on the isle (`routes/skyborne_alliance.lua`,
`routes/skyborne_horde.lua`, written by `draft_guide.lua` with the bit of that side), then
the Skyborne join their faction's route at that section. They are replayed from there like
the other races: the steps the other starts already did are kept for them (`races` includes
`Skyborne`). A route without a side (`neutral = true`) is still possible: it writes no
faction, keeps the quests open to both sides and takes `next = { Alliance = id, Horde = id }`;
`check_guides.lua` replays each branch of such a chain with the bit of its side.

`--deviation` measures the 10 % rule (Yendi, 12/10/2026: the optimizer may depart from the
route order only when it saves 10 % of a section's time): each section's quests, for the first
race that plays it, costed in route order and after `route_solver.lua`'s search from it. The
measure is indicative only (the optimizer does an objective in one visit where the base
route may split it, and leaves out the steps without quests), so nothing is reordered yet:
the route order stays everywhere.

Every run also looks for **free quests** the route leaves out (section 8): it prints
`Free quests left out: N, borderline: M` and a `warning:` line for each free one, with the route
step it would follow. `--free-quests <file>` writes them all, borderline ones included, as a Lua
table (what `audit_free_quests.lua` reads).

**Reasons** (`tools/route_why.lua`, the window's "why": docs/guide-packs.md, section 6): on the
final simulation, what a surprising step brings, measured and nothing else, written as the step's
`why`:

- **detour**: a run of at most 6 steps in another zone (back in the zone it left, or on to a
  third), or one step far off the way in its own zone (5 minutes or more). Its cost: the time on
  the way beyond the direct trip from the step before to the step after. What it brings: its
  turn-ins, the quests taken there (turned in later) and the chains they open (follow-ups through
  QuestieDB's prerequisites that the route turns in later), the monsters killed there for them;
  the window names the quest whose chain brings the most. Said under the step from 4 minutes
  (`short = true`), on demand below. A detour with a step for a trainer, a vendor, a bank, a
  flight master, the inn or an NPC to talk to (for any class) gets no reason: the simulation
  does not value those, so its quests would not be the whole reason.
- **carry**: a quest taken here and turned in an hour of route or more later, in another zone;
  said under the step when it is turned in on another continent and the route never comes back
  to this zone first (taken now or never).
- **level**: a level step, when the next quests taken after it are above its level (their
  levels; no time: the window counts the kills left).

A reason is kept when every race that plays the step finds the same (kind and quest); its figures
are their average, rounded (XP to the hundred, to the thousand from 10,000; time to the minute).
Each run prints `Reasons (tools/route_why.lua): N steps, M said under their step (...)`; `--why`
lists them (stderr). The free-quests audit's verdicts on the quests the route leaves out
become each section's `leftOut` (in the section where the audit measured the quest, else the
first one on its giver's map): too little XP for the detour (`detour`, with the XP and the
added time), too long a detour (`long`), giver, objectives or turn-in off the route (`away`,
`far`), log full (`log`), a prerequisite not on the route (`prereq`), another version on the
route (`version`), exclusive with a route quest (`exclusive`), its follow-up taken first
(`followup`), objectives the data does not know (`unsure`). Reasons that are not the route's
(class, profession, event, elite, dungeon...) stay out: the game or Ding tells those.

## 8. Free quests

```sh
lua5.1 tools/audit_free_quests.lua $QDB                       # both Leveling routes
lua5.1 tools/audit_free_quests.lua $QDB tools/routes/leveling/horde.lua
lua5.1 tools/audit_free_quests.lua $QDB --apply [--also 1271,97222] [--passes 5]
```

A quest a Leveling route leaves out is **free** when it costs almost nothing on the route's way
(`route_free.lua`, run by `write_leveling.lua` on its own simulation of each race):

- **Where the game offers it**: open to the race, its prerequisites turned in by the route by
  then (a breadcrumb only before the route takes the quest it leads to), required level reached,
  at most 2 levels above the player, not grey; never a class, dungeon, elite, escort or event,
  repeatable, profession, reputation or event-category quest, nor another version of a route
  quest (same name, givers and enders), nor one in the route's `exclude` list.
- **On the way**: its giver and its ender stand at a step's place, next to it, or between two
  steps that follow each other, away from hostile elite monsters (40 yards); objectives by the
  way too (objects, places, a purchase), or monsters the route already kills for its own quests
  while this one is in the log (each kind of a job's monsters gets its share of its kills). A
  new step goes after every step at its place (the Forever additions and repairs anchored
  there included); the quest stays in the log 3 hours of the route at most, with room in it.
- **Measured** with the simulation's own travel network (`route_travel.lua`), work
  (`route_work.lua`, `route_model.lua`) and 3 seconds per extra accept or turn-in (Ding accepts
  and turns in by itself); XP from QuestieDB's QuestXP table at the player's level (an estimate
  when the table lacks the quest). Races placed at the same steps share one verdict, the average
  of their measures.
- **Free** when its XP per added second is at least 10 times the section's own pace (the
  simulated section's XP per second, grinding included) and it adds 2 minutes at most;
  **borderline** from 4 times (up to 4 minutes), after a borderline quest of its chain, or when
  the data cannot tell what it asks (taken and handed in to the same one with no objective,
  scripted objectives). The figures are `route_free.lua`'s `PARAMS`.

The audit prints, per route, each free quest (section, XP, seconds added, times the section's
pace, objectives, the route steps its accept, objectives and turn-in follow), the totals per
section, the borderline ones with the reason, and why the side's other quests are not free.
`--apply` writes a step per action into the route file (`{ accept = q }`, `{ complete = q }`
when it has objectives, `{ turnin = q }`, with `races` when only some races get it), right after
the route step named, then audits the route again: a quest added puts the route in new places,
where more may be free (`--passes` runs at most, 5 by default). `--also` adds borderline quests a
person chose. Then write the guides again (section 7, then `translate_guides.lua`) and check
them. A free quest the route must keep out goes in its `exclude` list, with the reason:
`write_leveling.lua` warns about every other one.
