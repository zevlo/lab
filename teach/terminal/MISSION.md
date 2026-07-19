# Mission: Bash + vim + tmux fluency for DevOps

## Why
Move from comfortable dabbler to fluent operator on a bare bash + vim + tmux + ghostty stack, so I can triage incidents, edit remote configs, and run multi-host work without reaching for the mouse or installing plugins. The terminal is my primary DevOps tool — its mastery compounds into every other skill.

## Success looks like
- Edit remote configs at speed using vim's grammar (operators + motions + text-objects); no arrow keys.
- Compose POSIX pipelines reflexively for log triage: `tail -F | grep | cut | sort | uniq -c`.
- Drive tmux copy-mode, splits, and `synchronize-panes` from muscle memory for parallel multi-host ops.
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

## Out of scope (for now)
- zsh, fish, neovim, helix, emacs.
- vim plugins, tmux plugin managers (TPM), oh-my-* or starship prompts.
- Container/k8s CLI depth (kubectl, helm, docker-compose) — revisit once fundamentals are locked.
- IDEs and GUI editors entirely.
