# Changelog

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
    service.
  - **Weapon masters, by weapon**: only the weapons your class can learn and does not know yet.
  - The arrow takes you there the fastest way, flights, boats and zeppelins included, and the
    guide window shows the whole way.
  - Cancel the trip from the "Cancel the trip" line of the guide window, its right-click menu,
    the directory or `/ding cancel`; moving the guide yourself (next, skip, mark as done) ends
    it too.
- **Weapon to learn**: a line in the guide window when your class can learn a new weapon, with
  the weapon master to see.
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
  - A quest you turned in, seen again with "Previous", says so; a "keep this item" reminder is
    a line under the step, not a line to do.
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
