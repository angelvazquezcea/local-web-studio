---
name: pre-launch-qa
description: Run the complete quality check of a local business site before showing a demo or publishing — content truth, contact buttons, mobile layout, performance, SEO and schema, accessibility, legal, forms, languages, placeholders, browser console — and report blockers vs improvements. Use before every demo and delivery, after a change round, or when the user says review/revisar/check the site.
---

# Pre-launch QA

Two levels: **demo QA** (sections 1–4) before any client sees it; **launch QA** (all) before
publishing. Run `scripts/check-site.sh <site-dir>` first for the automated part, then go
through the rest. For an independent pass, delegate to the `site-auditor` agent.

## 1. Content truth
- [ ] Every fact (years, figures, names, certifications, prices, hours) matches `client.md`.
- [ ] Hard rules respected (e.g. no visit offers if visits not allowed; no prices if private).
- [ ] No `[TO CONFIRM]`, lorem ipsum, "Your Business", example.com, template leftovers.
- [ ] Stock images listed and either replaced or knowingly accepted by the client.
- [ ] Spelling/grammar in every language (use `copy-editor` / `translation-reviewer`).

## 2. Contact
- [ ] Every phone has `tel:` (landlines too); WhatsApp only on WhatsApp numbers, with a correct
      prefilled message per language; links tested.
- [ ] Sticky mobile actions visible, not covering content or the cookie/consent UI.
- [ ] Email link and visible address; map shows the right place; directions link works.
- [ ] Hours match Google Business Profile.

## 3. Mobile layout & browsers
- [ ] 320, 360, 390, 768, 1024, 1440 px: no horizontal scroll, no overlapping, no broken words.
- [ ] Tap targets ≥ 44 px; text ≥ 16 px; images not stretched.
- [ ] Safari iOS quirks: `100vh` → `100svh/dvh`, sticky bars, video `playsinline`.
- [ ] Console: zero errors; no 404s for assets.

## 4. Performance
- [ ] First-view transfer within budget (`static-site-build`); hero ≤ 200 KB; no unused fonts.
- [ ] Images have width/height, lazy below the fold, modern formats.
- [ ] Lighthouse mobile (if available): Performance ≥ 90, Accessibility ≥ 95, Best Practices ≥ 95,
      SEO 100.

## 5. SEO
- [ ] Unique titles/descriptions; one h1; canonical; `lang`; hreflang complete.
- [ ] JSON-LD valid and matching visible NAP/hours; most specific type.
- [ ] `robots.txt`, `sitemap.xml` correct; **no `noindex` on production**; preview keeps noindex.
- [ ] Open Graph image (1200×630) and texts; favicon/apple-touch-icon.

## 6. Accessibility
- [ ] Contrast, focus visible, keyboard nav, alt texts, labels, reduced motion
      (`accessibility-check`).

## 7. Legal & privacy
- [ ] Legal notice, privacy, cookies (if needed) with real data, linked in every footer.
- [ ] Nothing third-party loads before consent if a banner is required.
- [ ] Form info layer present.

## 8. Forms & integrations
- [ ] Test submission received by the client; spam protection on; success message.
- [ ] Booking links open the right property/service.

## 9. Delivery readiness
- [ ] Hosting and domain in client's name; HTTPS on apex and www; redirects; email DNS intact.
- [ ] Google Business Profile link points to the site.
- [ ] `client.md` updated (live URL, renewals, permissions).

## Report format

```
BLOCKERS (must fix before showing/publishing)
1. <issue> — <where> — <fix>
IMPROVEMENTS (recommended)
1. …
PASSED: <short list>
NOT CHECKED: <what couldn't be verified and why>
```
Be honest in "not checked". Fix blockers when asked; for a delivered site, propose first.
