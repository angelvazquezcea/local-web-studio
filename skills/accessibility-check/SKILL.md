---
name: accessibility-check
description: Make and verify that a local business site is usable by everyone — older owners' customers, low-vision users, screen readers, keyboard users, people with motion sensitivity — against practical WCAG 2.2 AA checks (contrast, text size, headings, alt text, focus, targets, forms, motion, language). Use when building or reviewing a site, or when the user asks about accessibility or legal accessibility requirements.
---

# Accessibility check

Many visitors of local businesses are older, on small phones, outdoors in sunlight. Good
accessibility is good business. In the EU, the European Accessibility Act (from June 2025)
applies to many consumer e-commerce/booking services — micro-enterprises are often exempt, but
building to WCAG 2.2 AA costs little extra.

## Checks (fix every failure)

**Visual**
- Text contrast ≥ 4.5:1 (≥ 3:1 for ≥ 24 px or bold ≥ 18.5 px). Buttons/icons/borders ≥ 3:1.
- Text over photos: overlay or solid backdrop until contrast passes on the lightest image area.
- Body text ≥ 16 px; line-height ~1.5; zoom to 200% without loss; no horizontal scroll at 320 px.
- Don't rely on colour alone (links underlined or clearly distinct).

**Structure**
- `lang` set; one `h1`; headings never skip levels for styling.
- Landmarks: `header`, `nav`, `main`, `footer`; skip link "Skip to content".
- Lists as lists; tables only for tabular data (hours, prices) with headers.

**Images & media**
- Informative images: meaningful `alt`. Decorative: `alt=""`. Logos: business name.
- Video: no audio autoplay; pause control for loops > 5 s if not purely decorative; captions
  for videos with speech.

**Interaction**
- Everything works by keyboard; visible `:focus-visible` style.
- Tap targets ≥ 44×44 px with spacing (call/WhatsApp buttons especially).
- Links/buttons have clear names ("Call María", not "Click here"; icon buttons with
  `aria-label`).
- Mobile menu: button with `aria-expanded`, focus moves sensibly, Escape closes.
- Forms: visible labels, error messages in text, required fields marked, autocomplete
  attributes (`name`, `tel`, `email`).
- `prefers-reduced-motion`: disable parallax, auto-sliders, large animations.
- No content that flashes > 3 times/second.

**Embedded content**
- Map iframe with `title`; address also as text. Third-party widgets checked or avoided.

## How to test quickly

1. Keyboard-only pass (Tab through the page).
2. Zoom 200% and 320 px width.
3. Contrast check of palette tokens (compute ratios).
4. Accessibility tree via the browser tool (`read_page`) if available — check names/roles.
5. Use the `ecc:accessibility` / `design:accessibility-review` skills if installed for a deeper
   audit.

Report as: issue → where → fix, sorted blockers first.
