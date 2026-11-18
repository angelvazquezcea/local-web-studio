---
name: analytics-and-reporting
description: Measure and report results of local business websites with privacy-friendly analytics — visits, call/WhatsApp/directions clicks, Google Business Profile insights, Search Console queries — and write short results messages and yearly reports owners understand. Use when setting up analytics, preparing a care-plan report or renewal, or when a client asks "is the website working?".
---

# Analytics and reporting

Owners don't care about sessions or bounce rate. They care: **did people call, message, come
or book because of it?**

## Set-up (prefer no-cookie tools)

| Tool | Notes |
|---|---|
| Netlify Analytics | Server-side, no script, no cookies; paid add-on; page views only. |
| Plausible / Fathom / Umami / GoatCounter | Cookieless, lightweight script, custom events for clicks; EU hosting options. |
| Cloudflare Web Analytics | Free, cookieless, basic. |
| Google Analytics 4 | Powerful but needs consent banner in the EU; avoid for small sites unless the client insists. |

Track events from `data-contact` attributes (`call`, `whatsapp`, `email`, `directions`,
`book`, `form`) with a few lines of JS for the chosen tool. No personal data in events.

## Other sources

- **Google Business Profile performance**: calls, messages, direction requests, website
  clicks, searches that showed the profile — usually the most impressive numbers for the
  client.
- **Search Console**: queries and clicks; top local searches.
- **Ask the owner**: "how many customers mentioned the website or Google?" — qualitative
  evidence counts.

## Report formats

**Short results message (quarterly or mid-year):** 3–5 lines, one headline number, one
comparison, one action.
> Hi <name>! In the last 3 months your website had 640 visits and 38 people tapped "Call" or
> "WhatsApp". On Google Maps, 112 people asked for directions. Next month I'll add the
> summer hours. 👍

**Yearly report (before renewal):** one page — what was done this year (changes log), results
(with the numbers above and comparison to last period), what's included in renewal, 1–2 ideas
for next year. Template: `templates/care-report.md`.

Rules: only real numbers from tools; if something is not measured, say so; never inflate.
Write in the client's language, no jargon; round numbers.
