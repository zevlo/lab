# Sets for dedupe is solid

Completed Lesson 0023 (sets dedupe a list) with 3/3 on the quiz and a correct from-memory `unique_hosts.py`. The new shape — `set(xs)` to throw away duplicates, `len(set(xs))` for distinct count, `sorted(set(xs))` for stable output — came back fluently on the first try. No troubleshooting needed.

## Evidence

Quiz 3/3, including the two trap questions: `<code>{}</code>` evaluates to an empty **dict** (not a set), and `for h in sorted(set(hosts)):` is the right loop for deterministic output. Pasted script matches the lesson spec line for line: 8-entry list with intentional duplicates, `unique = set(hosts)`, two `len()` calls (one on the list, one on the set) producing the &ldquo;8 total / 4 unique&rdquo; framing, and the report loop wrapping the set in `sorted()`. The wrap-in-`sorted()` habit was produced unprompted, which is the load-bearing discipline this lesson was designed to instill.

## Implications

- **`set` is now in the toolkit.** Treat blank-file interview prompts like &ldquo;list the unique hosts in this log,&rdquo; &ldquo;what log levels did we see?,&rdquo; or &ldquo;count distinct values&rdquo; as reliably within reach. The dict-vs-set split is now clean in memory: dict = &ldquo;how many of each?&rdquo; (tally, Lesson 22), set = &ldquo;which ones?&rdquo; (dedupe, Lesson 23).
- **No new set surface yet.** Union (`|`), intersection (`&`), difference (`-`), symmetric difference, frozenset, set comprehensions, and `dict.fromkeys()` for order-preserving dedupe remain out of scope. Re-introduce only when an interview prompt or library-reading task genuinely requires one.
- **The core interview toolkit is now broader, not deeper.** Variables/strings/types, lists+loops, dicts, conditionals, functions, file reading+string parsing, subprocess, JSON, error handling, argv, pathlib walks, HTTP fetch, env vars, file writing, entry point, class-enough-to-read, and now sets. Mission's success criteria (&ldquo;write a working Python script from a blank file&rdquo;) remain within striking distance.
- **Next-direction question (open).** With sets added, remaining small interview-common surfaces within reach: list comprehensions, `collections.Counter` (the stdlib version of the Lesson 22 idiom), and tuples. Alternatively, a second retrieval-mix session (different cluster than Lesson 22) is available if any older skill has gone cold again. Confirm direction with the user before building Lesson 24, per NOTES.
