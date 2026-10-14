<!--
Ding's theme sheet: the Claude Design handoff "Ding — theme system and three Forever themes"
(October 14, 2026), as delivered, then how it is implemented ("Implementation") and what can
only be checked in game. The mockup (HTML) and the PNG textures are not in the repository
(Yendi keeps the handoff archive); the textures are converted in Ding/Media/Textures.
The first handoff (the dingdark theme's look, every size) stays docs/UI-handoff.md.
-->

# Handoff: Ding — theme system and three "Forever" themes

## In the code

| What | Files |
|---|---|
| Theme registry, theme tables, `UI.Theme.Apply` | `Ding/UI/Themes.lua` |
| Token tables (`UI.C`), painting through tokens, skins, fonts by surface, window styles, focus, chips, hover card | `Ding/UI/Widgets.lua` (`UI.Color`, `UI.Tint`, `UI.Fill`, `UI.Paint`, `UI.Skin`, `UI.Font`, `UI.TitleFont`, `UI.Window`, `UI.Separator`, `UI.DialogBars`, `UI.Focus`, `UI.Glyph`, `UI.Card`, `UI.*Row`) |
| Gradients on every client | `Ding/Core/Compat.lua` (`Compat.SetGradient`) |
| Guide window, hover card | `Ding/UI/Panel.lua` |
| Arrow | `Ding/UI/Arrow.lua` |
| Appearance tab: theme picker | `Ding/UI/Config.lua` |
| New textures | `Ding/Media/Textures/*.tga` |

## Overview
Ding gets a **theme system**: the player picks a theme in Settings › Appearance, with a live preview. A theme changes **only the look** (colors, alphas, textures, font flags, a few decorations). It never changes sizes or positions: the layout (`UI.SIZE`) is shared by every theme, so there is one code path.

This handoff defines four themes:

| id | Name shown (frFR) | Status |
|---|---|---|
| `halo` | Forever · Halo | **new default**, board 1a |
| `ardoise` | Forever · Ardoise | new, board 1b |
| `bandes` | Forever · Bandes | new, board 1c |
| `dingdark` | Ding sombre | the current look, tokens unchanged (`docs/UI-handoff.md`) |

"Contraste élevé" appears on a card in the mockup but is **not designed yet**: do not ship that card.

## About the design files
`design/Ding Forever Directions.dc.html` (in the handoff archive) is an **HTML design reference** (open it in a browser; `support.js` and `assets/` must stay next to it). It is not code to ship. The task is to **recreate it in the addon in Lua with the WoW frame API**, the same way as the previous handoff. When in doubt, the HTML is the reference. In Tweaks you can switch the backdrop (`taverne`, `carte` and `neige` = light-background test) and the display scale (1.9 ≈ a 1440p screen).

The mockup draws some things with CSS that the game cannot do: soft box-shadows, `clip-path` arrows, `drop-shadow` outlines, multi-stop gradients. **Each one maps to a texture listed below.** Do not try to reproduce the CSS.

## Fidelity
**High fidelity** for the surfaces drawn: guide window (mouse, hover), hover card, arrow (3 states), Settings › Appearance (gamepad). Every value is in WoW interface units (`UIParent` scale 1). Colors are `#RRGGBBAA`. The other surfaces (directory, NPC panel, assistant, import, nameplate marks, item button, minimap) are not drawn per theme yet. They must take their colors from the theme's tokens (same roles as today), and the theme flags below apply to them where noted.

---

## Theme architecture

```lua
-- Ding/UI/Themes.lua
UI.Themes = {}            -- id -> theme table
UI.ThemeOrder = { "halo", "ardoise", "bandes", "dingdark" }

-- a theme table
{
  id = "halo",
  name = L["Forever · Halo"], desc = L["Léger, aux couleurs du jeu."],
  C = { ... },            -- color tokens, same keys in every theme (table below), {r,g,b,a}
  opacityDefault = 60,    -- default of the "Opacité du fond" slider for this theme
  flags = {
    windowStyle = "feather" | "panel" | "bands",
    textShadow  = {0, -1, 0,0,0,0.90} | nil,
    fontOutline = false | "OUTLINE",
    titleFont   = "game" | "noto",       -- "game" = STANDARD_TEXT_FONT (the game's own font)
    focusChevron = false | true,
    arrowLabelPlate = false | true,
    stateRowBg  = false | true,          -- tinted backgrounds on done / to-do rows
  },
  tex = { arrow=..., arrowBack=..., arrived=..., arrivedCheck=..., chipDisc=..., chipPill=..., focusRing=... },
  radius = { window=..., row=..., control=..., chip=3 },
}
```

- `UI.C.<token>` resolves through `UI.Themes[Ding.db.ui.theme].C`. Every widget that paints registers a `Skin(self, theme)` function. `UI.Theme.Apply(id)` sets the theme and calls every registered `Skin`, then `Panel:Relayout()` (wrapping can change when the title font changes).
- **Never in a theme**: `UI.SIZE`, paddings, gaps, row heights, font sizes. Line heights are fixed **per role** (table "Typography") and identical in every theme. With the game font on titles, a line can wrap differently and the row grows, but nothing moves sideways.
- SavedVariables: `DingDB.ui.theme = "halo"` (new installs and existing installs: the default changed, say it in the changelog). `DingDB.ui.opacity` stays one number. When the theme changes and the player never moved the slider (`DingDB.ui.opacityTouched ~= true`), set the slider to the new theme's `opacityDefault`.
- The game font is never shipped: `STANDARD_TEXT_FONT` (or `GameFontNormal:GetFont()`). In koKR/zhCN Ding already uses the game font everywhere, so `titleFont` changes nothing there. The mockup uses **Marcellus** only as a stand-in for the game font.

---

## Shared layout (every theme)

These are the previous handoff's sizes, kept. What's new:

**Guide window** — 300 wide (240–420), height = content.
- Title bar 24 · separator 1 · step bar 28 · separator 1 · list (padding 4, gap 2) · progress (padding 2/8/8, bar 3).
- Row: padding 4 vertical / 6 horizontal, gap 8, icon 16, text 12/16, sub-lines 11/14 with 2 between them, counter 12/16 SemiBold. Objectives under a quest header are indented 8.
- Quest header: padding 4 top / 6 left, no icon, `[27]` in `text.secondary`, the name in `quest` (or `quest.above` when the quest's level is above the player's).
- Section title ("À savoir", "Étapes suivantes"): 6 above, then a 1-unit divider across the list, then 8, then the title 11/14 SemiBold `text.muted` at 6 in. In `bandes` the line sits on the right of the title instead (see below).
- Notice box: padding 6, left padding 30 (text at the text column), radius = `radius.row`, background `notice.bg`.
- Hover: row background `hover`. The row under the mouse in the mockup is « Récupérer Fragment Neru ».

**Hover card** (Ding's own tooltip frame, never `GameTooltip` restyled): 220 wide, padding 8/10, gap 3. It is placed 10 to the right of the window, top aligned with the row. Title 12/16 SemiBold `text.primary`, lines 11/14 `card.text`, last line "Clic : la flèche y va." in `accent`.

**Arrow** — 56 rotated texture, 8 to the label, label max width 220, centered, lines 2 apart:
1. instruction or target name: 14/18 with `titleFont` (13/18 SemiBold Noto in `bandes`). "Vole vers Forgefer" in `accent`; a plain target name in `text.primary`.
2. detail: 11/14 `arrow.sub` ("Shellei Brondir · Port de Menethil", "Boucle de chasse : repère 2 sur 10")
3. distance 16/20 SemiBold `text.primary` + " · 1 min 10" 12 Regular `arrow.sub`. Behind (> 120°): the whole line in `arrow.back`, "85 m · fais demi-tour". Arrived: `tex.arrived` 48 + `tex.arrivedCheck` 22 in `done`, line "Tu y es" 16 SemiBold `done`, the target name above it.

**Settings › Appearance** — window 560 wide, height = content (≈ 430 in frFR; was 392, the theme block adds it).
- Title bar 28 · separator · tabs 28 · separator · content padding 8, gap 2 · separator · footer 26.
- Block header "Thème" 20 high, bottom-aligned, 8 in.
- **Theme cards**: a 4-column grid (gap 6, 4 above), card width (544 − 18) / 4 ≈ 131. The mockup has 3 columns; use 4 for the four themes. Card: padding 6, gap 4, radius `radius.control`, background `card.bg`:
  - preview 34 high, radius 2: a scene (a texture we ship: `theme_preview_bg.tga` 256×64, drawn by us, no capture of the game) with a small mock bar in that theme's look ("Ding! Étape 29 / 87", 10 Regular). These are real frames using the card's theme tokens, not baked images.
  - name 12 SemiBold `text.primary`, and on the right "Actif" 11 SemiBold `accent` on the current theme, or the A chip on the focused card (gamepad).
  - description 11/14 `text.secondary`, wraps.
- Under the cards, 4 above: "La fenêtre du guide montre le thème pendant que tu choisis." 11/14 `text.secondary`.
- Block "Fenêtre du guide": slider "Opacité du fond" (0–100 %, step 5, default = theme's), slider "Taille de la fenêtre du guide" (50–150 %), check row "Réduire la fenêtre en combat". Sliders: padding 6/8, gap 6, track 4, thumb 14.
- Footer (gamepad, focus on a card): `Y Thème par défaut` only (A is on the card, B on the title bar, LB/RB on the tabs: each action once).

**Theme cards — copy (frFR)**

| id | Name | Description |
|---|---|---|
| `halo` | Forever · Halo | Léger, aux couleurs du jeu. |
| `ardoise` | Forever · Ardoise | Un panneau sombre, filets or. |
| `bandes` | Forever · Bandes | Une bande par ligne, texte cerné. |
| `dingdark` | Ding sombre | Le thème d'origine de Ding!. |

### Typography (shared roles, every theme)
| Role | Size / line | Weight | Font |
|---|---|---|---|
| Window title, settings title | 13/16 (settings 14/18) | — | `titleFont` (game font) · `bandes`: Noto SemiBold 12/16, settings 13/18 |
| Quest header | 13/16 | — | `titleFont` · `bandes`: Noto SemiBold 12/16 |
| Settings block header | 11 SemiBold Noto · `ardoise`: 12 game font in `accent` | | |
| Arrow line 1 | 14/18 | — | `titleFont` · `bandes`: Noto SemiBold 13/18 |
| Body, row text | 12/16 | Regular | Noto |
| Sub-line, notice, card lines | 11/14 | Regular | Noto |
| Section title | 11/14 | SemiBold | Noto |
| Counter, "Étape 29" | 12/16 | SemiBold | Noto |
| Distance | 16/20 | SemiBold | Noto |
| Chips | 9 | Bold | Noto |

`fontOutline = "OUTLINE"` (bandes) applies to every FontString of the guide window, the arrow and the hover card, not to the opaque settings window.

---

## Color tokens

Keys are the previous handoff's, plus `quest`, `quest.above`, `link`, `card.bg`, `card.text`, `notice.bg`, `arrow.sub`, `arrow.back`, `chip.bg`, `chip.text`, `line`. 0–1 values for `SetVertexColor` / `SetTextColor`.

### `halo` (1a) — feather, gold
| Token | Hex | RGBA 0–1 | Usage |
|---|---|---|---|
| `bg.window` | `#080604` | 0.031, 0.024, 0.016, **α = setting** (default 0.60) | `soft_rect` feathered background |
| `bg.settings` | `#080604E6` | 0.031, 0.024, 0.016, 0.90 | settings, same feather |
| `card.bg` (tooltip) | `#080604E0` | 0.031, 0.024, 0.016, 0.88 | hover card, feather |
| `bg.control` | `#FFFFFF12` | 1, 1, 1, 0.07 | ‹ › buttons |
| `card.bg` (theme card) | `#FFFFFF0F` | 1, 1, 1, 0.06 | theme cards |
| `hover` | `#FFFFFF17` | 1, 1, 1, 0.09 | row under the mouse |
| `notice.bg` | `#FFFFFF0F` | 1, 1, 1, 0.06 | notice box |
| `divider` | `#FFFFFF1F` | 1, 1, 1, 0.12 | section lines, tab bottom line |
| `line` | `#FFD10059` | 1, 0.820, 0, 0.35 | `line_fade` under title bar / step bar |
| `text.primary` | `#F4EFE6` | 0.957, 0.937, 0.902 | |
| `text.secondary` | `#C2B9A9` | 0.761, 0.725, 0.663 | done rows' text, other quest, sub-lines |
| `text.muted` | `#8F8778` | 0.561, 0.529, 0.471 | "/ 87", section titles, preview text |
| `text.disabled` | `#6E675C` | 0.431, 0.404, 0.361 | preview glyphs |
| `card.text` | `#E0D9CC` | 0.878, 0.851, 0.800 | hover card lines |
| `arrow.sub` | `#E0D9CC` | 0.878, 0.851, 0.800 | |
| `accent` | `#FFD100` | 1, 0.820, 0 | focus, active tab, progress, "Clic :", to-do glyph and counter |
| `accent.bg` | `#FFD1001F` | 1, 0.820, 0, 0.12 | focused card / row |
| `on.accent` | `#17130E` | 0.090, 0.075, 0.055 | check on checked box |
| `quest` | `#FFD100` | 1, 0.820, 0 | quest names in headers |
| `quest.above` | `#FF9A3C` | 1, 0.604, 0.235 | quest above the player's level |
| `link` | `#8CCBFF` | 0.549, 0.796, 1 | item / NPC / target names |
| `done` | `#5FD068` | 0.373, 0.816, 0.408 | check glyph, counter, arrived |
| `todo` | `#FFD100` | = accent | dot / diamond glyph, counter |
| `other` | `#C2B9A9` | = text.secondary | other quest's glyph and counter |
| `arrow.back` | `#FFA35C` | 1, 0.639, 0.361 | behind line |
| `track` | `#FFFFFF24` / slider `#FFFFFF29` | 1,1,1,0.14 / 0.16 | progress / slider tracks |
| `thumb` | `#F4EFE6` | | slider thumb |
| `chip.bg` | `#E2DCCD` | 0.886, 0.863, 0.804 | Forever-like light chips |
| `chip.text` | `#17130E` | 0.090, 0.075, 0.055 | |
| `textShadow` | `#000000E6` | offset (0, −1) | every text |

Flags: `windowStyle="feather"`, `titleFont="game"`, `stateRowBg=false` (no row backgrounds: the state reads from the word, the glyph and the counter), `focusChevron=false`, `arrowLabelPlate=false`. Radii: window none visible (feather), row 3, control 3 (‹ ›), card 4, check box 3. Focus: `accent.bg` + 2-unit inset ring `accent` (`rr4_stroke2`), no halo.
Arrow: `arrow_halo_gold.tga` (real colors, **not tinted**), behind `arrow_halo_back.tga`, arrived `ring.tga` + `icon_check_large.tga` tinted `done`, both with the `textShadow` duplicate underneath (offset 0,−1) as today.

### `ardoise` (1b) — panel, gold hairlines, tinted rows
| Token | Hex | RGBA 0–1 | Usage |
|---|---|---|---|
| `bg.window` | `#0E0B08` | 0.055, 0.043, 0.031, **α = setting** (default 0.80) | `rr3_fill`, no border, `shadow.tga` `#00000059` |
| `bg.titlebar` | `#00000047` | 0, 0, 0, 0.28 | title bar band (window and settings) |
| `bg.settings` | `#0E0B08F0` | 0.055, 0.043, 0.031, 0.94 | |
| `card.bg` (tooltip) | `#0E0B08F0` | same | + 1-unit top line `#C6A05080` |
| `bg.control` | `#FFFFFF0F` | 1, 1, 1, 0.06 | ‹ › buttons |
| `card.bg` (theme card) | `#FFFFFF0D` | 1, 1, 1, 0.05 | |
| `notice.bg` | `#FFFFFF0D` | 1, 1, 1, 0.05 | |
| `line` | `#C6A05066` | 0.776, 0.627, 0.314, 0.40 | separators under title / step bar (solid 1) |
| `divider` | `#C6A0504D` | 0.776, 0.627, 0.314, 0.30 | section lines; settings tab line `#C6A05040` (0.25) |
| `text.primary` | `#F2EDE4` | 0.949, 0.929, 0.894 | |
| `text.secondary` | `#B9AFA0` | 0.725, 0.686, 0.627 | |
| `text.muted` | `#8C8375` | 0.549, 0.514, 0.459 | |
| `text.disabled` | `#6B6458` | 0.420, 0.392, 0.345 | |
| `card.text` | `#DAD2C4` | 0.855, 0.824, 0.769 | |
| `arrow.sub` | `#B9AFA0` | = text.secondary | |
| `accent` | `#F5C842` | 0.961, 0.784, 0.259 | |
| `accent.bg` | `#F5C8421F` | 0.961, 0.784, 0.259, 0.12 | |
| `on.accent` | `#17130E` | 0.090, 0.075, 0.055 | |
| `quest` | `#F5C842` | = accent | |
| `quest.above` | `#FF9A3C` | 1, 0.604, 0.235 | |
| `link` | `#8CCBFF` | 0.549, 0.796, 1 | |
| `done` | `#6FD36F` | 0.435, 0.827, 0.435 | |
| `done.row.bg` | `#6FD36F21` | 0.435, 0.827, 0.435, 0.13 | |
| `done.icon.bg` | `#6FD36F38` | 0.435, 0.827, 0.435, 0.22 | |
| `todo` | `#FFB040` | 1, 0.690, 0.251 | amber, not red |
| `todo.row.bg` | `#FFB04033` | 1, 0.690, 0.251, 0.20 | |
| `todo.icon.bg` | `#FFB0403D` | 1, 0.690, 0.251, 0.24 | |
| `other.icon.bg` | `#FFFFFF12` | 1, 1, 1, 0.07 | other quest, weapon |
| `preview.icon.bg` | `#FFFFFF0D` | 1, 1, 1, 0.05 | |
| `arrow.back` | `#FFB040` | = todo | |
| `labelPlate` | `#0E0B08B8` | 0.055, 0.043, 0.031, 0.72 | arrow label plate, `rr3_fill`, padding 4/10 |
| `track` | `#FFFFFF1F` / slider `#FFFFFF24` | | |
| `chip.bg` / `chip.text` | `#E2DCCD` / `#17130E` | | as `halo` |
| `textShadow` | `#00000099` | offset (0, −1) | |

Flags: `windowStyle="panel"`, `titleFont="game"`, `stateRowBg=true`, `focusChevron=true`, `arrowLabelPlate=true`. Radii: window 3, row 3, icon 3, card 3. Focus: `accent.bg` + 1.5-unit inset ring `accent` (`rr3_stroke15`) + `chevron_focus.tga` 7×16 tinted `accent`, 9 left of the focused element, vertically centered (inside lists it sits in the 4-unit list padding + 5 outside the window: allowed, it overhangs). Active tab: `text.primary` + 2 underline `accent` + vertical `SetGradient` on a `rr2_fill`-free plain texture from `accent` α 0 (top) to α 0.14 (bottom). Settings block headers: 12 game font `accent`.
Arrow: `arrow_slate.tga` tinted `#F2EDE4`, behind tinted `todo`; arrived `ring.tga` tinted `done` on a 48 `circle.tga` `#0E0B0880`.

### `bandes` (1c) — no window, a band per row, outlined text
| Token | Hex | RGBA 0–1 | Usage |
|---|---|---|---|
| `band.left` / `band.right` | `#040609D1` → `#04060966` | 0.016, 0.024, 0.035, 0.82 → 0.40 | title bar, step bar: `rr2_fill` + `SetGradient("HORIZONTAL")` |
| `band.todo` | `#12283EEB` → `#12283E8C` | 0.071, 0.157, 0.243, 0.92 → 0.55 | step's rows still to do |
| `band.done` | `#103822D1` → `#0406095C` | 0.063, 0.220, 0.133, 0.82 → 0.016, 0.024, 0.035, 0.36 | done rows |
| `band.info` | `#04060999` → `#0406093D` | 0.016, 0.024, 0.035, 0.60 → 0.24 | "À savoir" headers, rows, notice |
| `bg.window` | none | | no window background; the opacity slider (default **82**) scales every band: α × setting / 82 |
| `bg.settings` | `#06080BE6` | 0.024, 0.031, 0.043, 0.90 | radius 2, shadow |
| `bg.titlebar` (settings) | `#63C2FF24` → `#63C2FF00` | horizontal gradient | |
| `bg.tabs` | `#FFFFFF08` | 1, 1, 1, 0.03 | |
| `card.bg` (tooltip) | `#040609F0` → `#040609D1` | horizontal gradient | |
| `card.bg` (theme card) | `#FFFFFF12` → `#FFFFFF05` | horizontal gradient | |
| `bg.control` | `#FFFFFF14` | 1, 1, 1, 0.08 | |
| `line` | `#FFFFFF66` → 0 | `line_fade_right`, 1 unit, + 1 unit `#00000099` under it | section rule, right of the title, 8 after it |
| `text.primary` | `#F5F7FA` | 0.961, 0.969, 0.980 | |
| `text.secondary` | `#C3CAD3` | 0.765, 0.792, 0.827 | |
| `card.text` / sub-lines | `#D3D9E0` | 0.827, 0.851, 0.878 | sub-lines are lighter than in other themes: the outline darkens them |
| `text.muted` | `#AEB6C1` | 0.682, 0.714, 0.757 | preview rows (no band) |
| `text.disabled` | `#8E97A3` | 0.557, 0.592, 0.639 | |
| `accent` | `#63C2FF` | 0.388, 0.761, 1 | |
| `accent.bg` | `#63C2FF29` | 0.388, 0.761, 1, 0.16 | (active tab `#63C2FF2E`) |
| `on.accent` | `#0A1118` | 0.039, 0.067, 0.094 | |
| `quest` | `#FFD100` | 1, 0.820, 0 | the game's quest gold |
| `quest.above` | `#FF9A3C` | | |
| `link` | `#63C2FF` | = accent | |
| `done` | `#5ED38A` | 0.369, 0.827, 0.541 | |
| `todo` | `#F5F7FA` | = text.primary | to-do glyph and counter |
| `arrow.back` | `#FF8E5E` | 1, 0.557, 0.369 | |
| `track` | `#0000008C` | 0, 0, 0, 0.55 | progress, + 1-unit black edge |
| `chip.bg` / `chip.text` | none / `#F5F7FA` | | outlined chips |

Flags: `windowStyle="bands"`, `titleFont="noto"`, `fontOutline="OUTLINE"`, `textShadow=nil`, `stateRowBg=true` (as bands), `focusChevron=false`, `arrowLabelPlate=false`. Rows are 2 apart, so the scene shows between bands. The quest header of the step's own quest and the preview rows have **no band**. Radii 2 everywhere. Focus: `accent.bg` + 2-unit inset ring `rr2_stroke2.tga` `accent`. Chips: `chip_ring.tga` / `chip_pill_stroke.tga` tinted `text.primary`, letter `text.primary`.
Arrow: `arrow_band.tga` tinted `accent`, behind tinted `arrow.back`; arrived `ring_outlined.tga` + `icon_check_large_outlined.tga` tinted `done` (the black outline stays black when tinted).

### `dingdark`
The token table of `docs/UI-handoff.md`, unchanged, with flags `windowStyle="panel"`, `titleFont="noto"`, `stateRowBg=true`, everything else off, plus the new keys: `quest = accent`, `quest.above = #FF9A3C`, `link = accent`, `card.bg = bg.window` opaque, `card.text = #CCCCCC`, `notice.bg = #FFFFFF0A`, `arrow.sub = text.glyph`, `arrow.back = todo`, `chip.bg = surface.glyph`, `chip.text = text.glyph`, `line = divider`.

---

## Window styles (what `flags.windowStyle` builds)

- **feather** (`halo`): the background texture is `soft_rect.tga` (64, slice 24), anchored **20 units outside** the frame on each side, tinted `bg.window` at the slider's alpha. The window's own edge is invisible. Mouse hit rect = the frame, not the feather. Same for settings (`bg.settings`) and the hover card (feather 12 outside).
- **panel** (`ardoise`, `dingdark`): `rr3_fill` (ardoise) / `rr6_fill` + `rr6_stroke1` (dingdark), plus `shadow.tga`.
- **bands** (`bandes`): no frame background. Every row, bar, header and notice gets its own `rr2_fill` with `SetGradient("HORIZONTAL", left, right)`; the row's state chooses the pair. The collapsed window is one band.

At **opacity 0 %**, feather and bands disappear entirely. Text stays readable only through the shadow (halo, ardoise) or the outline (bandes).

## Gamepad / mouse
Unchanged from the current handoff ("Each action once"). Specific to themes:
- In the theme grid: D-pad left / right / up / down move between cards. **Focusing a card previews that theme live** on the real guide window, the arrow and the settings window (`UI.Theme.Apply(id, true)` = preview, not saved). A saves it, and "Actif" moves to that card. Leaving the grid (D-pad out, LB/RB, B, closing the window) without A restores the saved theme. Y = back to `halo`. The footer shows `Y Thème par défaut` only.
- Mouse: hovering a card previews it, a click saves it, leaving the card restores. No chips at all.
- The preview must not rebuild frames: `Apply` only re-skins (colors, textures, font flags) and relayouts heights.

## Textures (`textures/`, PNG → convert to TGA)
All white masks tinted with `SetVertexColor`, unless marked **real colors**. Preview: `textures_preview.png`.

| File | Size | Slice | Tinted | Usage |
|---|---|---|---|---|
| `soft_rect` | 64×64 | 24 | yes | halo: window, settings, card feathered background |
| `line_fade` | 256×4 | — (stretch, shown 1 high) | yes | halo: line under title / step bars |
| `line_fade_right` | 128×4 | — | yes | bandes: section rule |
| `chip_disc_forever` | 32×32 | — | yes (`chip.bg`) | halo, ardoise: A/B/X/Y chips, baked grey bottom edge (embossed like the game's) |
| `chip_pill_forever` | 32×32 | 6 | yes | halo, ardoise: LB/RB chips |
| `chip_ring` | 32×32 | — | yes | bandes: A/B/X/Y outlined chips |
| `chip_pill_stroke` | 32×32 | 6 | yes | bandes: LB/RB outlined chips |
| `rr2_stroke2` | 32×32 | 2 | yes | bandes: 2-unit focus ring |
| `chevron_focus` | 16×32 | — | yes | ardoise: focus chevron (shown 7×16) |
| `arrow_halo_gold` | 128×128 | — | **real colors** | halo arrow (shown 56, black outline baked) |
| `arrow_halo_back` | 128×128 | — | **real colors** | halo arrow, behind |
| `arrow_slate` | 128×128 | — | yes (outline stays black) | ardoise arrow |
| `arrow_band` | 128×128 | — | yes (outline stays black) | bandes arrow |
| `ring_outlined` | 64×64 | — | yes | bandes arrived ring (shown 48) |
| `icon_check_large_outlined` | 64×64 | — | yes | bandes arrived check (shown 22) |
| `theme_preview_bg` | 256×64 | — | real colors | background of the theme card previews: **drawn by us** (a dim warm room, numbers only), never a capture of the game (no Blizzard art is shipped) |

Reused as they are: `rr2_fill`, `rr3_fill`, `rr4_fill`, `rr6_fill`, `rr6_stroke1`, `rr3_stroke15`, `rr4_stroke2`, `circle`, `ring`, `icon_check`, `icon_check_large`, `icon_diamond`, `caret_up`, `shadow`, `glyph_ps_square`. The arrows' outline and glow are baked symmetrically (no offset), so they stay correct when rotated.

## Changes from the current UI and why
- **The default theme is `halo`**: the brief asks for integration with Forever's own UI (its objective tracker is text on the scene, with no frame).
- **Gold accent** in halo / ardoise (the game's `GameFontNormal` gold). Bandes keeps a cold blue accent for players who want it.
- **Quest names in gold** in the three Forever themes, like the game's quest log. Links (items, NPCs) stay light blue so they don't read as quests.
- **No red** in the Forever themes: red reads as danger in the game. To do = gold (halo), amber (ardoise), white on a blue band (bandes). The word, the glyph and the counter still carry the state (rule 2).
- **Forever-like chips** (light embossed discs) in halo / ardoise, so Ding's prompts look like the game's own.
- Settings window height grows by the theme block (≈ 392 → 430).

## Open points
- Light scenes (snow, desert) were only simulated (`neige` backdrop). Check halo at 40 % opacity and below on snow. If text is hard to read, set a minimum opacity of 40 for halo or turn on `OUTLINE` below 40 %.
- Game font on titles: check frFR / deDE wrapping of "[29] « L'équipage maudit »" type headers at 240 wide.
- `SetGradient` signature on client 1.60 (`SetGradient(orientation, CreateColor(...), CreateColor(...))` vs the old `SetGradientAlpha`).
- Surfaces not drawn per theme (directory, NPC panel, assistant, import, nameplate marks, item button, minimap) follow the tokens and flags above. A visual pass per theme comes later.
- "Contraste élevé" is not designed.

## Files
- `design/Ding Forever Directions.dc.html` (+ `support.js`, `assets/`): the three boards 1a (halo), 1b (ardoise), 1c (bandes).
- `textures/*.png`: the new textures (power-of-2 sizes, 8-bit alpha).
- `textures_preview.png`: contact sheet.

---

## Implementation

### Tokens and painting
- `UI.C` holds **one table per token** (`{ r, g, b, a }`, or 8 numbers for a horizontal
  gradient: left then right). `UI.Theme.Apply` copies the theme's values **into** these tables:
  their identity never changes, so a module keeps `local C = UI.C` and token references
  (`STATES` in Panel.lua, a glyph's style) and reads the new values.
- Every paint goes through a token and is remembered by its region: `UI.Color(fs, token)`,
  `UI.Tint(tex, token[, alphaMul])`, `UI.Fill(tex, token)`, `UI.Paint(tex, token[, orientation])`
  (a gradient token on a plain texture), `Slice:SetColor(token[, alphaMul, orientation])` (a
  gradient across a nine-slice: the left column takes the left color, the middle column the
  gradient). `UI.Repaint` paints every remembered region again with the new values, sets each
  themed slice's texture again (`UI.Shape`: "row", "small", "window", "card" follow the theme's
  radii, "ring" its focus ring), then runs the skins (`UI.Skin(object, fn)`, in the order they
  were registered): what a widget draws by itself (a window's style, a chip's shapes, the focus
  chevron, a separator's style, a title "Ding! · …"). Then `Panel:Relayout()` and the
  `UI.Theme.OnApply` listeners (the arrow, the settings' rows, the directory, the item button).
  **Nothing is rebuilt**: no frame, texture nor text is created by a theme change
  (`themes_test`).
- Inline colors (`UI.Colored(name, s)`) are made from the tokens when the text is made: the
  guide window makes its texts again on every layout.
- Token names in the code (the handoff's in brackets): `bg` (bg.window), `bgSettings`,
  `bgTitlebar` (a dialog's title bar), `panelTitlebar` / `panelStepbar` (the guide window's bars:
  Ardoise's darker title bar, Bandes' bands), `bgTabs`, `control` (bg.control: buttons, fields),
  `subtle` (the ‹ › buttons), `popup` (opaque dropdown lists and menus, not in the handoff),
  `itemBg`, `border`, `divider`, `tabLine` (the settings' tab line), `line`, `lineShadow`,
  `cardLine` (Ardoise's card top line), `hover`, `strong`, `text` (text.primary), `secondary`,
  `subText` (sub-lines and notices: lighter in Bandes), `muted`, `disabled`, `accent`,
  `accentBg`, `accentHalo` (Ding dark's outer focus halo), `onAccent`, `glyphOnAccent`, `done`,
  `doneIconBg`, `doneRowBg` (a band in Bandes), `todo`, `todoIconBg`, `todoRowBg`, `todoBorder`,
  `above` (quest.above), `manual*`, `skipped*`, `impossibleIconBg`, `otherIconBg`,
  `previewIconBg`, `previewGlyph`, `extraIconBg`, `extraGlyph`, `infoRowBg` (band.info),
  `cooldown`, `shadow`, `textShadow`, `quest`, `link`, `cardBg` (card.bg of the hover card),
  `cardText`, `themeCardBg` (card.bg of a theme card), `noticeBg`, `arrowSub`, `arrowBack`,
  `arrowTint` / `arrowBackTint` (the arrow's tint: white for Halo's real-color arrows),
  `labelPlate`, `arrivedBg` (Ardoise's disc under the ring), `chipBg`, `chipText`,
  `itemChipBg` / `itemChipText` / `itemChipBorder` (the item button's chip), `track`,
  `trackEdge`, `sliderTrack`, `thumb`, `tabActive`, `tabActiveBg`, `blockHeader`.

### Fonts
- A font object per weight, size and **surface**: "dialog" (settings and Ding's windows),
  "scene" (the guide window), "card" (the hover card), "world" (the arrow, the item's name),
  "chip" (gamepad chips: no shadow, no outline). A theme change sets each font object again in
  place (file, size, flags, shadow): the texts using it follow. `fontOutline` applies to scene,
  card and world, never to dialog; `textShadow` to every text but chips; the world texts keep
  a shadow when the theme has neither (Ding dark, as before).
- Titles by role (`UI.TITLE_ROLES`): window 13 / 12, quest header 13 / 12, settings 14 / 13,
  arrow line 1 14 / 13, settings block headers 12 / 11 (the game's font / Noto Sans SemiBold),
  each role's line height fixed whatever the font. The game's font is `STANDARD_TEXT_FONT`, never
  shipped. In koKR, zhCN and zhTW Ding already uses the game's font everywhere: `titleFont`
  changes nothing there.
- **Halo's safety** (open point): below 40 % of opacity (`flags.outlineBelow`), the guide
  window's texts get OUTLINE (light scenes: snow, desert); not the card's nor the settings'.

### Windows
- `UI.Window(frame, kind)`: kind "panel" (the guide window: its opacity), "dialog", "card",
  "popup" (always a panel), "item". The style is the theme's `windowStyle` for the guide window
  and the card; dialogs are panels in Bandes (radius 2, `bgSettings`). Every piece (shadow,
  feather, fill, border, top line) is made once; a style only shows, hides and paints them.
- Separators under a title bar or a step bar: `UI.Separator` (feather: `line_fade` tinted
  `line`; panel: a plain `line`; bands: none, the bars are bands).
- Bands: the guide window's title bar, step bar, rows (by state; the info rows and other
  quests' headers `infoRowBg`; the step's own quest header, the section titles and the preview
  rows none) and the minimized line; their alpha × opacity / the theme's default (82).

### Settings › Appearance
- Theme (header), the four cards (one focusable row; Left / Right move between cards, Up /
  Down leave them), the note, then "Window" (opacity, size, minimize in combat), then the rows
  that were there (lock, hide in dungeons, move...). The old preview row (a scene with a
  minimized window) is gone: the real guide window shows the theme. The settings window is 430
  high (392 before).
- Focusing a card shows its theme (`UI.Theme.Apply(id, true)`); A or a click saves it
  (`UI.Theme.Apply(id)`); leaving the cards (Up, Down, LB / RB, B, closing the window, the mouse
  leaving the card) puts the saved theme back (`UI.Theme.Restore()`); Y saves Halo. A chip on
  the focused card when A would change something; "Active" on the saved one; no chip without a
  gamepad. Footer: `Y Default theme` only. A card's preview uses **its** theme's tokens, not
  the theme on screen.

### Arrow picker (Settings › Arrow and maps; Yendi's request after the handoff)
- Seven cards in three columns, after "Show the arrow": **Theme's arrow** (`theme`, the
  default: the active theme's skin), **Halo** (`arrow_halo_gold` / `arrow_halo_back`, real
  colors), **Ardoise** (`arrow_slate`), **Bandes** (`arrow_band`, outlined ring and check),
  **Ding!** (`arrow`), **Gold** (`gold`, « Or »: `arrow_gold`, the arrow of Ding!'s icon, see
  below) and **Minimap** (the game's minimap arrow, the former "Arrow style"), each usable with
  any theme (`UI.ArrowSkins`; every theme's arrow is its skin). A card shows its skin in its
  three states (on the way, behind, arrived) on our scene, 48 high.
- **Gold** (design handoff "icon", 2a "Éclat"): real colors, never tinted in any state nor theme
  (`realColors`); no dark copy under it, its glow is baked (`noShadow`); behind, the label line
  in `arrowBack` says it; arrived: the active theme's ring and check (and Ardoise's disc). In
  Halo it looks like the theme's own arrow, as expected.
- Colors (`UI.Theme.ArrowLook`): on its own theme a skin takes that theme's tints (Ardoise's
  light arrow, its dark disc under the ring); with another theme a tinted skin takes the accent
  and `arrowBack`; Halo's real colors are never tinted; arrived: the skin's ring and check in
  `done`.
- The same interaction as the theme cards (one card grid, `cardGrid` in Config.lua): Left /
  Right within a line, Up / Down between the two lines, then out of the cards; focusing a card
  shows it on the **real arrow** (`Arrow:PreviewSkin`, the arrow stays on screen meanwhile, like
  in move mode); A or a click saves (`Ding.db.arrow.skin`); leaving restores; Y: the theme's
  arrow; footer `Y Default arrow` only. With the default places, the settings window covers the
  arrow (both near the screen's center): the cards show each skin themselves.
- Migration: `arrow.style` "classic" becomes the Minimap skin, "ding" the theme's arrow.

### The icon (design handoff "icon", treatment 2a "Éclat")
- `minimap_icon64` / `minimap_icon32` (the minimap button: the gold arrow on a dark disc with
  rays; the 32-texel one when the button is drawn under 24 pixels), `logo64` / `logo32` (the
  logo: `## IconTexture` of the TOC, the AddOns list) and `arrow_gold` (the gold skin): real
  colors with 8-bit alpha, never tinted (`SetVertexColor(1, 1, 1, 1)`). Their vector sources
  are in `docs/icon/`. They replace `icon.tga` / `icon32.tga` (and `tools/media/icon.py`).
- Nothing else in the addon showed the old icon: `logo32` waits for a place (a title, an
  "About"). The CurseForge avatar and hero images are page assets, never in the addon.
- The minimap button keeps its own look (Ding's round button, 32, a soft shadow, no game
  texture): the handoff's "31 × 31 with the game's tracking border" does not apply; no mask.

### Saved settings
- `Ding.db.ui.theme` ("halo" by default, new and existing installs: settings layout 3),
  `Ding.db.ui.opacityTouched` (the player moved the opacity slider). The opacity stays
  **`Ding.db.panel.bgAlpha`** (the handoff's `ui.opacity`). While the slider was never moved,
  every theme change (a preview too) sets it to the theme's default; Y on the slider gives it
  back to the theme. Migration: a background left at the old default (85 %) follows Halo (60 %),
  any other value is kept as chosen.

### Decisions and deviations
- **Default theme `halo` for everyone**, said in the changelog.
- **"Contraste élevé" is not shipped** (not designed).
- **No game screenshot shipped**: `theme_preview_bg` is drawn by us (a dim warm room, from
  numbers).
- Nothing moves between themes: the separators keep their 1-unit slot in Bandes (the mockup has
  a 2-unit gap between the bands), and the rows keep the list's 4-unit padding.
- Not in the handoff, for the later visual pass: the colors of a step marked done by hand or
  skipped in the Forever themes (violet `#B49CFF`, teal `#5CC8D6`; Bandes keeps amber
  `#E8C547`), the opaque `popup` of dropdown lists and menus, the item button's chip (the
  theme's chip colors), chips never outlined.
- The arrow (shared layout): line 1 the instruction or the target, line 2 the detail (the
  flight master and its zone, the farming loop's stop "Farming loop: stop 2 of 10", or the
  target's zone when it is not the player's), line 3 the distance alone; label width 220.
- The hover card goes on the window's left when the screen has no room on its right. The
  game's own card stays for an item or a talent (an upgrade, a talent row).
- Ding dark: the first handoff's tokens, unchanged, except `above` (quest.above) `#FF9A3C` like
  every theme.

## To check in game (Forever 1.60)
- The minimap icon at 100 % and at small UI scales (the 32-texel one under 24 pixels): the arrow
  readable, the rays not cut; `## IconTexture` (logo64) in the AddOns list.
- `arrow_gold` at 40, 56 and 80 and at every angle: an even outline all around, no shadow copy.
- `Texture:SetGradient(orientation, CreateColor(...), CreateColor(...))` on 1.60 (bands, the
  card and the tab glow); `Compat.SetGradient` falls back to `SetGradientAlpha`, then to a plain
  mean color. After Bandes, another theme: no gradient left on a row or a bar
  (`SetVertexColor` over a gradient).
- Halo at 40 % and below on light scenes (snow, desert): the texts readable with the outline.
- The game's font on titles: "[29] « L'équipage maudit »"-type headers in frFR and deDE at 240
  wide (they wrap, the row grows, nothing moves sideways).
- `Font:SetFont` / `SetShadowColor` on a font object changing the texts already using it.
- The feather (`soft_rect` 20 outside the window) at every scale; the mouse only takes the
  window itself.
- The chips (light discs, outlined rings), the Ardoise chevron at the left of a settings row
  inside the scrolling content, the arrow's label plate.
- The theme cards' preview (the scene cropped, the bars), the live preview from the D-pad and the
  mouse, the saved theme back on leaving.
