---
name: static-site-build
description: Build a local business website as a fast, dependency-free static site — file structure, semantic HTML, mobile-first CSS with custom properties, minimal vanilla JS, self-hosted fonts, responsive images, performance budget and the invisible technical baseline every client site shares. Use when coding or editing a client site, starting a demo, or when a site is slow, heavy or broken on phones.
---

# Static site build

Local sites need to open instantly on a rural 3G signal, be cheap to host for ever, and be
editable years later by anyone. Static HTML/CSS with a little JS does that best.

## Stack (default; respect the studio's own choices in CLAUDE.md/studio.md)

- Plain `index.html` (+ extra pages if planned), `css/styles.css`, `js/main.js` (optional),
  `img/`, `fonts/`, `video/`. No frameworks, no build step, no CDN dependencies.
- If the studio uses a static generator (Eleventy, Astro), keep the same output rules.
- Copy the technical starter from this plugin's `templates/starter/` (head metadata,
  schema block, contact bar, legal page stubs, `netlify.toml`, `robots.txt`, `sitemap.xml`,
  `404.html`). The starter is **unstyled on purpose**: visual design comes from
  `brand-discovery`, never from another client.

## Technical baseline (identical in every site; the client never sees it)

- `<!doctype html>`, `lang`, `charset`, `viewport`, unique `<title>` and meta description,
  canonical, Open Graph + Twitter image, favicon set, theme-color.
- `LocalBusiness` (most specific subtype) JSON-LD — see `local-seo`.
- Contact actions for **every** phone (call + WhatsApp where applicable), visible at all times
  on mobile — see `contact-actions`.
- Map embed (lazy) + directions link — see `contact-actions`.
- Legal pages linked in the footer — see `legal-pages`.
- Accessible: landmarks, headings in order, alt text, focus styles, contrast, 44 px targets —
  see `accessibility-check`.
- No cookies without consent; self-hosted fonts; privacy-friendly analytics if any.

## HTML

- Semantic landmarks: `header`, `nav`, `main`, `section` with headings, `footer`.
- One `h1`. Sections with `id`s for anchor navigation.
- Phone numbers, addresses, hours as real text (not images).
- Images: `<img src srcset sizes width height alt loading="lazy" decoding="async">`; the hero
  image `fetchpriority="high"` and not lazy.

## CSS

- Mobile-first; breakpoints only where the layout needs them (~600, ~960, ~1280 px).
- Design tokens as custom properties: colours, type scale (`clamp()`), spacing, radius.
- Fluid typography; max line length ~65ch; `text-wrap: balance` for headings.
- No horizontal scroll at 320 px. Test 360, 390, 768, 1440.
- `prefers-reduced-motion` and `prefers-color-scheme` (only if the design supports dark).
- Inline critical CSS only if it measurably helps; otherwise one small stylesheet.

## JS (only if needed)

- Vanilla, deferred, ≤ ~15 KB. Typical uses: mobile menu, language switch, gallery lightbox,
  accordion (prefer `<details>`), year in footer.
- Site must work with JS disabled (content and contact visible).

## Performance budget (mobile, per page)

| Item | Budget |
|---|---|
| Total transfer first view | ≤ 1 MB (aim 500 KB) |
| Hero image | ≤ 200 KB (AVIF/WebP + JPEG fallback) |
| Fonts | ≤ 2 families, ≤ 4 files, ≤ 120 KB |
| JS | ≤ 15 KB, no third-party scripts by default |
| Hero video (if any) | ≤ 2.5 MB, muted, loop, `playsinline`, poster, not on save-data |
| LCP | < 2.5 s on throttled 4G; CLS < 0.1 |

## Placeholders

Stock or temporary images: name them `stock-<subject>.jpg` and add a `<!-- REPLACE: … -->`
comment; list them in `client.md`. Text placeholders: `[TO CONFIRM: …]`. The pre-launch QA
fails while any remain.

## Verify while building

Open the page in the browser tool if available; check mobile width, console errors, and run
`scripts/check-site.sh <site-dir>` from this plugin. Fix before showing the client.
