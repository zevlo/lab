# List comprehensions solid; quiz wording was the failure mode

Completed Lesson 0024 (list comprehensions filter lines). The from-memory exercise `filter_errors.py` matched the spec: six log lines, one comprehension that filters with `startswith("ERROR")` and transforms with `split()[1]`, then a count + report loop. The skill itself is in reach. Quiz was 0/3, but the user attributed that to not understanding the question wording — not to missing the concept. That matches the evidence split (broken quiz, clean exercise).

## Evidence

Pasted script is the lesson shape: multiline `hosts = [line.split()[1] for line in lines if line.startswith("ERROR")]`, `len(hosts)` framing, ordered report loop. No long-form `append` fallback. Quiz miss is treated as a lesson-design signal, not a ZPD miss: Q2 originally used bare `if x` (truthiness), which the lesson never taught, and the option glosses ("failed/passed the test") were ambiguous.

## Implications

- **List comprehension (filter + transform) is in the toolkit.** Treat blank-file prompts like "keep only ERROR lines" or "extract the hostname from matching lines" as within reach. Nested / dict / set comprehensions and generator expressions remain out of scope.
- **Quiz copy is a real failure mode.** Prefer concrete stems ("What does this produce?", "Which statement is true?") and options that do not introduce untaught ideas. Recorded in NOTES.
- **Next-direction candidates (open):** `collections.Counter`, tuples, or a spaced-retrieval mix of a different cluster than Lesson 22. Confirm with the user before Lesson 25.
