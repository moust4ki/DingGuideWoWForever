# Ding!

A free, open-source leveling guide for **World of Warcraft: Forever** (client 1.60). Ding
shows what to do next, points the way with its own arrow and moves forward on its own as you
accept, complete and turn in quests. It is built from the ground up to be played **with a
gamepad**.

[Download on CurseForge](https://www.curseforge.com/wow/addons/ding-xp-and-leveling-guide)

> **Version 1.4**, released during the Forever beta.
> **Alliance 1–60**: Human, Dwarf/Gnome and Night Elf starting zones up to level 20, then a
> common route to 60. **Horde 1–60**: Orc/Troll, Tauren and Undead starting zones up to
> level 20, then a common route to 60.
> Levels 30 to 60 have not been played in game yet (the beta stops at 30): they are checked
> by the offline tools only. Please report what you find in the
> [issues](https://github.com/moust4ki/DingGuideWoWForever/issues).

## Installation

Install Ding from [CurseForge](https://www.curseforge.com/wow/addons/ding-xp-and-leveling-guide),
or copy the `Ding/` folder of this repository into `World of Warcraft/_forever_/Interface/AddOns/`
(during the beta: `_classic_beta_` instead of `_forever_`). That is all: Ding carries its own
game data, **QuestieDB is no longer needed** (you may remove it if no other addon uses it).

Ding has its own arrow: **TomTom is not needed**. If it is installed, its arrow can be used
instead from the *Arrow* tab of the settings (off by default).

## Features

- **Guides optimized for XP per hour.** The routes are generated offline from the game data:
  quests grouped to avoid back-and-forth, poor-value detours left out, never a quest above
  your level (one level above at most). The new quests of Forever are included.
- **A setup assistant** at the first launch: four short screens, a few choices each, the
  recommended ones already selected. How you play (gamepad or keyboard and mouse), what Ding
  does for you (quests, gray items, repairs), your route (hearthstone, group quests, death
  skips), then the guide to start with. "Keep the recommended settings" ends it from any
  screen; everything else is on by default, and all of it can be changed later in the settings.
  Run it again from the *Guide* tab ("Run the setup assistant again") or with `/ding intro`.
- **Resumes where you really are.** Ding picks the guide for your race, class and level. When
  you resume, it first sends you to finish the guide's old quests still in your log, then
  skips what you have done.
- **Guide window.** One line per action and objective, with counters (2/6), done / to do /
  not yet possible states and the guide's notes. Hover a line to see its quest (name, level,
  objectives); click it to send the arrow there. Right-click the window to mark the step as
  done or skip it for later: steps left by hand keep their own color (violet: marked done,
  amber: skipped); go back to such a step ("previous") to undo it, from the line under it or the
  same menu. Minimizes to a single line, automatically in combat if you want. Closing it
  hides the arrow too; the minimap button brings both back.
- **Waypoint arrow.** Distance and time to the target, red with "turn around" when it is
  behind you. Among the monsters you have to kill, it tells you you're in the area. When you
  die, it leads your ghost back to your corpse.
- **Automation.** Accepts and turns in the guide's quests when you talk to an NPC (you still
  choose your reward), catches up on missing prerequisite quests, can skip gray quests.
- **Quest item button.** A floating button with the item the step needs: one press of a
  gamepad button uses it. Shows the cooldown and when you are out of range.
- **NPC directory.** Bags full, out of food, a weapon to learn? The directory (its key
  binding, the pin button of the guide window, or `/ding find`) lists, anywhere in the world,
  the NPC of each kind that is the fewest seconds away: vendor, repair, food and drink,
  ammunition, reagents, poisons, innkeeper, flight master, class trainer, weapon masters by
  weapon, profession trainers by profession, trade supplies, bank, auction house, stable
  master. A second tab lists the capitals of your side and the neutral towns (Booty Bay,
  Gadgetzan, Ratchet, Everlook) with what each offers. Each row says how long it takes and by
  which way (flight, boat, zeppelin, tram, hearthstone). Pick one: the arrow takes you there
  leg by leg, the guide window says what to take, and the guide resumes once you talk to that
  NPC. When a weapon you can use
  but do not know is in your bags, or its weapon master is close by, the guide window says
  where to learn it.
- **Minimap button.** Left-click for the settings, right-click to show or hide the guide.
- **Community guides.** Ding runs other guides too: install a guide pack and pick it in the
  settings (*Guide* tab, first list), then its section in the second list. See
  [Community guide packs](#community-guide-packs).
- **DingDB, an open game database.** Ding's game data (quests, NPCs, objects, items, places,
  names in 9 languages) is open: other addons can read it (`LibDingDB`), and anyone can correct
  it or add to it. See [docs/dingdb.md](docs/dingdb.md).
- **Languages.** English, French, German, Spanish (Spain and Latin America), Brazilian
  Portuguese, Korean, Simplified and Traditional Chinese: Ding follows your game's language.
  Quest, NPC and item names come from Ding's game data in that language. Each language has its own
  files; to add one, see [docs/SPEC.md](docs/SPEC.md#languages).

## With a gamepad

On first launch, Ding opens its setup assistant (the D-pad picks a choice, A ticks it, LB / RB
change screens, Y keeps the recommended settings, B closes), then its settings on the
**Keybinds** tab: bind a button to "Open Ding settings" (for example LT+Start), then to "Next
step", "Previous step" and "Use the quest item".
In the settings window: A selects, B closes, LB / RB change tabs, the D-pad picks and adjusts,
Y resets to default.

The guide window never takes a button away from the game. To browse it with the gamepad,
bind "Browse the guide with the gamepad" (focus mode): the D-pad picks a line, A sends the
arrow there (or uses the item), X shows its quest, LB / RB change steps, Y minimizes the
window, B gives the gamepad back to the game. Up from the first line, the focus reaches the
NPC directory's button.

The NPC directory (bind "NPC directory", or use the guide window's pin button): LB / RB change
tabs, the D-pad picks, A opens a list or sends the arrow, B goes back or closes. To cancel a trip:
the "Cancel the trip" line under it in the guide window (a click, or A in focus mode), the first
entry of the right-click menu, the directory's first row, or `/ding cancel`; moving the guide
(next, skip, mark as done...) ends it too.

The settings also move the window, the arrow and the item button with the D-pad, set the
opacity and the size, minimize the guide in combat and pick the button names (Xbox or
PlayStation). They also open from the window's menu button, the minimap button or
*Options > AddOns > Ding*.

## With a keyboard and mouse

Everything works without a gamepad too. In the settings, click to choose, toggle or confirm
(click again when a button asks), right-click to put a setting back to its default or to
unbind a key, and press Escape to close. To bind a key, click its row and press the key. To
move the guide window, the arrow or the item button, drag it with the mouse, then click
Save. In the setup assistant, click a choice, Previous, Next or "Keep the recommended settings";
Escape closes it. Chosen "Keyboard and mouse" there, the Keybinds tab does not open after it.
The gamepad hints at the bottom ("A Open", "Y Reset"…) can be clicked too. Without a
gamepad plugged in, that help speaks of the mouse and the keyboard, and the buttons show no
gamepad button.

## Commands

`/ding` show/hide · `/ding config` settings · `/ding intro` (the setup assistant again) · `/ding list` (guides and their sections) ·
`/ding guide <id>` · `/ding where` (your position, for guide authors) · `/ding passages [n]` (the
lifts, gates and tunnels near you, for testers; the arrow points at the n-th) · `/ding import` (a guide as
text) · `/ding export [id]` (a guide as text) · `/ding find <text>` (the NPC directory: a service,
a weapon, a profession or a name, in your game's language or in English, such as
`/ding find gun`, `/ding find bank`, `/ding find Buliwyf`) · `/ding cancel` (end the directory's
trip: the arrow follows the guide again) · `/ding next` · `/ding prev` · `/ding skip` · `/ding back` · `/ding reset` (take the guide up
where you are) · `/ding scale <0.5-1.5>` · `/ding arrow` · `/ding arrowflip` ·
`/ding minimap` · `/ding debug`

## Community guide packs

Anyone can write a guide for Ding and share it as a **guide pack**: a small addon of Lua
files with quest ids, places and notes, which Ding plays like its own guide. Once
installed, a pack shows up in the settings (*Guide* tab) next to Ding's guide.

**Write a pack:** [docs/guide-packs.md](docs/guide-packs.md) explains every file, step by
step, how to test it in the game and how to check it offline. A working example to start
from: [examples/DingExamplePack](examples/DingExamplePack).

**Or a guide as text, with an AI:** [docs/create-a-guide-with-ai.md](docs/create-a-guide-with-ai.md)
gives the format, a complete example and a prompt ready to copy. Paste the result in the
game with `/ding import`: Ding checks every id and lists what is wrong, step by step.

**Known packs:** none yet. Published one? Open an
[issue](https://github.com/moust4ki/DingGuideWoWForever/issues) titled `Guide pack: <name>` and it
will be listed here.

## Development

Nothing runs in the game here: the offline tools load Ding with a mocked WoW API and play
every guide. See [tools/README.md](tools/README.md) and [CLAUDE.md](CLAUDE.md).
Every pull request runs the whole suite (`.github/workflows/tests.yml`); pushing a `v*` tag
publishes the release on CurseForge and GitHub once the suite passes
(`.github/workflows/release.yml`).

## License

Ding is free software, released under the **GNU GPL v3** (see [LICENSE](LICENSE)): you may
use, modify and redistribute it, provided you publish your modified versions under the same
license, with their source code.

Everything built on Ding stays free: a guide pack for Ding (an addon that calls
`Ding.RegisterGuidePack` and `Ding.RegisterGuide`) is a derivative work and must be released
under the GPL v3 as well. There is no exception.

The Noto Sans fonts in `Ding/Media/Fonts` are under the SIL Open Font License 1.1
(`OFL.txt`). TomTom is a separate addon; Ding ships none of its code.

### Credits

DingDB, Ding's game data (`Ding/DB`: quests, NPCs, objects, items, places and their names), is built
from the database of [Questie](https://github.com/Questie/Questie) and
[QuestieDB](https://github.com/Questie/QuestieDB), released under the GNU GPL v3: thanks to
their authors and contributors. See [`Ding/DB/CREDITS.md`](Ding/DB/CREDITS.md).
