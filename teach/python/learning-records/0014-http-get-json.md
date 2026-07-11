# HTTP GET + JSON with urllib is solid

Completed Lesson 0013 with 3/3 on the quiz and a correct from-memory script: guard `sys.argv`, `urlopen` → `read()` → `json.loads`, catch `HTTPError` / `URLError` / `JSONDecodeError`, print `data["title"]`.

## Evidence

User pasted their script after completing the lesson. Control flow and messages match the exercise spec (`sys.exit(1)` used equivalently to `raise SystemExit(1)`).

## Implications

- Mission checklist item “hit an API and process JSON” is now covered with stdlib only — good interview default.
- Core DevOps interview script skills from the mission are in place (logs, JSON, directories, subprocess, argv, HTTP). Next sessions can combine them (e.g. walk logs + count ERROR, or fetch + filter JSON) or deepen one area on request — hold difficulty steady unless asked.
