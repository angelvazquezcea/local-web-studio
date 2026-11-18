---
name: photos-and-media
description: Handle images and video for local business sites — collecting originals, selecting and naming, compressing to AVIF/WebP/JPEG with responsive sizes, hero video loops (including drone footage), stock placeholders marked for replacement, licences, and consent for people/property. Use when adding or replacing photos, when images are heavy, when using drone or stock material, or when the client sends media.
---

# Photos and media

## Collecting

- Ask for **originals** (shared folder, AirDrop, "send as document" on WhatsApp). Chat-compressed
  photos are often too small for heroes.
- Put received files untouched in the client's `assets/originals/` (or the studio's photo
  folder). Never edit originals in place.

## Selecting

Pick per section from the site plan: 1 hero (wide, strong, room for text), 3–6 for offer
sections, people/story shots, 6–12 for the gallery. Prefer real, sharp, well-lit, horizontal
for heroes; check that nothing private or unsafe is visible (licence plates, documents,
children's faces, alarm panels, biosecurity breaches on farms).

## Naming

`<subject>-<place>-<n>.<ext>` in lowercase with dashes: `horno-lenha-panaderia-1.jpg`.
Stock: `stock-<subject>.jpg` + note in `client.md` "to replace".

## Processing (web versions in `site/img/`)

- Widths: 480, 960, 1600 (hero up to 2400). Quality ~70–80 (JPEG/WebP), AVIF ~50–60.
- Formats: AVIF + WebP with JPEG fallback via `<picture>`, or WebP + JPEG if AVIF tooling is
  unavailable.
- Strip EXIF/GPS (privacy) except where location is intentionally public.
- Always output `width`/`height` to avoid layout shift.
- Tools: `scripts/optimize-images.sh` in this plugin uses `sips` (macOS) or ImageMagick/
  `cwebp`/`avifenc` if installed; tell the user what is missing instead of failing silently.

## Video (hero loops, drone footage)

- Hero loop 8–20 s, no audio track, 1280–1920 px wide, H.264 MP4 (+ WebM/AV1 optional),
  target ≤ 2.5 MB, `autoplay muted loop playsinline preload="metadata" poster="…"`.
- Respect `prefers-reduced-motion` and `Save-Data`: show the poster image instead.
- Longer videos: host on YouTube/Vimeo (privacy-enhanced embed, click-to-load) rather than the
  site.
- ffmpeg recipe (if installed):
  `ffmpeg -i in.mp4 -an -vf "scale=1600:-2,fps=30" -c:v libx264 -crf 28 -preset slow -movflags +faststart hero.mp4`
- Drone footage from partners: client must approve publication; credit the operator if agreed;
  check that flights comply with local rules is the operator's responsibility, but don't
  publish footage showing neighbours' private property in detail.

## Stock images (temporary)

- Only free-for-commercial-use sources (e.g. Unsplash, Pexels) and keep the source URL in
  `client.md`. Never AI-generated images presented as the real place, never illustrations as a
  substitute for real photos unless it's an intentional design choice.
- They must look plausible for the region and sector (no palm trees for a Galician farm).
- Mark them visibly in the demo notes; QA blocks launch until replaced or knowingly accepted.

## Rights and consent

- Client confirms they own or have rights to the photos they send.
- People recognisable: client must have their consent (staff, guests, children → be strict).
- Record permissions in `client.md`.
