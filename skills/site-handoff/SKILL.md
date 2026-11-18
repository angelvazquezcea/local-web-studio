---
name: site-handoff
description: Deliver a finished local business website — final checks, publish on the client's own hosting, connect the domain, set up Google Business Profile, hand over accesses and a one-page guide, collect the balance, ask for review and portfolio permission. Use when the site is approved, when the user says deliver/entregar/launch/go live, or wants a delivery checklist.
---

# Site handoff

Delivery is the moment the client judges the whole experience. Make it calm, complete and
documented.

## 1. Before publishing

- Run `pre-launch-qa` in full (or `/local-web-studio:review`). Zero blockers.
- Client gave **written final approval** (a WhatsApp "ok, publish" is enough; note the date).
- Placeholders: no `[TO CONFIRM]`, lorem ipsum, stock photos marked for replacement unless
  the client accepted them knowingly (then note it in `client.md`).
- Legal pages filled with the client's real data.

## 2. Publish (see `deploy-and-domains`)

1. Hosting account **in the client's name/email** (e.g. Netlify). Studio invited as member.
2. Deploy. Check the live URL on a real phone with mobile data.
3. Domain registered in the client's name; DNS pointed; HTTPS active; `www` ↔ apex redirect.
4. Submit sitemap in Google Search Console (property owned by client, studio as user).
5. If replacing an old site: redirects in place (`site-takeover`), old URLs tested.

## 3. Google Business Profile (see `google-business-profile`)

Created or claimed in the client's name, studio as manager; website link, phone, hours,
category, photos, description. Verification started (it can take days — tell the client what
to expect, e.g. a postcard, video or phone code).

## 4. Hand over

Create `docs/handoff.md` from `templates/handoff.md`:
- Live URLs, what's on the site, how to request changes (and how many are in the care plan).
- Where each account lives and who owns it (no passwords in the document).
- Renewal dates: domain, care plan.
- What the client should do: answer reviews, keep hours updated on Google, send new photos.
- A 3-line "how to get more out of it": put the URL on cards, van, signage QR, social bios.

Send the client a short message with the link and the handoff summary. Offer a 15-minute
walkthrough call.

## 5. Close the project

- Invoice the balance (per agreement).
- Ask for a Google review of the studio and for portfolio permission if still pending
  (`reviews-and-referrals`).
- Update `client.md`: status `delivered` (date), live URL, renewal dates, care plan start.
- Schedule care touchpoints: a 1-month check, a mid-year change/novelty, the yearly report
  before renewal (`care-plans`). If a scheduling tool is available and the user wants, create
  reminders.
