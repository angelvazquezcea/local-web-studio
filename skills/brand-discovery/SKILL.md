---
name: brand-discovery
description: Derive a unique visual and verbal direction for a local business site from the business itself — palette, typography, imagery, layout character, motion, tone of voice — and check it doesn't repeat other sites the studio made. Use before designing any client site, when the user asks for colours/fonts/style, or when a demo feels generic or similar to another client.
---

# Brand discovery

Every local business already has a brand, even without a logo: its place, materials, people,
products, vehicles, signage, the way the owner talks. The site's design is *found* there, not
picked from a template.

## 1. Collect signals (from client.md, assets, the call)

- **Place**: landscape, light, stone/wood/slate, coast or mountain, town vs countryside.
- **Material & product**: what you can touch — soil, timber, steel, flour, wool, leather, wine.
- **People & history**: generations, founding year, craft, family names, local language.
- **Existing marks**: logo, sign, vans, uniforms, packaging, menus — real colours to sample.
- **Customers**: who decides to buy (tourists from cities, local families, farmers, firms).
- **Three words** the owner chose, and the words it must not feel like.
- **References** the client liked — extract *why*, never copy layouts.

## 2. Write a one-paragraph design brief

"<Business> should feel <3 words> to <audience>. Visual world: <place/material>. Type voice:
<serif/sans/slab/grotesk character>. Colour: <anchors taken from X>. Imagery: <real/drone/
detail shots>. Layout character: <editorial/rugged/bright/calm/dense>. Motion: <none/subtle>."

## 3. Make concrete choices

- **Palette** — 1 dominant neutral (background), 1 ink, 1–2 brand colours sampled from real
  assets, 1 accent for actions (call/WhatsApp buttons must stand out). Check contrast
  ≥ 4.5:1 for text, ≥ 3:1 for large text and UI. Define as CSS custom properties.
- **Typography** — max 2 families, self-hosted WOFF2, subsetted, `font-display: swap`.
  Pick for character and legibility on small screens. Avoid the overused defaults unless they
  are the right choice for this business (say why).
- **Imagery** — real over stock; detail + wide + people shots; consistent treatment.
- **Layout character** — decide the one signature element (e.g. full-bleed drone hero,
  hand-drawn map, ledger-like table of products, big numerals of years/hectares, postcard
  grid). One memorable idea, executed well, beats many effects.
- **Motion** — optional, subtle, respects `prefers-reduced-motion`, never blocks reading.
- **Tone of voice** — formality, sentence length, local words, how they address customers.

## 4. Anti-sameness check

Keep a registry at the workspace root (`design-registry.md`) with one line per client site:
`client | palette hexes | fonts | signature element | layout pattern`. Before finalising,
compare: if fonts **and** palette family **or** signature element repeat a previous client,
change at least two of them. Add the new line when the design is approved.

If the studio forbids templates (check `CLAUDE.md`), never reuse another client's CSS beyond
the technical baseline.

## 5. Present to the user

Show the brief paragraph, a palette with hexes and contrast ratios, the font pair with a
sample heading/body line, the signature element and 2–3 alternatives you rejected and why.
Wait for approval before building, unless the user asked to go straight to a demo.

When the frontend-design or design skills are available, use them for deeper visual craft;
this skill supplies the business-derived direction.
