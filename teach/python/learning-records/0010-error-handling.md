# Error handling basics are solid

Completed Lesson 0009 with 3/3 on the quiz and a correct from-memory script: one `try` block around file open + `json.load()`, then specific `except` handlers for `FileNotFoundError`, `json.JSONDecodeError`, and `KeyError`.

## Evidence

User pasted their script after completing the lesson. Structure and messages match the exercise spec exactly.

## Implications

- User can now write a small config-reading script that fails gracefully instead of crashing.
- The foundation is in place for combining files, JSON, subprocess, and exceptions in one interview-style task.
- Best next lesson: a small capstone that reads a config, runs commands, and handles failures cleanly.
