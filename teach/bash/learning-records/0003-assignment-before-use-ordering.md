# Variables must be assigned before the line that reads them (ordering insight)

2026-09-10. While doing the lesson 0002 stretch task, the user first placed `label="web server 1"` *after* the `echo` that read `$label`, saw it fail, and self-corrected by moving the assignment above the header. This corrected an implicit misconception (variables being "available anywhere", as in hoisting languages) and produced a stronger rule: **expansion pastes the value at the moment that line runs; a script is executed strictly top to bottom.**

Evidence: user reported the bug and their own fix, unprompted. Implications: they can be trusted with multi-step scripts where initialisation order matters (config at top, `readonly`, guards before body). Watch for the same ordering intuition in future contexts: functions defined before `main` calls, guards before the body — the natural next lesson can build on "top to bottom" explicitly.
