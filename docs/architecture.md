# Ding! — architecture and conventions in detail

The file-by-file map of the addon, its flow, the contracts between modules and the saved
variables, then the full text of the coding conventions. `CLAUDE.md` keeps the short version
that every working session reads; this is where the details live. The behavior itself is
specified in [`SPEC.md`](SPEC.md).

## Files

```
Ding/
  Ding.toc          load order; no hard dependency; optional: TomTom
  Bindings.xml      bindings DING_NEXT / DING_PREV / DING_TOGGLE / DING_CONFIG / DING_COMPACT,
                    DING_FOCUS (focus mode), DING_SKIP / DING_UNSKIP, DING_FINDER (NPC directory),
                    DING_CYCLE (the arrow on the step's next target), DING_REPORT (report a
                    problem),
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
    Why.lua         Ding.Why: why the guide makes its choices, in plain words (a step's `why`, a
                    section's `leftOut`): a short line under a surprising step, the whole reason
                    on demand (row tooltips), why a quest is left out (Why:Quest)
    Report.lua      Ding.Report: "Report a problem": the facts (Collect: the guide, the step on
                    screen, the position, the step's quests and the log's quests the next 3
                    steps name, the arrow's target, the route settings, the client; never the
                    character's name nor the realm), the text (GitHub Markdown, English
                    labels), the last 20 kept in DingDB.reports (not a setting)
    Commands.lua    /ding
  UI/
    Themes.lua      Ding.UI.Themes: the four themes (halo by default, ardoise, bandes,
                    dingdark: their tokens, flags, textures, radii), UI.Theme.Apply / Restore
    Widgets.lua     Ding.UI: design tokens (UI.C, filled by the theme), painting through tokens
                    (UI.Color / Tint / Fill / Paint, UI.Skin), fonts by surface (UI.Font,
                    UI.TitleFont), nine-slice kit shapes (UI.Shape, UI.Window), focus, gamepad
                    glyphs, rows, the hover card (UI.Card)
    Gamepad.lua     Ding.Gamepad: button names and glyphs, temporary bindings, move mode,
                    binding capture (Capture({ done, refuse, say }): a button on its release,
                    a combination with the game's modifier buttons, B held, keys), saved
                    bindings (Bind: replaces the action's keys of that kind, BindingKeys,
                    ShownKeys: the input in use's, WhoUses: an addon's override, the game's
                    gamepad interface, a saved binding; a chord: another action's, Easy
                    Controller's), chords ("PADLSHOULDER+PADDUP" in Ding.db.chords: two
                    buttons, watched each frame, the second kept from the game by DingChordInput
                    while the first is held; CHORD_RUN), the windows' own reading of the
                    gamepad (DingPadInput, before any binding), BindDefaultConfig ("Open Ding!
                    settings": the chord RB + Up, else LB + Up, once),
                    other gamepad addons (HasWindow for them to read; Ding never waits for
                    theirs nor changes GamePadEmulate*; docs/compatibility.md)
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
                    (after the setup assistant: Config:Welcome, the Keybinds tab)
    Setup.lua       Ding.Setup: the setup assistant, four screens of choices (Setup.SCREENS), once
                    per account at the first launch (Setup:FirstLaunch), again from the Guide tab
                    or /ding intro
    Report.lua      Ding.ReportWindow: "Report a problem" (DING_REPORT, /ding bug, the guide
                    window's flag): what the report holds in plain words, four ready reasons,
                    the player's words; then the text selected for Ctrl+C and the GitHub link
  Locales/
    enUS.lua        interface texts in English (reference, default language)
    <locale>.lua    interface texts of one language (frFR, deDE, esES, ptBR, koKR, zhCN, zhTW)
    Guides/<locale>/<Race>/NN_<Zone>.lua   translation of a guide, Ding.RegisterGuideTranslation
  DB/               Ding's game database, generated by tools/build_data.lua from a QuestieDB
                    release (CREDITS.md): DB.lua (layout, source), Zones, Quests, Npcs, Objects,
                    Items; Locales/<locale>.lua: names in that language (loaded by that client)
  Media/Textures/   white textures of the design kit, to tint (rr4_stroke1: tools/media/textures.py);
                    in real colors, never tinted: the icon (minimap_icon64/32, logo64/32: sources in
                    docs/icon/), arrow_gold, arrow_halo_gold/back, theme_preview_bg
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
  Guides/Class/<Side>/<Class>.lua  "Ding! - Class quests" pack (pack = "ding-class", category
                                "class"): one guide per class and side (`faction`, `classes`),
                                the class's chains in level order, hand-written (SPEC, Class
                                quests)
  Guides/Dungeons/<Side>/NN_<Name>.lua  "Ding! - Dungeon quests" pack (pack = "ding-dungeons",
                                category "dungeon"): one guide per dungeon and side (`faction`),
                                numbered by level: the quest givers and their chains, the
                                entrance, the dungeon's quests with notes, the turn-ins;
                                hand-finished from tools/draft_dungeon.lua (SPEC, Dungeon quests)
examples/DingExamplePack/   example guide pack (a separate addon, not in the zip), tested
tools/              offline scripts (Lua 5.1): list_zone, check_guides, smoke_test, run_tests;
                    route_why.lua: the reasons of the Leveling guides (`why`, `leftOut`), measured
                    on write_leveling.lua's simulation
  wow_mock.lua      mocked WoW API, shared by the smoke test and the unit tests
  tests/*_test.lua  unit tests (one process per file)
docs/SPEC.md        specification and roadmap
docs/guide-packs.md public documentation for guide pack authors
docs/create-a-guide-with-ai.md public: a guide as text, with an AI (format, example, prompt);
                    its example is imported by import_test
docs/UI-handoff.md  Claude Design handoff (dimensions, colors, fonts, states) + deviations: the
                    reference for the UI (its colors: the dingdark theme)
docs/UI-themes.md   the themes' handoff (tokens, flags, window styles, the picker) + how it is
                    implemented and what to check in game
docs/compatibility.md  what Ding and the gamepad addons (Easy Controller, ConsolePort) and TomTom
                    change in the game, how they stay out of each other's way, checks in game
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
  "impossible" | "manual" | "skipped" | "header" | "section" | "notice" | "button" | "other" |
  "extra" | "preview", `counter`, `sub`), built from `Describe` and the quest
  log objectives: a quest's objectives (`nested`) under a row `action = "header"` (its level
  and name) unless a row of the step names the quest; then the notices `action = "notice"`
  (`notice` = "travel" | "trip" | "skipped"; `P:Content` lines of the same kind make one box;
  the step's own rows carry `ofStep`: their tooltip says why, `P.shownStep`),
  after the step's rows (and its `unmark` control), a row `action = "infoHeader"` (state
  "section", "Good to know", a line above) and everything informational, `info = true`: the
  first notices, the rows `along = true` of `Along.shown` (objectives of other quests, state
  "other", `other` = "sticky" | "along", each quest under a row `action = "header"` with
  `other`), the extras (`extra = true`, state "extra"), the notices "bags" | "cleanup"; then the
  preview (under a row `action = "previewHeader"`, state
  "section"). The rules of the window: SPEC "Guide window: rules" (`panel_rules_test`);
  `tools/panel_snapshot.lua` writes it as text for a scenario of `tools/panel_scenarios.lua` (in Ding
  dark; `--theme`: another theme, `<scenario>@<theme>.txt` for `Snap.THEMED`). Plain words (SPEC): `Panel:RowMeaning(row)`
  -> what a row's look means, in words, for its card (`Panel:ShowQuest`: hover, X in focus mode;
  a grey row's `requires` or `waitsOn`); `UI.More(n, quests)` ("and 2 more", never "+2");
  `QuestMobs:Words(e)`, `ItemButton:Explain()`, `MinimapPins:Explain(pin)`: their tooltips.
  `Engine.autoMoved`: the engine moved on by itself (the window keeps the finished step for
  1.5 s; `Panel:EndHold()` ends it, and "next" or "skip" meanwhile does only that).
  `Engine:IsManual(step)` -> step validated by "next" only.
- Packs: `Ding:GuidePacks()` (packs that have sections: Ding's five, Leveling, Zones, Items,
  Class quests then Dungeon quests, first, then by title),
  `Ding:GetGuidePack(id)`, `Ding:IterateGuides(packId)` (sections of a pack, in registration
  order), `Ding:SuggestGuide(packId)` (Ding's when unknown; nil when nothing fits the
  character), `Engine:SetPack(id)` (the section last followed in it, `Ding.char.packGuide`,
  while it has quest work left at the player's level, else the suggested one), `guide.pack`,
  `Ding.BUILTIN_PACK` (= "ding", Leveling), `Ding.ZONES_PACK` (= "ding-zones"),
  `Ding.ITEMS_PACK` (= "ding-items"), `Ding.CLASS_PACK` (= "ding-class": the Guide tab's section
  list shows only the character's own sections of a "class" pack), `Ding.DUNGEONS_PACK`
  (= "ding-dungeons": the section list shows the character's side only, by level), `pack.category` (`Ding.GUIDE_CATEGORIES`: "leveling" by
  default, "items", "reputations", "professions", "class", "dungeon"; unknown -> "leveling");
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
  `Engine:Next()` (while browsing back: the step right after, marking nothing; else
  `Engine:MarkDone()`, the step menu's "Mark as done"), `Engine:Prev()` (browsing:
  `Engine.browseFrom` = the guide's current step, `Engine:IsBrowsing()`,
  `Engine:BrowseTo(index)` for "Go to step" behind), `Engine:Skip()` (without validating),
  `Engine:BackToIncomplete()` (nearest past step not done), `Engine:CatchUp(q, step)`
  (missing link of the chain of `q`), `Engine.skipNotes` (reasons of the last skip),
  `Engine.passNotes` (`{ index, reason }`: steps passed by itself in play, never shown; the
  window's "Step passed: …"), `Engine:StepNumber(index[, guide])` -> number, total among the
  character's steps (`Ding:StepForCharacter`: race, class, options, without `when`): every
  step number the player sees,
  `Engine:StepMark(index)` -> "manual" | "skipped" | nil (step marked done or skipped by
  hand: colors `C.manual` / `C.skipped` in the window), `Engine:Unmark([index])` (undoes it: back
  to that step when it is still to do). `Travel:Leg(point)` -> nil (walk) or
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
  place that asks `Ding.Why:Quest(q)` for the route's reason (a clause, or `{ text }`).
  Reasons (`Core/Why.lua`): `Why:Step(step)` -> `{ short, lines,
  estimates }` or nil (no `why`: the step has no reason), `Why:Short(step)` (the line under the
  step, nil when not `short` or the option is off), `Why:Detail(step)` (the tooltip's lines,
  nil without a reason or when off), `Why:Quest(q[, guide])` -> clause, entry, guide
  (for `L.OFFER_NOT_DONE`; the section's `leftOut`, else another section of its pack for the character; nil: say
  nothing), `Why.LeftOutText(entry)`, `Why.XPText(xp, plain)`, `Why.TimeText(seconds)`,
  `Why.STEP` / `Why.LEFT` (kinds and keys, checked by Import; `check_guides.lua` has the same).
  `Engine:UnusedLogQuests()`: quests
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
- Themes (docs/UI-themes.md): `UI.Themes[id]` = `{ id, name, desc, C, opacityDefault, flags,
  tex, radius }`, `UI.ThemeOrder`, `UI.TOKENS` (every theme has every key: `themes_test`).
  `UI.C[key]` is one table per token whose identity never changes: `UI.Theme.Apply(id[,
  preview])` copies the theme's values into it (preview: not saved in `Ding.db.ui.theme`),
  `UI.Theme.Restore()` (the saved theme back), `UI.Theme.Saved()`, `UI.Theme.current`,
  `UI.Theme.Opacity()` (`Ding.db.panel.bgAlpha`), `UI.Theme.OnApply(fn)`. A theme never holds a
  size, a padding nor a font size. **Every paint goes through a token**: `UI.Color(fs, token)`,
  `UI.Tint(tex, token)`, `UI.Fill(tex, token)`, `UI.Paint(tex, token[, orientation])` (a
  gradient token: 8 numbers), `Slice:SetColor(token[, alphaMul])`, `UI.Shape` (its texture
  follows the theme's radii); what a widget draws by itself registers `UI.Skin(object, fn)`.
  A theme change creates no frame (`themes_test`): it paints again, sets the font objects again
  in place, runs the skins, then `Panel:Relayout()`. Fonts by surface: `UI.Text(parent, weight,
  size, color, layer, surface)` ("dialog", "scene": the guide window, "card", "world": over the
  game, "chip"), `UI.SetFont(fs, weight, size)`, `UI.SetTitleFont(fs, role)` (the game's font or
  Noto Sans SemiBold, `UI.TITLE_ROLES`). The guide window's row cards: `UI.Card` (Ding's frame,
  read like GameTooltip by the tests through `T.tip`); `Panel.HideCard(owner)`. Arrow skins:
  `UI.ArrowSkins`, `UI.ArrowSkinOrder`, `UI.Theme.ArrowLook(id)` -> `{ skin, tint, backTint, disc }`
  (its own theme's tints on its theme, else the accent; real colors never tinted),
  `Arrow:SetSkin(id)`, `Arrow:PreviewSkin(id | nil)`, `Arrow:Skin()`. The pickers (themes,
  arrows) are one card grid in Config.lua (`cardGrid`).
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
  `Finder:Go(kind)`, `Finder:Cancel([quiet])`), read by the arrow and the guide window; the
  engine ends it whenever the player moves the guide (Next, Skip, Prev, BackToIncomplete,
  SetGuide).
- Setup assistant: `Setup:Open(screen, back)` (`back(input)` runs once the player closes it, one
  frame later, `input` = "xbox" | "ps" | "mouse": the settings it came from, the first launch's
  Keybinds tab), `Setup:Close(quiet)` (`quiet`: another Ding window takes over, `back` does not
  run; the settings, the directory and the import window call it), `Setup:FirstLaunch(after)`
  (Config:Init: 2 s after login, the assistant then `after(input)`, or `after()` alone once
  done), `Setup:Keep()` ("Keep the recommended settings": every setting not changed in this run
  back to `Ding.DEFAULTS`), `Setup:IsShown()`. A choice of a screen: `{ kind = "check" | "radio"
  | "go", id, label, sub, tag, setting = { get, set, recommended[, custom] }, value, run }`; a
  check writes its setting at once, through the same calls as the settings window.
- `Ding.db` (DingDB, account): `panel` (position, `scale` 0.5-1.5, `width` 240-420, `locked`,
  `bgAlpha`, `compactInCombat`, `hideInInstance`, `keyHints`, `itemButton`), `arrow`
  (position, `size` 40-80, `skin` (the arrow's look: "theme" | "halo" | "ardoise" | "bandes" |
  "ding" | "gold" | "classic", `UI.ArrowSkins`; the old `style` migrated), `mode`, `tomtom`,
  `loop`:
  farming loop, `worldMap`: the
  target as the client's map waypoint), `item` (position of the item button),
  `minimap` (`shown`, `angle`), `ui` (`theme` (UI/Themes.lua, "halo"), `opacityTouched` (the
  opacity slider moved: it no longer follows the theme's default), `buttonStyle`, `sound`,
  `welcomed`, `setupDone` (the
  setup assistant was closed by the player; a fight during the first launch's keeps it pending),
  `configChordDone` (the default chord of "Open Ding! settings" was offered), `autoAccept`,
  `autoTurnin`, `skipGrey`, `hearth`, `deathSkip`, `dungeons`, `elites`, `chooseReward`,
  `sellGrey`, `repair`, `markTarget`, `serviceSteps`, `trainerSteps`, `flightSteps`, `autoEquip`, `autoFly`, `offers`, `dungeonChoice` (`[name] = bool`),
  `mobIcons`, `mobTooltip`, `farPlates`), `farPlatesFrom` (the nameplate distance before
  "Show enemy nameplates farther", put back when it goes off),
  `timings`, `flightTimes` (`["<from npc>:<to npc>"] = { seconds, count }`, flights measured),
  `imported` (`[pack id] = { pack, guides, at }`: guides imported as text, kept by "restore
  all defaults"), `chords` (`[action] = "PADLSHOULDER+PADDUP"`: Ding's gamepad chords, kept by
  "restore all defaults"), `reports` (the last 20 of "Report a problem", oldest first:
  `{ at, title, text }`, kept by "restore all defaults": Core/Report.lua),
  `debug`,
  `layout` (settings version: `Ding.Migrate`; 3: themes, Halo for everyone). Defaults:
  `Ding.DEFAULTS`.
  `Ding.char` (DingCharDB, character): `guide`, `pack` (pack of `guide`: if the guide goes
  away, a section of this pack, else of Ding's), `prevPack` (the pack before it: deleting an
  imported guide goes back there), `packGuide` (`[pack] = guide id`: the section
  last followed in each pack), `step`, `manual`, `resumeTo` (resume in
  progress: `Engine:Resume` passes what is done or left behind up to the step the character
  was on in the section, `lastStep`, but first finishes and turns in the quests of the
  guide's past still in the log; never further on the quests alone; `Engine:LeftBehind(step,
  i)`: a step it passes, which `Engine:NextSteps` leaves out of the preview), `layout`
  (version of the character's data, `Ding.MigrateChar`: a resume saved before v1.4.0 is
  dropped once), `guideSig`
  (signature of the active guide: changed by an update, the guide is resumed), `early`
  (quests taken on the way by AutoQuest, ignored to place the player), `skipped` (skipped
  steps, per guide; cleared by "Take this guide up where I am", like `manual`), `killXP`
  (the last 30 kills, as a share of a monster of the player's level: `Grind:KillXP`),
  `deathskip` (`{ guide, step }`: died during a death skip step, done once alive again),
  `flights` (`[npc]` = name of the flight path known, or true), `bind` (`{ map, x, y, name }`,
  the inn of the hearthstone), `training` (`{ now, future = { [level] = cost }, level }`; nil
  before the first visit: even levels), `trainingReminded` (level of the last chat reminder
  near a class trainer), `gearDeclined` (`[itemID] = true`), `weaponsDismissed` (`[skill line] =
  true`: weapons the reminder never suggests again), `sticky` (`[questID] = true`,
  persistent objectives; a quest the active guide makes sticky only past the step shown
  leaves it), `wrapUp` (guide id in "turn in first" mode), `stay` (`[guide id] =
  true`), `talentBuild` (id of the talent build followed, "off" for none, nil: the class's
  first), `taxiSeen` (`[continent] = true`: a flight map opened there), `goals`
  (`["<guide>#<step>"] = { kills, talked, gossiped, used, object, counts, progress }`), `keep`
  (`[itemID] = true`), `lastStep` (`[guide id] = step`: where the character was in each
  section, `Engine:Resume` goes there and no further; cleared by "Take this guide up where I
  am", which then takes the first step still to do),
  `hearthInn` (`{ inn, name }`: bound during a sethearth step, the client's name of the inn),
  `worldMark` (`{ map, x, y }`: the map waypoint Ding set, not the player's).
  `Ding.db.ui.suggestGear` (the gear upgrade's row, banner and item button:
  `Gear:Suggested()`; `Gear.upgrade` stays for auto-equip), `Ding.db.panel.preview` (0-3 next steps shown), `Ding.db.panel.weaponReminder` (the weapon
  to learn under the step), `Ding.db.panel.why` (the guide's explanations, Core/Why.lua),
  `Ding.db.minimap.pins`, `Ding.db.ui.dialogScale` (the settings windows' size, 0.6-1.2:
  `UI.Dialog` / `UI.SetDialogScale`). The dialog windows take their sizes from `UI.SIZE`.
  The engine places the player only once the quest log has arrived (`Engine.logReady`).

## Conventions in detail

The rules `CLAUDE.md` sums up, in full.

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
  `note`, the place of a `sethearth`: shown as `step.sethearthText`, the English name stays the
  inn's key) are written in English; their translations are in the dictionaries
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
- Interface: the design of `docs/UI-handoff.md` and `docs/UI-themes.md`, to the pixel. Colors
  only through the `UI.C` tokens and the painting helpers (no color literal in `Ding/UI` but
  `UI/Themes.lua`: `themes_test`), fonts through `UI.Font(weight, size[, surface])` (Noto Sans),
  shapes through `UI.Shape` /
  `UI.Window` (nine-slice kit textures), focus through `UI.Focus`, gamepad buttons through
  `UI.Glyph`. Never BackdropTemplate nor a WoW window texture (`look_test` checks it).
  **No arrows nor shapes in texts** (← → ◂ ▸ ✕ □ △ ○…): Noto Sans does not have them, they
  are textures. No Ace3, no XML templates, no protected frame except `DingItemButton`
  (using an item requires it: attributes, showing and position only out of combat, anchored
  to UIParent only).
- Gamepad: never a button captured for good on a shown window. Commands go through key
  bindings (`Bindings.xml`) or Ding's chords (two gamepad buttons, watched: `Ding.db.chords`);
  navigation in a window goes through temporary bindings (settings, move mode, the guide's
  focus mode) that only take the useful keys, read first by `DingPadInput` while the window is
  open (the game's gamepad interface and other addons' overrides would go before a binding).
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
