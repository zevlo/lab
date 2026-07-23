# L0011 quiz 4/4 but Mac copy-mode yank broken in practice

User scored 4/4 on Lesson 0011 but cannot get copy-mode / paste buffer working in Ghostty or Terminal.app on Mac.

**Likely root cause (environment, not lesson theory):** stock macOS terminals do not send Option as Meta/Alt. Emacs copy-mode yank is `M-w` (taught as Option-w); without `macos-option-as-alt` (Ghostty) or “Use Option as Meta key” (Terminal.app), Option-w inserts a character instead of yanking. Secondary footgun: macOS often steals `C-Space` for input-source switching, blocking begin-selection.

**Workarounds that need no config:** mouse drag in copy-mode (user has `set -g mouse on` — drag end runs `copy-pipe-and-cancel`); or `C-Space` (if free) + `C-w` (also bound to copy, no Meta).

**Implications:** Update L0011 / copy-mode reference with Mac Meta + C-Space gotchas. Prefer documenting `C-w` as Meta-free yank. Ghostty `macos-option-as-alt = left` is the durable fix if user wants Option-w muscle memory.
