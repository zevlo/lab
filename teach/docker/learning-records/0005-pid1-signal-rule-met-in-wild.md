# Met the PID 1 signal rule in the wild

During lesson 0004's CPU lab, `timeout` could not stop the container. Root cause, found by reproduction: busybox `timeout` execs the program as PID 1 and leaves a watcher child that SIGTERMs its parent — and the kernel discards signals PID 1 has not registered a handler for. The container ran forever; only `docker kill` (SIGKILL) ended it. The user met the PID 1 rule through a real failure, not a lecture.

## Evidence
Self-report at session 6 (2026-10-08); dissected same day: `docker exec` into the hung container showed PID 1 = sha256sum, PID 7 = [timeout] zombie; `sh -c 'timeout 3 sleep 100'` (target not PID 1) terminated normally; `time docker stop` on a busybox `sleep` container measured the full 10.16 s grace period before force kill.

## Implications
- Lesson 0004 step 4 rewritten as a single-process `dd` demo (26.6 GB/s vs 2.7 GB/s, exit 0 both) — no signals involved, cannot hang
- Bonus finding: a two-process pipe (`dd | sha256sum`) under `--cpus=0.25` blew past 120 s (far beyond the 4× ideal) — quota throttling punishes producer/consumer ping-pong. Not taught (too deep), but explains why the demo is single-process
- PID 1 rule is now experientially grounded: schedule --init, STOPSIGNAL, stop grace period, and stop-vs-kill deliberately in Module 4 (compose `init:`) and Module 5 (signal handling, hardening)
- Pure kernel semantics — OrbStack and busybox behaved correctly; do not teach it as a bug
