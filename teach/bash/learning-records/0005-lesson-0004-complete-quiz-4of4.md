# Lesson 0004 complete — look before you leap (quiz 4/4)

2026-09-16. Completed lesson 0004 with a perfect quiz score (4/4), including the spaced-retrieval question revisiting `>&2` from lesson 0003. All four "feel the tests — predict first" predictions were correct — the file/string test operators are fluent, not just recognised.

Evidence in their own scripts, both ShellCheck clean:

- `tmp/peek.sh` — added the second guard exactly as tasked: `[[ ! -f "$1" ]]` → stderr message, `exit 1`, stacked below the lesson-0003 argument guard. Two guards, correct order, one script.
- `tmp/canwrite.sh` — new script with three guards (`$#`, `! -d`, `! -w`), every error to stderr with exit 1.

Implications: guard-before-body is now an unprompted habit applied across every script they touch — the core defensive-scripting habit from lessons 0003–0004 is stored, not just performed. Next lesson can put guards to work inside control flow: lesson 0005 (loops, `"$@"`) reuses the guard pattern word for word inside loop bodies.
