# L0032 complete 4/4; system-call tracing floor set

User finished Lesson 0032 quiz 4/4. No friction reported on the program↔kernel boundary concept, the five strace shapes, the triage patterns (silent failure → `-e trace=file`; spawner → `-f`; live service → `pgrep` + `-p` attach; hang → `-T`), or trace reading (`execve` first, `write(1, …)`, `= -1 ENOENT`, `exit_group` ↔ `$?`).

**Implications:** the observation-point move landed — L0031's `pdb` watches inside a program you can edit; strace watches any program from the boundary. The five-shapes table is the new floor; `= -1 ENOENT` as the smoking gun ties traces back to L0023's nonzero `$?`. The L0030 container-as-disposable-Linux-box drill worked (`docker run` + `exec` second shell); `dtruss` stays named-only (sudo + SIP). Do not re-teach unless retrieval decay shows.

**Next when requested:** tcpdump, ASan/Valgrind, rr, AI-for-debugging, or the Profiling half (`time`/`htop`/`perf`/`hyperfine`) — or more vim practice, or L0020 workbook re-run.
