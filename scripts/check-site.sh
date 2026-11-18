#!/usr/bin/env bash
# local-web-studio — static site checker for local business websites.
#
# Usage:
#   check-site.sh <site-dir|page.html>   Full report (exit 1 if blockers found)
#   check-site.sh --hook                 Hook mode: reads Claude Code hook JSON on stdin,
#                                        checks the edited .html page, prints nothing when OK.
#
# Opt out of hook checks in a project: create a file named .lws-no-checks in the project
# root, or set LWS_HOOKS=off.
#
# Compatible with macOS bash 3.2. Uses python3 or node (if present) only to parse JSON-LD.

set -u

BLOCKERS=()
WARNINGS=()
INFOS=()

blocker() { BLOCKERS+=("$1"); }
warn()    { WARNINGS+=("$1"); }
info()    { INFOS+=("$1"); }

# ---------- helpers ----------

is_full_page() { grep -qiE '<html|<head' "$1"; }

json_ld_valid() {
  # $1 = html file. Prints the number of invalid JSON-LD blocks (0 if none or can't check).
  local f="$1"
  if command -v python3 >/dev/null 2>&1; then
    python3 -I - "$f" <<'PY' 2>/dev/null
import json, re, sys
html = open(sys.argv[1], encoding="utf-8", errors="replace").read()
blocks = re.findall(r'<script[^>]+application/ld\+json[^>]*>(.*?)</script>', html, re.S | re.I)
bad = 0
for b in blocks:
    try:
        json.loads(b)
    except Exception:
        bad += 1
print(bad)
PY
  elif command -v node >/dev/null 2>&1; then
    node -e '
const fs=require("fs");const h=fs.readFileSync(process.argv[1],"utf8");
const re=/<script[^>]+application\/ld\+json[^>]*>([\s\S]*?)<\/script>/gi;let m,bad=0;
while((m=re.exec(h))){try{JSON.parse(m[1])}catch(e){bad++}}console.log(bad);' "$f" 2>/dev/null
  else
    echo "skip"
  fi
}

check_page() {
  # $1 = html file, $2 = label (relative path)
  local f="$1" p="$2"
  is_full_page "$f" || return 0

  grep -qiE '<meta[^>]+name=["'"'"']?viewport' "$f" || blocker "$p: missing <meta name=\"viewport\"> (page will not be mobile-friendly)"
  grep -qiE '<html[^>]+lang=' "$f" || warn "$p: <html> has no lang attribute"
  grep -qiE '<title>[^<]+' "$f" || blocker "$p: missing or empty <title>"
  grep -qiE '<meta[^>]+name=["'"'"']?description' "$f" || warn "$p: missing meta description"

  # Title length
  local title
  title=$(sed -n 's:.*<title>\([^<]*\)</title>.*:\1:Ip' "$f" | head -1)
  if [ -n "$title" ] && [ "${#title}" -gt 65 ]; then
    warn "$p: <title> is ${#title} chars (aim <= 60)"
  fi

  # h1 count
  local h1
  h1=$(grep -oiE '<h1[ >]' "$f" | wc -l | tr -d ' ')
  [ "$h1" = "0" ] && warn "$p: no <h1>"
  [ "$h1" -gt 1 ] 2>/dev/null && warn "$p: $h1 <h1> elements (use one)"

  # Contact actions
  if ! grep -qi 'href=["'"'"']tel:' "$f"; then
    if grep -qE '(\+?[0-9][0-9 .-]{7,}[0-9])' "$f"; then
      blocker "$p: phone-like numbers found but no tel: link (every number needs a call link, landlines too)"
    fi
  fi
  # tel links should be digits and + only
  if grep -oiE 'href=["'"'"']tel:[^"'"'"']+' "$f" | sed 's/.*tel://I' | grep -qE '[^0-9+]'; then
    warn "$p: tel: link contains spaces or symbols (use E.164, e.g. tel:+34600123456)"
  fi
  # WhatsApp links format
  if grep -oiE 'https?://(api\.)?wa\.me/[^"'"'"' >]*' "$f" | sed -E 's#https?://(api\.)?wa\.me/##I' | cut -d'?' -f1 | grep -qE '[^0-9]'; then
    blocker "$p: wa.me link has non-digits in the number (use https://wa.me/34600123456)"
  fi
  if grep -qiE 'wa\.me/[0-9]+["'"'"' >]' "$f"; then
    warn "$p: WhatsApp link without a prefilled ?text= message"
  fi

  # Images
  local imgs noalt nodims
  imgs=$(grep -oiE '<img[^>]*>' "$f" || true)
  if [ -n "$imgs" ]; then
    noalt=$(printf '%s\n' "$imgs" | grep -viE '\balt=' | wc -l | tr -d ' ')
    [ "$noalt" -gt 0 ] && blocker "$p: $noalt <img> without alt attribute"
    nodims=$(printf '%s\n' "$imgs" | grep -viE 'width=' | wc -l | tr -d ' ')
    [ "$nodims" -gt 0 ] && warn "$p: $nodims <img> without width/height (causes layout shift)"
  fi

  # Structured data
  if grep -qi 'application/ld+json' "$f"; then
    local bad
    bad=$(json_ld_valid "$f")
    if [ "$bad" = "skip" ]; then
      info "$p: JSON-LD present (not parsed: python3/node not available)"
    elif [ -n "$bad" ] && [ "$bad" != "0" ]; then
      blocker "$p: $bad JSON-LD block(s) are not valid JSON"
    fi
  else
    # Home pages only: root index.html or a language home like gl/index.html, pt-PT/index.html
    if [ "$p" = "index.html" ] || printf '%s' "$p" | grep -qE '^[a-z]{2}(-[A-Za-z]{2,4})?/index\.html$'; then
      warn "$p: no JSON-LD structured data (LocalBusiness)"
    fi
  fi

  # Third parties & privacy
  grep -qiE 'fonts\.(googleapis|gstatic)\.com' "$f" && warn "$p: Google Fonts loaded from Google (self-host fonts for privacy/GDPR and speed)"
  if grep -oiE '<script[^>]+src=["'"'"']https?://[^"'"'"']+' "$f" | grep -qviE 'plausible|goatcounter|umami|fathom|cloudflareinsights'; then
    warn "$p: external script(s) loaded from a CDN/third party (check need, privacy and speed)"
  fi
  grep -qiE 'googletagmanager|google-analytics|gtag\(' "$f" && warn "$p: Google Analytics/Tag Manager found (needs consent banner in the EU)"

  # Placeholders
  grep -qiE '\[TO CONFIRM|\[TO FILL|lorem ipsum|example\.com|REPLACE:' "$f" && warn "$p: placeholders left ([TO CONFIRM], REPLACE, lorem ipsum, example.com)"
  grep -qiE 'src=["'"'"'][^"'"'"']*stock-' "$f" && info "$p: stock images in use (replace before launch or get client OK)"

  # Indexing
  grep -qiE '<meta[^>]+name=["'"'"']?robots[^>]+noindex' "$f" && info "$p: noindex present (OK for previews; remove for launch)"

  return 0
}

check_site_dir() {
  local d="$1"
  local pages
  pages=$(find "$d" -type f -name '*.html' -not -path '*/node_modules/*' | sort)
  if [ -z "$pages" ]; then
    blocker "No .html files found in $d"
    return
  fi
  local f rel
  while IFS= read -r f; do
    rel="${f#$d/}"
    check_page "$f" "$rel"
  done <<EOF
$pages
EOF

  # Site-level files
  [ -f "$d/robots.txt" ] || warn "robots.txt missing"
  [ -f "$d/sitemap.xml" ] || warn "sitemap.xml missing"
  [ -f "$d/404.html" ] || warn "404.html missing"
  [ -n "$(find "$d" -maxdepth 3 -type f -iname 'favicon*' 2>/dev/null | head -1)" ] || warn "no favicon found"

  # Legal pages linked from the home page
  if [ -f "$d/index.html" ]; then
    grep -qiE 'priva' "$d/index.html" || blocker "index.html: no link to a privacy policy"
    grep -qiE 'legal|aviso|imprint|impressum|notice' "$d/index.html" || warn "index.html: no link to a legal notice/imprint (required for businesses in the EU)"
    grep -qiE 'maps\.google|google\.com/maps|maps/embed|maps/dir' "$d/index.html" || warn "index.html: no Google Maps embed or directions link"
    grep -qiE 'wa\.me' "$d/index.html" || info "index.html: no WhatsApp link (fine only if no number has WhatsApp)"
  fi

  # Heavy files
  local big
  big=$(find "$d" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' -o -iname '*.avif' \) -size +400k 2>/dev/null)
  [ -n "$big" ] && warn "Images over 400 KB: $(echo "$big" | sed "s#$d/##" | tr '\n' ' ')"
  big=$(find "$d" -type f \( -iname '*.mp4' -o -iname '*.webm' -o -iname '*.mov' \) -size +3000k 2>/dev/null)
  [ -n "$big" ] && warn "Videos over 3 MB: $(echo "$big" | sed "s#$d/##" | tr '\n' ' ')"
  big=$(find "$d" -type f \( -iname '*.ttf' -o -iname '*.otf' \) 2>/dev/null)
  [ -n "$big" ] && warn "TTF/OTF fonts found: convert to WOFF2: $(echo "$big" | sed "s#$d/##" | tr '\n' ' ')"
  local total
  total=$(du -sk "$d" 2>/dev/null | cut -f1)
  [ -n "$total" ] && info "Total site size: ${total} KB"
}

json_escape() { sed -e 's/\\/\\\\/g' -e 's/"/\\"/g' | awk 'BEGIN{ORS="\\n"}{print}'; }

# ---------- hook mode ----------

if [ "${1:-}" = "--hook" ]; then
  [ "${LWS_HOOKS:-on}" = "off" ] && exit 0
  [ -n "${CLAUDE_PROJECT_DIR:-}" ] && [ -f "$CLAUDE_PROJECT_DIR/.lws-no-checks" ] && exit 0
  input=$(cat)
  file=$(printf '%s' "$input" | grep -oE '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed -E 's/.*:[[:space:]]*"(.*)"/\1/')
  case "$file" in
    *.html|*.htm) ;;
    *) exit 0;;
  esac
  [ -f "$file" ] || exit 0
  case "$file" in
    */templates/starter/*) exit 0;;
  esac
  check_page "$file" "$(basename "$file")"
  # Hook mode reports blockers only, so work-in-progress pages (placeholders, stock images)
  # don't produce noise on every edit. Warnings appear in the full CLI report.
  [ ${#BLOCKERS[@]} -eq 0 ] && exit 0
  msg="local-web-studio checks for $(basename "$file"):"
  for b in "${BLOCKERS[@]}"; do msg="$msg
- BLOCKER: $b"; done
  msg="$msg
(Fix if relevant to this edit; run scripts/check-site.sh on the site folder for a full report.)"
  esc=$(printf '%s' "$msg" | json_escape)
  printf '{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":"%s"}}\n' "$esc"
  exit 0
fi

# ---------- CLI mode ----------

target="${1:-}"
if [ -z "$target" ]; then
  echo "Usage: $0 <site-dir|page.html>" >&2
  exit 2
fi
if [ -d "$target" ]; then
  target="${target%/}"
  check_site_dir "$target"
elif [ -f "$target" ]; then
  check_page "$target" "$(basename "$target")"
else
  echo "Not found: $target" >&2
  exit 2
fi

echo "== local-web-studio site check: $target =="
if [ ${#BLOCKERS[@]} -gt 0 ]; then
  echo "BLOCKERS (${#BLOCKERS[@]})"
  for b in "${BLOCKERS[@]}"; do echo "  ✗ $b"; done
fi
if [ ${#WARNINGS[@]} -gt 0 ]; then
  echo "WARNINGS (${#WARNINGS[@]})"
  for w in "${WARNINGS[@]}"; do echo "  ! $w"; done
fi
if [ ${#INFOS[@]} -gt 0 ]; then
  echo "INFO"
  for i in "${INFOS[@]}"; do echo "  · $i"; done
fi
if [ ${#BLOCKERS[@]} -eq 0 ] && [ ${#WARNINGS[@]} -eq 0 ]; then
  echo "  ✓ No blockers or warnings from automated checks."
fi
echo "Automated checks only: also review content truth, design, real-device rendering and legal data (see the pre-launch-qa skill)."
[ ${#BLOCKERS[@]} -gt 0 ] && exit 1
exit 0
