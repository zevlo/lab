# Lesson 0005 complete — one run, many targets (quiz 4/4)

2026-09-21. Completed lesson 0005 with a perfect quiz score (4/4), including the spaced-retrieval question revisiting word splitting from lesson 0002.

Evidence in their own scripts, both ShellCheck clean (commit d62e788):

- `tmp/diskcheck.sh` — single target became `for target in "$@"`; the lesson-0004 existence guard moved inside the loop; `exit 1` became `continue`; usage message updated to advertise multiple paths.
- `tmp/peek.sh` — same upgrade applied unprompted: loop over `"$@"`, per-file `-f` guard, `continue` past missing files.

Implications: the loop pattern — body once, guard per item, `continue` on the bad ones — is stored, not copied. The open thread is failure honesty: a loop that skips bad items still exits 0 (their `diskcheck.sh` run ends with the last `df`'s status). That is the standing motivation for a future fail-loudly lesson (`set -e`, failure tracking). Next: lesson 0006 — command substitution `$(...)` and any command as an `if` condition; loops just ran commands, 0006 teaches the script to listen to them.
