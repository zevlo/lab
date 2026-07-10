# Walking directories with pathlib is solid

Completed Lesson 0012 with 3/3 on the quiz and a correct from-memory script: guard `sys.argv`, build a `Path`, reject non-directories with `is_dir()`, then `rglob("*.log")` and print files.

## Evidence

User pasted their script after completing the lesson. Control flow and messages match the exercise spec (`sys.exit(1)` used equivalently to `raise SystemExit(1)`).

## Implications

- User can now turn a single-file script into a tree-scanning tool — a common DevOps interview prompt.
- `pathlib.Path` + `rglob` is in place; `os.walk` is optional later if needed for reading others' code.
- Good next topics: HTTP/API calls that return JSON (`urllib` or `requests`), or combining walk + file parsing (e.g. count ERROR lines across all logs under a directory).
