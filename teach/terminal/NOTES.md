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

## L0005 design notes (added after L0004 4/4)
- **L0005 topic locked: registers & system clipboard.** User confirmed via three pre-build scope questions.
- **OSC 52 covered at one-paragraph depth** (the bridge concept + one drill task). Full remote-clipboard depth — `pbcopy` SSH forwarding, vim-to-tmux hooks, `allow-passthrough` interplay — deferred to tmux phase.
- **`set clipboard=unnamedplus` intentionally omitted** from lesson and reference body. Mentioned only in reference's "Beyond the pareto" as a deliberate non-recommendation (user's defaults-only constraint is absolute). All clipboard ops use explicit `"+` prefixes throughout.
- **`1`–`9` numbered registers**: family mentioned in a single table row, only `1` drilled. Pareto cuts: full rotation mechanics, small-delete `-` register, expression `=` register, alternate `#` register — all moved to reference's "Beyond the pareto" or omitted.
- **Drill file**: `/tmp/secrets.yaml` (a Secret-shaped YAML) so system-clipboard tasks feel like real DevOps work — copy a `whsec_` token to the local browser.
- **Pre-emption**: the lesson warns about the remote-SSH clipboard gotcha BEFORE the user hits it. Future remote drills should reinforce that `"+y` is local-only without OSC 52; tmux copy-mode is the bridge.
- **Forward-reference discipline upheld**: Task 5 references tmux copy-mode keys, but explicitly — labeled as a bonus task that probes Lesson 0006 material rather than assuming it.

## L0006 design notes (Phase 3 kickoff)
- **Topic**: sessions / windows / panes + detach/attach. Copy-mode and Mac clipboard path explicitly deferred (user parked that investigation).
- **Pareto keys only**: `d c n p 0-9 % " o arrows z x ?` after prefix; shell: `new -s`, `ls`, `attach -t`.
- **Cut to reference "Beyond the pareto"**: copy-mode, paste buffer, sync-panes, layouts, rename, kill-session.
- **SSH comfort**: teach stock `base-index 0`; warn that local conf uses `base-index 1`.
- **Primary source**: `man tmux` DESCRIPTION + DEFAULT KEY BINDINGS (OpenBSD man mirror).

## L0006 complete (4/4)
- Hierarchy + detach/attach/splits: fluent. Next Phase 3 slice TBD from ask-the-teacher options.
- **Copy-mode constraint (mandatory when that lesson ships):** `C-b [` + `Option-w` does **not** update macOS clipboard on this machine; it only fills the tmux buffer. Teach buffer paste (`C-b ]`) as the portable win; Mac clipboard via mouse/Ghostty or `set-buffer -w` — do not promise Option-w → Notes.
- User question logged: how bash history vs tmux scrollback vs Ghostty scrollback differ (three separate stores).

## L0007 design notes (Pareto shell — user-requested)
- **Topic:** the 20% of Linux/shell commands that cover ~80% of DevOps work — map first, then one tangible filter pipeline.
- **Five families:** navigate / inspect / filter / redirect / ops. Full table in `reference/pareto-shell-commands.html`.
- **Skill win:** mission recipe `grep | cut | sort | uniq -c | sort -nr` (+ `tee`, optional `tail -F`). Shotts TLCL ch. 6 is primary source.
- **Pareto cut from lesson body:** `find`/`xargs`, `sed`/`awk`, `jq`, archives, deep permissions — reference "Beyond the pareto" only.
- **macOS caveat:** `ss` is Linux/remote; call out `lsof`/`netstat` for local. Don't drill `ss` on Mac.
- **Interleave:** shell lesson inserted after tmux L0006 by explicit user request; Phase 3 copy-mode remains deferred.
- **Next from ask-the-teacher:** ops drill, redirect mastery, tmux copy-mode, or more filter interleaving.

## L0008 design notes (ops — from L0007 feedback)
- **Gaps named:** `pgrep`/`kill`/`curl` soft; `cut` first-time → interleave cut for storage strength.
- **Skill win:** local `python3 -m http.server` lifecycle — curl -i → cut status → pgrep -f → kill TERM → kill -0 verify.
- **Portable core:** `pgrep -f` + kill-by-PID. Mac display: `-lf`; Linux display: `-af`. No `pkill` in lesson.
- **Cut:** reinforce `-d' '` (space not default) and 1-indexed fields; status code = field 2.
- **Deferred:** dig, ss, rich curl API flags, redirect mastery, tmux copy-mode.

## L0008 complete (4/4)
- Ops loop fluent: `pgrep -f` → `curl -i` / `cut` → `kill` TERM → `kill -0`. New floor; do not re-teach unless retrieval decay shows up.
- Next slice TBD from ask-the-teacher: redirect mastery, dig + remote ss, cut spacing, or tmux copy-mode.

## L0009 design notes (redirect mastery — user-requested)
- **Topic:** stdout vs stderr, `>` / `>>` / `2>`, merge `>f 2>&1`, order footgun, `tee` / `tee -a`.
- **Skill win:** lose an error with `> only`, catch it with correct merge, prove wrong-order footgun, append + tee.
- **POSIX-lean:** teach `>f 2>&1`, not bash `&>`. Cut: `|&`, process substitution, fancy fd swaps.
- **Primary:** Shotts TLCL ch. 6 + `man bash` REDIRECTION + `info coreutils` tee.

## L0009 complete (4/4)
- Redirects fluent; no confusion reported. Shell pareto families (navigate map + inspect/filter + ops + redirect) now have drill floors. Next: dig + remote ss, tmux copy-mode, or spaced retrieval.

## L0010 design notes (dig + ss — user-requested)
- **Topic:** `dig` (full / +short / @resolver / AAAA / MX) + remote `ss -tlnp`.
- **Skill win:** local dig on example.com; SSH Linux for ss; Mac has no ss — `lsof` only as contrast.
- **Pareto cut:** dig +trace/DNSSEC, ss state filters, UDP deep dives.
- **Primary:** `man dig` (BIND), `man ss` (iproute2 / Debian manpage).
