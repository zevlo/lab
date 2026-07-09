# Command runner capstone is solid

Completed Lesson 0010 with 3/3 on the quiz and a correct from-memory script: load JSON config with `json.load()`, handle `FileNotFoundError` and `json.JSONDecodeError`, loop over configured commands, run each with `subprocess.run(..., capture_output=True, text=True)`, and branch on `result.returncode`.

## Evidence

User pasted their script after completing the lesson. Structure, control flow, and output formatting all match the exercise spec.

## Implications

- User can now combine files, JSON, loops, subprocess, and error handling in one short interview-style script.
- The core "blank-file DevOps Python" toolkit is now in place for many common interview prompts.
- Best next lesson: make scripts reusable with command-line arguments so one script can operate on different files or inputs.
