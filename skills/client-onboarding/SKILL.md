---
name: client-onboarding
description: Start a new client project — create the client folder and brief, list and request the materials and accesses needed (photos, logo, texts, legal data, domain, Google listing), and set dates. Use when a client accepts, when the user says "new client", or when a project is about to start and materials are missing.
---

# Client onboarding

## 1. Create the client space

1. Choose a slug: lowercase, dashes, no accents (`casa-do-rio`, `talleres-lopez`).
2. Follow the workspace layout recorded in `studio.md`/`CLAUDE.md`. Default:
   `clients/<slug>/{client.md, assets/, site/, docs/}`.
3. Create `client.md` from the studio template if `CLAUDE.md` defines one, else from
   `templates/client-brief.md`. Fill what is known; never overwrite an existing brief —
   merge into it.
4. Add the client to the studio's client list (in `CLAUDE.md` or `studio.md`) if the studio
   keeps one there — ask before editing `CLAUDE.md`.

## 2. Materials checklist (send to the client)

Produce a short, friendly message with only what's missing, grouped and prioritised:

- **Must have to start:** business name as it should appear, phones (which has WhatsApp),
  email, address/GPS pin, opening hours, 5–20 photos (any phone photos are fine), logo if
  any, legal name + tax ID for the legal notice.
- **Nice to have:** history/story in their words (a voice note works), certificates, menus,
  price lists, reviews they're proud of, social links, websites they like.
- **Accesses (only if they exist):** current domain registrar, current hosting, Google
  Business Profile manager invite, current site login. Ask for **invites/delegated access**,
  never passwords by chat. If they must share a password, recommend a password manager share
  and changing it afterwards.

Explain how to send photos without losing quality (original files via a shared folder or
"send as document" on WhatsApp — not compressed chat photos).

## 3. Dates

Agree and write in `client.md`: materials by <date>, demo by <date + ~7–10 days after
materials>, revision windows, target launch. If the client has a seasonal deadline, plan
backwards from it.

## 4. Permissions

Record explicitly in `client.md`: portfolio permission (yes/no/pending), permission to publish
photos of people, drone footage publication (yes/no), who approves texts.

## 5. Status

Set `accepted` (or `demo` if starting immediately) with date. Next step: `brand-discovery`.
