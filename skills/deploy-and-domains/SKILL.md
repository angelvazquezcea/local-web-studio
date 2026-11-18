---
name: deploy-and-domains
description: Publish static client sites and manage domains — hosting on the client's own Netlify account (or Cloudflare Pages/GitHub Pages), deploy methods, preview links with noindex, custom domain registration in the client's name, DNS records, HTTPS, www/apex redirects, email records, headers and caching, and renewals. Use when publishing a demo or final site, connecting or transferring a domain, or fixing DNS/SSL problems.
---

# Deploy and domains

## Principles

- **Client's account, client's domain.** Create hosting and registrar accounts with the
  client's email (or have them create it), and add the studio as a team member/delegated user.
  Payment method: the client's for paid items, or the studio pays and invoices — written down.
- **Previews are not indexed.** Demo URLs carry `noindex`; remove it only on the production
  deploy.
- **Never hold a domain hostage.** Transfers and auth codes are given on request.

## Netlify (default)

1. Demo: drag-and-drop the site folder on Netlify Drop or `netlify deploy` (draft URL) from the
   studio's account — fine for previews.
2. Production: site in the **client's** team. Deploy by drag-and-drop, Netlify CLI
   (`netlify deploy --prod --dir=site`), or connect a Git repo the client can access.
3. Site settings: site name (`<business>.netlify.app`), form notifications to client email,
   asset optimisation off (assets are already optimised).
4. `netlify.toml` from `templates/starter/` sets security and cache headers and the 404 page.

The user deploys or approves deployment; Claude prepares the folder and commands, and only runs
deploy commands when the user asks.

## Alternatives

Cloudflare Pages (great free tier, DNS on the same place), GitHub Pages (needs GitHub account),
traditional shared hosting (FTP; keep the same static output). Match what the studio uses.

## Domains

- Choose: short, the business name, local ccTLD if customers are local (`.es`, `.gal`, `.pt`,
  `.co.uk`…) or `.com`. Check availability and trademark conflicts; avoid hyphens if possible.
- Register **in the client's name** (registrant data = client). Enable auto-renew and registrar
  lock; WHOIS privacy where available.
- Connect: either point nameservers to the host (Netlify DNS / Cloudflare), or add records at the
  registrar: apex `A`/`ALIAS` per host docs, `www` `CNAME` to `<site>.netlify.app`. Set the
  primary domain and redirect the other variant.
- HTTPS: automatic certificate once DNS resolves; check `https://` on both apex and www.
- **Email**: keep/add `MX`, `SPF`, `DKIM`, `DMARC` records when moving DNS — breaking the
  client's email is the worst launch mistake. Copy all existing records before switching
  nameservers.
- Record in `client.md`: registrar, renewal date, DNS host, who pays.

## Headers & caching (static)

- Long cache for fingerprinted or rarely changed assets (`/img/*`, `/fonts/*`): 1 year,
  `immutable` only if file names change when content changes; HTML: no long cache.
- Security headers: `X-Content-Type-Options: nosniff`, `Referrer-Policy:
  strict-origin-when-cross-origin`, `Permissions-Policy` minimal, a CSP that allows the map
  iframe and nothing else needed.

## After going live

Test on a phone with mobile data; submit sitemap in Search Console; update the Google Business
Profile website link; check forms; check old URLs redirect (see `site-takeover`).
