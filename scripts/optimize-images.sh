#!/usr/bin/env bash
# local-web-studio — make web versions of photos.
#
# Usage: optimize-images.sh <input-dir> <output-dir> [widths]
#   widths default: "480 960 1600"
#
# Produces <name>-<width>.jpg (always) and .webp / .avif when cwebp / avifenc (or
# ImageMagick 'magick') are installed. Originals are never modified. EXIF is stripped
# where the tool allows it.
#
# Tools used if present: sips (macOS, built in), magick (ImageMagick), cwebp, avifenc.

set -eu

in="${1:-}"; out="${2:-}"; widths="${3:-480 960 1600}"
if [ -z "$in" ] || [ -z "$out" ]; then
  echo "Usage: $0 <input-dir> <output-dir> [\"480 960 1600\"]" >&2
  exit 2
fi
[ -d "$in" ] || { echo "Input dir not found: $in" >&2; exit 2; }
mkdir -p "$out"

have() { command -v "$1" >/dev/null 2>&1; }

resizer=""
if have magick; then resizer="magick"; elif have sips; then resizer="sips"; fi
[ -n "$resizer" ] || { echo "Need ImageMagick (magick) or macOS sips to resize." >&2; exit 1; }
have cwebp || echo "note: cwebp not found — skipping WebP (brew install webp)" >&2
have avifenc || have magick || echo "note: avifenc not found — skipping AVIF (brew install libavif)" >&2

slug() { echo "$1" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-|-$//g'; }

find "$in" -maxdepth 1 -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.heic' -o -iname '*.webp' \) | while IFS= read -r src; do
  base=$(basename "$src"); name=$(slug "${base%.*}")
  for w in $widths; do
    jpg="$out/$name-$w.jpg"
    if [ "$resizer" = "magick" ]; then
      magick "$src" -auto-orient -resize "${w}x>" -strip -quality 78 -interlace Plane "$jpg"
    else
      sips -s format jpeg -s formatOptions 78 --resampleWidth "$w" "$src" --out "$jpg" >/dev/null
    fi
    if have cwebp; then cwebp -quiet -q 75 -metadata none "$jpg" -o "$out/$name-$w.webp"; fi
    if have avifenc; then avifenc -q 55 -s 6 "$jpg" "$out/$name-$w.avif" >/dev/null 2>&1 || true
    elif [ "$resizer" = "magick" ]; then magick "$jpg" -quality 55 "$out/$name-$w.avif" 2>/dev/null || true; fi
  done
  echo "✓ $base → $name-{$(echo $widths | tr ' ' ',')}"
done

echo "Done. Use <picture> with AVIF/WebP sources and the JPEG as fallback; set width/height."
