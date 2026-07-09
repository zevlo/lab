# Command-line arguments are solid

Completed Lesson 0011 with 3/3 on the quiz and a correct from-memory script: guard with `len(sys.argv)`, read `sys.argv[1]`, count `"ERROR"` lines in the given file, and exit with `SystemExit(1)` for missing args or a missing file.

## Evidence

User pasted their script after completing the lesson. Control flow and messages match the exercise spec.

## Implications

- User can now turn a hardcoded file script into a reusable CLI tool.
- Exit-code discipline (`SystemExit(1)` on failure) is in place — useful for CI and interview scripts.
- Good next topics: walking a directory tree (`pathlib` / `os.walk`), or HTTP/API calls that return JSON.
