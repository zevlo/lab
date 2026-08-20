# L0037 complete 4/4; visualizing-performance floor set

User finished Lesson 0037 quiz 4/4. No friction reported on tidy CSV/JSON as a plottable series, gnuplot `using 1:2 with lines` + headless `dumb`/`png`, doubling-array spikes vs a cheap mean, periodic latency vs a “fine” average, or matplotlib faceting (one endpoint sick, pooled mean nowhere).

**Implications:** a mean is now a known non-proof of “looks fine.” L0031 tidy logs pay off: `timestamp,value` is already a graph; a prose sentence is not. Split by category before averaging. ggplot2 stays named (R, not the track). `gnuplot-nox` / matplotlib live in the Linux box, not on the Mac.

**Next when requested (now taken):** user said ready without picking; took lecture order — L0038 CPU profilers (sampling `perf stat`/`perf record -g` + flame graphs vs tracing Valgrind `callgrind`). Remaining Profiling slices: massif, `hyperfine` — or more vim practice, or L0020 workbook re-run.
