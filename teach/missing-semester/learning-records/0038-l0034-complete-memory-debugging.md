# L0034 complete 4/4; memory-debugging floor set

User finished Lesson 0034 quiz 4/4. No friction reported on the three memory-bug classes (overflow / use-after-free / leak), the recompile-vs-not decision (ASan vs Valgrind), reading an ASan report as three connected stacks (access ← freed by ← allocated by), or the leak verdicts (`definitely lost` / `still reachable`).

**Implications:** the “appears to work” class is now a floor — exit 0 on a plain `uaf` is not evidence of correctness (undefined behavior; L0023 callback). ASan first-error abort vs Valgrind tally-and-continue is the style contrast; LeakSanitizer-at-exit vs `valgrind --leak-check=full` on the plain binary is the no-recompile point. The intra-object overflow ASan can’t see (`corruption.c` / wrong slot inside a valid object) stayed a named gotcha, not a drill. `rr` and `bpftrace` stay named-only (VM counters; kernel-wide/root).

**Next when requested (now taken):** user said ready without picking; took lecture order — L0035 AI-for-debugging (MS’s next section after Memory Debugging; consumes ASan/strace/compiler output; distinct from L0029 form factors). Remaining Lecture-4 slice after L0035: the Profiling half (`time` real/user/sys, `htop`/`free`/`lsof`, `perf`/callgrind, massif, `hyperfine`) — or more vim practice, or L0020 workbook re-run.
