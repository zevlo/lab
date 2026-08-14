# L0031 complete 4/4; debugging fundamentals floor set

User finished Lesson 0031 quiz 4/4 (flawless). No friction reported on the golden rule, the printf-vs-logging split, third-party logs (`-v`/`--verbose`, `journalctl -u`), the `pdb` launch paths + core commands, or the reproduce→isolate→inspect→fix→gate loop.

**Implications:** the logic-bug framing (L0028 checkers pass → program still wrong) is the hinge and it landed. `pdb` core (`b`/`c`/`n`/`s`/`p`/`q`) + `breakpoint()` is the new floor; `gdb` named only. Tidy-logs-as-future-dataset point set up the Profiling half. Do not re-teach unless retrieval decay shows.

**Next when requested:** next Lecture-4 slice — system-call tracing (`strace`/`dtruss`), network debugging (`tcpdump`), or the Profiling half (`time`/`htop`/`perf`) — or more vim practice, or another L0020 workbook pass.
