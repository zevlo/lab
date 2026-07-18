# Spaced retrieval held: lists/dicts/files/capstone after two weeks cold

Completed Lesson 0022 (spaced-retrieval mix) with 3/3 on the quiz and a correct from-memory `tally_log.py`. All four target skills — lists + loops, dicts, reading files, and the capstone try/except shape — came back fast and clean after ~2 weeks cold. No piece required troubleshooting.

## Evidence

Quiz 3/3. Pasted script matches the lesson spec line for line: `counts = {}` literal, `try:` wrapping `with open(...) as f:` + the for-loop, `level = line.split()[0]`, `counts[level] = counts.get(level, 0) + 1`, `except FileNotFoundError:` with `raise SystemExit(1)`, then a second loop over `counts.items()` for reporting. The two-loops-two-roles pattern (build the data, then report it) was produced unprompted. No `counts[level]` lookup-before-set bug, which is the classic failure mode this lesson was designed to surface.

## Implications

- **The four oldest core skills are now storage-strong, not just fluency-strong.** LR 0003/0004/0007/0011 recorded them as solid when first learned; this record confirms they survive a two-week gap. Treat blank-file interview prompts that combine these four (log tally, config reader, command runner) as reliably within reach.
- **The `counts.get(k, 0) + 1` increment-or-insert idiom is fluent.** This is the load-bearing line for any "count by category" interview task. It can be assumed as prior knowledge in future lessons.
- **Difficulty held steady as instructed (NOTES 2026-07-03).** No escalation in scope or speed. The retrieval-mix format worked; it is available as a template for future interleaving sessions when any other skill cluster goes cold (~2+ weeks).
- **The OOP remediation arc (closed in LR 0022) and the now-retrieved core four can be combined.** A natural future interview-shaped drill: a small class wrapping a tally or report (combining the capstone + classes + dicts). Not urgent — only when mission-relevant.
- **The next-direction question from LR 0022 is still open.** With retrieval confirmed solid, the alternative path — one small new interview-common surface (list comprehensions, `set` for dedupe, tuples, or `collections.Counter`) — is now the leading candidate for Lesson 23. Confirm with the user before building, per NOTES.
