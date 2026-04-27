# Blue Coding Design System

**Version:** 2026  
**Company:** Blue Coding — Nearshore Software Development  
**Website:** [bluecoding.com](https://bluecoding.com)

Blue Coding connects Latin American engineering talent with global organizations. Founded in 2014, the company offers staff augmentation, dedicated AI pods, and forward-deployed engineers to startups, SMBs, and enterprise clients.

---

## Sources

| Asset | Location | Notes |
|-------|----------|-------|
| Brand Identity Manual 2026 | `uploads/BC_Brand_Identity_Manual_2026_COMP.pdf` | Image-based PDF (38pp); not machine-readable |
| Asset ZIP | `01_Assets/` (local mount) | Logos, icons, patterns, imagery |
| Google Slides template | https://docs.google.com/presentation/d/1ZRYL_77Ne2-52y6f_jSA2Qm4nQzoVsFeTcYSP0ZSYaE/edit | Reference deck (may require access) |

---

## Files in This Project

```
README.md                  ← You are here
SKILL.md                   ← Agent skill descriptor
colors_and_type.css        ← All CSS tokens (colors, type, spacing, shadows)

assets/
  logos/                   ← SVG logos: Logo, Logotype, Symbol × Colour/White
  icons/                   ← 50+ Phosphor duotone SVGs in 13 categories
  patterns/                ← Pattern_HORIZONTAL.svg, Pattern_VERTICAL.svg
  imagery/                 ← 10 AI-generated brand photos

preview/                   ← Design System tab cards
  colors-primary.html
  colors-secondary.html
  colors-neutral.html
  colors-status.html
  colors-gradient.html
  type-display.html
  type-headings.html
  type-body.html
  type-labels.html
  spacing-tokens.html
  spacing-rhythm.html
  icons-showcase.html
  logos-showcase.html
  imagery-showcase.html
  components-buttons.html
  components-badges.html
  components-cards.html
  components-divider.html

slides/
  index.html               ← Slide deck viewer
  TitleSlide.jsx
  ContentSlide.jsx
  QuoteSlide.jsx
  TeamSlide.jsx
  ClosingSlide.jsx

ui_kits/
  marketing/
    index.html             ← Marketing site UI kit
    README.md
```

---

## CONTENT FUNDAMENTALS

### Voice & Tone
- **Clear, concise, decision-focused.** No jargon, no corporate fluff.
- **Short punchy phrases.** Active voice. Verbs lead.
- **Authoritative when advising, empathetic when problem-solving.**
- **Positioning:** Trusted advisor, not a vendor. Expert without ego.

### Copy Patterns
- **Sentence case** for all headings and UI labels (not Title Case).
- **First person plural (we/our)** for company statements; **second person (you/your)** when addressing clients.
- **No emoji** in professional contexts (decks, documents, proposals).
- **Numbers:** always use numerals (10 engineers, not ten engineers).
- Short stat callouts preferred: "10+ years. 500+ engineers. Zero compromise."

### Examples
> "We don't just fill seats. We build teams."  
> "Hire faster. Ship smarter. Scale with confidence."  
> "Your next engineering hire is in Latin America."  
> "Staff augmentation built for velocity."

---

## VISUAL FOUNDATIONS

### Colors
**Primary palette** is monochromatic blue — Baltic Blue (#01638E) anchors the brand; Ocean Blue (#0091CE) drives accents and interactivity. See `preview/colors-*.html` for all swatches.

### Typography
- **Poppins** — display and all headings. Bold, geometric, modern. Weights 400/600/700.
- **Maven Pro** — body copy and UI labels. Readable, slightly quirky, humanist. Weights 400/500/600.
- Display headings use **Prussian Blue** main text with the **last word** rendered in a blue-to-indigo gradient (135° #1F96DB → #3771D6).
- A **dual-color divider bar** (Baltic Blue | Ocean Blue) appears below the first line of display titles, referencing the logo's two-tone B mark.

### Backgrounds
- Light pages: **Alice Blue #F5FAFF** — almost white, very slightly blue.
- Dark pages (title slides, hero sections): **Prussian Blue #101C32**.
- **Hex-geometric pattern** (Pattern_HORIZONTAL.svg) always applied at low opacity as brand texture — anchored to the right edge, fading left.
- No gradients on backgrounds — gradients reserved for the title accent word only.

### Imagery
AI-generated photos follow a consistent "quiet luxury biophilic" prompt:
- Warm wood paneling + lush greenery office environments
- Racially diverse subjects, smart-casual earthy neutrals (browns, tans, creams)
- 50mm f/1.2 cinematic bokeh, soft warm ambient light, subtle lens flare + film grain
- Never stock-photo generic — specific, cinematic, editorial feeling

### Layout & Grid
- **Base unit:** 4px. All spacing is multiples of 4.
- **Presentations (1920×1080):** 12-column internal grid, 64px page margins.
- **Print/documents (US Letter):** single-column default, 2-col for dense reference.
- Standard rhythm: title→subtitle 8px · heading→body 24px · paragraph→paragraph 16px · section→section 48px.

### Cards & Surfaces
- Background: white on Alice Blue page.
- Border: 1px `--color-lavender` or none (shadow preferred).
- Shadow: `--shadow-sm` or `--shadow-md`.
- Radius: `--radius-lg` (12px) standard.

### Animation & Interaction
- **Transitions:** 200ms ease-out for hover states, 300ms ease-in-out for reveals.
- **Hover:** subtle elevation increase (shadow step up) + slight background lightening.
- **Press:** slight scale-down (0.97).
- No bounces or spring physics — clean, precise transitions match the high-tech minimalist personality.

### Borders & Dividers
- Light dividers: 1px `--color-lavender` (#D7E4F9).
- Accent dividers: the dual-color bar (Baltic Blue + Ocean Blue halves) used under display headings.
- No decorative borders on cards — use shadow + radius instead.

### Iconography
See ICONOGRAPHY section below.

### Corner Radii
- `4px` — tags, small chips
- `8px` — inputs, small cards
- `12px` — standard cards, panels
- `16px` — large feature cards
- `9999px` — pill badges, buttons

---

## ICONOGRAPHY

**Library:** 132 custom icons in Phosphor duotone style, organized into 13 categories:
Actions · Business & Strategy · Communication · Documents & Content · Finance & Contracts · Interface & Navigation · Location & Global · Misc Utility · People & Team · Security & Trust · Software & Development · Status & Feedback · Values

**Format:** SVG, `viewBox="0 0 256 256"`. Two visual layers:
1. **Fill layer** — shape filled with `currentColor` at `opacity="0.2"` (automatic duotone)
2. **Stroke layer** — outline at `stroke="currentColor"` stroke-width 16

**Usage:** Set `color` on the parent element — both layers inherit automatically. Icons ship as standalone SVG files in `assets/icons/`.

**Sizing:** Render at 20px, 24px, 32px, or 48px. Never below 20px.

**No icon font or sprite sheet** — use `<img src="...">` or inline SVG. Prefer inline for color control.

**Emoji:** Never used in brand contexts.

---

## DOCUMENT STRUCTURE

### Title Pages (dark mode)
- Background: Prussian Blue #101C32
- Logo: White version, top-left
- Title: White main text, last word in gradient accent
- Hex pattern at low opacity, right-anchored

### Regular Pages (light mode)
- Background: Alice Blue #F5FAFF
- Logo: Hex symbol only, top-left (small)
- Left footer strip: rotated page title + page number, Ocean Blue
- Pattern at low opacity, right-anchored
