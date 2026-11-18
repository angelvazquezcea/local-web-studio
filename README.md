# Local Web Studio

**A Claude Code plugin for people who build websites for local businesses.**
Find clients, sell, design, build, deliver and maintain sites for farms, rural houses,
restaurants, trades, shops, clinics and workshops — the whole business, not just the code.

> 🇪🇸 Guía en español: [README.es.md](README.es.md)

Most dev plugins help you write code. Local Web Studio helps you run a one-person web studio:
the discovery call, the quote, a design that fits *this* bakery and not every bakery, the
WhatsApp button that actually works on a landline-heavy business, the Google Maps listing, the
legal pages, the handoff in the client's name, and the care plan that turns one-off projects
into recurring income.

## What's inside

| | Count | Highlights |
|---|---|---|
| **Skills** | 31 | Full lifecycle from prospecting to yearly renewal |
| **Sector playbooks** | 11 | Farms, agricultural machinery, rural tourism, food producers, restaurants, trades, car workshops, beauty, health, retail, professional services |
| **Agents** | 6 | `site-auditor`, `seo-auditor`, `copy-editor`, `translation-reviewer`, `design-critic`, `prospect-researcher` |
| **Commands** | 11 | `/setup`, `/prospect`, `/discovery`, `/new-client`, `/proposal`, `/demo`, `/review`, `/deliver`, `/care-report`, `/takeover`, `/status` |
| **Hook** | 1 | Quiet HTML check after edits — silent unless something is wrong |
| **Templates** | — | Studio profile, client brief, handoff, care report, design registry, JSON-LD, technical site starter, legal pages (ES) |
| **Scripts** | 2 | `check-site.sh` (static site checker), `optimize-images.sh` |
| **Evals** | 3 | Behaviour tests for the rules that matter most |

### Skills by stage

| Stage | Skills |
|---|---|
| Orientation | `studio-guide` |
| Studio set-up | `studio-setup`, `pricing-packages`, `portfolio-site`, `partnerships` |
| Find clients | `lead-prospecting`, `outreach-messages` |
| Sell | `discovery-call`, `proposal-writing`, `service-agreement` |
| Onboard & manage | `client-onboarding`, `revision-rounds` |
| Design | `brand-discovery`, `site-planning`, `local-copywriting`, `photos-and-media`, `sector-playbooks` |
| Build | `static-site-build`, `contact-actions`, `local-seo`, `multilingual-sites`, `forms-and-bookings`, `legal-pages`, `accessibility-check` |
| Ship | `pre-launch-qa`, `deploy-and-domains`, `google-business-profile`, `site-handoff` |
| Keep | `care-plans`, `analytics-and-reporting`, `reviews-and-referrals` |
| Existing sites | `site-takeover` |

## Principles baked in

1. **Your rules win.** Every skill reads your `CLAUDE.md` and `studio.md` first. Prices,
   wording, process and layout you've defined override the plugin's defaults.
2. **No templates for design.** Each site's look comes from the business itself (place,
   materials, people, tone). A design registry stops two clients getting the same site. Only
   the invisible technical baseline repeats.
3. **Facts come from the client.** No invented years, awards, reviews or figures —
   `[TO CONFIRM]` placeholders instead, and QA blocks launch until they're gone.
4. **The client owns everything.** Domain, hosting and Google profile in their name.
5. **Mobile first, fast, cookie-free by default.** Self-hosted fonts, click-to-load maps,
   cookieless analytics, a performance budget.
6. **Every phone is one tap away.** `tel:` for every number (landlines too), WhatsApp with a
   prefilled message only where WhatsApp exists, sticky mobile action bar.
7. **Honest selling.** No fake reviews, no ranking promises, no exaggerated audits.
8. **Propose before changing** a delivered site.

## Install

From GitHub (after you publish the repo):

```bash
claude plugin marketplace add angelvazquezcea/local-web-studio
claude plugin install local-web-studio@local-web-studio
```

From a local folder:

```bash
claude plugin marketplace add /path/to/local-web-studio
claude plugin install local-web-studio@local-web-studio
```

Start a new Claude Code session afterwards. Commands are namespaced:
`/local-web-studio:demo`, `/local-web-studio:review`, etc.

## Quick start

```text
/local-web-studio:setup                 # define your offer, prices, area → studio.md
/local-web-studio:new-client Casa do Río
/local-web-studio:discovery casa-do-rio # cue sheet before the call
/local-web-studio:discovery casa-do-rio <paste your call notes>
/local-web-studio:proposal casa-do-rio
/local-web-studio:demo casa-do-rio
/local-web-studio:review casa-do-rio launch
/local-web-studio:deliver casa-do-rio
/local-web-studio:status                # pipeline, renewals, what's overdue
```

You can also just talk normally ("I have a call tomorrow with a rural house owner") — the
skills load on their own.

## Workspace layout

The plugin adapts to the layout you already have. If you have none, it proposes:

```
workspace/
├── CLAUDE.md          # your rules (optional)
├── studio.md          # your offer and process
├── design-registry.md # one line per delivered design
├── leads.md
├── my-site/
└── clients/<slug>/{client.md, assets/, site/, docs/}
```

## The hook

After Claude writes or edits an `.html` file, `scripts/check-site.sh --hook` runs a few fast
checks: viewport, title, call links on every phone number, WhatsApp link format, image alt
text and JSON-LD validity. **It only speaks up for real blockers**: pages still in progress
(placeholders, stock photos) stay silent, and warnings appear only in the full report. Turn it off per project with an empty
`.lws-no-checks` file in the project root, or `LWS_HOOKS=off`.

Run the full checker yourself any time:

```bash
bash scripts/check-site.sh clients/casa-do-rio/site
```

## Requirements

- Claude Code with plugin support.
- `bash` (macOS/Linux; Windows via WSL or Git Bash).
- Optional: `python3` or `node` (JSON-LD validation), ImageMagick / `cwebp` / `avifenc` /
  `ffmpeg` (media processing). Everything degrades gracefully if missing.
- Works alongside other plugins (frontend-design, SEO, accessibility) — skills point to them
  when installed.

## Regional scope

Universal by design. Legal and regulatory notes go deepest for the EU/Spain (LSSI-CE, GDPR,
cookies, tourism registry numbers) with pointers for the UK, US and Latin America. Contributions
for other countries are welcome — see [CONTRIBUTING.md](CONTRIBUTING.md).

Legal templates are practical starting points, **not legal advice**.

## Evals

```bash
claude plugin eval . --runs 1
```

See [evals/README.md](evals/README.md).

## License

MIT
