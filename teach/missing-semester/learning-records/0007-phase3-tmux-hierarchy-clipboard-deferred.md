# Phase 3 starts: L0006 tmux hierarchy; clipboard depth deferred

User asked for Lesson 0006 via the teach skill and said to ignore the local Ghostty/tmux clipboard investigation for now. L0006 opens Phase 3 on the mission-critical hierarchy only: session → window → pane, detach/attach, and the pareto default keys.

Pedagogical decisions locked for L0006:
- **Pareto in:** `tmux new -s`, `tmux ls`, `tmux attach -t`, `C-b d/c/n/p/0-9/%/"/o/arrows/z/x/?`.
- **Pareto out:** copy-mode, paste buffer, synchronize-panes, layouts, rename, kill-session — listed in the reference "Beyond the pareto" only.
- **Defaults-first:** teach stock window index `0`; call out local `base-index 1` as a local-only footgun for SSH remotes.
- **No forward-loaded copy-mode** despite L0005's OSC 52 teaser — user explicitly parked clipboard work.

Implications for L0007 (from ask-the-teacher): copy-mode on stock defaults, multi-session habits, or synchronize-panes — pick from drill feedback.
