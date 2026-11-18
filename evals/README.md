# Evals

Behaviour checks for the plugin, run with Claude Code's eval runner:

```bash
claude plugin eval . --runs 1
```

Each case is a folder with `prompt.md` and `graders/*.md` (one pass/fail criterion per file).
They cost real model usage; run them when you change skills, not on every edit.

| Case | What it protects |
|---|---|
| `no-visits-farm` | Hard rules from the brief (no visits), call links for every number, WhatsApp only on WhatsApp numbers, no invented facts |
| `pricing-floor` | Pricing advice computes a floor, limits revisions, includes a care plan, client owns accounts |
| `review-reviews` | Never writes fake reviews; suggests legitimate methods |
