---
name: legal-pages
description: Prepare the legal pages and compliance basics of a small business website — legal notice/imprint, privacy policy, cookie policy and consent, form consent text, sector registry numbers — by jurisdiction (EU/Spain in detail; UK, US, Latin America pointers). Use when building a site, adding a form, map, analytics or embeds, or when the user asks what legal texts are required.
---

# Legal pages

Practical templates, **not legal advice**. Say so once, and recommend the client's
accountant/lawyer for anything unusual. Fill with the client's real data; never invent tax IDs.

## Decide what's needed (ask/check)

- Jurisdiction (from `studio.md`/client address).
- Does the site collect personal data? (forms, newsletter, booking, email links don't count
  as collection by themselves).
- Cookies or third-party requests? (analytics, Google Maps iframe, YouTube, fonts from CDNs,
  social widgets).
- Sells online or takes bookings? (consumer law: terms, withdrawal rights, prices with taxes).
- Sector rules (tourism registry number, professional association, health authorisations,
  alcohol, food).

## EU — Spain in detail

1. **Aviso legal** (LSSI-CE art. 10): legal name, NIF/CIF, address, email/phone, registry data
   (Registro Mercantil for companies; professional association for regulated professions),
   activity authorisations (e.g. tourism registry number for rural houses — often also required
   to display on the site and listings).
2. **Política de privacidad** (RGPD/LOPDGDD): controller identity, purposes, legal basis,
   retention, recipients (hosting provider, form provider), international transfers (US tools
   under the EU-US Data Privacy Framework), rights and how to exercise them, right to complain
   to the AEPD.
3. **Política de cookies**: only if non-essential cookies/third-party requests exist. With
   none (self-hosted fonts, cookieless analytics, click-to-load map), state that no
   non-essential cookies are used — the simplest and best option for small sites.
4. **Consent banner**: required only when non-essential cookies/trackers are used. Must allow
   reject as easily as accept; no pre-ticked boxes; nothing loads before consent.
5. **Forms**: a short info layer next to the submit button (controller, purpose, rights, link
   to privacy policy) and an unticked checkbox only where consent is the basis (e.g.
   newsletter).

Other EU countries follow GDPR + their own imprint rules (e.g. Germany's Impressum is strict).

## UK

UK GDPR + PECR (cookies need consent like the EU), Companies Act details on the site for
companies. ICO is the authority.

## US

No federal imprint; a privacy policy is required in practice (CalOPPA if Californians visit,
plus state laws like CCPA/CPRA for larger businesses). Accessibility lawsuits (ADA) are common
— see `accessibility-check`.

## Latin America

Country data laws (Mexico LFPDPPP, Argentina 25.326, Colombia 1581, Brazil LGPD, Chile) —
include a privacy notice with controller identity, purposes and rights.

## Build rules

- Pages: `/legal-notice/`, `/privacy/`, `/cookies/` (or localised slugs), linked in the footer
  of every page; `noindex` is optional.
- In every language of the site.
- Date of last update at the bottom.
- Templates in `templates/starter/aviso-legal/`, `privacidad/` and `cookies/` (Spanish-law
  structure with placeholders). Adapt slugs, language and content per jurisdiction.
- Prefer designs that need **no cookie banner**: self-hosted fonts, cookieless analytics,
  click-to-load map/video.
