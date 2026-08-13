# Terminal, vim, tmux Resources

High-trust sources only. Knowledge for lessons is drawn from here, not from parametric guesses. Wisdom from the communities listed at the bottom.

## Knowledge — primary (canonical, read these first)

- **Vim's built-in `:help`**
  Open with `:help` (overview) or `:help usr_01.txt` (user manual). The user manual (`usr_*.txt`) is tutorial-style; the reference manual (`:help :s`, `:help operator`, etc.) is the source of truth for every command. Use for: every vim question.
- **`man 1 tmux`** — https://man.openbsd.org/tmux
  Tmux ships an excellent man page covering every command, format string, and option. Use for: every tmux question.
- **`info coreutils`** — https://www.gnu.org/software/coreutils/manual/coreutils.html
  The canonical reference for `ls`, `cp`, `cut`, `sort`, `tee`, `head`, `tail`, `uniq`, etc. Use for: POSIX utility semantics — better than the BSD man pages that ship with macOS.
- **`man bash`** — https://www.gnu.org/software/bash/manual/bash.html
  The bash reference. Use for: shell builtins, parameter expansion, redirection, job control, POSIX mode.
- **Ghostty documentation** — https://ghostty.org/docs
  Authoritative for ghostty: terminfo, clipboard integration, key sequences, OSC. Use for: terminal-side integration with tmux and the system clipboard.

## Knowledge — books

- **_The Linux Command Line_ — William Shotts** (free) — https://linuxcommand.org/tlcl.php
  Best-in-class beginner-to-intermediate shell book, POSIX-aware. Use for: structured reading on coreutils, processes, networking, shell scripting. Ch. 6 (Redirection) is the primary source for Lesson 0007’s filter pipeline.
- **"I/O Redirection" — linuxcommand.org** — https://www.linuxcommand.org/lc3_lts0070.php
  Short companion to Shotts ch. 6: stdout/stdin, `>`, `>>`, pipes, and the common filter list. Use for: quick refresh before pipeline drills.
- **_Practical Vim_ (2nd ed.) — Drew Neil** — https://pragprog.com/titles/dnvim2/practical-vim-second-edition/
  The canonical vim-as-language text. Tips 12–14 alone rewire how you think about editing. Use for: vim editing fluency. Lesson 0027 (motions practice) reuses L0001–0005 only; book is optional depth after drills.
- **_tmux 2: Productive Mouse-Free Development_ — Brian Hogan** — https://pragprog.com/titles/bhtmux2/tmux-2/
  Pragmatic, project-driven tmux guide. Use for: tmux mastery beyond the man page.

## Knowledge — courses / curricula

- **The Missing Semester of Your CS Education (MIT)** — https://missing.csail.mit.edu/
  **Curriculum spine (from L0015).** User-recommended MIT IAP course. 2026 lecture order drives shell/tooling lessons. Notes are default lesson sources; still defer to `man` / Shotts / `:help` for exact semantics. Skip “consider installing” fancy CLIs while constraints say defaults/POSIX-only.
- **Introduction to the Shell (2026)** — https://missing.csail.mit.edu/2026/course-shell/
  Lecture 1 notes + exercises. Use for: shell vs terminal, navigation, PATH, core tools intro, redirects/pipes, light bash. Lesson 0015 = nav/PATH/`man`; Lesson 0016 = pipes + core filters; Lesson 0017 = `find` / light `sed` / `awk`; Lesson 0018 = light bash scripting (`if`/`for`/shebang/`set -euo pipefail`). Lesson 0020 = full MS lecture 1 exercises workbook (no new Knowledge; includes MS `jq` exercise as a one-off exception).
- **Command-line Environment (2026)** — https://missing.csail.mit.edu/2026/command-line-environment/
  Lecture 2. Lesson 0019 = Signals & job control (`Ctrl-C`/`Z`, `fg`/`bg`/`jobs`, `SIGHUP`/`nohup`). Lesson 0021 = Arguments & globs (`$0`/`$@`/`$#`, flags, `*`/`?`/`{}`, shell expands before exec). Lesson 0022 = Environment variables & `export` (shell-local vs env, one-shot `VAR=cmd`, `printenv`/`unset`). Lesson 0023 = Return codes (`$?`, `&&`/`||`). Lesson 0024 = SSH / remote machines (connect, keys, `scp`/`rsync`, `~/.ssh/config`). Lesson 0025 = Aliases & dotfiles (`alias`/`unalias`, bashrc, PATH append). Skip fancy “consider installing” tools while defaults-only holds. Tmux hierarchy already covered in L0006–0013 — do not re-teach from CLE’s multiplexer section. CLE AI / Terminal Emulator sections out of scope (Ghostty already chosen).
- **Development Environment and Tools (2026)** — https://missing.csail.mit.edu/2026/development-environment/
  Lecture 3. Lesson 0026 = terminal workflow vs IDE map + vim compose retrieval (MS fizzbuzz). Lesson 0028 = language servers (LSP concept) + CLI checkers (`py_compile`, `gofmt`/`go vet`, `mypy` one-off install). Lesson 0029 = AI form factors (autocomplete / inline chat / agents) mapped to the user’s real surfaces (Zed IDE, opencode terminal agent, vim no-AI floor); gates AI output with L0028 checkers. Lesson 0030 = dev containers (image/container/dev container; `docker` CLI core; `devcontainer.json` as editor-agnostic, versioned config; L0028 checkers baked into the image). Skip vim plugins, Caps Lock remaps, and IDE extension shopping while defaults-only / no-IDE mission holds. Prior vim floor: L0001–0005; practice workbook L0027.
- **Debugging and Profiling (2026)** — https://missing.csail.mit.edu/2026/debugging-profiling/
  Lecture 4. Sliced like Lectures 1–3. Lesson 0031 = debugging fundamentals (the golden rule; printf vs logging + severity levels; third-party logs `-v`/`journalctl`; the debugger concept; `pdb` core + `gdb` named; the reproduce→isolate→inspect→fix→gate loop; bug class = L0028 checkers pass and the program is still wrong, a logic bug). Later slices: `rr` (record-replay, reverse debugging, Linux-only); `strace`/`dtruss`/`bpftrace` (syscall tracing); `tcpdump`/Wireshark (network debugging, relates to L0010 `dig`/`ss`); ASan/TSan/MSan/UBSan + Valgrind (memory debugging, mostly C/C++/Rust); AI-for-debugging; the Profiling half (`time` real/user/sys, `htop`, `perf` + flame graphs, callgrind/massif, `hyperfine`). `pdb` is the hands-on debugger (Python is the primary track); `gdb` named for compiled-language remotes.

## Knowledge — focused references

- **"Editing as a language" — Drew Neil (vimcasts)** — http://vimcasts.org/episodes/the-edit/
  Short essay introducing the operator + motion grammar. Use for: mental model before Lesson 0001.
- **POSIX Shell Command Language spec** — https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html
  The actual standard. Use for: deciding what is portable bash vs a GNU-ism.
- **_Learn Vimscript the Hard Way_ — Steve Losh** — https://learnvimscriptthehardway.stevelosh.com/
  For later: scripting vim. Out of scope until fundamentals are locked.
- **`man 1 dig`** / BIND dig
  DNS lookup utility. Use for: A/AAAA/MX, `+short`, `@server`, reading `status:` in full output. Lesson 0010.
- **`man 8 ss`** — https://manpages.debian.org/bookworm/iproute2/ss.8.en.html
  Linux socket statistics (iproute2). Use for: `ss -tlnp` listening TCP + process. Not on macOS — remote only.

- **Development Containers spec** — https://containers.dev/
  Editor-agnostic `devcontainer.json` reference (read by VS Code, Cursor, Codespaces, JetBrains, and the `devcontainer` CLI). Use for: the dev-container config shape (build, mounts, forwardPorts, postCreateCommand). Lesson 0030. Container build depth (multi-stage, registries, CI) is MS Packaging and Shipping Code, not this slice.
- **Docker CLI reference** — https://docs.docker.com/reference/cli/docker/
  Official `docker` verb/flag reference (`build`, `run`, `exec`, `ps`, `stop`/`rm`, `rmi`, `logs`; `-it`, `--rm`, `-v`, `-w`, `-p`). Use for: exact flag semantics. On macOS the daemon runs via Docker Desktop or `colima`; commands are identical to Linux. Lesson 0030.
- **`pdb` — Python debugger** — https://docs.python.org/3/library/pdb.html
  Python’s language-specific debugger. Use for: breakpoints, step/next, inspect values, backtrace (`b`/`c`/`n`/`s`/`p`/`l`/`w`/`q`; `breakpoint()` inline since 3.7). Lesson 0031. `gdb` (https://www.gnu.org/software/gdb/) is the de-facto standard for C/C++/Rust — command shapes mirror `pdb`; named, not the hands-on debugger under this mission.

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
