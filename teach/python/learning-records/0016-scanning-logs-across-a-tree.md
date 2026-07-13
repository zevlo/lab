# Scanning logs across a tree is solid

Completed Lesson 0015 with 3/3 on the quiz and a correct from-memory script: argv + `Path` guards, `rglob("*.log")`, nested line scan for `"ERROR"`, one running `total`.

## Evidence

User pasted their script after completing the lesson. Control flow and messages match the exercise spec (`total += 1` equivalent to `total = total + 1`; `sys.exit(1)` equivalent to `raise SystemExit(1)`).

## Implications

- User can assemble walk + file parse into one interview-style tool without new modules.
- Retrieval of pathlib, open/line loops, and argv is working under load.
- Good next topics: writing files (report output), `if __name__ == "__main__"` script structure, or light classes enough to read others' code.
