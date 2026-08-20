# L0038 complete 4/4; CPU-profilers floor set

User finished Lesson 0038 quiz 4/4. No friction reported on sampling vs tracing, `perf stat` / `perf record -e cpu-clock -g` + flame-graph axes (y = depth, width ∝ samples, x is not a timeline), the Docker-on-Mac PMU gap (`cycles` → `<not supported>`), or callgrind `self` vs inclusive.

**Implications:** `time` is now a known non-proof of “which function.” Production prefers sampling; tracing is for exact counts on a short test. Hardware `perf` events and kcachegrind / Speedscope / Perfetto stay named. `--privileged` was the box tax for `perf_event`, not a Valgrind need.

**Next when requested (now taken):** user said ready without picking; took lecture order — L0039 memory profilers (Valgrind `massif` + `ms_print`; heap over time vs Memcheck’s exit verdict). Remaining Profiling slice: `hyperfine` — or more vim practice, or L0020 workbook re-run.
