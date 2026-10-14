<!--
Ding's interface sheet: the reference for the UI. Taken from the Claude Design handoff
"Ding, addon WoW Classic" (October 11, 2026), wanted exactly as is by Yendi. The mockup's
HTML file is not in the repository (Yendi keeps the handoff archive).
The accepted deviations and what remains to be checked in game are at the end of the sheet.
Since v1.5.0 the look comes from a theme (docs/UI-themes.md): this sheet is the "Ding dark"
theme's (its colors) and every theme's sizes, which themes never change.
-->

# Handoff: Ding — interface (WoW Classic)

## In the code

| Screen | Files |
|---|---|
| Themes (the colors of the tokens, flags, textures): [`UI-themes.md`](UI-themes.md) | `Ding/UI/Themes.lua` (`UI.Themes`, `UI.Theme.Apply`) |
| Tokens, fonts, shapes, focus, chips, settings rows | `Ding/UI/Widgets.lua` (`UI.C`, `UI.Font`, `UI.Shape`, `UI.Window`, `UI.Focus`, `UI.Glyph`, `UI.*Row`) |
| 01 Guide window, collapsed version, focus mode | `Ding/UI/Panel.lua` |
| 02 Arrow | `Ding/UI/Arrow.lua` (TomTom: `Ding/UI/TomTom.lua`) |
| 03 Settings | `Ding/UI/Config.lua` |
| 04 Item button | `Ding/UI/ItemButton.lua` |
| Gamepad chips, footer help, move mode | `Ding/UI/Gamepad.lua` |
| Minimap button (not in the mockup) | `Ding/UI/Minimap.lua` |
| Setup assistant (not in the mockup) | `Ding/UI/Setup.lua` |
| Textures, font | `Ding/Media/Textures/*.tga`, `Ding/Media/Fonts/NotoSans-*.ttf` (OFL) |


## Overview
Ding is a free, open-source World of Warcraft Classic addon that guides the player while leveling. It is often played with a gamepad. This folder describes the interface to implement **exactly as designed**:

1. Compact guide window (always on screen) + a version collapsed to one line
2. Direction arrow in the middle of the screen
3. Tabbed settings window (Guide, Arrow, Automation, Keybinds, Appearance)
4. Floating quest item button with a gamepad glyph

## About the design files
`design/Ding UI.dc.html` is an **HTML design reference** (open it in a browser; `support.js` must stay next to it). It is not code to ship. The task is to **recreate this design in the addon in Lua + XML with the WoW frame API** (Frame, Texture, FontString, `SetTextureSliceMargins`, `EnableGamePadButton`…). When in doubt, the HTML is the reference: open it and compare.

## Fidelity
**High fidelity.** Colors, sizes, spacing, typography and states are final. Reproduce them pixel for pixel at 100 % UI scale. All values below are in WoW interface pixels (at `UIParent` scale 1). 8-digit colors are `#RRGGBBAA`.

---

## Design tokens

The colors below are the **Ding dark** theme's (`UI.Themes.dingdark`); the other themes,
Halo (the default since v1.5.0), Ardoise and Bandes, and the tokens added since, are in
[`UI-themes.md`](UI-themes.md). Code reads every color through `UI.C`.

### Colors
| Token | Hex | RGBA (0–1) for `SetVertexColor` / `SetTextColor` | Usage |
|---|---|---|---|
| `bg.window` | `#16181C` | 0.086, 0.094, 0.110, **α = setting** (default 0.85) | Guide window background |
| `bg.settings` | `#16181C` | 0.086, 0.094, 0.110, 1 | Settings background (opaque) |
| `bg.control` | `#22252B` | 0.133, 0.145, 0.169, 1 | Dropdown, item button glyphs |
| `bg.itemButton` | `#16181CD9` | 0.086, 0.094, 0.110, 0.85 | Item button background |
| `border` | `#FFFFFF14` | 1, 1, 1, 0.078 | 1 px window border, bar track |
| `divider` | `#FFFFFF0F` | 1, 1, 1, 0.059 | Inner separators |
| `surface.subtle` | `#FFFFFF0A` | 1, 1, 1, 0.039 | Background of the ‹ › arrow buttons |
| `surface.hover` | `#FFFFFF14` | 1, 1, 1, 0.078 | Icon button hover |
| `surface.glyph` | `#FFFFFF1F` | 1, 1, 1, 0.122 | Background of the LB/RB/A/B/X/Y chips, slider track |
| `border.strong` | `#FFFFFF26` | 1, 1, 1, 0.149 | Item button border, item icon |
| `text.primary` | `#E8EAED` | 0.910, 0.918, 0.929 | Primary text |
| `text.glyph` | `#C9CDD3` | 0.788, 0.804, 0.827 | Gamepad chip text, arrow ETA |
| `text.secondary` | `#A3A9B3` | 0.639, 0.663, 0.702 | Secondary text, inactive tabs, icons |
| `text.muted` | `#7D838C` | 0.490, 0.514, 0.549 | "/ 42", "3/42", unchecked checkbox |
| `text.disabled` | `#5F656E` | 0.373, 0.396, 0.431 | Impossible / disabled, "·" separator |
| `accent` | `#5BB4FF` | 0.357, 0.706, 1.000 | Links, active tab, progress, focus |
| `accent.bg` | `#5BB4FF1F` | 0.357, 0.706, 1, 0.122 | Focused element background |
| `accent.halo` | `#5BB4FF33` | 0.357, 0.706, 1, 0.2 | Outer focus halo |
| `on.accent` | `#0B0C0E` | 0.043, 0.047, 0.055 | Check mark on a checked box, pressed glyph |
| `done` | `#4CC38A` | 0.298, 0.765, 0.541 | Done (icon, counter, arrival arrow) |
| `done.icon.bg` | `#4CC38A33` | 0.298, 0.765, 0.541, 0.2 | Done icon background |
| `done.row.bg` | `#4CC38A1F` | 0.298, 0.765, 0.541, 0.122 | Done row background |
| `todo` | `#E5676B` | 0.898, 0.404, 0.420 | To do (counter, icon, arrow when behind) |
| `todo.icon.bg` | `#E5676B2E` | 0.898, 0.404, 0.420, 0.18 | To-do icon background |
| `todo.row.bg` | `#E5484D1F` | 0.898, 0.282, 0.302, 0.122 | To-do row background |
| `todo.border` | `#E5676B80` | 0.898, 0.404, 0.420, 0.5 | Item button border when out of range |
| `impossible.icon.bg` | `#FFFFFF0F` | 1, 1, 1, 0.059 | Impossible icon background |
| `cooldown.overlay` | `#000000A6` | 0, 0, 0, 0.65 | Cooldown overlay |
| `shadow` | `#00000059` | 0, 0, 0, 0.35 | Window drop shadow |
| `textShadow` | `#000000CC` | 0, 0, 0, 0.8 | Text shadow over the game scene |

Accent color: `#5BB4FF` ("Ding blue"). Alternatives noted but **not kept**: `#A78BFA`, `#F5B042`. Make the accent a single constant.

### Typography
Font: **Noto Sans** (OFL license, to be bundled with the addon). Download from Google Fonts: `NotoSans-Regular.ttf`, `NotoSans-Medium.ttf`, `NotoSans-SemiBold.ttf`, `NotoSans-Bold.ttf` → `Media/Fonts/`. It covers French accented letters and `« » ‹ › × – ’`.

| Role | Size | Weight (file) | Line height | Notes |
|---|---|---|---|---|
| Arrow distance | 16 | SemiBold | 20 | tabular figures* |
| Settings title | 13 | SemiBold | 18 | |
| Arrow objective name | 13 | SemiBold | 18 | |
| Tabs, guide title, "Step 3" | 12 | SemiBold | 16 | |
| Objective, body | 12 | Regular | 16 | |
| Counter "2/6" | 12 | SemiBold | 16 | right-aligned |
| Focused label (dropdown, focused checkbox, slider) | 12 | Medium | 16 | |
| Sub-line, help, zone | 11 | Regular | 14 | |
| "3/42" (collapsed) | 11 | SemiBold | 14 | |
| Item name above the button | 11 | Medium | 14 | |
| Gamepad chips (LB, RB, A…) | 9 | Bold | 14 | 10 Bold on the item button |

\*Noto Sans has proportional figures by default: give the counter FontStrings a minimum width so the text does not shift.

For 2-line FontStrings: `SetSpacing(4)` at 12 px gives a line height of 16. Single line height = 16 (12 px) / 14 (11 px).

### Spacing, radii, shadows
- Spacing scale: **2 · 4 · 6 · 8 · 12 · 16 · 24**
- Radii: window **6**, row/button/field **4**, icon/box/chip **3**, bars **2**
- Border: 1 px `#FFFFFF14`
- Window shadow: y offset −4 (downward), blur 16, `#00000059`
- Text shadow over the game scene: `SetShadowOffset(0, -1)`, `SetShadowColor(0, 0, 0, 0.8)`
- **Gamepad focus**: background `#5BB4FF1F` + 2 px ring `#5BB4FF` + 3 px halo `#5BB4FF33` outside the ring. In list rows (guide, dropdown, settings), the ring is **inside** (2 px inset) and has no halo. On a standalone field (closed dropdown, item button), the ring is **outside** + halo.

---

## Supplied textures (`Media/Textures/*.tga`)
All white, to be tinted with `SetVertexColor`. Preview: `Media/textures_preview.png`.

| File | Size | Slice margins | Usage |
|---|---|---|---|
| `rr6_fill.tga` | 32 | 6 | Window background (radius 6) |
| `rr6_stroke1.tga` | 32 | 6 | 1 px window border |
| `rr4_fill.tga` | 32 | 4 | Rows, buttons, fields |
| `rr4_stroke2.tga` | 32 | 4 | 2 px focus ring |
| `focus_halo.tga` | 32 | 7 | 3 px halo (place at −5 px around the element) |
| `rr3_fill.tga` | 32 | 3 | 16 px icons, checked boxes, chips |
| `rr3_stroke15.tga` | 32 | 3 | Unchecked box (1.5 px) |
| `rr2_fill.tga` | 32 | 2 | Progress bars, tracks |
| `shadow.tga` | 64 | 24 | Shadow (9-slice, extends 16 px beyond the frame; +4 at the bottom, −4 at the top) |
| `circle.tga` | 64 | — | A/B/X/Y chips, slider thumb, ● collect (6×6) |
| `ring.tga` | 64 | — | "Arrived" circle (shown at 48×48 → 3 px stroke) |
| `arrow.tga` | 128 | — | Arrow (shown at 56×56, `SetRotation`) |
| `minimap_icon64.tga`, `minimap_icon32.tga`, `logo64.tga`, `logo32.tga`, `arrow_gold.tga` | 64 / 32 / 128 | — | Since v1.5.0, **real colors** (never tinted): the minimap button's icon, the logo (TOC), the gold arrow skin (docs/UI-themes.md) |
| `icon_check.tga` | 32 | — | Check mark (shown at 11×11 inside a 16 px icon) |
| `icon_check_large.tga` | 64 | — | Check mark inside the "arrived" circle (22×22) |
| `icon_diamond.tga` | 32 | — | ◆ kill (shown at 6×6) |
| `caret_up.tga` | 32 | — | ▴ dropdown (8×8); ◂ ▸ via `SetRotation` |
| `glyph_ps_square.tga` | 32 | — | PlayStation □ glyph |

Example:
```lua
local bg = f:CreateTexture(nil, "BACKGROUND")
bg:SetTexture("Interface\\AddOns\\Ding\\Media\\Textures\\rr6_fill")
bg:SetTextureSliceMargins(6, 6, 6, 6)
bg:SetTextureSliceMode(Enum.UITextureSliceMode.Stretched)
bg:SetAllPoints()
bg:SetVertexColor(0.086, 0.094, 0.110, Ding.db.opacity / 100)
```
If `SetTextureSliceMargins` does not exist on the target client, build a manual 9-slice (4 corners + 4 edges + center) with `SetTexCoord`.

Real item icons come from `GetItemIcon(itemID)` (the stripes in the mockup are placeholders). Show the item icon with `SetTexCoord(0.08, 0.92, 0.08, 0.92)` to remove the Blizzard border, then apply a rounded mask (`CreateMaskTexture` with `rr4_fill`).

---

## Screens

### 01 — Guide window
Always on screen, movable, position saved. Background `bg.window` at the chosen opacity (0–100 %, default 85 %). Scale 50–150 % (`SetScale`), default 100 %.

**Container**
- Width 300 (resizable 240–420), height = content
- Background `rr6_fill` tinted `#16181C` with α from the setting; border `rr6_stroke1` `#FFFFFF14`; shadow `shadow.tga` `#00000059`
- Vertical stack: title bar → separator → step bar → separator → list → progress

**Title bar** — height 24, horizontal padding 4, gap 4; bottom separator 1 px `#FFFFFF0F`
- Menu button 20×20, radius 4: 3 lines 10×1.5 `#A3A9B3`, 2 apart (centered)
- Title (flex): `Ding` in `#5BB4FF` + ` · ` in `#5F656E` + guide name in `#E8EAED`. 12 SemiBold. One line, truncated with an ellipsis.
- Collapse button 20×20: 9×1.5 line `#A3A9B3`
- Close button 20×20: `×` 14 Regular `#A3A9B3`
- Button hover: background `rr4_fill` `#FFFFFF14`

**Step bar** — height 28, horizontal padding 6, gap 6; bottom separator 1 px `#FFFFFF0F`
In order:
1. `LB` chip (see Gamepad chips)
2. Previous button 24×24, radius 4, background `#FFFFFF0A`, `‹` 13 SemiBold `#E8EAED`
3. `Step 3` 12 SemiBold `#E8EAED` + ` / 42` 12 Regular `#7D838C`
4. Next button 24×24, identical, `›`
5. `RB` chip
6. Flexible space
7. Zone `Valley of Trials` 11 Regular `#A3A9B3`, right-aligned, ellipsis

**Objective list** — padding 4 on all sides, vertical gap 2 between rows
Row: padding 4 vertical / 6 horizontal, gap 8, radius 4, content top-aligned
- Icon 16×16, radius 3 (`rr3_fill`)
- Flex text, 12/16 Regular, **wraps, 2 lines max**
- Counter on the right, 12/16 SemiBold, top-aligned
- Optional sub-line under the text: gap 2, 11/14 Regular `#A3A9B3`
- Item/NPC/target names in the text are links in `#5BB4FF`

| State | Row background | Icon background / glyph | Text | Counter |
|---|---|---|---|---|
| Done | `#4CC38A1F` | `#4CC38A33` / check mark `#4CC38A` | `#A3A9B3` | — (or `#4CC38A`) |
| To do | `#E5484D1F` | `#E5676B2E` / glyph `#E5676B` | `#E8EAED` | `#E5676B` |
| Impossible | none | `#FFFFFF0F` / glyph `#5F656E` | `#5F656E` | — |
| Gamepad focus | `#5BB4FF1F` + 2 px inset ring `#5BB4FF` | unchanged | `#E8EAED` | unchanged |

Icon glyphs by type:
- accept / done: check mark (`icon_check`, 11×11)
- kill: `icon_diamond` 6×6
- collect: `circle` 6×6
- use an item: the item's real icon 16×16, 1 px border `#FFFFFF26`
- turn in: `?` 11 Bold
- accept (not done): `!` 11 Bold

Exact mockup content (step 3):
1. Done — `Accept ` + link `“Cutting Teeth”`
2. To do, kill — `Kill 6 ` + link `Mottled Boars` — `2/6`
3. To do, collect — `Collect 8 ` + link `Scorpid Worker Tails` — `3/8` — sub-line `Scorpids roam north of the den.`
4. To do, item, **focused** — `Use ` + link `Foreman’s Blackjack` + ` on Lazy Peons` — `0/5`
5. Impossible — `Turn in “Sarkoth” · requires level 4`

**Progress** — padding 2 top / 8 sides / 8 bottom; bar height 3, `rr2_fill`; track `#FFFFFF14`, fill `#5BB4FF`, width = step / total (7 % in the mockup)

**Collapsed version (one line)** — 300×28, same background/border/shadow, horizontal padding 4, gap 6
1. Menu button 20×20
2. `3/42` 11 SemiBold `#7D838C`
3. Icon 14×14, radius 3, of the current objective (5×5 glyph)
4. Current objective text 12 Regular `#E8EAED`, one line, ellipsis
5. Counter 12 SemiBold in the state color
6. Expand button 20×20: 9×9 square, 1.5 outline `#A3A9B3`, radius 2
7. 2 px progress bar along the bottom edge, full width, no radius (clipped by the window)

**Collapsed — objective done**: horizontal padding 8, check icon `#4CC38A` on `#4CC38A33`, past-tense text `Killed 6 Mottled Boars` in `#4CC38A`, counter `6/6` `#4CC38A`. Moves on to the next step automatically after **1.5 s**.

### 02 — Direction arrow
Horizontally centered, **120 px above the center of the screen** (above the character). No background. Not clickable.
- Arrow `arrow.tga` 56×56 (size adjustable 40–80), `SetRotation(angle)` from the direction of the target relative to the player's facing
- Shadow: duplicated texture in `#000000CC` offset by (0, −1) under the arrow
- Arrow → label gap: 8
- Centered label, max width 240, ellipsis, gap 2 between lines, text shadow:
  - Line 1: target name 13/18 SemiBold `#E8EAED`
  - Line 2: distance `119 yd` 16/20 SemiBold `#E8EAED` + ` · 0:08` 12 Regular `#C9CDD3` (ETA m:ss)

States:
| State | Condition | Visual | Line 2 |
|---|---|---|---|
| On the way | angle off ≤ 120° | arrow `#5BB4FF` | `119 yd · 0:08` |
| Behind | angle off > 120° | arrow `#E5676B` | `342 yd · turn around` |
| Arrived | distance < 10 yd | `ring.tga` 48×48 `#4CC38A` + check mark 22×22 `#4CC38A` instead of the arrow | `You’re here` 16 SemiBold `#4CC38A`; fades out after 3 s |

Mockup examples: `Mottled Boar` (rotation 24°), `Gornek` (160°), `Scorpid den` (arrived).

### 03 — Settings
Window 520×420, centered, `rr6_fill` `#16181C` **opaque**, 1 px border `#FFFFFF14`, shadow. Stack: title bar 32 → tabs 36 → content (flex) → footer 32.

**Title bar** — height 32, padding left 12 / right 6, gap 8; bottom separator 1 px `#FFFFFF0F`
- `Ding` `#5BB4FF` + ` · ` `#5F656E` + `Settings` `#E8EAED`, 13/18 SemiBold
- Round `B` chip (shown when the gamepad is active)
- Close button 24×24, `×` 16 Regular `#A3A9B3`

**Tabs** — height 36, horizontal padding 8, gap 2; bottom separator 1 px `#FFFFFF14`
- `LB` chip (right margin 4) · tabs · flexible space · `RB` chip
- Tab: horizontal padding 12, text 12 SemiBold, vertically centered
- Inactive `#A3A9B3`; active `#E8EAED` + 2 px underline `#5BB4FF` along the bottom edge, across the full width of the tab
- Order: `Guide`, `Arrow`, `Automation`, `Keybinds`, `Appearance`
- If the row overflows (French), padding 12 → 10

**Footer** — height 32, horizontal padding 12, gap 16; top separator 1 px `#FFFFFF0F`; 11 Regular `#A3A9B3`. Each entry = chip + gap 6 + label. Content depends on the tab:
- Guide: `A Select` · `B Back` · `LB RB Tabs`
- Automation: `A Toggle` · `B Back`
- Appearance: `◂ ▸ Adjust` · `Y Reset` · `B Back`

**Guide tab** — padding 16, gap 6
- Label `Active guide` 11 Regular `#A3A9B3`
- Closed dropdown: height 32, radius 4, background `#22252B`, horizontal padding 10, gap 8. Guide name 12 Medium `#E8EAED` (flex) · level range 11 Regular `#A3A9B3` · caret 8×8 `#A3A9B3` (▴ open, ▾ closed). Focus: 2 px outer ring + halo.
- Open list: top margin 4, background `#22252B`, 1 px border `#FFFFFF14`, radius 4, shadow, padding 4, gap 2. **8 visible items max**, then scrolling.
- Item: height 28, radius 4, horizontal padding 8, gap 8: check column 12 wide (`icon_check` `#5BB4FF` for the current guide) · name 12 Regular `#E8EAED` (flex) · levels 11 Regular `#A3A9B3`
- Focused item: name in Medium, background `#5BB4FF1F` + 2 px inset ring
- Unavailable item: name and levels `#5F656E`, levels followed by ` · lvl 13+`
- When the list opens, the focus is on the current guide → **2 presses** to change (A to open, D-pad, A to confirm).

Mockup content:
| Name | Levels | State |
|---|---|---|
| Orc & Troll · Durotar | 1–10 | current (check mark) |
| Tauren · Mulgore | 1–10 | |
| Undead · Tirisfal Glades | 1–10 | |
| The Barrens | 10–20 | focused |
| Silverpine Forest | 12–20 | |
| Stonetalon Mountains | 15–25 · lvl 13+ | unavailable |

**Automation tab** — padding 12, gap 4
Row: min height 36 (44 with a description), radius 4, padding 4 vertical / 8 horizontal, gap 10, vertically centered
- Box 16×16, radius 3: checked = background `#5BB4FF` + check mark `#0B0C0E`; unchecked = 1.5 px outline `#7D838C` (`rr3_stroke15`)
- Label 12 Regular `#E8EAED` (Medium when focused)
- Optional description under the label, gap 2, 11/14 `#A3A9B3`
- Focused row: background `#5BB4FF1F` + 2 px inset ring + right-aligned `A` chip
- Content: `Accept quests` (checked) · `Turn in quests` (checked, focused) · `Skip gray quests` (unchecked, description `Gray quests give little XP at your level.`)

**Appearance tab** — padding 12, gap 4
Slider block: radius 4, padding 8, gap 8
- Top line: label 12 Medium `#E8EAED` on the left, value `85 %` 12 SemiBold on the right (`#5BB4FF` when focused, otherwise `#E8EAED`)
- Slider height 16: 4 px full-width track `#FFFFFF1F` radius 2; fill `#5BB4FF`; round 14×14 thumb `#E8EAED` (`circle.tga`) centered on the value, shadow `0 1 3 #00000080`
- Bottom line: bounds 11 Regular `#A3A9B3` at both ends, help text in the middle
- Focus: background `#5BB4FF1F` + 2 px inset ring

Sliders:
1. `Background opacity` — 0 % to 100 %, step 5, default 85, help text in the middle `D-pad ◂ ▸ · 5 % steps`
2. `Window scale` — 50 % to 150 %, step 5, default 100

Preview below them: top margin 8, height 92, radius 4, game scene background, with a centered 300×28 collapsed window that applies the chosen opacity **live**. Both settings also apply live to the real guide window.

`Arrow` and `Keybinds` tabs: not drawn. Reuse exactly the components above (sliders, checkboxes, 36 px rows).

### 04 — Quest item button
Floating, movable, position saved. Shown only when the current step calls for an item (`SecureActionButtonTemplate`, `type = "item"`). Do not change it in combat (`InCombatLockdown`).
- Button 44×44, radius 6, padding 3, background `#16181CD9`, 1 px border `#FFFFFF26`, shadow
- Icon 36×36, radius 4 (the item's real icon)
- Item name above, centered, gap 10: 11/14 Medium `#E8EAED` + text shadow
- Gamepad glyph: 18×18 circle, overhanging the bottom-right corner by 6 px (center at −3/−3 from the corner). Background `#22252B`, 1 px border `#FFFFFF26`, letter 10 Bold `#E8EAED`

| State | Visual |
|---|---|
| Ready | as above |
| Pressed / focused | no border; 2 px outer ring `#5BB4FF` + halo; glyph background `#5BB4FF`, letter `#0B0C0E` |
| Cooldown | `#000000A6` overlay on the icon, remaining seconds 13 Bold `#E8EAED` centered; glyph letter `#7D838C` |
| Unusable / out of range | icon at 45 % opacity, border `#E5676B80`, label `Out of range` above it in `#E5676B`; glyph letter `#7D838C` |

Glyph depending on the binding: `X` (Xbox) · `glyph_ps_square.tga` 10×10 (PlayStation) · key name on a keyboard. Read the actual binding; do not hard-code it.

### Gamepad chips (shared component)
- **Shoulder buttons** (`LB`, `RB`, `LB RB`, `◂ ▸`): height 14, horizontal padding 3, radius 3, background `#FFFFFF1F`, text 9 Bold `#C9CDD3`
- **Face buttons** (`A`, `B`, `X`, `Y`): 14×14 circle, same colors
- Hidden when no gamepad is active (`C_GamePad.IsEnabled()` / last device used)

### 05 — French text lengths
Allow **+30 %** compared with English.
- Objective text: wraps, 2 lines max, never truncated
- Title and zone: one line, ellipsis, full name in a tooltip
- Counters: fixed column on the right
- French tabs: `Guide`, `Flèche`, `Automatisation`, `Raccourcis`, `Apparence` (padding 10)
- French step bar: `Étape 3 / 42`
- Quest, NPC and item names come from the client (`C_QuestLog`, `GetItemInfo`, etc.), **never hard-coded**. The French names in the mockup are illustrative.

---

## Interactions and behavior

### Gamepad
Windows with `EnableGamePadButton(true)` + `OnGamePadButtonDown`. Mapping:
| Action | Button |
|---|---|
| Previous / next step (guide window) | `PADLSHOULDER` / `PADRSHOULDER` |
| Move the focus through the rows | `PADDUP` / `PADDDOWN` |
| Activate (use the item, point the arrow at the link, check, open the dropdown) | `PAD1` (A) |
| Back / close | `PAD2` (B) |
| Use the quest item | `PAD3` (X), can be changed in Keybinds |
| Hold: collapse / expand the guide window · Reset the slider | `PAD4` (Y) |
| Switch tabs (settings) | `PADLSHOULDER` / `PADRSHOULDER` |
| Adjust the slider | `PADDLEFT` / `PADDRIGHT`, step 5 |

Pass unhandled buttons on to the game (`SetPropagateKeyboardInput` / gamepad equivalent) so the character is never blocked.

### Mouse
- Icon button hover: background `#FFFFFF14`, radius 4
- Click on an objective link: the arrow points at that target
- Click on ‹ ›: previous / next step
- Title bar: drag to move

### Transitions
No animation required. Only: moving on to the next step 1.5 s after "done", and fading out the "arrived" state after 3 s (`UIFrameFadeOut`, 0.3 s).

## State / SavedVariables
```lua
DingDB = {
  guide = "orc_troll_1_10",   -- active guide
  step = 3,
  opacity = 85,               -- 0–100, step 5
  scale = 100,                -- 50–150, step 5
  minimized = false,
  arrowScale = 56,            -- 40–80
  autoAccept = true,
  autoTurnIn = true,
  skipGray = false,
  positions = { guide = {...}, item = {...} },
}
```
The opacity slider updates `bg:SetVertexColor(..., opacity/100)` on the guide window (full and collapsed). The scale slider updates `SetScale(scale/100)`.

## Strings (enUS)
`Ding` · `Step` · `Settings` · `Guide` · `Arrow` · `Automation` · `Keybinds` · `Appearance` · `Active guide` · `Accept quests` · `Turn in quests` · `Skip gray quests` · `Gray quests give little XP at your level.` · `Background opacity` · `Window scale` · `D-pad ◂ ▸ · 5 % steps` · `Select` · `Back` · `Tabs` · `Toggle` · `Adjust` · `Reset` · `turn around` · `You’re here` · `Out of range` · `requires level %d` · `lvl %d+` · `yd`
Objective verbs: `Accept` · `Turn in` · `Kill` · `Collect` · `Use … on …` · past tense: `Accepted` · `Killed` · `Collected`.

## Files

- `Ding/Media/Textures/*.tga`: the kit's white textures, to be tinted. `rr4_stroke1.tga`
  (1 px border at radius 4 for the dropdown list) was missing from the kit: it is drawn by
  `tools/media/textures.py`.
- `Ding/Media/Fonts/`: Noto Sans Regular, Medium, SemiBold, Bold (static fonts, notofonts
  repository) and their license, `OFL.txt`.

## Implementation deviations and decisions

- **Gamepad on the guide window.** Capturing LB, RB, the D-pad, A and B on a window that is
  always shown would take them away from the game (and from EasyController). Yendi's choice:
  the `LB` / `RB` chips show the keybinds actually assigned ("Previous step" / "Next step",
  which work in combat), and moving through the rows goes through a **focus mode** (the
  "Browse the guide with the gamepad" keybind, `DING_FOCUS`): the D-pad moves through the
  rows, A points the arrow at the row (or uses the item on the item's row, through a secure
  click), LB / RB change step, Y collapses, B exits. Only these buttons are taken; the mode
  stops in combat and when the settings open.
- **Y resets to default** (sliders, choices) and clears a keybind; X is not used in the
  settings.
- **Always nine-slice**: rounded shapes are cut by hand (`SetTexCoord`, one texel per unit);
  `SetTextureSliceMargins` is not used.
- **No arrows or shapes in text**: Noto Sans has neither ← → nor ◂ ▸ ▴ ▾ nor ✕ □ △ ○.
  The D-pad and the PlayStation symbols are textures (rotated `caret_up`, `ring`,
  `glyph_ps_square`, × for the cross button); in text, D-pad directions are written out in
  words ("LT+Right"). `tools/tests/look_test.lua` rejects these characters in texts and
  guides.
- **Objective names**: they come from the client, in the singular ("Kill 6 Mottled Boar").
  In French, the past tense is « … : fait ».
- **Settings not in the mockup**, built from the design's components:
  - Arrow: show the arrow, TomTom arrow, size (40-80), its look (since v1.5.0 the arrow picker
    of docs/UI-themes.md; the minimap arrow is one of its cards), orientation (with the test
    question), move, default position;
  - Automation: accept, turn in, skip gray quests, collapse in combat, hide in dungeons,
    choose quest rewards, sell gray items, repair at merchants, mark the target (solo), then
    under the label "Steps the guide can offer": manage the hearthstone, death skips, dungeon
    quests, elite quests, vendor and repair steps (rows with their description, like the
    mockup's; 30 / 36 high since the density below);
  - Keybinds: "Open Ding settings" first, then next, previous, item, target the arrow's NPC or
    monster, browse the guide, show,
    collapse, skip, go back; button names; show gamepad buttons; game keybinds;
  - Appearance: opacity, window size, preview, then lock, move and reset the window, item
    button (show, move), minimap button, sound, and under "Advanced": debugging, timing,
    reset all settings to default;
  - Guide: two lists with the same look, each under its own label: `Active guide` (the guide
    packs: "Ding" first, with the detail `built in · 1–60`, then the installed packs, with the
    detail `by <author> · levels`, grayed out if they have nothing for the character) and
    `Section` (the sections of the chosen pack, like the list in the mockup); then "Take this
    guide up where I am" and the "Show the guide and its arrow" checkbox; then, under "Quest
    log cleanup", the quests of the log the guide never uses: one button row each ("Details":
    the quest's card in a tooltip next to the row), or an info line when there are none.
- **Quest rewards** (not in the mockup): with several rewards to choose from, the same banner as
  on the flight map ("Best reward: [item] (an upgrade)") and an accent ring over the reward's
  button in the game's quest window (read only).
- **Quests an NPC offers** (not in the mockup): a 280-wide Ding window (window look, strata
  HIGH, no mouse), its top level with the game's NPC window and 8 to its right (to its left
  when the screen has no room), else at 370, -116 from the top left. Title 12 SemiBold
  "Ding! · These quests and your guide" (Ding! in `accent`, the dot in `text.disabled`),
  divider at 26; then per quest, padding 12: "[level] name" 12 Medium `text`, 2 lower one or
  two plain sentences 11 Regular `text.secondary`, no color code (Yendi's feedback); both wrap
  without a line limit; 8 between quests.
- **Why the guide makes its choices** (not in the mockup, Core/Why.lua): a surprising step
  (a detour, a quest taken now or never) gets one more sub-line under its first row still to
  do, after the guide's note, in the note's style (11 Regular `text.secondary`, never cut): "Why
  this detour (about 5 min): turning in “…” opens a chain of quests worth a lot of XP (about
  13,000)." The tooltip of the step's rows (mouse, X in focus mode) ends with a blank line, "Why?"
  in `accent`, then the reason's lines in light grey (wrapped); a row without a quest (a trip, a
  level) gets that tooltip too, its text as title. Option "Guide explanations" (Guide tab, on).
- **TomTom**: optional and **off by default**; Ding's arrow is enough (Yendi's request); the
  old settings are migrated to Ding's arrow.
- **Minimap button** (Yendi's request): left click opens the settings, right click the guide;
  drag it around the minimap; it can be hidden in Appearance and with `/ding minimap`. Its icon
  since v1.5.0: `minimap_icon64` (`minimap_icon32` under 24 pixels), the gold arrow of the new
  icon, in its own colors (docs/UI-themes.md, "The icon").
- **Data**: `DingDB` keeps Ding's own structure (`panel`, `arrow`, `item`, `minimap`, `ui`),
  migrated once (`layout = 2`): arrow at center + 120, size taken from the old scale, window
  scale clamped to 50-150 %. Design defaults: background 85 %, window 100 %, arrow 56, gray
  quests **not** skipped.
- **Opacity 0 %**: the border and the shadow fade out with the background (otherwise an empty
  frame would stay on screen).
- **Collapsed version**: the 2 px bar is inset by 3 on each side instead of being clipped by
  the rounded corners.
- **Item button**: no item count (not in the mockup); moved by right-click dragging or in move
  mode; the glyph follows the "Show gamepad buttons" setting.
- **Window width** (240-420): invisible handle in the bottom-right corner.
- **Arrow** not clickable: it is moved in move mode (D-pad, or the mouse while that mode is
  on). The arrival time comes from the speed **measured by Ding** from the player's movements
  (the client keeps `GetUnitSpeed` secret from addons), with running speed (7 m/s) when the
  player is standing still.
- **Zone names** (not in the mockup): after the distance, " · Duskwood" in the same style; on a
  line of the window, " — Madame Eva, Duskwood" in `text.secondary` after the line's text.
  "Mark the target on the world map" is a check row of the Arrow and maps tab ("Maps" block),
  its description saying how (the game's waypoint, TomTom, or the minimap only).
- **Hunting areas** (Yendi's feedback): the spawn points of an objective's monsters or objects
  form an area. "You’re in the area" (the same green ring as "You’re here") as soon as the
  player is within 40 m of one of them; the player only leaves it beyond 60 m, so it does not
  flicker. With the farming loop (on by default) the arrow stays on the way instead, toward the
  loop's next stop, its label "name · farming loop: 2 of 6"; without a loop (fewer than 3 stops, option
  off) it fades out during the hunt and comes back on leaving.
- **Death** (Yendi's feedback): a ghost is led to its corpse ("Your corpse", arrival at 30 m),
  then the arrow goes back to the guide.
- **Quest of an objective** (Yendi's feedback): a header row above a quest's objectives, its
  level and name "[22] “quest”" in 12 SemiBold (the level `text.secondary`, the name a link, or
  all of it in `above` orange over the player's level), no icon nor background, text at the
  icons' x, padding 4 above and none below; its objectives indented by 8. No header when a row
  of the step names the quest; a quest is named with its level everywhere in the window
  ("Accept [22] “quest”"). Hovering or clicking a row (X in
  focus mode): the quest's card in a tooltip (name, level, objectives and counters); clicking
  also sends the arrow there. Ding **never opens the game's quest log** or any Blizzard
  window: called from an addon, they are tainted and, on Forever, their secret values fail en
  masse (the game offered to disable Ding). `taint_test` checks this. For the same reason,
  there is no longer a "Game keybinds" button, and "Options > AddOns > Ding" opens Ding
  without closing the options.

- **Travel** (not in the mockup): the arrow's label line 1 says what to take ("Fly to …",
  "Try to fly to …" from a flight master never seen, "Take the boat to …", "Hearthstone to …",
  "Teleport to …") when walking is not the fastest; the window repeats it in a notice under
  the step, the itinerary under it ("Route: walk 1:20, fly 6:30 (8:30 in all)"). For a teleport, the item button shows the spell (its icon, name and cooldown, like
  an item). On the game's flight map, a 300 × 32 Ding banner (window look,
  13 SemiBold, the destination in the accent color) at the top of the screen and a 34 px accent
  ring over the destination node, placed where the game's node button stands (read only).

- **NPC directory** (not in the mockup; it replaces the "Nearby services" list): a 360-wide
  window like the settings (window look, opaque). Title bar 28 high: "Ding! · Directory" 13
  SemiBold (Ding! in `accent`, the dot `text.disabled`), the close cross on the right with the
  round B chip before it (gamepad, on a tab's first page). Tab strip 28 high, the settings' tab
  look (12 SemiBold, `text.secondary`, the active one `text` with a 2-unit accent underline):
  LB chip, "Nearby", "Cities", RB chip (chips with a gamepad only), then a `border` divider.
  Inside a list, a 26-high title row: accent left caret, the B chip (gamepad), the list's name
  13 SemiBold; a click goes back. Rows 36 high, 2 apart, 6 from the sides (row background
  `bg.control`, radius 4): the name 12 Medium, under it 11 Regular `text.secondary` ("Buliwyf
  Stonehand · Ironforge · by flight", or what an NPC offers), both 8 in. On the right, 8 in: a
  `text.secondary` right caret for a row that opens a list; 6 left of it (or of the edge), the
  time 12 SemiBold accent ("8 min away", "under 1 min away"). The inset focus ring of list rows;
  with a gamepad the focused row's A chip takes the caret's place, and every row keeps the
  chip's room (the time sits left of it), so that nothing moves with the focus and the chip
  never covers the time; the texts stop 8 before the time. A row with nothing to offer: its name
  `text.disabled`. Nine rows shown, then the wheel or the focus scrolls. Footer 26 high under a
  divider: with a gamepad, the plain text "Fastest way:
  flights, boats, hearthstone." (every action has its chip); without one, the mouse help
  ("Click: go · Right-click or Esc: close", "… : back" in a list).
- **The guide window's directory button** (not in the mockup): a 20 × 20 icon button in the
  title bar, left of minimize (a map pin: an 8-unit `text.secondary` circle with a 3-unit
  `bg` dot, over a 7-unit downward caret); tooltip "NPC directory". In focus mode, up from the
  first row: the outer focus ring around it and the A chip on its left (the title shortens).
- **Information apart from the step** (Yendi's first rule for the window): after the step's own
  rows, a 1-unit `divider` line across the list, then a section title "Good to know" (11 SemiBold
  `text.muted`, no icon, padding 8 above, none below; "Next steps" has the same line and title),
  then the notices, other quests' objectives and the rows added under the step, never with a
  state's background.
- **Guide window rows added under the step** (under "Good to know", after "along the way"),
  with their own look, never the red or green of the step's rows: no background, the icon on
  `accent.bg` with an `accent` glyph, text `text`, a counter `accent` (Yendi: the weapon to learn
  passed for a red row to do): "Weapon to learn: Guns —
  Buliwyf Stonehand, Ironforge" with sentences under it (why, how to go there or never see it
  again); "New spells at your class
  trainer (cost)", or "New spells may wait at your class trainer (level N)" before the first
  visit (glyph of an "other" row) and "Equip [item]" with the item's icon, no counter (a bare
  "+4" read like a quest's), and two sentences under it: how much better ("Clearly better than
  [worn item] for your class.") and how to equip it or say no. Focus mode also takes
  **Left** (ignore the gear upgrade under focus); Right stays the game's. With a free talent
  point, "Talent: name" (glyph of a "level" row), the rank it reaches as the counter ("2/3") and
  a sub-line saying how to learn it ("Focus mode, A twice: learn it", then "A again: learn it"
  for 5 s). Only when the class has a talent build.
- **Find this quest in the guide** (not in the mockup): a third item of the step menu ("Find this
  quest in the guide", same 26-high item) on a line with a quest; the offer is an ordinary row
  under the step, "Go to step N of Section" with a sub-line ("Turn in “…” · A: go there · Left:
  never mind"). Focus mode also takes **Right** (find the focused line's quest).
- **Goals without a quest** (not in the mockup): ordinary rows of the step, one per goal, with
  the kill, objective, use or "other" glyph and a counter ("2/8"). The dialogue line to pick
  is named on a Ding banner (like the flight map's), "Pick “…”", while the dialogue is open.
- **Settings by intent** (Yendi: "a huge mass of information; the dungeons are an endless
  list"), instead of screen 03's five tabs:
  - Window 560 wide (was 520) so that **six tabs** fit: `Guide`, `Route`, `Automation`,
    `Arrow and maps`, `Keybinds`, `Appearance`; tab padding 12 down to 6, then 11-unit labels,
    when a language is long. 392 high since the density below (440 before, 420 in the mockup).
    Every tab: padding 8, gap 2 (were 12 and 4).
  - **Block headers**: 20 high, 11 SemiBold `text.secondary`, bottom-aligned 8 in ("Quests",
    "Merchant", "Equipment", "Flights"; "Travel", "Group content", "Stops"; "Arrow", "Maps",
    "Target"; "Window", "Item button", "Minimap and sound").
  - **Descriptions on one line** (11 Regular `text.secondary`, cut beyond), shortened.
  - **Long lists on a page**: a page row (label, the value on the right in 12 Medium, `caret`
    RIGHT 8 `text.secondary`, accent when focused; `A Open`) opens a page over the tab's content:
    a title row (`caret` LEFT 8 accent, then the title 13 SemiBold, 26 high, a click goes back),
    then the list. "Dungeon quests: Off / All / 3 of 12" opens "All" and "None" (button rows),
    a "By level" header and one check row per dungeon, "name 17–21" (levels in
    `text.secondary`). B, Esc, a right click or the title go back to the row; LB / RB leave the
    page for a tab. The quest log cleanup is a page too.
  - **Folded rows**: a fold row, 28 high, `caret` RIGHT (folded) or DOWN (open) 8 then the label
    12 Regular `text.secondary` ("More options" / "Fewer options"; "Advanced" in Appearance);
    A or a click.
  - **"Defaults for this tab"**: a button row (confirmed) at the end of every tab but Keybinds.
  - Footer: on a page, B goes back: its chip sits on the page's title (below, "Each action
    once"); the mouse help says "Click: change · Right-click or Esc: back".
- **Step language 2** (not in the mockup): the dungeons' page of the Route tab (above); the
  arrow's label on a patrol, "text · point 2 of 5"; as a ghost on a death skip with a spirit
  healer, "Spirit healer".
- **Texts never cut** (Yendi's feedback: a step note ended in "un étage plus…" and could not be
  read anywhere): the rows' text, sub-lines (notes, hints) and notices wrap with no line cap
  (instead of "2 lines max" for the text and 3 for the sub-line); the row grows, at every width
  from 240. The minimized window keeps its one line with an ellipsis; hovering it shows that
  row whole with its note in a tooltip, and the gamepad's focus mode opens the window.
- **Notices** (not in the mockup): what concerns the whole window (the way there, a trip to a
  service, steps passed, bags almost full, quest log almost full) is a box of its own instead of
  a sub-line of the last row: row background `#FFFFFF0A` (`subtle`), radius 4, no icon, text
  11/14 Regular `text.secondary` at the icons' x, wrapped whole, the other lines of the
  same notice as its sub-line. The quest log's one adds "A: see the list" (mouse: "Click: see the
  list") and opens the settings on the cleanup page. A trip of the NPC directory: "On the way to
  … (…): the guide resumes once there.", the travel hint and the route in the same box (no
  travel box then); right under it, 2 apart, a "Cancel the trip" control: a row with the
  `bg.control` background and the `hover` one under the mouse, no icon, 12 Regular `text`; in
  focus mode, focused, the A chip on its right (gamepad). During a trip the step menu starts
  with the trip's entries ("Cancel the trip to …", "Done with …: back to the guide"), then a
  1-unit `divider` line (9 high with its space), then the guide's step said so ("Mark the
  guide's step as done", "Skip the guide's step"); the menu widens to its longest text.
- **Undo a mark** (not in the mockup): under a step marked done or skipped (seen again with
  "Previous"), the same control as the trip's, "Undo: mark as not done" / "Undo the skip"; the
  step menu starts with it too.
- **New continent** (not in the mockup): an ordinary "other" row under the step, "New continent:
  talk to … (flight master) to learn its flight paths".
- **Other quests, wrap-up, preview** (not in the mockup): the objectives of another quest
  (persistent, along the way) come under a header like a quest's (12 SemiBold `text.secondary`,
  no icon, padding 8 above: a group starts) that says why they are there, "Another quest of your
  log, to finish along the way: [29] “quest”" or "Another quest of your log, its targets are
  right here: [26] “quest”", indented by 8, without the to-do look: no background, icon
  `impossible.icon.bg` / glyph `text.secondary`, text and counter `text.secondary` (Yendi: "The
  Cursed Crew" 0/13 in red passed for the step's work); none under a step seen again with
  "Previous". The wrap-up choices are three rows besides the step (the first with "You are past
  this section's levels (up to N)."); the preview rows are dimmed: no background, icon
  `impossible.icon.bg` / glyph `text.disabled`, text `text.muted` without its links' colors, no
  counter; a quest's level in brackets before its name, "and 1 more quest" for the step's other
  quests, under a "Next steps" section title.
- **Minimap pins** (not in the mockup): `ring` 14 px accent for the target, `circle` 6 px accent
  at 70 % for the spots (a farming loop's stops: up to 12), `caret_up` 12 px accent on the rim (6 inside), rotated toward the
  target.
- **Import window** (not in the mockup): `/ding import`, `/ding export`, the Guide tab's page
  "Guides as text". A window like the settings' (560 × 440, `bg.window`, padding 12): title
  13 SemiBold ("Ding · Import a guide"), a help line 11 Regular `text.secondary`, the text in a
  box (radius 4, `bg.control`, 196 high, 11 Regular `text.primary`, scrolls), a status line
  12 Medium (`done` green when imported, `todo` red when refused, `text.secondary` while the
  game's chat still has the keyboard), the report in a second box
  (104 high, 11 Regular `text.secondary`, read-only, hidden when empty), buttons at the bottom
  right (26 high, radius 4, 12 Medium, the first one `accent` with `onAccent` text; focus: outer
  ring and halo, gamepad only; A on the focused one, B on the one that closes, Y on "Select
  all"), the hint bar at the bottom left (`Y Select for Ctrl+C` while no button selects;
  without a gamepad "Ctrl+V: paste · Esc: close"), on a line of its own above the buttons, the
  window 30 higher, when it does not fit beside them. The Guide tab:
  a header "Guides as text" and a page row "Import and export" (value "None" / "2 imported");
  its page: "Import a guide", "Export the active guide" (button rows), a header "Imported
  guides", one button row per imported guide ("Delete", confirmed; its steps, category and id
  under the title). In the guide list, an imported pack says "imported" where a pack names
  its author.
- **Guide categories** (not in the mockup): the guide list (first dropdown of the Guide tab)
  groups the packs by category, leveling first, then items (later reputations, professions,
  class): a header item per category that has packs, the item's height, the name 11 SemiBold
  `text.secondary` 8 in (no check column), never focused nor picked; the D-pad, a page jump
  and the mouse pass over it. Opening the list scrolls a header into view with the first item
  under it.
- **Quest monster mark** (not in the mockup, `UI/QuestMobs.lua`): over an enemy nameplate,
  bottom centered on the plate's top, 2 up; 18 high, the "small" shape (radius 3) in
  `itemBg` with a 1.5 border; the glyph of the window's rows (diamond 7 for a kill, dot 7 for
  a drop, "!" / "?" 12 Bold for a quest giver or a turn-in) 5 + 4 in from the left, then the
  counter 11 SemiBold 4 after an 8 glyph column, 6 at the right; without a counter, an 18
  square with the glyph centered. Current step: glyph and border `accent`, counter `text`;
  another quest: glyph and counter `text.secondary`, border `border`, the mark at 80 %. In
  the unit tooltip, one line per objective: "Ding!" in `accent`, then " · Kill for “Quest” 3/8 ·
  current step" (or "Loot for", "Quest to take:", "Quest to turn in:"; "current step" only on the
  accent marks) in
  `text` (the step's) or `text.secondary` (another quest's).
- **Target line** (not in the mockup): under the arrow's distance, gap 2, a glyph chip of the
  target binding then "Target: name" in 11 Regular `#A3A9B3` with the text shadow; only when
  that binding is bound and the arrow points to an NPC or a monster. In the Keybinds tab, an
  info row under the bindings (11 Regular `text.secondary`) suggests the game's "Interact with
  Target" key.
- **Each action once** (Yendi, in game: "the gamepad interface and the mouse interface coexist,
  so I get duplicate buttons": `A Import` in the hint bar next to the Import button). With a
  gamepad, a button carries the chips of the gamepad buttons that press it, and the hint bar
  keeps only what no button on screen does; without one, the buttons alone and the mouse help
  (no chip anywhere). Switching (a gamepad plugged in or out) updates an open window.
  - **Chips on a button** (`UI.ButtonKeys`): the 14-high chips before the label, 6 between the
    last chip and the label, 3 between chips, chips and label centered together. On a
    `bg.control` button the hint bar's colors; on an `accent` button a dark disc
    (`glyphOnAccent`, `#0B0C0E33`) and the `onAccent` letter. A button keeps room for every
    chip it can carry, so that it does not grow when the focus comes to it.
  - **Import window**: A on the focused button, B on Cancel / Close (A and B on it when it has
    the focus), Y on "Select all" (export); the hint bar keeps `Y Select for Ctrl+C` (import)
    or nothing (export).
  - **Settings**: the footer no longer shows `B Back` nor `LB RB Tabs` (screen 03's footer):
    the round B chip of the title bar and the LB / RB chips of the tabs say it, and show only
    while those buttons do that (not while the guide list is open, a button is awaited or a
    binding conflict asks). On a page the B chip moves from the title bar to the page's title
    (between the caret and the name). The focused check row shows A in its corner (screen
    03), the focused button row A on its button: their footer is empty. A confirmation: the
    button says "Confirm? (A)", the footer `B Cancel` only. Other rows keep their footer (`A
    Open`, `◂ ▸ Adjust`, `Y Reset`, `A Bind` · `Y Unbind`…).
  - **Move mode plate**: Save (A), Cancel (B) and Reset (Y) buttons with their chips; the
    hints keep `◂▴▾▸ Move` and `LB RB Step 1 / 20`.
  - **NPC directory**: A on the focused row, B on the close cross (in a list: on the list's
    title), LB / RB at the ends of the tabs; the footer keeps a plain text ("Fastest way:
    flights, boats, hearthstone."), the mouse help without a gamepad.
  - The guide's focus mode has no button doing what a hint says: its hint bar (below) lists A,
    X and B; A is left out on a row that carries the A chip (a control) and on the directory's
    button.
- **Plain words** (Yendi, v1.4.0: "the player must understand"; no meaning carried only by a
  color, an icon or shorthand; SPEC "Plain words"). What changes on screen:
  - Every row of the guide window has a card (hover, X in focus mode): first what its look means
    ("Still to do.", "Done.", "Not possible yet: …", "Marked done by hand: …", "Skipped for
    later: …", "A step further on: …", "Not this step's work: …", "Not a step of the guide: …";
    a quest header: where its quest stands), in `#CCCCCC` like the card's other lines; a quest's
    "[29]" as "Quest level 29" (above the player's: why it is orange), "· before “Name”" in a
    sentence. A row without a quest: its text whole in white, then those lines; section titles,
    notices and controls have no card (their text says it).
  - Quest lines done change verb ("Accepted / Turned in / Completed [2] “Name”").
  - Next steps: a "Next steps" header row above them, the quest headers' style (12 SemiBold
    `text.secondary`, no icon nor background).
  - Focus mode (gamepad only): a hint bar 22 high under the progress, 6 below it, 8 from the
    sides, plain hints (not buttons, so that three fit at 240: `A Arrow` · `X Details` · `B
    Leave`); the window grows by its height. The directory's button, focused, shows its tooltip.
  - Minimized window: hovering it always shows the card (row, note, state, "Step 3 of 42").
  - Arrow: "distance unknown" instead of "?"; the label wraps under LABEL_MAX instead of
    being cut ("name · farming loop: 2 of 6").
  - Minimap pins: hovered, a tooltip ("Ding! · name" then what the pin is); they take the mouse's
    motion only, the minimap keeps its clicks (`SetMouseClickEnabled(false)`; a client without
    it: no hover).
  - Item button tooltip: an accent line under the item's card: why it is there, its cooldown in
    seconds, "Cannot be used right now." when dimmed. A gear upgrade's card in the window: its
    "+12" in an accent line.
  - NPC directory: "8 min away", "under 1 min away", "· by flight, boat", "and 2 more".
  - Offers panel: "Name (level 24)" (the panel takes no mouse: no card to explain "[24]").
  - Settings: "levels 10–20", "from level 20"; the minimap pins' and nameplate marks'
    descriptions name their shapes.

- **Setup assistant** (not in the mockup, `UI/Setup.lua`; Yendi: an onboarding of choices, not
  of text, three choices at most per screen): a 460-wide window like the directory's (window look,
  opaque, DIALOG). Title bar 28 high: "Ding! · Setup" 13 SemiBold (Ding! in `accent`, the dot `text.disabled`), the close
  cross with the round B chip before it (gamepad). A screen, 14 in: its title 16 SemiBold
  `text` (the arrow distance's size), 4 below one sentence 12 Regular `text`, both wrapped
  whole; 8 below, the choices, 8 from the sides, 2 apart: rows of the settings' look (inset
  focus: `accentBg` fill and the 2-unit accent ring; the A chip at the right, 8 in, gamepad),
  at least 28 high, growing with their texts. In a row, 6 from the top and 8 in: a check box (the settings' 16-unit
  box: `accent` with the check, or the `muted` outline), a radio (the 16-unit `ring` in `muted`,
  an 8-unit accent `circle` when chosen), or, for a guide, the accent check on the current one;
  the label 12 Regular `text` 34 in (`text.disabled` for a pack with nothing for the
  character), under it 11 Regular `text.secondary` (a pack's levels or items), both wrapped; on
  the right before the A chip's room, "Recommended" 11 SemiBold `accent`. The window is as high
  as its tallest screen in the client's language, the same on every screen. Footer 70 high under
  a divider, 8 from its edges: "Keep the recommended settings" across (24 high, `bg.control`, 12 Medium, the Y
  chip before it), 6 below Previous on the left and Next on the right (24 high, radius 4, 12
  Medium, at least 96 wide; Previous `bg.control`, `text.disabled` on the first screen; Next
  `accent` with `onAccent` text, "Finish" on the last screen, its width that of the longer
  label; LB and RB chips), the screen dots centered between them (14 wide and 2 apart: a 6-unit
  `circle` in `text.disabled`, the current screen's 8 units in `accent`, hover `text.secondary`).
- **Density** (v1.4.0; the user: "the preferences UI is too big, too airy; a bit denser, not
  much"; a full redesign of the settings and the assistant comes later): the settings, the NPC
  directory and the setup assistant share their sizes (`UI.SIZE` in `UI/Widgets.lua`), about
  15 to 20 % tighter than above: title bars 28 (32), tab bars 28 (36 / 30), hint bars 26
  (32 / 28), rows of one line 30 (36), of a label and its description 38 (44; 36 in v1.4.0, the
  label touched the frame), the directory's 38, "More options" 28 (32), block headers 20 (24), a page's title 26 (30), padding 8 (12),
  2 between rows (4); the sliders 66 high (78), the dropdown's field 28 (32) and its entries 24
  (28), the Appearance preview 86 (100), the settings' push buttons 22 (24), the assistant's 24
  (26). Texts are never cut (a description stays one line, as before), the focus rings keep
  their 2 units, the rows stay as wide. On a row with a description, the label sits just above
  the row's middle and the description just below it (2 apart), so the two lines are centered
  on the row and on its check box whatever the font's real line heights (the user, v1.5.0).
- **Size of the settings windows** (v1.4.0; the user's screen draws the 520-unit mockup window
  about 1.5 times bigger than the mockup they compared it with: the game's UI scale on a
  high-resolution screen): the Appearance tab's "Settings windows size" slider, under a
  "Settings windows" header, 60 % to 120 % by 5 %, 85 % by default, sets the scale of the
  settings, the NPC directory, the setup assistant and import / export (`UI.Dialog`,
  `Ding.db.ui.dialogScale`); not the guide window, which has its own "Window scale". The open
  window follows at once (with the mouse, once it lets go of the thumb: the window would move
  under it). The windows stay centered, as far from the screen's center whatever their size,
  and on the screen.
  No hint bar: every action has its control.
- **Settings, Guide tab** (Help): a header "Help" and a button row "Run the setup assistant
  again" ("How you play, automation, route and guide.", button "Open"), before "Defaults
  for this tab".

## To check in game (Forever 1.60)

- Why the guide makes its choices: the line under the Duskwood step that turns in "The Legend of
  Stalvan" at Moonbrook (Leveling, Alliance section 11), at 240 and 300 wide; the "Why?" part of
  the row tooltips with the mouse and with X in focus mode; nothing more with the option off.

- Quests an NPC offers: `GossipFrame` and `QuestFrame` (names, `GetLeft` / `GetRight` / `GetTop`)
  with the gamepad interface on; the order of `GOSSIP_CLOSED` and `QUEST_DETAIL` when a quest
  is picked from a gossip; no "AddOn blocked" popup while the window shows.
- Setup assistant: the window's height on its tallest screen (no text cut, in French and German
  above all), the radio ring and the check boxes, Previous and Next clear of the dots with the
  gamepad's chips, Y keeping the recommended settings, Esc and B closing it then the Keybinds tab
  following at the first launch (not after "Keyboard and mouse").
- Loading of the kit's TGAs and of the Noto Sans fonts (`Font:SetFont` on a file of the
  addon); otherwise the game font takes over.
- Sharp nine-slices at 100 % scale (corners of 6, 4, 3, 2), shadows and halos.
- Rotation of `caret_up` (◂ ▸ ▾), rounded mask of item icons (`CreateMaskTexture`).
- `GetQuestObjectives` texts (type, counters) and `QUEST_MONSTERS_KILLED` patterns in French.
- Focus mode: `SetOverrideBindingClick` to `DingItemButton` (A uses the item); its hint bar
  (A, X, B) fits at 240 in every language.
- Minimap pins: `SetMouseClickEnabled(false)` keeps the minimap's clicks (pings) under a pin
  while hovering it shows its tooltip.
- The arrow's label on two lines (a long farming loop or travel hint): centered, the distance
  under it.
- Item button: `PostClick`, right-click drag, `IsItemInRange`, `IsUsableItem`.
- Minimap button: position around the round minimap, dragging.
- `C_GamePad.IsEnabled` or the `GamePadEnable` variable to hide the chips without a gamepad.
- Flight map: `C_TaxiMap.GetAllTaxiNodes` (or the legacy taxi functions) and the `TaxiButton<i>`
  buttons, the ring on the right node; `TakeTaxiNode` watched with `hooksecurefunc`.
- World map mark: does Forever have `C_Map.SetUserWaypoint` / `UiMapPoint` and super-tracking;
  the pin on the world map and the minimap, its on-screen marker if any; moved with the target;
  a waypoint you set yourself is left alone; option off or window closed: cleared. Without
  the API and with TomTom: TomTom's pin, no TomTom arrow.
- Zone names: localized zone names (`C_Map.GetMapInfo`), a dungeon or a city's sub-map named by
  its zone, nothing when the target is in your zone.
- Quest monster marks: `NAME_PLATE_UNIT_ADDED` / `C_NamePlate.GetNamePlateForUnit`, the mark
  above the plate (its size and place at every plate scale, over the name), the counter after
  a kill, in combat (a GUID kept secret?); the tooltip line (`TooltipDataProcessor` or
  `OnTooltipSetUnit`) inside the tooltip's background; `nameplateMaxDistance`: the distance the
  client keeps (the chat says it) and the value back once off.
- Teleports on the item button (`type` "spell", the spell's name): the cast, its icon and
  cooldown; `C_Spell.GetSpellName` / `GetSpellInfo`, `IsSpellKnown`.
- Automatic flight (option on): `TakeTaxiNode(index)` from an addon when the flight map opens,
  `Dismount()` when mounted (allowed out of combat?), the chat line, Shift (LT) held to choose.
- Talents: `GetTalentInfo` (tier, column, rank), `GetTalentPrereqs`, `UnitCharacterPoints`, and
  whether `LearnTalent(tab, index)` is allowed from an addon (a press on Ding's row, out of
  combat); `GameTooltip:SetTalent` on the row.
