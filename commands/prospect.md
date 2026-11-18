---
description: Find and score local businesses to contact in an area or sector, with a presence audit and a concrete opening hook for each.
argument-hint: "<sector in area> | <business name, town>"
---

Use the `lead-prospecting` skill (and the `prospect-researcher` agent for web research when
web tools are available). Target: $ARGUMENTS

1. If no target is given, read `studio.md` for sectors/area and ask the user for 10 warm
   contacts first.
2. Audit each business's public presence; score need/value/access; write one hook each.
3. Update or create `leads.md` and recommend the first 3–5 to contact.
4. Offer drafts with the `outreach-messages` skill. Never send anything yourself.
