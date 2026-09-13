# Lesson 0003 complete — scripts that take orders (quiz 4/4)

2026-09-12. Completed lesson 0003 with a perfect quiz score (4/4). Applied the lesson directly to their own `tmp/diskcheck.sh`: replaced the hardcoded `target="$HOME/lab"` with `target="$1"`, and added a guard — `if [ $# -eq 0 ]` prints usage to stderr and exits 1 before the body runs.

Evidence: the guard follows the lesson's pattern exactly (usage message to stderr via `>$2`, non-zero exit). The user is now writing defensive, reusable scripts unprompted — argument handling plus early exit is the core habit from this lesson. Next lesson can build on this: loops (`for`/`while`) to process many arguments, or reading command output (`$(...)`), extending the guard-before-body pattern.
