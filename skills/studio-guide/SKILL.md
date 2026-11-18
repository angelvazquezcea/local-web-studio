---
name: studio-guide
description: Map of the local-web-studio plugin and the end-to-end workflow for selling and building websites for local businesses. Use when the user asks what this plugin can do, where to start, which skill or command fits a task, or when a request spans several stages (find a client, sell, build, deliver, maintain).
---

# Local Web Studio — guide

This plugin is a working system for a freelancer or small studio that builds websites for
local businesses: farms, rural tourism, restaurants, trades, shops, clinics, workshops,
professional services. It covers the whole business, not only the code.

## Ground rules that apply to every skill

1. **The studio's own rules win.** Before acting, read the workspace `CLAUDE.md` and
   `studio.md` if they exist. Prices, process, language, layout, tone and technical rules
   written there override every default in this plugin. Never contradict them silently.
2. **Speak the user's language.** These instructions are in English; the conversation and
   every client-facing text are in the user's language (and the client's, if different).
3. **Each site is designed for its business.** There is no house template. Only the
   invisible technical baseline repeats (see `static-site-build`). See `brand-discovery`.
4. **Facts come from the client.** Never invent years, figures, awards, certifications,
   reviews, prices, opening hours or people. Leave a visible `[TO CONFIRM: …]` placeholder.
5. **Client owns their assets.** Domain, hosting account and Google Business Profile are
   registered in the client's name. The studio is a manager, not the owner.
6. **Propose before changing a delivered site.** For anything beyond a typo, list the change
   and wait for a yes.
7. **Mobile first, light, fast.** Most local customers look from a phone on a weak signal.

## Workspace layout

Detect the existing layout first and adapt to it (for example `clientes/<name>/notas.md`,
`fotos/`, `web/`). If there is none, propose this one (see `studio-setup`):

```
<workspace>/
├── CLAUDE.md            # studio rules for Claude (optional, user-written)
├── studio.md            # studio profile: offer, prices, region, tools
├── my-site/             # the studio's own portfolio site
└── clients/
    └── <client-slug>/
        ├── client.md    # brief: contact, business, goals, status, permissions
        ├── assets/      # photos, logos, video, documents from the client
        ├── site/        # the website code
        └── docs/        # proposal, agreement, handoff, reports
```

## The lifecycle and which skill to use

| Stage | Skills | Commands |
|---|---|---|
| 0. Set up the studio | `studio-setup`, `pricing-packages`, `portfolio-site` | `/local-web-studio:setup` |
| 1. Find clients | `lead-prospecting`, `outreach-messages`, `partnerships` | `/local-web-studio:prospect` |
| 2. First call | `discovery-call`, `sector-playbooks` | `/local-web-studio:discovery` |
| 3. Sell | `proposal-writing`, `pricing-packages`, `service-agreement` | `/local-web-studio:proposal` |
| 4. Onboard | `client-onboarding` | `/local-web-studio:new-client` |
| 5. Design | `brand-discovery`, `site-planning`, `local-copywriting`, `photos-and-media` | `/local-web-studio:demo` |
| 6. Build | `static-site-build`, `contact-actions`, `local-seo`, `multilingual-sites`, `forms-and-bookings`, `legal-pages`, `accessibility-check` | |
| 7. Review | `pre-launch-qa`, agents `site-auditor`, `seo-auditor`, `copy-editor`, `design-critic` | `/local-web-studio:review` |
| 8. Changes | `revision-rounds` | |
| 9. Deliver | `deploy-and-domains`, `google-business-profile`, `site-handoff` | `/local-web-studio:deliver` |
| 10. Keep | `care-plans`, `analytics-and-reporting`, `reviews-and-referrals` | `/local-web-studio:care-report` |
| Existing site | `site-takeover` | `/local-web-studio:takeover` |

## How to route a vague request

- "I have a new client" → `client-onboarding`, then `discovery-call` if there was no call yet.
- "Make the website for X" → check `client.md` exists and is complete; if not, run
  `discovery-call` questions first. Then `brand-discovery` → `site-planning` → build.
- "How much should I charge" → `pricing-packages`.
- "They already have a website" → `site-takeover`.
- "Nobody calls me" / "how do I get clients" → `lead-prospecting` + `outreach-messages`.
- "Check the site" → `pre-launch-qa` (or the `site-auditor` agent for a second pair of eyes).

## Status values for client.md

`lead` → `contacted` → `call-done` → `proposal-sent` → `accepted` → `demo` →
`changes-1` → `changes-2` → `delivered` → `care` (maintenance) → `lost` / `paused`.
Update the status line whenever a stage changes, with the date.
