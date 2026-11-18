# Contributing

Thanks for helping local businesses get better websites.

## What's most useful

- **New sector playbooks** — copy any file in `skills/sector-playbooks/references/`, keep the
  same headings (Goals · Audiences · Must-have sections · Hard rules · Schema · CTAs · Photos ·
  FAQ ideas · Discovery questions · Pitfalls · Upsells), and add it to the table in
  `skills/sector-playbooks/SKILL.md`.
- **Country notes** — legal pages, consumer rules, sector registries for your country, added
  to `skills/legal-pages/SKILL.md` and, if useful, localized legal templates in
  `templates/starter/`.
- **Checks** — new fast, low-noise checks in `scripts/check-site.sh`. A check must be cheap,
  have almost no false positives, and print nothing when the page is fine.
- **Evals** — a case in `evals/<name>/` with `prompt.md` and `graders/*.md` for any behaviour
  you fix or add.

## Style for skills

- Frontmatter `description` says what the skill does **and when to use it** (that's how
  Claude picks it).
- Instructions in English, imperative, concrete; tables and checklists over prose.
- Respect the principles in `README.md`: studio rules win, no design templates, no invented
  facts, client owns accounts, honest selling.
- Keep each `SKILL.md` focused; move long material into `references/`.

## Before opening a PR

```bash
claude plugin validate .
bash -n scripts/*.sh
bash scripts/check-site.sh templates/starter   # should only report placeholders
```
