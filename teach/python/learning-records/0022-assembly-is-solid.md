# Assembly of class + argv + main + guard is solid

Completed Lesson 0021 (the small combine) with 3/3 on the quiz and a correct from-memory `host_check.py`. Every piece — class with `__init__` + `summary`, argv length guard with usage + `SystemExit(1)`, `main()` wiring argv to the class, entry guard at the bottom — was typed from memory and matches the spec exactly.

## Evidence

Quiz 3/3. Pasted script is line-for-line the assembled shape: `class Host` at top, `def main():` in the middle, `if __name__ == "__main__":` last. The user did not surface the `method()` vs `method` gotcha this time, which suggests the call-vs-reference distinction (flagged in LR 0021) has settled.

## Implications

- **The OOP remediation arc is closed.** LR 0019 marked Lesson 0018's full-script scope as beyond ZPD. After attributes (0019) → methods (0020) → assembly (0021), that same scope is now within reach and demonstrably fluent. Treat "class + main + argv + guard" as a reusable interview-script skeleton the user can produce from a blank file.
- **No new OOP surface yet.** Inheritance, `@classmethod`/`@staticmethod`, `__str__`, dataclasses, and properties remain out of scope. Re-introduce only when the mission demands it (e.g. reading a library snippet that uses one of them).
- **The core interview toolkit is now covered.** Variables/strings/types, lists+loops, dicts, conditionals, functions, file reading+string parsing, subprocess, JSON, error handling, argv, pathlib walks, HTTP fetch, env vars, file writing, entry point, and class-enough-to-read. The mission's success criteria ("write a working Python script from a blank file") are within striking distance.
- **Do not auto-escalate difficulty** (per NOTES 2026-07-03). Two natural next directions, both at-or-below current ZPD:
  1. **Spaced retrieval** of older skills (LR 0003 lists/loops, LR 0004 dicts, LR 0007 files, LR 0010 capstone) — these are now ~2 weeks cold and due for interleaving. Pure recall, no new surface.
  2. **One small new interview-common surface** within reach: list comprehensions, `set` for dedupe, or tuples — whichever best matches a realistic DevOps script the user might face.
- Confirm direction with the user before building the next lesson rather than prescribing.
