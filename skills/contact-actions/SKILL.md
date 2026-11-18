---
name: contact-actions
description: Implement the contact layer of a local business site — call (tel:) and WhatsApp (wa.me with prefilled message) for every number including landlines, sticky mobile action bar, email, map embed, directions and opening hours — with correct international formats and tracking-friendly markup. Use whenever a site has phone numbers, when buttons are missing or broken, or when adding a map or hours.
---

# Contact actions

For a local business, the site's job is usually to make the phone ring. Every contact must be
one tap away on mobile.

## Phone numbers

- Store numbers in E.164 for links: `+34600123456` (no spaces). Display them in the local
  readable format: `600 12 34 56`.
- **Call link for every number**, landlines included: `<a href="tel:+34982123456">`.
- Label each number with what it is: "Office (landline)", "María – mobile & WhatsApp".

## WhatsApp

- Only for numbers that actually have WhatsApp (ask; landlines usually don't, though
  WhatsApp Business can run on a landline — confirm).
- Link: `https://wa.me/<digits-without-plus>?text=<urlencoded message>`.
- Prefilled message in the site language, polite and specific:
  `Hello, I saw your website and I'd like information about …`. URL-encode it
  (`encodeURIComponent`). One message per language version.
- Use the official WhatsApp icon shape in a neutral way; do not imply WhatsApp endorsement.

## Visibility rule

- **Mobile**: sticky bottom bar (or floating buttons) with the primary actions (Call,
  WhatsApp, optionally Directions/Book), ≥ 48 px tall, not covering content (add
  `padding-bottom` to `body`), respects `env(safe-area-inset-bottom)`.
- **Desktop**: phone visible in header; contact section complete.
- Buttons also inside hero and contact section.
- With several numbers: the bar shows the main one; the contact section lists all.

## Email

`<a href="mailto:…?subject=…">` plus the address visible as text (users copy it). Consider
obfuscation only if spam is a real issue — never break usability for it.

## Map and directions

- Google Maps embed via `<iframe loading="lazy" referrerpolicy="no-referrer-when-downgrade"
  title="Map: <Business>">` with the business place (preferably the Business Profile place,
  or exact coordinates for rural addresses).
- Privacy option (EU): show a static image/placeholder with a "Load map" button so no Google
  request happens before consent; or keep the iframe and mention it in the privacy/cookie
  policy — follow `legal-pages`.
- Always add a plain **"How to get here"** link: `https://www.google.com/maps/dir/?api=1&destination=<lat>,<lng>`
  and, for rural places, written directions ("after the church, second left; GPS sometimes
  sends you via …").

## Opening hours

Human-readable table + the same data in schema (`openingHoursSpecification`). Seasonal hours
and holidays noted; remind the client that Google Business Profile hours must match.

## Markup for measurement

Add `data-contact="call|whatsapp|email|directions|book"` attributes so privacy-friendly
analytics can count clicks (see `analytics-and-reporting`). No third-party trackers by default.

## Snippet

See `templates/starter/index.html` (`.contact-bar` and `#contact`) for a ready structure to
style per site.
