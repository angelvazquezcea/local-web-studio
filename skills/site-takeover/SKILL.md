---
name: site-takeover
description: Take over a local business's existing website — audit it, identify who owns the domain/hosting/accounts, propose improvements or a rebuild, migrate content and URLs safely with redirects, and transfer management without breaking email or rankings. Use when a prospect or client already has a site, wants someone to "take it over", or is unhappy with their current provider.
---

# Site takeover

Businesses with an existing site are often the easiest sales: they already value a website
and usually have a concrete frustration. The risk is breaking something (email, rankings,
bookings) during the move.

## 1. Audit (before proposing anything)

With browsing tools if available, otherwise from what the user shares:

| Area | Look at |
|---|---|
| Ownership | Domain WHOIS (registrar, expiry), who has registrar/hosting/admin access, contracts with the previous provider |
| Platform | WordPress/Wix/Squarespace/custom; plugins; booking engine; hosting cost |
| Mobile & speed | Layout on phones; page weight; LCP; broken elements |
| Content | Accuracy, outdated info (hours, prices, years), photos quality, languages |
| Contact | Click-to-call, WhatsApp, map, forms working? |
| SEO | Titles, schema, indexed pages (`site:domain`), Search Console access, top pages/queries if accessible, backlinks of note |
| Legal | Legal notice/privacy/cookies; consent banner behaviour |
| Security | Outdated CMS, HTTPS, mixed content, malware warnings |
| Email | Where the domain email is hosted (MX records) |
| Google profile | Exists? Who manages it? Link to site? |

## 2. Propose

Write a short findings + proposal for the user to review, in plain language:
- 3–5 things that work (keep them) and the 3–7 most impactful problems, each with why it
  matters to the business.
- Options: **(a) improve** the current site, **(b) rebuild** as a fast static site, **(c) care
  only** (take over maintenance). Price each with `pricing-packages`.
- Recommend one, with reasons. Never trash the previous provider; facts only.
- Per the studio's rules, the user decides what to propose to the client.

## 3. Secure access first

Get, in the client's name: registrar access (or initiate transfer with auth code), DNS
access, hosting/CMS admin, Google Business Profile manager, Search Console, analytics. List
everything in `client.md` (no passwords). Don't touch DNS until all email records are copied.

## 4. Migrate (if rebuilding)

1. Crawl/list all existing URLs (sitemap, `site:` search, menu). Save to `docs/url-map.md`.
2. Map each old URL → new URL (or the closest section). Keep slugs when possible.
3. Rebuild content (improved per `local-copywriting`), reuse good photos in originals.
4. Add 301 redirects (`_redirects` or `netlify.toml`) for every changed URL, including old
   language paths and PDFs that people link to.
5. Keep integrations (booking engine IDs, review widgets → text, tracking that the client
   uses).
6. Launch: switch DNS preserving MX/SPF/DKIM/DMARC; verify HTTPS; test redirects; resubmit
   sitemap; watch Search Console coverage for 4 weeks.

## 5. Close with the previous provider

Courteous handover request; cancel old hosting only after the new site and email are verified
and backups downloaded (with the client's agreement).
