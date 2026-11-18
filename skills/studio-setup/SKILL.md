---
name: studio-setup
description: Set up a web studio workspace — create studio.md (offer, prices, region, languages, tools, rules) and the client folder layout, or adapt to an existing one. Use when starting with the plugin, when the user wants to define their offer or process, or when studio.md is missing and another skill needs it.
---

# Studio setup

Goal: one short `studio.md` at the workspace root that every other skill reads, so the
studio's decisions are written once and applied everywhere.

## 1. Look before creating

1. Read `CLAUDE.md`, `studio.md`, `README*` at the workspace root.
2. List the top folders. If client folders already exist, note their naming and files
   (e.g. `clientes/<x>/notas.md`, `fotos/`, `web/`). **Keep that layout.** Record it in
   `studio.md` under "Layout" so other skills follow it.
3. If `CLAUDE.md` already contains the offer and rules, `studio.md` should only hold what is
   missing — or point to `CLAUDE.md`. Do not duplicate and do not contradict.

## 2. Ask only what is missing

Ask in one compact message, grouped. Offer sensible defaults so the user can answer "ok".

- **Studio**: name, who works in it, city/region, languages spoken, phone/WhatsApp, email.
- **Who you serve**: sectors and area (e.g. "farms and rural tourism within 60 km").
- **Offer**: what a standard project includes, price, delivery time, number of revision
  rounds, what is not included.
- **Care plan**: yearly price from year 2, what it covers (domain, hosting, X small changes,
  report), what costs extra.
- **Payment**: deposit %, when the rest is due, methods.
- **Tools**: hosting (default Netlify on the client's account), domain registrar, email,
  analytics, design references.
- **Rules**: anything Claude must always/never do (e.g. "never use the word free, say
  included"; "always ask before changing a delivered site").
- **Partners**: photographers, drone operators, printers, accountants who refer clients.

## 3. Write `studio.md`

Use `templates/studio.md` from this plugin as the shape. Keep it under ~80 lines. Facts,
not prose. Mark unknowns as `[TO DEFINE]`.

## 4. Create the layout (only if none exists)

```
clients/            # one folder per client (slug: lowercase-with-dashes)
my-site/            # the studio's portfolio
studio.md
```
Tell the user the per-client structure is created by `/local-web-studio:new-client`.

## 5. Sanity-check the offer

After writing, briefly flag risks a seasoned freelancer would flag, without lecturing:
- Price below what covers hours × a fair hourly rate (see `pricing-packages`).
- Unlimited revisions or "small changes" without a number.
- Domain or hosting in the studio's name (ownership disputes later).
- No deposit.
- Care plan not mentioned at the start (renewals then feel like a surprise).

End with: what was created, what is still `[TO DEFINE]`, and the next useful step.
