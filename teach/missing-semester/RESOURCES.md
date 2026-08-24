# Terminal, vim, tmux Resources

High-trust sources only. Knowledge for lessons is drawn from here, not from parametric guesses. Wisdom from the communities listed at the bottom.

## Knowledge — primary (canonical, read these first)

- **Vim's built-in `:help`**
  Open with `:help` (overview) or `:help usr_01.txt` (user manual). The user manual (`usr_*.txt`) is tutorial-style; the reference manual (`:help :s`, `:help operator`, etc.) is the source of truth for every command. Use for: every vim question. Canonical lesson: 0001. Pocket card: `reference/vim.html`.
- **`man 1 tmux`** — https://man.openbsd.org/tmux
  Tmux ships an excellent man page covering every command, format string, and option. Use for: every tmux question. Canonical lesson: 0006. Pocket card: `reference/tmux.html`.
- **`info coreutils`** — https://www.gnu.org/software/coreutils/manual/coreutils.html
  The canonical reference for `ls`, `cp`, `cut`, `sort`, `tee`, `head`, `tail`, `uniq`, etc. Use for: POSIX utility semantics — better than the BSD man pages that ship with macOS.
- **`man bash`** — https://www.gnu.org/software/bash/manual/bash.html
  The bash reference. Use for: shell builtins, parameter expansion, redirection, job control, POSIX mode.
- **Ghostty documentation** — https://ghostty.org/docs
  Authoritative for ghostty: terminfo, clipboard integration, key sequences, OSC. Use for: terminal-side integration with tmux and the system clipboard.

## Knowledge — books

- **_The Linux Command Line_ — William Shotts** (free) — https://linuxcommand.org/tlcl.php
  Best-in-class beginner-to-intermediate shell book, POSIX-aware. Use for: structured reading on coreutils, processes, networking, shell scripting. Ch. 6 (Redirection) backs the compose half of Lesson 0015.
- **"I/O Redirection" — linuxcommand.org** — https://www.linuxcommand.org/lc3_lts0070.php
  Short companion to Shotts ch. 6: stdout/stdin, `>`, `>>`, pipes, and the common filter list. Use for: quick refresh before pipeline drills.
- **_Practical Vim_ (2nd ed.) — Drew Neil** — https://pragprog.com/titles/dnvim2/practical-vim-second-edition/
  The canonical vim-as-language text. Tips 12–14 alone rewire how you think about editing. Use for: vim editing fluency. Lesson 0001 is the vim floor; older slices 0002–0005, 0027 are retrieval. Book is optional depth after drills.
- **_tmux 2: Productive Mouse-Free Development_ — Brian Hogan** — https://pragprog.com/titles/bhtmux2/tmux-2/
  Pragmatic, project-driven tmux guide. Use for: tmux mastery beyond the man page.

## Knowledge — courses / curricula

- **The Missing Semester of Your CS Education (MIT)** — https://missing.csail.mit.edu/
  **Curriculum spine (from L0015).** User-recommended MIT IAP course. 2026 lecture order drives shell/tooling lessons. Notes are default lesson sources; still defer to `man` / Shotts / `:help` for exact semantics. Skip “consider installing” fancy CLIs while constraints say defaults/POSIX-only.
- **Introduction to the Shell (2026)** — https://missing.csail.mit.edu/2026/course-shell/
  Lecture 1 notes + exercises. Canonical: **Lesson 0015** (nav/PATH, pipes + filters, `find`/`sed`/`awk`, light bash, MS exercises including `jq` as a one-off). Pocket card: `reference/shell.html`. Older slices 0016–0018, 0020 (and pre-MS 0007, 0009, 0014) are retrieval only.
- **Command-line Environment (2026)** — https://missing.csail.mit.edu/2026/command-line-environment/
  Lecture 2. Canonical: **Lesson 0019** (argv/globs, streams, env/`export`, return codes, signals/jobs, `pgrep`/`curl`/`kill`) and **Lesson 0024** (SSH, keys, `scp`/`rsync`, `~/.ssh/config`, aliases/dotfiles). Pocket cards: `reference/shell-cli.html`, `reference/shell-home.html`. Skip fancy “consider installing” tools while defaults-only holds. Tmux is **Lesson 0006** — do not re-teach from CLE’s multiplexer section. CLE AI / Terminal Emulator sections out of scope (Ghostty already chosen). Older slices 0021–0023, 0025, 0008 are retrieval only.
- **Development Environment and Tools (2026)** — https://missing.csail.mit.edu/2026/development-environment/
  Lecture 3. Canonical: **Lesson 0026** (terminal vs IDE map, LSP + CLI checkers, AI form factors, dev containers) and **Lesson 0001** (vim grammar floor). Pocket cards: `reference/devenv.html`, `reference/vim.html`. Skip vim plugins, Caps Lock remaps, and IDE extension shopping while defaults-only / no-IDE mission holds. Older slices 0028–0030, 0002–0005, 0027 are retrieval only.
- **Debugging and Profiling (2026)** — https://missing.csail.mit.edu/2026/debugging-profiling/
  Lecture 4. Canonical: **Lesson 0031** (debugging: printf/`pdb`, dig/`ss`/`lsof`, strace, tcpdump, ASan/Valgrind, AI-for-debug) and **Lesson 0036** (profiling: `time`/`htop`, tidy plots, `perf` + flame graphs + callgrind). Pocket cards: `reference/debug.html`, `reference/profiling.html`. Massif / `hyperfine` named only (L0039 withdrawn — massif is not in the exercise set). `rr` named (no PMU in Docker-on-Mac). Older slices 0032–0035, 0037–0038, 0010 are retrieval only.
- **Version Control and Git (2026)** — https://missing.csail.mit.edu/2026/version-control/
  Lecture 5. Lesson 0040 = the whole lecture: data model (blob / tree / commit DAG / objects / refs / HEAD), staging area, command map, and the nine MS exercises (class-site clone/blame, history rewrite on `/tmp` only, stash, alias, gitignore, merge conflict; Learn Git Branching optional; class-site PR only if useful). Git ≠ GitHub.
- **Packaging and Shipping Code (2026)** — https://missing.csail.mit.edu/2026/shipping-code/
  Lecture 6. Lesson 0041 = the whole lecture: environments (`venv`), artifacts (`pyproject.toml` / wheels), SemVer + lockfiles, VMs vs containers, runtime config, Compose, publishing named (TestPyPI / ghcr / Pages). Floor is `venv` + `pip` (`uv` named, not required). Compose at MS-exercise depth; Kubernetes named. Pocket card: `reference/shipping-code.html`.

## Knowledge — focused references

- **"Editing as a language" — Drew Neil (vimcasts)** — http://vimcasts.org/episodes/the-edit/
  Short essay introducing the operator + motion grammar. Use for: mental model before Lesson 0001.
- **POSIX Shell Command Language spec** — https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html
  The actual standard. Use for: deciding what is portable bash vs a GNU-ism.
- **_Learn Vimscript the Hard Way_ — Steve Losh** — https://learnvimscriptthehardway.stevelosh.com/
  For later: scripting vim. Out of scope until fundamentals are locked.
- **`man 1 dig`** / BIND dig
  DNS lookup utility. Use for: A/AAAA/MX, `+short`, `@server`, reading `status:` in full output. Lesson 0031 (older slice 0010).
- **`man 8 ss`** — https://manpages.debian.org/bookworm/iproute2/ss.8.en.html
  Linux socket statistics (iproute2). Use for: `ss -tlnp` listening TCP + process. Not on macOS — remote only. Lesson 0031; Mac listen sockets = `lsof -nP -iTCP -sTCP:LISTEN`.
- **Development Containers spec** — https://containers.dev/
  Editor-agnostic `devcontainer.json` reference (read by VS Code, Cursor, Codespaces, JetBrains, and the `devcontainer` CLI). Use for: the dev-container config shape (build, mounts, forwardPorts, postCreateCommand). Lesson 0026. Image build, Compose, registries: Lesson 0041.
- **Docker CLI reference** — https://docs.docker.com/reference/cli/docker/
  Official `docker` verb/flag reference (`build`, `run`, `exec`, `ps`, `stop`/`rm`, `rmi`, `logs`; `-it`, `--rm`, `-v`, `-w`, `-p`). Use for: exact flag semantics. On macOS the daemon runs via Docker Desktop or `colima`; commands are identical to Linux. Lessons 0026 / 0041. Compose: https://docs.docker.com/compose/ — Lesson 0041.
- **`pdb` — Python debugger** — https://docs.python.org/3/library/pdb.html
  Python’s language-specific debugger. Use for: breakpoints, step/next, inspect values, backtrace (`b`/`c`/`n`/`s`/`p`/`l`/`w`/`q`; `breakpoint()` inline since 3.7). Lesson 0031. `gdb` (https://www.gnu.org/software/gdb/) is the de-facto standard for C/C++/Rust — command shapes mirror `pdb`; named, not the hands-on debugger under this mission.
- **`tcpdump(1)` / `pcap-filter(7)`** — https://www.man7.org/linux/man-pages/man1/tcpdump.1.html
  Packet capture CLI (libpcap). Use for: `-i any`/`-n`/`-c`/`-w`/`-r`/`-A`; filter primitives (`host`/`port`/`src`/`dst` + and/or/not); TCP output format (`Flags [S.]`, relative seqs); the two MS invocations. Ships on macOS too (`lo0`/`en0`). Lesson 0031. Wireshark (https://www.wireshark.org/) opens the same `.pcap` — named, not on the terminal stack.
- **AddressSanitizer (sanitizers wiki)** — https://github.com/google/sanitizers/wiki/AddressSanitizer
  Canonical ASan reference. Use for: error kinds (heap-use-after-free, stack/heap/global overflow, leak), report anatomy (access ← freed by ← allocated by), redzones/quarantine. Invoke with `gcc -fsanitize=address -g`; family: TSan/MSan/UBSan one flag each. Compiles on macOS clang too. Lesson 0031.
- **Valgrind quick start** — https://valgrind.org/docs/manual/quick-start.html
  Memcheck on an existing binary, no recompilation: `valgrind --leak-check=full ./prog`; leak verdicts (definitely lost / indirectly lost / possibly lost / still reachable); `Invalid write … that was freed` for use-after-free. Linux-only (unusable on modern macOS). callgrind → Lesson 0036; massif named only. Lesson 0031.
- **rr — record and replay** — https://rr-project.org/
  Deterministic record/replay with reverse debugging (`rr record`, `rr replay`, `reverse-continue` in gdb). Linux-only, needs hardware performance counters — fails in most VMs (incl. Docker-on-Mac). Named, not drilled. Lesson 0031.
- **AI for debugging (MS lecture 4)** — https://missing.csail.mit.edu/2026/debugging-profiling/
  LLM as a debugging aid, distinct from lecture 3 form factors. Use for: four shine areas (cryptic errors, language/FFI boundaries, symptom↔cause, crash dumps/stacks); limitations (hallucinate, mask, always verify); debug symbols (`-g`, DWARF, `-fno-omit-frame-pointer`). Lesson 0031.
- **bash `time` keyword** — `help time` (also bash manual, Pipelines). Reports real / user / sys for a pipeline. Distinct from `/usr/bin/time`. Lesson 0036.
- **`htop(1)`** — https://man7.org/linux/man-pages/man1/htop.1.html
  Interactive process viewer. Use for: `P`/`M` sort, `t` tree, `H` hide user threads, `q` quit; `l` opens `lsof` for the selected process. Lesson 0036. `top` is the default that ships (different keys).
- **`free(1)`** — https://man7.org/linux/man-pages/man1/free.1.html
  procps-ng memory summary from `/proc/meminfo`. Use for: `free -h`; **available** (new apps without swapping) vs **free** (currently unused). Linux-only. Lesson 0036.
- **`lsof`** — list open files. Use for: which process holds a file (`lsof FILE`); what a PID has open (`lsof -p PID`); Mac listen-sockets (`lsof -nP -iTCP -sTCP:LISTEN`). Lessons 0031 / 0036.
- **`taskset(1)`** — https://man7.org/linux/man-pages/man1/taskset.1.html
  Set/retrieve CPU affinity (`taskset --cpu-list 0 command`). Linux-only (util-linux). Lesson 0036.
- **gnuplot** — http://www.gnuplot.info/ (in-program `help plot`). Use for: CLI plots from tidy CSV (`set datafile separator ','`; `plot 'f.csv' using 1:2 with lines`); headless terminals `dumb` (ASCII) and `png` + `set output`. Debian package `gnuplot-nox` (no X11). Lesson 0036.
- **matplotlib** — https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.subplots.html
  Python plotting. Use for: iterative slice / facets (`pyplot.subplots`, `Figure.savefig`); Agg backend writes a PNG with no display. Lesson 0036. ggplot2 (https://ggplot2.tidyverse.org/) is the R equivalent — named, not drilled.
- **`perf-stat(1)` / `perf-record(1)`** — https://man7.org/linux/man-pages/man1/perf-stat.1.html
  Linux sampling profiler. Use for: `perf stat` (task-clock vs hardware `cycles`); `perf record -g` (call-graph; default unwind `fp`); `perf report` / `perf script`. Software event `cpu-clock` when the PMU is missing (Docker-on-Mac / most VMs). Debian package `linux-perf`. Lesson 0036.
- **Flame graphs** — https://www.brendangregg.com/flamegraphs.html (scripts: https://github.com/brendangregg/FlameGraph)
  Visualization of sampled stacks: y = depth, width ∝ samples, x is **not** a timeline. Pipeline: `perf script | stackcollapse-perf.pl | flamegraph.pl > flame.svg`. Lesson 0036. Speedscope / Perfetto named as viewers.
- **Valgrind Callgrind** — https://valgrind.org/docs/manual/cl-manual.html
  Tracing CPU profiler: `valgrind --tool=callgrind ./prog`; `callgrind_annotate` (self vs `--inclusive=yes`). Exact call counts; much slower than sampling. kcachegrind is the GUI — named. Lesson 0036.
- **Valgrind Massif** — https://valgrind.org/docs/manual/ms-manual.html
  Heap profiler: `valgrind --tool=massif ./prog`; `ms_print massif.out.<pid>`. Named only (L0039 withdrawn — not an MS exercise). Python `memory-profiler` named (MS).
- **Git documentation** — https://git-scm.com/docs (`git help <cmd>`)
  Canonical CLI reference. Use for: exact flag semantics after the data model is in place. Lesson 0040.
- **Pro Git** — https://git-scm.com/book/en/v2
  MS-recommended. Chapters 1–5 after the data model. Lesson 0040.
- **Learn Git Branching** — https://learngitbranching.js.org
  Browser DAG game. MS exercise 1; optional if you already commit daily. Lesson 0040.
- **`venv`** — https://docs.python.org/3/library/venv.html
  Stdlib virtual environments. Use for: `python3 -m venv`, activate/PATH, `deactivate` as a function. Lesson 0041.
- **Writing pyproject.toml / PEP 621** — https://packaging.python.org/en/latest/guides/writing-pyproject-toml/
  Project metadata and build backend. Use for: `[project]`, `[project.scripts]`, `[build-system]`. Lesson 0041.
- **Semantic Versioning** — https://semver.org
  `MAJOR.MINOR.PATCH` contract. Use for: what a bump promises; `0.x` may break on minor. Lesson 0041.
- **Dockerfile reference** — https://docs.docker.com/reference/dockerfile/
  Instruction semantics (`FROM`, `RUN`, `COPY`, `WORKDIR`, `CMD`, `ENV`). Lesson 0041. Multi-stage / non-root named, not drilled.

## Wisdom (communities)

- **`#vim` on Libera Chat** — https://libera.chat/
  Long-running vim IRC channel; high signal, experts present. Use for: real questions on vim idioms.
- **r/vim** — https://reddit.com/r/vim
  Vim culture and tips. Use for: spotting common patterns and pitfalls.
- **r/tmux** — https://reddit.com/r/tmux
  Smaller, focused community. Use for: tmux config patterns and `synchronize-panes` recipes.
- **r/sre and r/devops** — https://reddit.com/r/sre
  Use for: real-world incident patterns and DevOps tool workflows.

## Gaps
_None yet._ Will surface explicitly if a mission-relevant area has no trusted resource.
