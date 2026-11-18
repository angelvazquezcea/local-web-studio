---
description: Full quality review of a client site before a demo or launch — automated checks plus content, contact, mobile, performance, SEO, accessibility and legal — with blockers first.
argument-hint: "<client or site folder> [demo|launch]"
---

Review: $ARGUMENTS

1. Locate the site folder and the client brief.
2. Run `bash "${CLAUDE_PLUGIN_ROOT}/scripts/check-site.sh" <site-dir>`.
3. Follow the `pre-launch-qa` skill (demo level = sections 1–4; launch = all).
4. In parallel when useful, use the agents `site-auditor`, `seo-auditor`, `copy-editor`,
   `design-critic` and, for multilingual sites, `translation-reviewer`. Merge and de-duplicate.
5. Output blockers → improvements → not checked. Ask before fixing anything on a delivered site.
