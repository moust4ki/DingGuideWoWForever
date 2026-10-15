# Changelog

## v1.8.0

Nothing else to install: QuestieDB is no longer needed, and TomTom stays optional.

- **Problem with this step?** An orange flag in the guide window's title bar, right beside the
  NPC directory's pin (with a gamepad: up from the first line in focus mode), its own key binding
  (Settings > Keybinds, a button or two like the others) and `/ding bug`. A window shows in plain
  words what the report will contain: the guide, the step and its place in the guide's file,
  where you stand, your character's level, race, class and side, the step's quests and the ones
  of your log the next steps need, with their counters, what the arrow points at, the settings
  that change your route, Ding's and the game's versions. Never your character's name, your
  realm or your account.
- Pick what went wrong among four ready answers (handy with a gamepad) and add your own words if
  you can type, then **Create the text**: 1. the address of the GitHub page to open, 2. the text
  to paste into it, each selected by its button for Ctrl+C (an addon cannot copy for you). Ding
  keeps your last 20 reports in its
  saved variables (`WTF\Account\<account>\SavedVariables\Ding.lua`), so a player without a
  keyboard can send that file instead; "Restore all defaults" keeps them.

## v1.7.1

Nothing else to install: QuestieDB is no longer needed, and TomTom stays optional.

- The arrow no longer leads to monsters you have already killed enough of, when the game names
  them in your language and Ding only knows their English name (Forever's own monsters, the
  Skyborne start among them): it matches the quest's objectives by their order too. Their
  marks and counters above the nameplates come back the same way.
- "Choose quest rewards" never takes a piece your class cannot wear (a druid's reward was taken
  in mail): only what you can wear counts as an upgrade, and when none is, the reward that
  sells for the most among what you can use. The chat says which reward Ding took and why.

## v1.7.0

Nothing else to install: QuestieDB is no longer needed, and TomTom stays optional.

- **Dungeon quests**: a new pack, **Ding! - Dungeon quests** (Settings > Guide, under
  "Dungeons"), with one guide per dungeon for your side, listed by level (the ones above your
  level are greyed, you can still pick them). Each guide takes you to every quest giver of that
  dungeon and through the chains that lead to them, in an order that keeps the trips short, then
  to the dungeon's entrance, then through the dungeon with a note for each quest (which boss or
  monster drops what, where it waits), and back to the turn-ins and the quests they open. Every
  dungeon from Ragefire Chasm, the Deadmines and Wailing Caverns to Blackrock Depths, Lower
  Blackrock Spire, Dire Maul, Scholomance and Stratholme, and Forever's own: the Hall of Thanes,
  the Ruins of Lordaeron, the Excavation Site of the Wetlands and the City of Dalaran.
- The first step of each chain says what it brings (a weapon of your choice, armor of your
  kind, a ring, a big amount of XP) and when it is long or far away; very long or far chains are
  optional and say why. A quest that starts from a drop shows only once the drop is in your bags.
  Raids, the Upper Spire and the level 60 armor-set chains are not in the pack.
- A step that takes you to a dungeon's entrance now passes once you are inside: the game gives
  no position in a dungeon, and the step stayed on screen for the whole run.
- "Take this guide up where I am" keeps your place: it stops only on a quest of your log still
  to finish or a quest of the route you never took. With "Elite quests" turned on, it used to
  send you back to the first elite quest of the section.
- The guide window stays as it is in combat: minimizing it there is now an option, off by
  default (Settings > Appearance, "Minimize the guide in combat"). It was on for everyone: turn it
  on again there if you liked it.
- The arrow says "You're here" 6 yards from the place or the NPC (it was 10, and the arrow faded
  while you still had a few steps to walk), and "You're in the area" 25 yards from the monsters
  or the objects to gather (it was 40, more than an attack's reach).
- The aids are on for a new install: the quest marks and counters above the monsters, the line
  in their tooltip, and enemy nameplates shown farther. The game hides the enemy nameplates
  until you press V: Ding shows them once so that its counters appear, and says so in the chat.
- Upstairs and downstairs: when the NPC or the object waits on another floor, the arrow no
  longer says "You're here" in the middle of the building. It says "The NPC is one floor up",
  "at the top" or "one floor down", and stays on screen until you find the stairs.

## v1.6.1

Nothing else to install: QuestieDB is no longer needed, and TomTom stays optional.

- Gamepad: while you hold the first button of one of Ding's combinations (RB of RB + Up), the
  game's own combinations work again: LB + RB + Left / Right (the action bar's pages), LB + RB +
  Down (the chat)... Ding kept every button while it waited for the second one. With a Ding
  window open, the buttons the window does not use go on to the game too.

## v1.6.0

Nothing else to install: QuestieDB is no longer needed, and TomTom stays optional.

- **Class quests**: a new pack, **Ding! - Class quests** (Settings > Guide, under "Class"),
  with one guide for your class and side: its important quest chains in level order, from the
  level they open. Druid: bear form, cure poison, aquatic form, Forever's Great Cat Spirit,
  Torwa Pathfinder. Hunter: your first pet. Mage: the robes, Tabetha's wand, the Magecraft
  chain. Paladin: Redemption, Verigan's Fist, the warhorse, the Mightstone, the charger.
  Priest: your first robe and your race's prayers. Rogue: Pick Lock, your poisons, the Azure
  Key. Shaman: the earth, fire, water and air totems. Warlock: the voidwalker, the succubus,
  the felhunter, the felsteed, Niby's quests, the dreadsteed. Warrior: Defensive and Berserker
  Stances, the Whirlwind weapon. Forever's own class quests are in: the Skyborne's, the
  Forsaken paladins' story, the Alliance shamans' totems, the Human and Gnome hunters' pets,
  the Syndicate of Ravenholdt for rogues...
- Each chain says, under its first step, from which level it opens and what it is for ("From
  level 10: the chain that teaches Bear Form"), and the step that teaches it says so. You only
  see your own class's guide; pick your leveling guide again in Settings > Guide when you are
  done. Quests inside a dungeon show when that dungeon is on in Settings > Route.
- **Wetlands (27-29)**: Carnage, the last quest Rethiel the Greenwarden gives, now comes after
  Blisters on the Land is turned in (he does not offer it before), and as an elite quest: it
  shows only when **Elite quests** is on in Settings > Route.
- A step you marked done by hand keeps its mark when a new version of Ding writes the guide again
  and the step moves: the mark used to stay on the step number, and fell on another step
  ("marked as done by hand" on a step you never touched).
- A turn-in step passed because you already turned the quest in now says "already done"
  instead of "it does not concern you now".
- The ring around the arrow's target on the minimap sits on the target in a city's inside view
  too (Ironforge): it used the outdoor scale there and only reached the target once you were
  on it.

## v1.5.0

Nothing else to install: QuestieDB is no longer needed, and TomTom stays optional.

- **Themes**: choose the look of Ding! in Settings > Appearance. While you go from one theme to
  the next, the guide window, the arrow and the settings show it at once; A (or a click) keeps
  it, leaving the themes without it brings yours back.
  - **Forever · Halo**: no frame, a soft dark veil under the text, the game's gold and its own
    font for titles, light gamepad buttons like the game's.
  - **Forever · Slate**: a dark panel with thin gold lines, lines tinted by their state, a gold
    marker on the gamepad's focus, the arrow's text on a small plate.
  - **Forever · Bands**: no window, a band behind each line, outlined text that stays readable
    on snow and sand, a blue accent.
  - **Ding dark**: the look of the previous versions.
- **The default look is now Forever · Halo, for everyone**, also if you played an earlier
  version: to get the old look back, pick **Ding dark** in Settings > Appearance. The
  background's opacity follows each theme (Halo: 60 %) until you move the slider yourself; if
  you had chosen your own, it is kept.
- Quest names are in the game's quest gold, items and monsters in light blue; in the Forever
  themes nothing still to do is red anymore (red reads as danger in the game).
- The card shown when you hover a line of the guide window (X in focus mode) now has the
  theme's look.
- **The arrow's look** has its own picker in Settings > Arrow and maps: the theme's arrow (the
  default), Halo's gold arrow, Slate's, Bands', Ding!'s, the new **Gold** arrow or the game's
  minimap arrow, with any theme; the real arrow shows each one while you choose. If you had
  picked the minimap arrow, you keep it.
- **A new icon**: Ding!'s arrow in gold, with a burst of light, on the minimap button and in the
  AddOns list.
- The arrow says where under the target's name: the flight master and its zone, the zone of a
  target outside yours, or the stop of the farming loop ("Farming loop: stop 2 of 10").
- **Keybinds with the gamepad fixed**: a button you bind now replaces the old one (it used to
  be added beside it, and the row kept showing the first one, often "RB"). **Any two gamepad
  buttons make a shortcut**: hold one, press the other (LB + Up, RB + Up, LT + A, LT + D-pad
  down…); Ding! watches them itself, like Easy Controller's RB + Down, and while you hold the
  first button it keeps the second one from the game (out of combat). A button the game's
  gamepad interface or another addon (Easy Controller...) also uses is named, and A binds it
  anyway. Tap B to cancel, hold B to bind B itself. If an action of Ding! ended up on several buttons, its row says "and 2
  more": bind it again, or press Y, to clean it up.
- **RB + Up opens Ding!**: "Open Ding! settings" gets **RB + Up** on the gamepad (LB + Up if you
  already use RB + Up), and the setup assistant shows it on its first screen; with the keyboard
  and mouse, it names the minimap button and the guide window's menu button. `/ding help` says
  it too. A button you gave it yourself is kept.
- **Ding!'s windows keep their buttons**: in focus mode, the settings, the directory and the
  setup assistant, the D-pad, A, B and the shoulders are Ding!'s while the window is open, even
  with the game's gamepad interface and Easy Controller (the D-pad used to cast the gamepad
  bar's spells in focus mode).
- **Easy Controller and Ding! side by side**: Ding! never changes the game's gamepad settings
  and its default button never takes a key Easy Controller uses; Ding!'s windows work as usual
  with Easy Controller on.
- Settings: on a line with a description, the two lines are centered on the line and its check
  box (the label used to touch the line's frame).

## v1.4.0

Nothing else to install: QuestieDB is no longer needed, and TomTom stays optional.

- **Setup assistant** at the first launch: four short screens to choose how you play, what
  Ding! does for you, your route and the guide to start with, the recommended choices already
  selected. "Keep the recommended settings" ends it at once; run
  it again from the Guide tab or with `/ding intro`.
- **NPC directory**: open it from the new button of the guide window, a key binding or
  `/ding find <text>`.
  - **Nearby**, anywhere in the world: the nearest vendor, repairer, innkeeper, bank, auction
    house, flight master, class trainer, stable master, ammunition, food and drink, reagents,
    poisons, trade supplies and profession trainers.
  - **Cities**: the six capitals and Booty Bay, Gadgetzan, Ratchet and Everlook, service by
    service, named in your game's language.
  - **Weapon masters, by weapon**: only the weapons your class can learn and does not know yet.
  - The arrow takes you there the fastest way, flights, boats and zeppelins included, and the
    guide window shows the whole way.
  - Cancel the trip from the "Cancel the trip" line of the guide window, its right-click menu,
    the directory or `/ding cancel`; moving the guide yourself (next, skip, mark as done) ends
    it too.
- **Weapon to learn**: when you carry (or a quest offers) a weapon your class can use but you
  have not learned, the guide window says so, why, and which weapon master teaches it; a right
  click (Left in focus mode) and it is never suggested again.
- **Quest monsters**: a mark above the nameplate of the monsters your quests need, with the
  count; a line in their tooltip; an option to see enemy nameplates from farther.
- **Beside an NPC's window**: what the guide does with each quest the NPC offers: now, later in
  the guide, in another section, or not in the guide and why.
- **Plain words**: what a color, an icon or a number means is now said in words too.
  - Hover a line of the guide window (X in focus mode with a gamepad): done, still to do, not
    possible yet and why, marked by hand or skipped; the quest's level, and why it is orange
    when it is above yours.
  - Quest lines done say so ("Turned in …"); the next steps sit under a "Next steps" header;
    "and 2 more" instead of "+2".
  - With a gamepad, focus mode shows what A, X and B do.
  - The minimized window, the minimap pins, the item button, the quest monsters' tooltip line,
    the NPC directory ("8 min away", "by flight"), the panel beside an NPC ("level 24") and the
    arrow ("distance unknown", "farming loop: 2 of 10") say what they show.
- **Why the guide does this**: when the guide sends you out of your way (a trip to another zone
  and back, a quest taken now for much later), one line under the step says why, with the XP
  and the time ("Why this detour (about 5 min): turning in “The Legend of Stalvan” opens a chain
  of quests worth a lot of XP (about 13,000)."). The whole reason shows in the tooltip of the
  step's rows (mouse over a row, or X in focus mode). Option "Guide explanations" (Guide tab).
- **Guide window**
  - Each quest's level and name above its objectives; the next steps show the quest's level too.
  - Texts are never cut: rows grow to show them whole.
  - Messages about the whole window (quest log or bags almost full, the way there) get a box of
    their own; the quest log one opens the cleanup page.
  - A step you marked as done or skipped by mistake: go back to it and undo it, from the line
    under it or the right-click menu.
  - What the step asks comes first; everything else (the way there, other quests on your way,
    the weapon to learn, new spells at the trainer, a gear upgrade, bags or quest log almost
    full) comes below a line, under "Good to know", never as a red line to do.
  - Another quest's objectives shown on the way sit under a line that names that quest and
    says why it is there, in grey: they no longer look like the step's own work.
  - A gear upgrade says how much better it is in words ("Clearly better than … for your class")
    instead of a bare "+4", and hovering it tells what it replaces and which stats change.
    **"Suggest better gear"** (Automation tab, on by default) turns these suggestions off.
  - The lines under a row are plain sentences ("To equip it, use the item button on screen.").
  - A quest of a chain whose parts share one name says which part ("The Legend of Stalvan (part 2
    of 13)"), so turning in one part and taking the next no longer read alike.
  - Hover cards are shorter: an objective's card shows that objective and its quest in one line;
    "Why?" only appears when the guide has a reason.
  - Numbers are written your language's way ("13 000" in French).
  - Hearthstone steps name the place in your language ("Set your hearthstone at the inn:
    Darkshire" reads "… : Sombre-Comté" in French).
  - A quest you turned in, seen again with "Previous", says so; a "keep this item" reminder is
    a line under the step, not a line to do.
- **Settings windows** (the settings, the NPC directory, the setup assistant, import / export)
  - A little denser: lower title and tab bars, rows and gaps; every text still shows whole.
  - **"Settings windows size"** (Appearance tab, 60 % to 120 %, 85 % by default): their size on
    screen, apart from the guide window's own "Window scale".
  - In the NPC directory, with a gamepad, the A button takes the place of a list's arrow and no
    longer covers the time.
- **Travel**
  - Walking passages (lifts, tunnels, bridges, city gates, portals) and islands: the arrow no
    longer points through a cliff or across the sea. The passages are not checked in game yet:
    `/ding passages` lists the ones near you; please report a wrong one.
  - A target inside a dungeon leads to the dungeon's entrance.
  - The arrow keeps the target it follows until another one is clearly nearer.
- **Leveling routes**
  - 17 more quests that cost almost nothing on the way.
  - One trip per class at weapon masters; every move step says where it goes.
  - Bank steps come at the banker and say which quest needs the item.
  - Notes say "the chest" when the target is not an NPC, and "this one roams" only for NPCs
    that move.
  - Horde: the Forever quest "This Is Spinal Axe" is left out (a long wait for little XP).
- **Fixes**
  - Taken up again after a zone done out of order, the guide no longer jumps ahead.
  - "Next" moves to the step the preview shows, one step at a time.
  - No more "AddOn blocked" popup on `/ding export`.
  - With a gamepad, each action shows once in the windows.

## v1.3.0

**QuestieDB is no longer needed**: Ding now carries its own game data, built from Questie's
database (thanks to its authors). You may remove the QuestieDB addon if no other addon uses it.

- Ding is now called **Ding!**: in the addon list, its windows, guide names, messages and
  options. Your settings and progress stay as they are.
- New leveling routes from 1 to 60, for both factions and every start.
  - **Ding! - Leveling**, the new default guide: one route over several zones, with Forever's
    quests, quests up to 2 levels above you and monsters up to 1 level above, and no more
    "kill monsters until level X" walls in the middle of a zone.
  - **Ding! - Zones**: the previous guides, one section per zone.
  - **Ding! - Items**: guides for items worth a detour. First one: the Cozy Sleeping Bag
    (up to 3% more experience), for both factions.
  - Skyborne: one start for each faction, the isle's class quests and, for the Alliance, the
    way off the isle.
- Guides are grouped by category in the Guide tab: "Leveling (XP)", then "Items".
- Guides as text: `/ding export` copies the current guide, `/ding import` pastes one. A page
  on GitHub explains how to write one, with an AI if you like:
  https://github.com/moust4ki/DingGuideWoWForever/blob/main/docs/create-a-guide-with-ai.md
- Travel: the arrow takes the fastest way, with known flight paths, boats, zeppelins, the
  tram, your hearthstone and teleports. The destination is highlighted on the flight map,
  and the target's zone is shown under the arrow and on the world map.
- New route options: hearthstone steps (on), death skips (off), elite quests (off), dungeon
  quests (off, or chosen dungeon by dungeon), take the planned flight automatically (off).
- Along the way: experience and kills left on level steps, objectives of the other quests
  of your log when you walk among their monsters, the best quest reward pointed out, grey
  items sold and repairs at merchants, gear upgrades on the item button, a list of nearby
  services, a reminder for your class trainer, pins on the minimap.
- Steps without a quest: kill, collect, buy, talk to, use an item, open an object, equip.
  A quest that needs an item you must buy first is no longer turned in without it.
- Up to 3 next steps shown under the current one.
- The settings are sorted by what they are for: six tabs, long lists on their own page,
  "Defaults for this tab".

## v1.2.0

**Requires QuestieDB**: download `QuestieDB-Forever.zip` from
https://github.com/Questie/QuestieDB/releases/latest and extract its `QuestieDB` folder into
`Interface/AddOns`.

- Community guides: Ding can now run guides written by other players. A guide pack is a
  small addon that depends on Ding; once installed, pick it in the settings.
  - The Guide tab now has two lists: the guide (Ding's built-in guide first, then the
    installed packs, with their author and the levels they cover for your character), then
    its section (for Ding's guide, the leveling zone).
  - Picking a guide starts the right section for your character, where you really are.
    Ding remembers the guide of each character; if a pack is disabled, Ding goes back to its
    own guide.
- Writing a guide pack: everything is explained on GitHub, with a complete example pack and
  an offline checker:
  https://github.com/moust4ki/DingGuideWoWForever/blob/main/docs/guide-packs.md
- `/ding list` shows the sections of each guide. New `/ding where` prints your position as a
  step ready to paste into a guide.

## v1.1.2

**Requires QuestieDB**: download `QuestieDB-Forever.zip` from
https://github.com/Questie/QuestieDB/releases/latest and extract its `QuestieDB` folder into
`Interface/AddOns`.

- Keyboard and mouse players can use every setting. Without a gamepad, nothing could be
  confirmed: the settings only showed gamepad buttons.
  - Click to choose, toggle or confirm (the button says "Click again to confirm").
  - Right-click a setting to put it back to its default, or a key binding to unbind it.
  - Escape closes the settings.
  - A key binding already in use: click to replace it, right-click to cancel.
  - Moving the guide window, the arrow or the item button: drag it, then click Save (or
    Cancel, or Reset); Enter saves and Escape cancels.
  - The help at the bottom of the settings is made of buttons you can click: "A Select",
    "B Back", "Y Reset" and "LB/RB Tabs" do what their gamepad button does, in the move mode
    too.
  - A gamepad enabled in the game's options but not plugged in no longer counts: the help
    then speaks of the mouse and the keyboard, and switches back when you plug it in.
- Guides regenerated with the latest QuestieDB data, which marks 13 Forever quests as not
  available to Humans:
  - they are no longer in the Human guides (Northshire, Elwynn, Westfall, Loch Modan);
  - the Dwarf and Gnome guides keep the ones in their zones;
  - the shared Alliance guides for Redridge and Duskwood leave them out for every race.

  Ding finds your place again in the updated guides.

## v1.1.1

**Requires QuestieDB**: download `QuestieDB-Forever.zip` from
https://github.com/Questie/QuestieDB/releases/latest and extract its `QuestieDB` folder into
`Interface/AddOns`.

- Quests above your level are no longer held back: holding them until you reach their level
  meant far too much grinding. They show in orange with their level, and Ding takes them as
  usual. Quests taken on the way, ahead of the guide, still have to be at your level.
- Right-click the guide window: "Mark as done" or "Skip, do it later". A step you marked done
  shows in violet when you come back to it, a skipped one in amber; green stays for what the
  game confirms. "Take this guide up where I am" clears these marks: what is not really done
  is to do again. On a gamepad, the "Next step" and "Skip step" bindings do the same.
- Closing the guide window hides the arrow too. The minimap button, your binding, /ding or
  the new "Show the guide and its arrow" box (Settings, Guide tab) bring both back.
- With "Hide in dungeons", the arrow now hides in dungeons as well. It used to stay, showing
  only its target's name and "?".

## v1.1.0

**Requires QuestieDB**: download `QuestieDB-Forever.zip` from
https://github.com/Questie/QuestieDB/releases/latest and extract its `QuestieDB` folder into
`Interface/AddOns`.

- Ding now speaks German, Spanish (Spain and Latin America), Brazilian Portuguese, Korean,
  Simplified Chinese and Traditional Chinese, as well as English and French: the interface
  and every guide follow your game's language. Quest, NPC and item names come from QuestieDB
  in that language.
- Korean and Chinese clients use the game's own font, which has their characters.
- Never a quest above your level, in game too: if you are behind the guide (skipped quests,
  deaths), a quest above your level shows in grey with "level N required" and a reminder to
  finish your level on nearby monsters first. Ding no longer takes it for you, and the guide
  goes on.
- Quests taken on the way: when an NPC offers a quest the guide takes later, Ding takes it
  now if it is not above your level and your quest log has room. It saves a trip back.
- The objectives of a finished quest now show as done (green, full counter) in the guide
  window, also when you go back to a past step after turning the quest in. They stayed red
  at 0/10 before.
- Taking a guide up where you are no longer skips the quests you still have to turn in:
  quests from earlier in the guide that are in your log, ready or not, are finished and
  turned in first. At login, Ding now waits for your quest log before placing you, so it
  cannot skip them either.
- After an update that changes a guide, Ding finds your place again instead of keeping a
  step number that now points elsewhere.
- Some place names have no official translation we could confirm and stay in English:
  corrections are welcome on GitHub.

## v1.0.0

First release of Ding, published during the WoW Forever beta.

**Before you start**

- **Install QuestieDB first.** It is a separate addon, not Questie, and it is not on
  CurseForge: download `QuestieDB-Forever.zip` from
  https://github.com/Questie/QuestieDB/releases/latest and extract its `QuestieDB` folder into
  `Interface/AddOns`. Ding does not load without it.
- **Levels 30 to 60 have not been played in game yet.** The Forever beta stops at level 30,
  so the guides beyond 30 were only checked by our offline tools: every quest, prerequisite
  and route is verified against QuestieDB, and the whole chain is played by a simulated
  character up to 60. Expect rough edges there, and please report them on GitHub.
- **The routes are cautious:** never a quest above your level. Some zones come back later in
  the guide, once their higher quests are open.

**What's in it**

- Alliance 1–60: Human, Dwarf/Gnome and Night Elf starting zones up to level 20, then a
  common route to 60.
- Horde 1–60: Orc/Troll, Tauren and Undead starting zones up to level 20, then a common route
  to 60.
- Routes generated by our own optimizer for XP per hour, including the new quests of Forever.
- Guide window: one line per action and objective with counters, quest card on hover,
  minimizes to one line, opacity, size and width settings.
- Waypoint arrow: distance and time, "turn around", hunting areas, leads your ghost back to
  your corpse. TomTom's arrow can be used instead (optional).
- Automatic accept and turn-in, missing prerequisite quests, optional skipping of gray quests,
  resume where you really are.
- Quest item button with cooldown and range.
- Built for gamepads: keybinds, settings driven with the gamepad, focus mode for the guide
  window, Xbox or PlayStation button names.
- Minimap button, English and French.

Bugs and suggestions: https://github.com/moust4ki/DingGuideWoWForever/issues
