# Teaching notes

## User stance (established at workspace init)
- **Comfortable dabbler**: uses the shell daily, can edit in vim, but slow and reliant on the mouse/plugins. Targeted gaps: vim grammar, text objects, tmux scripting, remote tmux patterns, POSIX-correct pipelines.
- Opinionated about defaults, POSIX, and fundamentals. No plugins, no remaps, no fancy prompts.
- Shell: **bash** (intentionally switched from default zsh on macOS).
- Terminal: **ghostty 1.3.1** (Gruvbox Dark). One custom keybind: `shift+enter=text:\x1b\r`.
- Tools installed: vim 9.1, tmux 3.7b, ghostty 1.3.1.
- Work pattern: roughly half local, half remote SSH.

## Lesson cadence
- A few sessions per week, 30–45 min each.
- Spacing: aim for retrieval prompts across sessions, not just within them.
- Interleave: once Phase 2 (vim) is underway, occasionally mix terminal drills back in.

## Pedagogical decisions
- **Opener = vim grammar** (operator + count + motion/text-object). Biggest single dabbler-unlock; immediate payoff on remote edits.
- **Reference docs built just-in-time** alongside each lesson.
- Quiz format: equal-length answers, immediate JS feedback.
- Primary sources cited per lesson; parametric knowledge never trusted.

## Tools available to teach with
- All file edits in this workspace use Write/Edit (no shell heredocs).
- Lesson HTML can be opened with `open` on macOS.
