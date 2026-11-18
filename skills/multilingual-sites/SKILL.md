---
name: multilingual-sites
description: Build and maintain websites in several languages for local businesses — when it's worth it, URL structure, hreflang, language switcher, translated schema/meta/WhatsApp messages, co-official and minority languages (Galician, Catalan, Basque, Welsh…), translation quality and native review. Use when a client needs more than one language or a site has translation issues.
---

# Multilingual sites

Only add languages the client asks for or really needs (tourists from abroad, export buyers,
co-official language identity). Each language is real ongoing work.

## Structure

- Separate URLs per language: `/` (default), `/en/`, `/fr/`, `/gl/` … One HTML file per
  language per page is fine for static sites. Avoid JS-only switching of text (Google indexes
  each URL; JS swapping is fragile and invisible to search).
- `<html lang="…">` correct on each version.
- `hreflang` in each page's `<head>` for **all** versions including itself, plus `x-default`:
  `<link rel="alternate" hreflang="gl" href="https://example.com/gl/">`. Also in the sitemap
  (`xhtml:link`) if the site is large.
- Canonical points to the same-language URL, never to the default language.

## Switcher

- Visible in the header on desktop and inside the mobile menu or bar.
- Labels are each language's own name ("Galego", "Español", "English", "Français"), not flags
  (flags are countries, not languages).
- Links to the equivalent page, not the home. Remember the choice (`localStorage`) for the
  switcher only — never auto-redirect by browser language without a way back.

## Translate everything

Body copy, `title`, meta description, `alt`, button labels, form labels/errors, schema
`description`, Open Graph text, the **WhatsApp prefilled message**, 404 page, legal pages
(at least summaries; in the EU the legal pages should exist in the site's languages).
Dates, numbers, phone display and currency formatted per locale.

## Quality

- Write natively in languages you master; adapt idioms rather than literal translation.
- Co-official and regional languages (e.g. Galician) matter for identity: use the normative
  standard, and ask whether the client prefers a particular variety.
- **Always mark translations for native review** before publishing; record in `client.md` who
  reviewed each language and when. Use the `translation-reviewer` agent for a second check.
- Keep a glossary of fixed terms (product names, place names, certifications) in `client.md`.

## Maintenance cost

Every text change now happens N times. Tell the client during planning; price extra languages
as an add-on (`pricing-packages`) and include language parity in care-plan changes.
