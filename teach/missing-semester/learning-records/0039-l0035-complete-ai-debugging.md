# L0035 complete 4/4; AI-for-debugging floor set

User finished Lesson 0035 quiz 4/4. No friction reported on the four shine areas (cryptic errors / language-FFI boundaries / symptom↔cause / crash dumps), the L0029 distinction (authoring form factors vs reading tool output), pasting the artifact rather than a paraphrase, the always-verify gate, or `-g` / frame pointers as why a native stack is pasteable.

**Implications:** an LLM explanation is now a known draft, not a verdict — same gate as L0028/L0029. A fluent “fix” can still be a mask (delete `free` on `uaf.c` → leak). Debug symbols are a profiling habit too (`-fno-omit-frame-pointer`). The Lecture-4 debugging half is complete (fundamentals → strace → tcpdump → ASan/Valgrind → AI-as-reader).

**Next when requested (now taken):** user said ready without picking; took lecture order — L0036 timing + resource monitoring (`time` real/user/sys, `htop`/`free`/`lsof`, `ss` retrieval, MS `taskset`/`stress` exercise). Remaining Profiling slices after L0036: visualizing performance data, CPU profilers (`perf` + flame graphs, callgrind), massif, `hyperfine` — or more vim practice, or L0020 workbook re-run.
