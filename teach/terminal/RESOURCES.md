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
  Best-in-class beginner-to-intermediate shell book, POSIX-aware. Use for: structured reading on coreutils, processes, networking, shell scripting.
- **_Practical Vim_ (2nd ed.) — Drew Neil** — https://pragprog.com/titles/dnvim2/practical-vim-second-edition/
  The canonical vim-as-language text. Tips 12–14 alone rewire how you think about editing. Use for: vim editing fluency.
- **_tmux 2: Productive Mouse-Free Development_ — Brian Hogan** — https://pragprog.com/titles/bhtmux2/tmux-2/
  Pragmatic, project-driven tmux guide. Use for: tmux mastery beyond the man page.

## Knowledge — focused references

- **"Editing as a language" — Drew Neil (vimcasts)** — http://vimcasts.org/episodes/the-edit/
  Short essay introducing the operator + motion grammar. Use for: mental model before Lesson 0001.
- **POSIX Shell Command Language spec** — https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html
  The actual standard. Use for: deciding what is portable bash vs a GNU-ism.
- **_Learn Vimscript the Hard Way_ — Steve Losh** — https://learnvimscriptthehardway.stevelosh.com/
  For later: scripting vim. Out of scope until fundamentals are locked.

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
