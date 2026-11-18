---
name: revision-rounds
description: Run client feedback and change rounds without scope creep — collect feedback into one consolidated list, classify (fix / included change / new scope), apply, confirm and track rounds used. Use when the client sends changes, voice notes or screenshots with comments, when changes keep coming, or when the user is unsure whether a request is included.
---

# Revision rounds

## Collecting feedback

- Ask the client for **one consolidated list per round** (a voice note is fine; you transcribe).
- Share the demo as a link they open on their phone, plus a short guide: "tell me what you'd
  change, section by section; screenshots welcome".
- When the user pastes messy feedback (WhatsApp messages, transcripts), turn it into a numbered
  list with section, the client's words, and your interpretation.

## Classify every item

| Type | Examples | Handling |
|---|---|---|
| **Fix** (our mistake) | typo, wrong phone, broken button, layout bug | Always free, doesn't count as a round |
| **Included change** | reword text, swap photos, reorder sections, adjust colour | Counts toward the round |
| **New scope** | new page, new language, booking system, shop | Quote separately; point to the proposal |
| **Risky/against brief** | a request that breaks the brief or the technical baseline (e.g. remove the call button, autoplay music, giant images) | Explain the trade-off briefly, propose an alternative, client decides |

Before applying, present the classified list and get a yes when anything is new scope or
risky. For a delivered site, never apply changes beyond fixes without that yes.

## Applying

- Apply all items of the round together, then run `pre-launch-qa` quick checks.
- Reply with a change log: what changed (✓), what needs their input (?), what is quoted ($).
- Update `client.md`: `changes-1` / `changes-2` with date and a one-line summary.

## When rounds run out

Say it kindly and clearly: "this would be a third round; it's <price> or we can include it in
the care plan changes after launch". Don't silently absorb extra rounds — it trains clients to
expect it — unless the user decides to as goodwill (then say it's a goodwill gesture).
