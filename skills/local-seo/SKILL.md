---
name: local-seo
description: Make a local business site findable on Google Search and Maps — titles, descriptions, headings, NAP consistency, schema.org LocalBusiness subtypes with hours/geo/areaServed, sitemap, robots, canonical, Search Console, local keywords and citations. Use when building or auditing any client site, adding structured data, or when a business doesn't appear on Google.
---

# Local SEO

For local businesses, ~80% of the result comes from: a complete Google Business Profile
(`google-business-profile`), consistent name/address/phone everywhere, reviews, and a fast
site with clear on-page basics. Do those well before anything fancy.

## On-page basics (every page)

- `<title>` ≤ 60 chars: `<Business> – <main offer> in <town>`; unique per page.
- Meta description ≤ 155 chars, written to be clicked (offer + place + action).
- One `h1` with the offer and place in natural language; logical `h2`/`h3`.
- Town/area in hero, about, contact, footer — naturally, never keyword lists.
- Descriptive `alt` text; descriptive file names (`casa-rural-lugo-salon.jpg`).
- Canonical URL; `lang`; `hreflang` for language versions (`multilingual-sites`).
- Internal links between pages/sections with descriptive anchor text.
- Fast and mobile-friendly (`static-site-build` budget).

## NAP consistency

Name, Address, Phone **exactly** the same on: site footer/contact, schema, Google Business
Profile, social profiles, directories. Record the canonical NAP in `client.md`.

## Structured data (JSON-LD in `<head>`)

Use the **most specific** schema.org type. There is no `Farm` type: for farms use
`LocalBusiness` (plus `additionalType` with a Wikidata/product-ontology URL if useful) or
`Store` if they sell direct. Other common types: `LodgingBusiness`/`BedAndBreakfast`/`Campground`,
`Restaurant`/`CafeOrCoffeeShop`/`Bakery`, `AutoRepair`, `Plumber`/`Electrician`/
`HVACBusiness`/`RoofingContractor`/`GeneralContractor`, `HairSalon`/`BeautySalon`,
`Dentist`/`MedicalClinic`/`Physiotherapy`, `Store` subtypes, `ProfessionalService`,
`LegalService`, `AccountingService`, `VeterinaryCare`, `SportsActivityLocation`.
Check the sector playbook for the recommended type.

Required/recommended properties: `name`, `url`, `telephone`, `address` (PostalAddress),
`geo` (lat/lng — essential for rural places), `openingHoursSpecification`, `image`, `logo`,
`priceRange` (if public), `areaServed` (towns/regions for service-area businesses),
`sameAs` (Google Maps URL, social), `description`, `founder`/`foundingDate` if true,
`hasMap`. For multilingual sites, localise `description` per page language.

Also: `WebSite` on the home page; `FAQPage` only for a visible FAQ; `BreadcrumbList` on
multi-page sites. Never mark up reviews you show from Google as your own `aggregateRating`
(self-serving review markup is ignored or penalised).

Template: `templates/schema/localbusiness.jsonld`. Validate with the Rich Results Test /
Schema Markup Validator when browsing is available; otherwise at least JSON-parse it
(`scripts/check-site.sh` does).

## Crawl files

- `robots.txt`: allow all, point to sitemap. Block nothing important. On demo/preview URLs
  use `noindex` (meta robots or header) and remove it at launch.
- `sitemap.xml`: every indexable URL (+ language alternates). Update when pages change.
- 404 page with contact buttons.

## Search Console

Property created by/for the client (domain property via DNS if possible), studio added as a
user. Submit sitemap at launch. Check coverage and queries at 1 month (feeds `care-plans`).

## Local keywords (light)

List 5–15 phrases a customer would type: `<service> <town>`, `<service> near <landmark>`,
`<product> <region>`, in each language. Use them to name sections and write copy naturally;
don't create thin doorway pages per town.

## Off-site (advise the client; optional add-on)

Citations in sector directories, local associations, tourism portals, chamber of commerce;
links from partners; keeping social bios with the website link. Avoid paid link schemes.

## What not to promise

Never promise rankings or "first page". Promise: technically correct, complete, fast, with a
Google profile — the things that give them a fair chance.
