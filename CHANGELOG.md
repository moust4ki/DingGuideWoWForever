# Changelog

## v1.3.0

**Requires QuestieDB**: download `QuestieDB-Forever.zip` from
https://github.com/Questie/QuestieDB/releases/latest and extract its `QuestieDB` folder into
`Interface/AddOns`.

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
