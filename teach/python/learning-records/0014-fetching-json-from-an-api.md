# Fetching JSON from an API is solid

Completed Lesson 0013 with a correct from-memory script: guard `sys.argv`, `urlopen` the URL, decode the body, `json.loads`, print `title`/`completed`, and exit on `URLError`.

## Evidence

Working `exercises/fetch_todo.py` matches the exercise spec (`sys.exit(1)` used equivalently to `raise SystemExit(1)`).

## Implications

- Core mission toolkit is in place: files, logs, subprocess, JSON, CLI args, directory walks, HTTP JSON.
- Good next topics: environment variables (`os.environ`) for config/secrets patterns, or a combine exercise (walk + parse logs across a tree).
