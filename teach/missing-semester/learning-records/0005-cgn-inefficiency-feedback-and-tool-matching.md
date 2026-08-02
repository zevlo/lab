# User pushed back on cgn inefficiency — multiple right tools for bulk replace

In Lesson 0003 Task 2, the user observed that `/v2\.4\.1<Enter>` + `cgn` + `.` is overkill for changing two image-tag strings. They are correct. The lesson forced `cgn` for practice, but for "change all occurrences of a literal string" the right tool is `:%s/v2.4.1/v2.4.2/g`.

Four legitimate options, each with its niche:
- `:%s/old/new/g` — bulk, when all matches should change. Right tool for this task.
- `cgn` + `.` — surgical, when some matches should be skipped.
- `\V` (very-no-magic) — escape hatch when a literal pattern has many regex metachars. `/\Vv2.4.1<Enter>` makes dots literal without escaping.
- `r` + `.` — single-character replacements, e.g., `/v2.4.1<Enter>` then `$r2n.` for changing the last digit of `v2.4.1` → `v2.4.2`.

Lesson 0003 Task 2 answer key updated to show all four options and the principle: match the tool to the task. Added to NOTES.md as a standing drill-design rule.

New GLOSSARY.md entries: substitute, word boundary, dot formula.

Implications for future drill design:
- Don't force a specific tool when a simpler one exists.
- Use `cgn` drills only when the scenario has surgical decisions (some matches in, some out).
- Use `:%s` drills for bulk renames.
- The user's "right tool for the job" instinct is reliable — reinforce it by surfacing alternatives honestly in answer keys.
- The user notices efficiency cliffs (verbose keystroke counts). Future lessons should pre-empt by acknowledging tradeoffs rather than presenting a single canonical answer.
