---
description: Build the first demo of a client site — brand direction, site plan, copy and a mobile-first static build following the technical baseline — then self-review it.
argument-hint: "<client>"
---

Build the demo for: $ARGUMENTS

1. Read the client brief, studio rules and the sector playbook. If the brief lacks essentials
   (contacts, what they do, hard rules), stop and list what's missing.
2. `brand-discovery` → present the direction briefly (palette, fonts, signature element) and
   check `design-registry.md` for sameness. Continue unless the user asked to approve first.
3. `site-planning` → sections and CTAs, respecting the Decisions.
4. `local-copywriting` → copy in the client's language(s), facts only, `[TO CONFIRM]` for gaps.
5. `static-site-build` starting from the plugin's `templates/starter/` (technical skeleton only;
   all visual design is new), with `contact-actions`, `local-seo`, `legal-pages`.
6. Add `noindex` (it's a preview). Run `scripts/check-site.sh` and the demo part of
   `pre-launch-qa`; open it in the browser tool at 390 px and 1440 px if available; fix blockers.
7. Report: what was built, placeholders to replace, questions for the client, and how to share
   the preview. Update status to `demo` and add the design line to `design-registry.md`.
