# CLAUDE.md — notes for working sessions on Ding

Ding is a free leveling guide addon for **WoW Forever** (client 1.60.x, interface `16001`,
Lua 5.1), optimized for XP per hour and playable with a gamepad. The full specification is in
[`docs/SPEC.md`](docs/SPEC.md): read it before any change to the engine or to the guide
format.

The user (Yendi) plays **with a gamepad only**: every feature must be reachable through a
key binding (`Bindings.xml`) or happen by itself.

## Architecture

```
Ding/
  Ding.toc          load order; no hard dependency; optional: TomTom
  Bindings.xml      bindings DING_NEXT / DING_PREV / DING_TOGGLE / DING_CONFIG / DING_COMPACT,
                    DING_FOCUS (focus mode), DING_SKIP / DING_UNSKIP, DING_FINDER (NPC directory),
                    DING_CYCLE (the arrow on the step's next target),
                    CLICK DingItemButton:LeftButton (quest item), CLICK DingItemButton:Target
                    (target the arrow's NPC or monster: the same secure button, virtual button)
  Core/
    Ding.lua        namespace (global Ding), event bus Ding:On, SavedVariables
    Locales.lua     Ding.L: texts in the client's language (English fallback), binding labels
    Compat.lua      Ding.Compat: protected API calls (C_QuestLog, C_Map first, pcall)
    Data.lua        Ding.Data: game data (names, quests, NPCs, spawns as UiMap points) from
                    Ding/DB, or from the QuestieDB addon when Ding/DB is missing
    DingDB.lua      LibDingDB: DingDB for other addons (read-only copies, docs/dingdb.md)
    Registry.lua    Ding.RegisterGuidePack, Ding.RegisterGuide (sections of a pack; without
                    `pack`: Ding's), choice of the section by race/class/level
    Timing.lua      Ding.Timing: real duration of each step -> DingDB.timings (zone, deaths,
                    kills, level step, step signature)
    Engine.lua      Ding.Engine: step machine, candidate points, Describe/Summary
    Grind.lua       Ding.Grind: level steps (experience and kills left from the player's own
                    kills, rested included; the monster to farm and its spawns)
    Along.lua       Ding.Along: objectives of other log quests right around the player
                    ("along the way", sticky)
    Passages.lua    Ding.Passages: walking passages (lifts, tunnels, bridges, city gates,
                    portals) and the two sides each joins; a walk across never goes straight;
                    islands (sides without a passage); `verified` per passage, /ding passages
    Travel.lua      Ding.Travel: fastest way to the arrow's target (walk, flight paths known or
                    to learn, boats, zeppelins, tram, hearthstone, teleports, walking passages;
                    slower through zones above the player), flight times measured, itinerary
    Services.lua    Ding.Services: vendors, repairers, innkeepers, flight masters, class
                    trainers of the player's side (npcFlags), nearest first
    Merchant.lua    Ding.Merchant: grey items sold and repairs at merchants, bags almost full
    Training.lua    Ding.Training: what the class trainer offers and at which level
    Directory.lua   Ding.Directory: the NPC directory's data: every NPC of DingDB by kind
                    (services, class / weapon / profession trainers, what vendors sell),
                    fastest first (Travel:Reach), cities, search, the weapon to learn
    Gear.lua        Ding.Gear: gear upgrades of the bags (scored like rewards), declined items
    Talents.lua     Ding.Talents: talent builds (Ding.RegisterTalentBuild), the next talent
                    when a point is free, learned on a confirmed press
    Goals.lua       Ding.Goals: goals without a quest (kill, collect, buy, talk, gossip,
                    useitem, object, equip, destroy, bank, unbank, keep, abandon, spots)
    AutoQuest.lua   Ding.AutoQuest: accepts and turns in the guide's quests automatically
    Rewards.lua     Ding.Rewards: best reward (upgrade for the class, else sell price)
    GuideText.lua   Ding.GuideText: reader of a guide as text (a Lua table literal read by
                    hand, never run) and writer back to text
    Import.lua      Ding.Import: guides imported as text (checks, ids, DingDB.imported,
                    registered at login), export
    Commands.lua    /ding
  UI/
    Widgets.lua     Ding.UI: design tokens (UI.C), Noto Sans fonts (UI.Font), nine-slice kit
                    shapes (UI.Shape, UI.Window), focus, gamepad glyphs, rows
    Gamepad.lua     Ding.Gamepad: button names and glyphs, temporary bindings, move mode,
                    binding capture
    Arrow.lua       Ding.Arrow: the design's arrow (on the way, behind, arrived), name,
                    distance, time; its loop runs on a separate frame (`go` steps validate
                    with the arrow hidden)
    TomTom.lua      Ding.TomTom: hands the target to TomTom (optional, off by default)
    TaxiMap.lua     Ding.TaxiMap: banner and ring on the flight map's destination (own frames)
    Rewards.lua     Ding.RewardHint: banner and ring on the best quest reward (own frames);
                    Ding.GearHint: banner of a gear upgrade
    Offers.lua      Ding.Offers: beside an NPC's window, what the guide does with each quest it
                    offers (now, later, another section, not in the guide and why); read only
    Finder.lua      Ding.Finder: the NPC directory's window (DING_FINDER, /ding find, the guide
                    window's pin button), trip of the arrow to an NPC
    ImportWindow.lua Ding.ImportWindow: /ding import and /ding export (text box, report,
                    buttons)
    Panel.lua       Ding.Panel: guide window (lines of the step), compact version, focus mode
    ItemButton.lua  Ding.ItemButton: floating secure button of the quest item (the only
                    protected frame)
    Minimap.lua     Ding.Minimap: button around the minimap (settings, guide)
    MinimapPins.lua Ding.MinimapPins: the target, nearby spots and an edge arrow on the minimap
    QuestMobs.lua   Ding.QuestMobs: a mark of Ding's over the enemy nameplates of the monsters a
                    log quest needs (kill, drop) with the counter, the step's quest givers on
                    friendly plates, a line in the unit tooltip (hooked), enemy nameplates
                    farther (nameplateMaxDistance)
    Config.lua      Ding.Config: settings window, six tabs by intent (Config.TAB keys: guide,
                    route, automation, arrow, bindings, appearance), titled blocks, pages for
                    long lists (OpenPage), folded rows, "Defaults for this tab"; first launch
  Locales/
    enUS.lua        interface texts in English (reference, default language)
    <locale>.lua    interface texts of one language (frFR, deDE, esES, ptBR, koKR, zhCN, zhTW)
    Guides/<locale>/<Race>/NN_<Zone>.lua   translation of a guide, Ding.RegisterGuideTranslation
  DB/               Ding's game database, generated by tools/build_data.lua from a QuestieDB
                    release (CREDITS.md): DB.lua (layout, source), Zones, Quests, Npcs, Objects,
                    Items; Locales/<locale>.lua: names in that language (loaded by that client)
  Media/Textures/   white textures of the design kit, to tint (rr4_stroke1: tools/media/textures.py)
  Media/Fonts/      Noto Sans Regular, Medium, SemiBold, Bold (license OFL.txt)
  Guides/Leveling/<Faction>/<NN>.lua   "Ding! - Leveling", the default pack: the sections of the
                                Leveling routes (tools/write_leveling.lua from
                                tools/routes/leveling/<faction>.lua); Leveling/Skyborne/0N.lua:
                                the Skyborne starts, one per side (tools/routes/
                                skyborne_<side>.lua), then that side's Leveling route
  Guides/<Race>/NN_<Zone>.lua   "Ding! - Zones" pack (pack = "ding-zones"): one guide per zone
                                (English texts), calls Ding.RegisterGuide
  Guides/Items/NN_<Item>.lua    "Ding! - Items" pack (pack = "ding-items", category "items"): an
                                item worth getting off the route, for both sides (`faction`
                                steps), hand-written
examples/DingExamplePack/   example guide pack (a separate addon, not in the zip), tested
tools/              offline scripts (Lua 5.1): list_zone, check_guides, smoke_test, run_tests
  wow_mock.lua      mocked WoW API, shared by the smoke test and the unit tests
  tests/*_test.lua  unit tests (one process per file)
docs/SPEC.md        specification and roadmap
docs/guide-packs.md public documentation for guide pack authors
docs/create-a-guide-with-ai.md public: a guide as text, with an AI (format, example, prompt);
                    its example is imported by import_test
docs/UI-handoff.md  Claude Design handoff (dimensions, colors, fonts, states) + deviations: the
                    reference for the UI
.pkgmeta            BigWigs packager config: the content of Ding/ at the root of the zip,
                    without tools nor docs
.github/workflows/ tests.yml (every PR), release.yml (tag v*: tests, checked zip, CurseForge +
                    GitHub)
```

Flow: a quest event -> `Engine:Update()` (delayed 0.2 s) -> `Advance()` passes the steps
that are done -> `Refresh()` computes the candidate points again, then calls
`Panel:Update()` and `Arrow:Update()`. The arrow points to the nearest candidate (world
coordinates, in yards) and calls `Engine:OnPosition` back to validate `go` steps.

Contracts between modules:

- `Engine:Describe(step)` -> `{ { icon, text, done, indent, kind, dim, impossible }, ... }`;
  `kind` = "objective" | "note" | "hint" for indented lines,
  `dim` = action not possible yet (required level: `requires`), `impossible` = quest not in
  the log. A quest above the player's level is never held back: the window writes its name
  in orange with its level (`UI.C.above`). Main lines also give `action` ("accept",
  "turnin", "complete", "level", "grind", "go", "manual"), `quest` and `prequestOf`; the
  level line of the current step adds `counter` (percent of the level) and `sub`
  (experience and kills left, `Grind:Status`), "grind" is the monster to farm (`npc`,
  `name`, `minLevel`, `maxLevel`, `quest` when a log quest needs it: `Grind:Spot`).
  `Engine:Summary(step)` -> first line. `Engine:Candidates(step, index)` (`StepCandidates` plus the
  persistent objectives as `low` points): the points of all
  the step's unfinished actions together (the arrow takes the nearest); a level step: the
  spot's spawns, else the next place (without `isGo`). A trip (`go`, `fly`, `hearth` alone)
  is done when the next step for the player is already done by the game's state.
- `Panel:Rows()` -> lines of the window (`kind`, `text`, `state` = "done" | "todo" |
  "impossible" | "header" | "notice", `counter`, `sub`), built from `Describe` and the quest
  log objectives: a quest's objectives (`nested`) under a row `action = "header"` (its level
  and name) unless a row of the step names the quest; then the notices `action = "notice"`
  (`notice` = "travel" | "trip" | "skipped"; `P:Content` lines of the same kind make one box),
  then the rows `along = true` of `Along.shown` (objectives of other quests near the player,
  after the step's rows and its notes), the extras, the notices "bags" | "cleanup", and the
  preview.
  `Engine.autoMoved`: the engine moved on by itself (the window keeps the finished step for
  1.5 s; `Panel:EndHold()` ends it, and "next" or "skip" meanwhile does only that).
  `Engine:IsManual(step)` -> step validated by "next" only.
- Packs: `Ding:GuidePacks()` (packs that have sections: Ding's three, Leveling, Zones then
  Items, first, then by title),
  `Ding:GetGuidePack(id)`, `Ding:IterateGuides(packId)` (sections of a pack, in registration
  order), `Ding:SuggestGuide(packId)` (Ding's when unknown; nil when nothing fits the
  character), `Engine:SetPack(id)` (the section last followed in it, `Ding.char.packGuide`,
  while it has quest work left at the player's level, else the suggested one), `guide.pack`,
  `Ding.BUILTIN_PACK` (= "ding", Leveling), `Ding.ZONES_PACK` (= "ding-zones"),
  `Ding.ITEMS_PACK` (= "ding-items"), `pack.category` (`Ding.GUIDE_CATEGORIES`: "leveling" by
  default, "items", "reputations", "professions", "class"; unknown -> "leveling");
  `Engine:KeepsGrey(guide)`: a guide of a pack that is not "leveling" keeps its grey quests
  ("Skip grey quests" only applies to leveling routes).
  The Guide tab has two lists: the pack (`ACTIVE_GUIDE`, grouped by category under header
  entries `{ header = true, text }` that the dropdown never focuses nor picks), then its
  sections (`GUIDE_SECTION`).
  `docs/guide-packs.md` is a public contract: any guide or step key, any behavior it
  describes, changes together with it (and with `examples/`), and with the import's key
  whitelist (`Import.STEP_KEYS`, `GUIDE_KEYS`, `PACK_KEYS`) and
  `docs/create-a-guide-with-ai.md`.
- Guides as text: `GuideText.Parse(text)` -> table or nil, `{ line, key, args }`;
  `GuideText.Write(value, { compact, order, orderOf, layout })`; `Import:Check(data)` ->
  plan or nil, report `{ errors, warnings }` (localized lines); `Import:Import(text)` -> pack
  id or nil, report; `Import:List()`, `Import:Delete(id)`, `Import:Export(id, compact)`,
  `Import:RegisterSaved()` (PLAYER_LOGIN, before `Engine:Start`); `pack.imported`;
  `Ding.UnregisterGuidePack(id)` (Registry); `Data:QuestOpenToRaces(q, races)`;
  `ImportWindow:Open("import" | "export", id, back)`.
- `Engine.guide`, `Engine.index`, `Engine.finished`, `Engine:CurrentStep()`,
  `Engine:Next()`, `Engine:Prev()`, `Engine:Skip()` (without validating),
  `Engine:BackToIncomplete()` (nearest past step not done), `Engine:CatchUp(q, step)`
  (missing link of the chain of `q`), `Engine.skipNotes` (reasons of the last skip),
  `Engine:StepMark(index)` -> "manual" | "skipped" | nil (step marked done or skipped by
  hand: colors `C.manual` / `C.skipped` in the window). `Travel:Leg(point)` -> nil (walk) or
  `{ kind = "fly" | "boat" | "zeppelin" | "tram" | "hearth" | "teleport" | "passage", point (flight
  master, dock, or a passage's entry, its far end once in it; nil for the hearthstone and a
  teleport), hint, to, flight, spell, passage }`, kept in `Travel.leg`
  (its plan in `Travel.plan`, `Travel:Itinerary(plan)` -> the "Route: …" line or nil; the item
  button casts `leg.spell`); the arrow shows `leg.point` and
  `Arrow.hint`, still validating `go` steps on the target itself. `Ding:StepApplies(step)`: the step's
  races and classes (`Ding:StepMatchesPlayer`, Registry) **and** its option (`sethearth` /
  `hearth` -> `ui.hearth`, `deathskip` -> `ui.deathSkip`, `dungeon` -> `ui.dungeons`,
  `elite` -> `ui.elites`, `vendor` / `repair` -> `ui.serviceSteps`, `train` -> `ui.trainerSteps`,
  `fly` -> `ui.flightSteps`): every module asks this one; `Ding:StepOptionOff(step)`: the
  setting that hides a step ("elites", "dungeons"...) or nil. `Engine:TargetNames(max)`: the
  step's NPCs and monsters by name, nearest first (the target binding's macro).
  `Engine:FindQuest(q)` -> `{ guide, index, action }` (where the guide deals with `q`),
  `Panel:FindQuest(q)` / `Panel:Jump()` (the offer row). `Travel:AutoFly()` takes the planned
  flight through `Compat.TakeTaxi` (the single taxi call `taint_test` allows).
  `Goals:Of(step)` (normalized goals), `Goals:Done(step, index)`, `Goals:Points`, `Goals:Lines`
  (lines `action = "goal"` with `goal`, `glyph`), `Goals:ButtonItem`; `Engine.ScheduleUpdate()`;
  `Compat.FormatPattern(fmt)`: a client format string as a Lua pattern.
  `Engine:ConditionsHold(when)` (in `Ding:StepApplies`), `Ding:DungeonWanted(name)`,
  `Engine:DungeonNames()`, `Engine:NoAuto(q)`, `Engine:LevelReached(step)` (`level` + `xp` or a
  fraction; `Grind:Into`), `Engine:PatrolPoint` / `NextPatrolPoint`. `Engine:ZoneLabel(point)`:
  the point's zone name when it is not the player's (`ZoneOf`, `PlayerZone`; `Compat.ZoneOf`
  climbs to the parent zone), `Panel:Where(row)` (" — NPC, Zone" on a line), `Arrow:MarkWorld`
  (the client's map waypoint through `Compat.SetUserWaypoint`, else `TomTom:MarkWorld`;
  `taint_test` allows those three calls in Compat only). `Engine:NextGuide(guide)`: `next`, or
  its entry for the player's faction when it is a table. `AutoQuest:PlaceEnd()`: the last step at
  the player's place (`Wanted` reads up to it). `Data:NpcQuests(npc)`: the quests an NPC starts.
  `Offers:Classify(q)` -> `{ kind = "now" | "later" | "needed" | "earlier" | "other" | "none",
  step, guide, before, ahead, reason }`, `Offers:Verdict(r, q, ctx)` -> "take" | "can" | "notNow" |
  "optional" | "useless" and plain sentences (no color code); `Offers:WhyLeftOut(q)`: the one
  place that asks `Ding.Why:Quest(q)` for the route's reason (a clause, or `{ text }`). `Engine:UnusedLogQuests()`: quests
  of the log the active guide and the next ones never use (listed in the Guide tab; Ding never
  abandons them). `UI.Banner`, `UI.Ring`, `UI.ScreenCenter`: Ding's marks over the game's
  windows, which are only read. `QuestMobs.byNpc` (`[npc id]` = entries best first: `kind`
  "kill" | "drop" | "accept" | "turnin", `quest`, `label`, `have`, `need`, `current`, `enemy`),
  rebuilt by `Engine:Refresh` (`QuestMobs:Refresh`); `QuestMobs.plates` (`[unit token]` =
  `{ plate, npc, name, attackable, badge }`, the monster read when the plate appears);
  `Along:Objectives(q, accept)` (unfinished objectives with the DingDB target they name) and
  `Along:StepQuests()`; `Data:ObjectiveTargets` gives each target `kind` and `npcs`;
  `Compat.UnitNpcID` (false for a player, nil when secret). `Panel:SetShown(v)`: the window and
  the arrow together (the arrow only shows with the window open).
- NPC directory: `Directory:Ids(kind)` (the NPC ids of the player's side; kinds "vendor",
  "repair", "food", "arrows", "bullets", "reagents", "poisons", "innkeeper", "flight", "trainer",
  "weapon:<skill line>", "profession:<key>", "trade", "bank", "auction", "stable"),
  `Directory:Best(kind[, within])` -> `{ kind, npc, name, point, seconds, means, distance }` (the
  fewest seconds away, `means` the ways besides walking; `within`: a city's NPC set),
  `Entries([within])`, `Cities()`, `CityNpcs(city)`, `CityList(city, category)`, `Search(text)`,
  `WeaponReminder()`, `Place(point)`; `Travel:Reach()` -> `reach:Seconds(point)`,
  `reach:Route(point)` -> seconds, `{ "fly", "boat"... }` (one planner pass, many targets).
  A trip goes through `Travel:Leg` like any target of the arrow.
  `Finder.trip` = `{ kind, npc, name, point, label }` (`Finder:GoTo(entry, label)`,
  `Finder:Go(kind)`, `Finder:Cancel()`), read by the arrow and the guide window.
- `Ding.db` (DingDB, account): `panel` (position, `scale` 0.5-1.5, `width` 240-420, `locked`,
  `bgAlpha`, `compactInCombat`, `hideInInstance`, `keyHints`, `itemButton`), `arrow`
  (position, `size` 40-80, `style`, `mode`, `tomtom`, `loop`: farming loop, `worldMap`: the
  target as the client's map waypoint), `item` (position of the item button),
  `minimap` (`shown`, `angle`), `ui` (`buttonStyle`, `sound`, `welcomed`, `autoAccept`,
  `autoTurnin`, `skipGrey`, `hearth`, `deathSkip`, `dungeons`, `elites`, `chooseReward`,
  `sellGrey`, `repair`, `markTarget`, `serviceSteps`, `trainerSteps`, `flightSteps`, `autoEquip`, `autoFly`, `offers`, `dungeonChoice` (`[name] = bool`),
  `mobIcons`, `mobTooltip`, `farPlates`), `farPlatesFrom` (the nameplate distance before
  "Show enemy nameplates farther", put back when it goes off),
  `timings`, `flightTimes` (`["<from npc>:<to npc>"] = { seconds, count }`, flights measured),
  `imported` (`[pack id] = { pack, guides, at }`: guides imported as text, kept by "restore
  all defaults"),
  `debug`,
  `layout` (settings version:
  `Ding.Migrate`). Defaults: `Ding.DEFAULTS`.
  `Ding.char` (DingCharDB, character): `guide`, `pack` (pack of `guide`: if the guide goes
  away, a section of this pack, else of Ding's), `prevPack` (the pack before it: deleting an
  imported guide goes back there), `packGuide` (`[pack] = guide id`: the section
  last followed in each pack), `step`, `manual`, `resumeTo` (resume in
  progress: `Engine:Resume` passes what is done or left behind up to the player's place, but
  first finishes and turns in the quests of the guide's past still in the log; never past the
  work left on the quests the player took last, `resumeLimit`; `Engine:LeftBehind(step, i)`:
  a step it passes, which `Engine:NextSteps` leaves out of the preview), `guideSig`
  (signature of the active guide: changed by an update, the guide is resumed), `early`
  (quests taken on the way by AutoQuest, ignored to place the player), `skipped` (skipped
  steps, per guide; cleared by "Take this guide up where I am", like `manual`), `killXP`
  (the last 30 kills, as a share of a monster of the player's level: `Grind:KillXP`),
  `deathskip` (`{ guide, step }`: died during a death skip step, done once alive again),
  `flights` (`[npc]` = name of the flight path known, or true), `bind` (`{ map, x, y, name }`,
  the inn of the hearthstone), `training` (`{ now, future = { [level] = cost }, level }`; nil
  before the first visit: even levels), `trainingReminded` (level of the last chat reminder
  near a class trainer), `gearDeclined` (`[itemID] = true`), `sticky` (`[questID] = true`,
  persistent objectives; a quest the active guide makes sticky only past the step shown
  leaves it), `wrapUp` (guide id in "turn in first" mode), `stay` (`[guide id] =
  true`), `talentBuild` (id of the talent build followed, "off" for none, nil: the class's
  first), `taxiSeen` (`[continent] = true`: a flight map opened there), `goals`
  (`["<guide>#<step>"] = { kills, talked, gossiped, used, object, counts, progress }`), `keep`
  (`[itemID] = true`), `lastStep` (`[guide id] = step`: where the character was in each
  section, `Engine:Resume` goes at least there; cleared by "Take this guide up where I am"),
  `hearthInn` (`{ inn, name }`: bound during a sethearth step, the client's name of the inn),
  `worldMark` (`{ map, x, y }`: the map waypoint Ding set, not the player's).
  `Ding.db.panel.preview` (0-3 next steps shown), `Ding.db.panel.weaponReminder` (the weapon
  to learn under the step), `Ding.db.minimap.pins`.
  The engine places the player only once the quest log has arrived (`Engine.logReady`).

## Data

- In game: **Ding's own database**, `Ding/DB`, only through `Core/Data.lua`. It is generated by
  `tools/build_data.lua` from a QuestieDB release (the Forever export, its zone tables and its
  names in every language): positional records (`Ding.DB.LAYOUT`), spawns already by UiMapID
  (`{ [map] = { x, y, x, y, ... } }`), the names of each language in `Ding/DB/Locales/<locale>.lua`
  (loaded by that client only). `Ding.DB.source` names the release. The QuestieDB addon is only
  a fallback when `Ding/DB` is missing (`Data:UseBackend`); the getters keep QuestieDB's
  semantics (docs: https://github.com/Questie/QuestieDB/blob/master/docs/api.md).
- **DingDB** is the public name of `Ding/DB` (docs/dingdb.md, a public contract like
  docs/guide-packs.md): other addons read it through the global `LibDingDB` (the global `DingDB`
  is Ding's saved settings); corrections and additions go in `tools/data/corrections/*.lua`
  (plain data, checked by `tools/check_data.lua` and `tools/dingdb_corrections.lua`), applied by
  `build_data.lua` on top of Questie's data; `Ding.DB.corrected` lists the ids they change.
- **Updating the data** on a new QuestieDB release: export that release (tag), run
  `tools/build_data.lua <combined dir> --source "QuestieDB vX.Y.Z"`, then the whole suite with
  that export (`db_parity_test` compares Ding/DB with it); CI clones the tag named in
  `Ding/DB/DB.lua`.
- Pitfalls: a missing number is `0` (test `~= 0`); `startedBy`, `finishedBy`, `objectives`
  always return a table; other empty tables are `nil`; QuestieDB's own spawns are by
  **AreaID** in percentages 0-100 (`Data` converts them); race masks go beyond 32 bits (no
  `bit.band`, use `math.floor(mask / bit) % 2`).
- Project license: **GPL-3.0** (`LICENSE`), with no exception: Yendi's choice, "everything
  stays free", third-party guide packs included (derivative works). GPL code (Questie) may
  be reused, citing where it comes from; never code under an incompatible license.
- TomTom is "all rights reserved": we only call its public API (`Ding.TomTom`), no file nor
  texture is reused. Calls always protected (`pcall`); on failure, back to Ding's arrow. It
  stays optional and off by default: Ding's arrow must be enough (Yendi's request).
- Noto Sans (in `Ding/Media/Fonts`) is under the OFL 1.1 license: shipped with its license.
- **Questie's data**: Questie is published under the GNU GPL v3; `Ding/DB` is built from its
  database (through QuestieDB) and keeps its credits (`Ding/DB/CREDITS.md`, the README, the
  header of each generated file). Guides only hold quest ids, route coordinates and our notes.

## Conventions

- **Everything in English**: code, comments, docs, tests, tool output, commit messages, pull
  requests (Yendi's request: everything on GitHub is in English). French only where it is
  data: the translations (`Ding/Locales/frFR.lua`, `Ding/Locales/Guides/frFR/`,
  `tools/routes/locales/frFR.lua`, examples' `Locales/frFR.lua`), the localized TOC fields
  (`## Notes-frFR`), and the French texts a test expects from the mocked client (frFR by
  default).
- The name players see is **Ding!**: `Ding.TITLE` in titles and the chat prefix, "Ding!" in every
  interface text and pack name, in every language. The code, the folder, the saved variables,
  `/ding` and the packs' `## Dependencies: Ding` keep "Ding", with no special character.
- Languages: English is the default language; translations **one file per language** in
  French (frFR), German (deDE), Spanish (esES, also for esMX), Brazilian Portuguese (ptBR),
  Korean (koKR), Simplified Chinese (zhCN) and Traditional Chinese (zhTW). Interface texts
  through `Ding.L`: a key added to `Locales/enUS.lua` **and** to every `Locales/<locale>.lua`
  (the `locales_test` test checks the keys and the `%d`/`%s`). Guide texts (`title`, `text`,
  `note`) are written in English; their translations are in the dictionaries
  `tools/routes/locales/<locale>.lua` ([English phrase] = translation), from which
  `tools/translate_guides.lua` writes `Locales/Guides/<locale>/` and the TOC (see SPEC §2,
  Languages). Korean and Chinese: the game's font (`UI.GAME_FONT`), Noto Sans does not have
  their characters.
- Lua 5.1: no `goto`, no bitwise operators, global `unpack`, `#` only on sequences without
  holes.
- Forever API: prefer `C_*`, go through `Ding.Compat`, `pcall` any doubtful function (some
  old functions exist but fail). The client can return **secret values** (the player's
  speed, for example) that an addon can neither compare nor compute with: every number or
  boolean from the API goes through `Compat.Plain` (secret = nil). Never `GetUnitSpeed`.
  The client's formats are positional (`%1$s`) and contain the grammar
  `|4singular:plural;`.
- Every display called by the engine or a timer goes through `Ding:Safe(fn, ...)`: an error
  blocks nothing else and shows only once.
- **Never drive a game window from Ding** (quest log, map, options, `ShowUIPanel`,
  `HideUIPanel`…): called from an addon, they get tainted and their secret values fail all
  over. Ding shows what is needed in its own frames and tooltips; `taint_test` rejects these
  calls.
- **Never take the keyboard from a box Ding does not own** (`EditBox:SetFocus` while the game's
  chat has it, during a slash command above all): the chat's focus-lost handler then runs in
  Ding's name and, with the gamepad interface, reaches Blizzard-only actions (the game's
  "AddOn blocked" popup). `ImportWindow:Focus` waits until `GetCurrentKeyBoardFocus()` is free.
- Interface: the design of `docs/UI-handoff.md`, to the pixel. Colors through the `UI.C`
  tokens, fonts through `UI.Font(weight, size)` (Noto Sans), shapes through `UI.Shape` /
  `UI.Window` (nine-slice kit textures), focus through `UI.Focus`, gamepad buttons through
  `UI.Glyph`. Never BackdropTemplate nor a WoW window texture (`look_test` checks it).
  **No arrows nor shapes in texts** (← → ◂ ▸ ✕ □ △ ○…): Noto Sans does not have them, they
  are textures. No Ace3, no XML templates, no protected frame except `DingItemButton`
  (using an item requires it: attributes, showing and position only out of combat, anchored
  to UIParent only).
- Gamepad: never a button captured for good on a shown window. Commands go through key
  bindings (`Bindings.xml`); navigation in a window goes through temporary bindings
  (settings, move mode, the guide's focus mode) that only take the useful keys.
- Keyboard and mouse: every gamepad action has an equivalent (click = A, right-click = Y or
  cancel, Escape = B, clickable buttons in move mode). Without an active gamepad
  (`Gamepad:Active`), the help and the messages speak of the mouse and the keyboard;
  `mouse_test` checks it (SPEC §3, Keyboard and mouse).
- Each action shows once: with a gamepad, a button carries its chips (`UI.ButtonKeys`: A on the
  focused one, B on the one that closes) and a hint bar only lists what no button on screen
  does; `single_action_test` checks every window, with and without a gamepad, in every language.
- Anchors: to stretch a region, `TOPLEFT`/`TOPRIGHT` pairs (never `TOPLEFT` + `RIGHT`, which
  also fixes the vertical center); the smoke test checks it.
- Temporary bindings (`SetOverrideBindingClick`) only out of combat; anything that sets them
  must remove them on `PLAYER_REGEN_DISABLED`.
- Every module: `local _, Ding = ...` then a local table exposed on `Ding`.
- Guides: keys `accept`, `turnin`, `complete`, `go`, `level`, `train`, `note`,
  `optional`, `sethearth`, `hearth`, `deathskip`, `dungeon`, `elite`… (see SPEC §2). An optional
  step must never block; a step behind an option disappears whole when it is off.
- Small commits, one per task, messages in English.

## Checks

Nothing runs in the game here: these commands are the only safety net.

```sh
# Syntax of all the Lua
find Ding tools examples -name '*.lua' -print0 | xargs -0 -n1 luac5.1 -p

# QuestieDB export (once, OUTSIDE the repository): the release Ding/DB was built from
git clone --depth 1 --branch v1.0.6 https://github.com/Questie/QuestieDB.git ../QuestieDB
(cd ../QuestieDB && lua5.1 tools/export-forever.lua --include-authored)

# DingDB (Ding/DB) from that export and tools/data/corrections; the corrections alone
lua5.1 tools/build_data.lua ../QuestieDB/src/corrections/Forever/combined --source "QuestieDB v1.0.6"
lua5.1 tools/check_data.lua

# Guide validation (non-zero exit code on errors)
lua5.1 tools/check_guides.lua ../QuestieDB/src/corrections/Forever/combined
lua5.1 tools/check_guides.lua ../QuestieDB/src/corrections/Forever/combined --addon examples/DingExamplePack

# Unit tests (tools/tests/*_test.lua)
lua5.1 tools/run_tests.lua ../QuestieDB/src/corrections/Forever/combined

# Smoke test: loads the addon with a mocked WoW API and plays the guides
lua5.1 tools/smoke_test.lua ../QuestieDB/src/corrections/Forever/combined --quiet
lua5.1 tools/smoke_test.lua ../QuestieDB/src/corrections/Forever/combined --quiet --skip-optional
lua5.1 tools/smoke_test.lua ../QuestieDB/src/corrections/Forever/combined --quiet --locale enUS
lua5.1 tools/smoke_test.lua ../QuestieDB/src/corrections/Forever/combined --quiet --tomtom
for l in deDE esES ptBR koKR zhCN zhTW; do lua5.1 tools/smoke_test.lua ../QuestieDB/src/corrections/Forever/combined --quiet --locale $l; done

# Guide translations from tools/routes/locales/<locale>.lua (files and TOC)
lua5.1 tools/translate_guides.lua

# Free quests the Leveling routes leave out (write_leveling.lua warns about each one; --apply
# adds them to the routes): tools/README.md, section 8
lua5.1 tools/audit_free_quests.lua ../QuestieDB/src/corrections/Forever/combined

# Kit texture missing from the handoff (once)
python3 tools/media/textures.py Ding/Media/Textures

# Quests of a zone for a race (141 = Teldrassil, 8 = Night Elf)
lua5.1 tools/list_zone.lua ../QuestieDB/src/corrections/Forever/combined 141 8
```

The mocked API is in `tools/wow_mock.lua`: a new WoW function used by the addon must be
added there (else an "unknown widget method" error or a missing global). Every feature comes
with its unit tests and its scenario in the smoke test; the whole suite runs again before
each delivery. The GitHub action `.github/workflows/tests.yml` runs these commands on every
PR.

## Publishing

CurseForge project `ding-xp-and-leveling-guide` (id 1739053, `## X-Curse-Project-ID` in the
TOC). A `v*` tag pushed to GitHub (`v0.2.0`, `v0.2.0-beta1` for a beta file) starts
`release.yml`: the whole suite, then the BigWigs packager builds the zip,
`tools/check_package.py` checks it (a single `Ding/` folder, exactly the tracked files of
`Ding/` plus the license and the changelog, version replaced, TOC files present, identical
media), and only then it goes to CurseForge and to the GitHub releases (secret
`CF_API_TOKEN`). Every PR builds and checks the same zip without uploading anything. The TOC
keeps `## Version: @project-version@` (replaced by the tag; a copy of the repository calls
itself "dev"). Before each tag, add the version's entry at the top of `CHANGELOG.md` (for
players: it is the text published on CurseForge). Never push a tag without Yendi's
agreement. Since v1.3.0 Ding carries its own game data: QuestieDB is no longer needed.

What can only be validated in game: the arrow's orientation (`/ding arrowflip` or the Arrow
tab), `QUEST_ACCEPTED` (a single `questID` argument on Forever) and the auto-advance, the
rendering of the interface and the gamepad bindings, TomTom's API on Forever
(`AddWaypoint`, `cleardistance = 0`), and the "to check in game" list of
`docs/UI-handoff.md` (TGA textures and kit fonts, nine-slice, masks, quest log objectives,
focus mode, item button, minimap button, `C_GamePad`).
