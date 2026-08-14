# Mission: Bash + vim + tmux fluency for DevOps

## Why
Move from comfortable dabbler to fluent operator on a bare bash + vim + tmux + ghostty stack, so I can triage incidents, edit remote configs, and run multi-host work without reaching for the mouse or installing plugins. The terminal is my primary DevOps tool — its mastery compounds into every other skill.

## Curriculum path
Follow **[MIT Missing Semester (2026)](https://missing.csail.mit.edu/)** lecture order as the spine for shell/tooling lessons. Primary lecture notes are the default lesson sources; `man` / `info` / `:help` remain the sources of truth for exact flag semantics. Stay POSIX-lean and defaults-only — skip Missing Semester “consider installing …” fancy replacements (eza, fd, ripgrep, zoxide, etc.) unless a later decision changes constraints.

**Next up:** L0032 in flight — MS lecture 4, second slice: system-call tracing (`strace` five shapes; trace reading — `execve` first, `write(1, …)`, `= -1 ENOENT`, `exit_group` ↔ `$?`; triage patterns incl. `-p` attach; container/SSH-Linux drill; `dtruss` named only). L0031 done (debugging fundamentals). Remaining Lecture-4 slices: tcpdump, ASan/Valgrind, rr, AI-for-debugging, and the Profiling half (`time`/`htop`/`perf`/`hyperfine`). Next when requested: another Lecture-4 slice, more vim practice, or L0020 workbook re-run.

## Success looks like
- Navigate the filesystem and explain cwd / PATH / absolute vs relative paths without hesitation.
- Compose POSIX pipelines reflexively for log triage: `tail -F | grep | cut | sort | uniq -c`.
- Edit remote configs at speed using vim's grammar (operators + motions + text-objects); no arrow keys.
- Drive tmux copy-mode, splits, `synchronize-panes`, and named sessions from muscle memory.
- Survive an SSH drop with remote tmux; reattach and the work is intact.
- Debug a service with `curl -i`, `dig`, `ss -tlnp`, `pgrep`/`kill` by reflex.
- Read `man`, `:help`, and `info` as primary references instead of searching blogs.

## Constraints
- Shell: **bash**, POSIX-lean (no zsh-isms; default macOS shell was switched on purpose).
- Keybinds: **default everywhere** — no vim/tmux remaps, no plugin managers.
- Plugins: **none**. `:help`, `man`, and `info` are the canonical docs.
- Environment: ghostty 1.3.1 (Gruvbox Dark), tmux 3.7b, vim 9.1, macOS.
- Work pattern: roughly half local, half remote over SSH.
- Cadence: a few sessions per week, 30–45 min each.
- Pedagogy: Missing Semester lecture notes set the spine and tone. Slice dense topics into workable lessons; drills and cold rebuilds are fine — do not narrate “pareto,” “reps,” or other teaching-meta in lesson copy.

## Out of scope (for now)
- zsh, fish, neovim, helix, emacs.
- vim plugins, tmux plugin managers (TPM), oh-my-* or starship prompts.
- Missing Semester–suggested alternate CLIs (eza, bat, fd, ripgrep, zoxide, jq-deep) — revisit later if desired; defaults/POSIX stay primary.
- Container/k8s CLI depth (kubectl, helm, docker-compose) — revisit once fundamentals are locked.
- IDEs and GUI editors entirely.
- PowerShell / cmd.exe (use bash on Mac / Linux remotes).
