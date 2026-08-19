# L0036 complete 4/4; timing + resource-monitoring floor set

User finished Lesson 0036 quiz 4/4. No friction reported on `time`’s three numbers (real / user / sys), the curl gap as network wait, the four-tool map (`htop` / `free -h` / `lsof` / `ss -tlnp`), available-vs-free, or `taskset --cpu-list 0 stress -c 2` (N workers ≠ N CPUs).

**Implications:** functionally correct is now a known non-proof of “fast enough.” Wall-clock alone misleads; user+sys is CPU, the rest of real is waiting. Name the scarce resource before optimizing. `h` in htop is help, not threads (`H`). `top` / `btop` / `iotop` / `nethogs` / `iftop` stay named-only.

**Next when requested (now taken):** user said ready without picking; took lecture order — L0037 visualizing performance data (tidy CSV logs from L0031, MS gnuplot one-liner, matplotlib facets; ggplot2 named). Remaining Profiling slices: CPU profilers (`perf` + flame graphs, callgrind), massif, `hyperfine` — or more vim practice, or L0020 workbook re-run.
