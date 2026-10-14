# Ding! beside other addons

What Ding! changes in the game, what the gamepad addons of WoW Forever change, and how they stay
out of each other's way. Checked by `tools/tests/compat_test.lua`, `chords_test.lua` and
`keybinds_test.lua` (the mocked client); the list at the end is what only the game can confirm.

## What Ding! changes in the game

| | Ding! |
|---|---|
| Game settings (CVars) | `nameplateMaxDistance` only, with "Show enemy nameplates farther" (the value before is put back when it goes off). **Never** the gamepad's: `GamePadEmulateShift` / `Ctrl` / `Alt`, cursor, camera. |
| Saved key bindings | Only what the player binds in the Keybinds tab: keys and single gamepad buttons in the game's bindings (its Keybindings list them under "Ding!"); two gamepad buttons (a chord) in Ding's own saved settings (`DingDB.chords`), with "Open Ding! settings" on RB + Up by default (below). |
| Temporary (override) bindings | On its own frames only, while a window or mode of Ding's is open: the settings, the setup assistant, the NPC directory, import / export, the guide's focus mode, the move mode. Removed when it closes and before every fight. |
| Frames taking the gamepad's buttons | `DingCaptureFrame` while a Keybinds row waits for a button; `DingPadInput` while a window of Ding's is open, for that window's buttons only (any other button goes on to the game); `DingChordInput` while a chord's first button is held, out of combat, for that chord's second button only. |
| Hooks | The flight map's `TakeTaxiNode`, the unit tooltip (a line about quest monsters). |
| Global names | `Ding`, `LibDingDB`, `DingDB` / `DingCharDB` (saved variables), frames named `Ding…`, `BINDING_*_DING_*`. |
| Slash command | `/ding` |

## Easy Controller

The author's own gamepad addon (chat keyboard, wheels, back paddles, gamepad mapping).

| | Easy Controller |
|---|---|
| Game settings | `GamePadEmulateAlt` / `GamePadEmulateCtrl` (its "triggers as modifiers": RT or LT made Alt / Ctrl so every trigger layer has keys of its own); gives back `GamePadStickAxisButtons` and camera speeds its older versions changed; the Edit Mode layout (compact gamepad bar); vibration. |
| Saved key bindings | Its own commands (`CONTROLLERKEYBOARD_*`, its toggles); none of Ding's. |
| Temporary (override) bindings | Its mapping (free inputs, the game's buttons it replaces, the shoulders kept), set again a moment after any override binding changes (it hooks `SetOverrideBinding*` and `ClearOverrideBindings`); its windows take the gamepad while open: chat keyboard, quick phrases, wheels, its settings, its first-launch guide. |
| Its own chord | Its settings' shortcut, RB + D-pad down by default: watched (`IsKeyDown` of both buttons), never bound; the second button's own action runs too. |
| Global names | `ControllerKeyboard…` frames, `ControllerKeyboardDB`; slash `/ec`, `/easycontroller`, `/ck`, `/controllerkeyboard`. Nothing in common with Ding's. |

**How Ding stays out of its way, and keeps its own buttons**

- Ding never changes the gamepad modifiers (`GamePadEmulate*`) Easy Controller sets up. Two
  gamepad buttons make a chord of Ding's whatever they are (LB + Up, RB + Up, LT + A…): Ding
  watches it itself, as Easy Controller does its RB + Down, instead of a game binding (the game
  binds a button with Shift, Ctrl or Alt only, and its gamepad interface went before such a
  binding: LT + Start did nothing in play).
- While a chord's first button is held, out of combat, Ding reads the gamepad's buttons first
  and keeps the chord's second button from the game, so the gamepad bar does not act too (Easy
  Controller's RB + Down lets it act). The first button keeps its own use (RB: the game's
  targeting); any other button goes on. In combat that cannot change: the chord still runs, and
  the second button's own action with it.
- A key or a chord Easy Controller has (its mapping's override bindings; its shortcut, read
  from its saved settings) is named in the Keybinds tab ("RB+Down: Easy Controller uses it too
  and may win in play. A binds it anyway, B cancels"): A binds it, Easy Controller's own stays
  as it is. The default chord of "Open Ding! settings" never takes one.
- Ding's windows (settings, setup assistant, NPC directory, import / export, focus mode, move
  mode) read their buttons first, before any binding (`DingPadInput`), so neither the game's
  gamepad interface nor Easy Controller's mapping (which sets its bindings again a moment after
  Ding's) goes before them: reported, in focus mode with Easy Controller on the D-pad cast the
  gamepad bar's spells. Only the window's buttons are kept. An earlier build waited while one of
  Easy Controller's windows was shown: it left Ding unusable as soon as Easy Controller was
  enabled (probably one of its frames stays shown all the time), and it is gone.
- `Ding.Gamepad:HasWindow()` says when a Ding window holds the gamepad, for Easy Controller to
  read (below). Ding's bindings go when its windows close, which Easy Controller's hook sees.

**Suggested on Easy Controller's side** (not changed by Ding):

1. In `Mapping.lua`, `M:CoreActive()`: return false while
   `Ding and Ding.Gamepad and Ding.Gamepad.HasWindow and Ding.Gamepad:HasWindow()`. Its repair
   then leaves Ding's window bindings alone (Ding reads the window's buttons first anyway); once
   Ding's window closes, its hook sees `ClearOverrideBindings` and the repair puts its own back.
2. In `ConfigWindow.lua`, `C:GameIsFree()`: the same test, so RB + D-pad down does not open Easy
   Controller's panel while a Ding window (or Ding's Keybinds capture) holds the gamepad.

## The default of "Open Ding! settings"

**RB + Up**, a chord of Ding's: the player's choice, neither the game nor Easy Controller uses it
(Easy Controller has RB + Down). **LB + Up** when RB + Up is already another action's chord or
Easy Controller's shortcut. Once per account with a gamepad in use (`Gamepad:BindDefaultConfig`,
`DingDB.ui.configChordDone`), never over a gamepad button or chord the player gave the action.
The first v1.5.0 builds set LT + Start as a game binding, which did nothing in play: it is
replaced by RB + Up. The setup assistant shows the chord on its first screen; `/ding help` too.

## ConsolePort

Not tested on WoW Forever. It sets the gamepad modifiers itself (`GamePadEmulate*`); Ding's
chords do not depend on them. Its override bindings are named in the Keybinds tab ("ConsolePort
uses it too"), A binds them anyway. Open Ding's settings with ConsolePort's own menus closed.

## TomTom

Optional, off by default (Arrow tab): Ding hands it the target through its public API
(`AddWaypoint`, protected calls) and keeps its own arrow when that fails. No key binding, no game
setting, nothing of TomTom's shipped.

## To check in game, with Easy Controller and Ding! both enabled

1. **RB + Up** opens Ding!'s settings (out of combat), and the gamepad bar's D-pad up does not
   act with it. In them the D-pad, A, B and LB / RB move right away.
2. Settings of Ding!, Keybinds: bind **LB + Up** to "Next step" (hold LB, press Up): the row
   shows "LB+Up"; in play, LB + Up goes to the next step once, Up alone keeps its bar action.
3. **LT + A** and **LT + D-pad down** the same way (LT's left bar must not act on them); RB +
   Down is named as Easy Controller's: A takes it anyway.
4. Ding's focus mode (its binding or a chord): the D-pad moves through the lines, no spell cast;
   B gives the gamepad back; then one of Easy Controller's wheels: its buttons work.
5. In combat, a chord still runs (its second button's bar action runs too).
6. Ding's settings open, press RB + D-pad down: Easy Controller's panel should not open over
   them (until suggestion 2 above, it may).
7. `/reload`: Ding's chords and bindings (Keybinds tab) and Easy Controller's mapping are all
   there.
8. If a chord does nothing, what the client reports for each press (20 s; holding LB then Up
   should print `PADLSHOULDER` then `PADDUP true`, the second value: LB still seen held):
   `/run local f=CreateFrame("Frame")f:EnableGamePadButton(true)f:SetScript("OnGamePadButtonDown",function(_,b)print(b,IsKeyDown("PADLSHOULDER"))return true end)C_Timer.After(20,function()f:Hide()end)`
   and Ding's chords: `/run for a,k in pairs(DingDB.chords or {})do print(a,k)end`
