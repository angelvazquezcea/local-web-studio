---
description: Prepare a discovery call for a client (tailored question cues) or turn call notes/transcript into a complete client brief.
argument-hint: "<client> [paste notes or transcript]"
---

Use the `discovery-call` skill plus the matching file in `sector-playbooks`.

Input: $ARGUMENTS

- If there are no notes yet: produce a one-screen cue sheet tailored to the sector and what is
  already known, plus the materials to ask the client to have ready.
- If notes or a transcript are included: fill the client brief (studio template from
  `CLAUDE.md`, else `templates/client-brief.md`), keep the owner's own phrases in quotes, add
  Decisions (hard rules), list contradictions and missing items, set status `call-done`.
