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
- **Audit caveat (after L0002)**: the "baseline vs new tools" speed delta will be smaller than expected because Lesson 0001's grammar is already instinctive — the user reached for `ci"` during the L0002 "baseline" run despite instructions to use old habits. Future audits should either (a) explicitly forbid ALL recently-taught commands in the baseline, or (b) be reframed as "new-skill delta" rather than "total speed delta".
- **Quiz randomization (after L0002)**: shuffle answer order on every page load. Default for all future lessons. Implemented in L0001 and L0002 script blocks.
- **Drill-design principle (after L0003)**: match the tool to the task. Don't force a specific tool when a simpler one exists. Use `cgn` only when the scenario has surgical decisions (some matches in, some out); use `:%s` for bulk; use `r`+`.` for single-char diffs. The user's instinct for "right tool for the job" is reliable — trust and reinforce it. When a lesson teaches tool X but the drill's task is better served by tool Y, surface the alternatives honestly in the answer key rather than pretending X is the only option.

## Pareto discipline (added after L0002 feedback)
- For every motion/shortcut/technique, ask: "Is this in the 20% that delivers 80% of real-world value?" If not, **cut from the lesson**.
- Reference docs may include cut items in a clearly-marked "Beyond the pareto" section for completeness.
- Specifically cut from L0002: `t`/`T`, `,` (reverse repeat), `:jumps`, built-in marks (`` `. ``, `` `^ ``, `` `[ ``, `` `< ``), backtick-vs-apostrophe mark distinction, `gi`/`gd` bonus.
- Specifically added to L0002: `/pattern<Enter>` + `n`/`N` (search is the highest-leverage nav move; teaching navigation without it forces forward-references).
- Drill tasks must use ONLY motions taught in the current or prior lessons. **No forward-references.**
- File creation in drills uses `cat > file <<'EOF'` from bash, not in-vim paste, to avoid autoindent/paste-mode issues.
- When in doubt, leave it out. Add later if a real-world need surfaces in a session.

## Tools available to teach with
- All file edits in this workspace use Write/Edit (no shell heredocs).
- Lesson HTML can be opened with `open` on macOS.
