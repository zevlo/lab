# subprocess.run() is solid

Completed Lesson 0007 with 3/3 on the quiz and a correct from-memory script: list-form args, `capture_output=True`, `text=True`, `.strip()` on stdout, explicit `returncode` check for a failing command.

## Evidence

User pasted their script and asked for idiomatic/correctness review. Logic and output match the exercise spec exactly.

## Implications

- The "run command → read output → check exit code" pattern is in place.
- Next: JSON — parsing API/config responses that map directly onto dicts and lists.
- User continues asking about idiomatic style; worth giving brief PEP 8 notes when code is correct but improvable.
