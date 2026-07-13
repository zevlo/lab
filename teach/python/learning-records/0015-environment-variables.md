# Environment variables are solid

Completed Lesson 0014 with 3/3 on the quiz and a correct from-memory script: `os.environ.get` with a default for `APP_ENV`, require `API_URL` via `None` check, and exit with `SystemExit(1)` when missing.

## Evidence

User pasted their script after completing the lesson. Control flow and messages match the exercise spec.

## Implications

- User can now configure scripts the way deploy/CI systems do — env vars for settings, argv for which input.
- Core blank-file DevOps toolkit is broad: files, logs, subprocess, JSON, CLI args, directory walks, HTTP JSON, environ.
- Good next topics: a combine/retrieval lesson (e.g. walk a tree and count ERROR lines), writing files, or light `if __name__ == "__main__"` script structure for interview readability.
