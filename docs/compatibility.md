# Ding! beside other addons

What Ding! changes in the game, what the gamepad addons of WoW Forever change, and how they stay
out of each other's way. Checked by `tools/tests/compat_test.lua` and `keybinds_test.lua` (the
mocked client); the list at the end is what only the game can confirm.

## What Ding! changes in the game

| | Ding! |
|---|---|
| Game settings (CVars) | `nameplateMaxDistance` only, with "Show enemy nameplates farther" (the value before is put back when it goes off). **Never** the gamepad's: `GamePadEmulateShift` / `Ctrl` / `Alt`, cursor, camera. |
| Saved key bindings | Only what the player binds in the Keybinds tab, and once the default button of "Open Ding! settings" (below). The game's own Keybindings list them under "Ding!". |
| Temporary (override) bindings | On its own frames only, while a window or mode of Ding's is open: the settings, the setup assistant, the NPC directory, import / export, the guide's focus mode, the move mode. Removed when it closes and before every fight. |
| Frames taking the gamepad's buttons | `DingCaptureFrame`, only while a Keybinds row waits for a button. |
| Hooks | The flight map's `TakeTaxiNode`, the unit tooltip (a line about quest monsters). |
| Global names | `Ding`, `LibDingDB`, `DingDB` / `DingCharDB` (saved variables), frames named `Ding…`, `BINDING_*_DING_*`. |
| Slash command | `/ding` |

## Easy Controller

The author's own gamepad addon (chat keyboard, wheels, back paddles, gamepad mapping).

| | Easy Controller |
|---|---|
| Game settings | `GamePadEmulateAlt` / `GamePadEmulateCtrl` (its "triggers as modifiers": RT or LT made Alt / Ctrl so every trigger layer has keys of its own); gives back `GamePadStickAxisButtons` and camera speeds its older versions changed; the Edit Mode layout (compact gamepad bar); vibration. |
| Saved key bindings | Its own commands (`CONTROLLERKEYBOARD_*`, its toggles); none of Ding's. |
| Temporary (override) bindings | Its mapping (free inputs, the game's buttons it replaces, the shoulders kept), set again a moment after any override binding changes (it hooks `SetOverrideBinding*` and `ClearOverrideBindings`); its windows take the gamepad while open: chat keyboard (`ControllerKeyboardFrame`, `ControllerKeyboardConsolePort`), quick phrases, wheels, its settings, its first-launch guide. |
| Global names | `ControllerKeyboard…` frames, `ControllerKeyboardDB`; slash `/ec`, `/easycontroller`, `/ck`, `/controllerkeyboard`. Nothing in common with Ding's. |

**How Ding stays out of its way**

- Ding reads the modifiers Easy Controller sets up (`GamePadEmulate*`) and builds its
  combinations with them ("LT+A" = `SHIFT-PAD1` when LT is Shift); it never changes them. A
  combination it cannot make is explained in words in the Keybinds tab ("RB+Up: the game only
  combines a button with LT or RT").
- A key Easy Controller holds (its override bindings: its mapping, its wheels…) is refused by
  name in the Keybinds tab ("LT+X is used by Easy Controller, which comes first"), and never
  taken by the default button of "Open Ding! settings".
- While one of Easy Controller's windows is open (detected with `C_AddOns.IsAddOnLoaded` and its
  frames), a Ding window does not set its buttons over Easy Controller's: it waits for that
  window to close, says so once in the chat, and works with the mouse meanwhile. Ding's first
  launch waits for Easy Controller's own guide to close.
- `Ding.Gamepad:HasWindow()` says when a Ding window holds the gamepad, for Easy Controller to
  read (below). Ding's bindings go when its windows close, which Easy Controller's hook sees.

**Suggested on Easy Controller's side** (not changed by Ding):

1. In `Mapping.lua`, `M:CoreActive()`: return false while
   `Ding and Ding.Gamepad and Ding.Gamepad.HasWindow and Ding.Gamepad:HasWindow()`. Its repair
   (0.15 s after Ding sets its window's bindings) can otherwise set again the game buttons it
   replaced, with priority, over the settings' D-pad, A, B or LB / RB; once Ding's window closes,
   its hook sees `ClearOverrideBindings` and the repair puts them back.
2. In `ConfigWindow.lua`, `C:GameIsFree()`: the same test, so RB + D-pad down does not open Easy
   Controller's panel while a Ding window (or Ding's Keybinds capture) holds the gamepad.

## The default button of "Open Ding! settings"

Asked: RB + Up (beside Easy Controller's RB + Down). The game binds a button with Shift, Ctrl or
Alt only, and those are buttons its gamepad settings name (`GamePadEmulateShift` / `Ctrl` /
`Alt`): RB + Up can be a binding only when RB is one of them. Making RB one would change what RB
alone does for the game's targeting and Easy Controller's mapping, so Ding never does it.
Easy Controller's own RB + Down is not a binding: it watches the two buttons, and the game's
D-pad down action runs too.

So, once per account with a gamepad in use (`Gamepad:BindDefaultConfig`): **RB + Up** when the
game's settings already make RB a modifier, else **LT + Start**, else **RT + Start** (a trigger
with Start is a combination the game's gamepad interface leaves free; a trigger with the D-pad or
a face button is a slot of its gamepad bars). Never over a gamepad button the action already
has, never over a key in use (Easy Controller's, the game's, another action's). The setup
assistant shows the result on its first screen; with nothing free, the Keybinds tab follows it.

## ConsolePort

Not tested on WoW Forever. It sets the gamepad modifiers itself (`GamePadEmulate*`): Ding reads
them like Easy Controller's. Its override bindings are named in the Keybinds tab ("used by
ConsolePort") and never taken. Ding does not detect its windows: open Ding's settings with
ConsolePort's own menus closed.

## TomTom

Optional, off by default (Arrow tab): Ding hands it the target through its public API
(`AddWaypoint`, protected calls) and keeps its own arrow when that fails. No key binding, no game
setting, nothing of TomTom's shipped.

## To check in game, with Easy Controller and Ding! both enabled

1. Settings of Ding!, Keybinds: bind LT + A to "Next step" (hold LT, press A): the row shows
   "LT+A"; in play, LT + A goes to the next step and nothing else happens. If Easy Controller
   already uses LT + A, the row names it and nothing changes.
2. LT + D-pad down the same way; RB + Up refused in words.
3. Open Easy Controller's chat keyboard, then Ding's settings (from the minimap button): the
   chat line says Ding waits; close the keyboard: the D-pad, A, B and LB / RB move in Ding's
   settings.
4. Ding's focus mode (its binding), then one of Easy Controller's wheels, then the focus mode
   again: each one's buttons work, none left to the other once closed.
5. Ding's settings open, press RB + D-pad down: Easy Controller's panel should not open over
   them (until suggestion 2 above, it may).
6. `/reload`: Ding's bindings (Keybinds tab) and Easy Controller's mapping are all there.
7. What the client holds, in the chat:
   `/run for _,a in ipairs({"DING_CONFIG","DING_NEXT"})do print(a,GetBindingKey(a))end print("Shift",GetCVar("GamePadEmulateShift"),"Ctrl",GetCVar("GamePadEmulateCtrl"),"Alt",GetCVar("GamePadEmulateAlt"))`
   and what each press sends (for 20 s; holding LT then A should print `PAD1 SHIFT-PAD1`):
   `/run local f=CreateFrame("Frame")f:EnableGamePadButton(true)f:SetScript("OnGamePadButtonDown",function(_,b)print(b,CreateKeyChordStringUsingMetaKeyState(GetConvertedKeyOrButton(b)))return true end)C_Timer.After(20,function()f:Hide()end)`
