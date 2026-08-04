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

## MS-era pedagogy (from L0015; current default)
- **Spine:** Missing Semester 2026 lecture order and notes. Slice a dense lecture into focused lessons.
- **Tone:** Teach the material plainly — why it matters, how it works, drill, quiz. Do **not** put “pareto,” “high-rep,” “storage strength,” or similar meta in lesson copy.
- **Still good:** cold rebuilds, hidden drill answers, quiz shuffle, citing MS + `man`, deferring out-of-slice topics as “later” (not “pareto cut”).
- **Still constrained:** defaults-only, POSIX-lean bash, skip MS “consider installing …” fancy CLIs unless mission changes.
- Pre-MS NOTES below are historical context for older lessons — do not let them steer new MS lesson wording.

## Pedagogical decisions (mostly pre-MS; keep where still useful)
- **Reference docs built just-in-time** alongside each lesson.
- Quiz format: equal-length answers, immediate JS feedback; shuffle answer order on every page load.
- Primary sources cited per lesson; parametric knowledge never trusted.
- **Drill-design principle (after L0003)**: match the tool to the task. Don't force a specific tool when a simpler one exists.
- Drill tasks must use ONLY material taught in the current or prior lessons. **No forward-references.**
- File creation in drills uses `cat > file <<'EOF'` from bash, not in-vim paste, to avoid autoindent/paste-mode issues.

## Scope discipline (historical label: “Pareto”; pre-MS)
- Older lessons/refs used “pareto” / “Beyond the pareto” for cutting low-leverage material. The *idea* (leave depth out of the lesson body) still applies under MS-era wording: say “later” / “beyond this slice.”
- Specific pre-MS cuts (vim L0002, tmux keys, etc.) remain valid for those lessons; do not retrofit every old HTML file.

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

## L0010 complete (4/4)
- dig + remote ss floor set. User ready for next lesson → Phase 3 copy-mode.

## L0011 design notes (tmux copy-mode)
- **Topic:** scrollback vs bash vs Ghostty; `C-b [` / emacs `C-Space` + `M-w` (Option-w) / `C-b ]`; `tmux show-buffer`.
- **Mandatory Mac caveat:** Option-w → tmux buffer only, not macOS clipboard. Portable paste = `C-b ]`.
- **mode-keys:** stock emacs; vi gotcha if EDITOR contains vi (`Space`/`Enter`).
- **Pareto cut:** rectangle, search, buffer list, OSC 52 / set-buffer -w.
- **Primary:** `man tmux` copy-mode + prior LR-0008 constraint.

## L0011 complete (quiz 4/4; mouse yank works)
- Keyboard Meta yank deferred to Linux try. Mouse path confirmed. Next: synchronize-panes.

## L0012 design notes (synchronize-panes)
- **Topic:** `setw synchronize-panes on|off` via `C-b :` (no default bind — defaults-only).
- **Skill win:** 3 local panes, sync on → shared typing → sync off → single-pane typing.
- **Habit:** always off after burst. Window-scoped.
- **Primary:** `man tmux` synchronize-panes.

## L0012 complete (4/4)
- Sync on/off via `C-b :` fluent. Primary use case to reinforce: multi-host SSH panes → identical triage burst → sync off.

## L0013 design notes (multi-session habits)
- **Topic:** named sessions as workspaces; `tmux new -s` / `ls` / `attach -t`; `C-b s` / `(`/`)` / `L` / `$`.
- **Skill win:** ops + edit sessions, switch via picker and last-session toggle.
- **Pareto cut:** kill-session, nested tmux, sockets.
- **Primary:** `man tmux` sessions + DEFAULT KEY BINDINGS.

## L0013 complete (4/4)
- Multi-session habits fluent; user praised the lesson. Recommended Missing Semester → added to RESOURCES.md.
- Phase 3 core (hierarchy, copy-mode, sync, multi-session) largely drilled. Next: OSC 52, spaced shell retrieval, or mission check-in.

## L0014 design notes (spaced shell retrieval — user-requested)
- **No new knowledge.** Interleave L0007–0010: pipeline, redirect order, ops loop, dig, ss.
- **Desirable difficulty:** hide answers; retrieval index for after-check only.
- **Quiz:** 6 interleaved items. Drill is incident-shaped single pass.

## L0014 complete — drills weak; path change
- User performed poorly on drills; requested more repetitions.
- **Course path → Missing Semester 2026** (explicit). MISSION.md updated. Next lessons follow MS lecture order.

## L0015 design notes (MS Introduction to the Shell — nav slice)
- **Primary source:** https://missing.csail.mit.edu/2026/course-shell/
- **Scope:** terminal vs shell, cwd/cd/paths, PATH/which, man, date/echo/ls/cat.
- **Defer:** pipes, redirects deep, find/sed/awk, scripting, MS fancy CLIs.
- User should read MS notes (nav + PATH sections) before/during lesson.

## L0015 complete (no issues)
- Nav / PATH / `man` floor set. Continue MS lecture 1 — pipes + core filters.

## L0016 design notes (MS shell — pipes + core filters)
- **Primary source:** https://missing.csail.mit.edu/2026/course-shell/ — “What is available” (simple tools) + “The shell language” pipes/`>`/`tee` paragraphs.
- **Scope:** `cat` `head` `tail` `grep` `sort` `uniq` + `|` composition; light `>` / `>>` / `tee`; pipe vs redirect.
- **Data shape:** one token per line so ranking works without `cut`/`awk` (those return later).
- **Skill win:** cold rebuild `sort | uniq -c | sort -nr | head`.
- **Defer:** `find`/`sed`/`awk`, stderr merge depth (already L0009), bash scripting, MS fancy CLIs.
- Solo each filter, then compose, then cold rebuild.

## L0016 complete (4/4; cold rebuild + /tmp spacing OK)
- Ranking recipe stuck through cold rebuild and optional fresh-tab spacing. Next: MS `find` / light `sed` / `awk`.

## L0017 design notes (MS shell — find / light sed / awk)
- **Primary source:** https://missing.csail.mit.edu/2026/course-shell/ — “What is available” complicated tools (`sed`, `find`, `awk`).
- **Scope:** `find` `-type`/`-name`/`-exec`; `sed` `s///g` preview + in-place; `awk` `{print $N}` + `-F`.
- **macOS mandatory:** `sed -i '' 's/…/…/g' file` (BSD); Linux remotes use `sed -i 's/…/…/g'`.
- **Skill win:** find py files with TODO via `-exec grep -l`; extract a column with awk; safe sed substitute.
- **Defer:** deep sed/awk languages, find `-mtime`/`-size` depth (mention only), full SSH log pipeline, bash scripting, fd/rg.
- **Scratch tree:** `/tmp/ms-tree/` — controlled, disposable.

## L0017 complete (4/4; cold rebuilds great)
- find/sed/awk floor set. User paused before next lesson — do not build L0018 until asked. When resumed: MS light bash scripting.

## L0018 design notes (MS shell — light bash scripting)
- **Primary source:** https://missing.csail.mit.edu/2026/course-shell/ — “The shell language (bash)” (conditionals → shebang / `set -euo pipefail`).
- **Scope:** variables (`name=value`, `"$name"`); `if` / `[ -f ]` / string `=`; `for` + `$(seq)`; shebang; `set -euo pipefail`; `$1`; `chmod +x`.
- **Skill win:** cold rebuild `check.sh` (MS exercise shape) + dated backup via `$(date +%Y-%m-%d)`.
- **Defer:** full flaky-test/`stress` script, background `&`, arithmetic, `[[ ]]` depth, functions, `set -x`, shellcheck, CLE lecture.
- **Scratch:** `/tmp/ms-script/`.

## L0018 complete (4/4; cold rebuild a/b/c ×2 — good rep)
- Light bash floor set. Two cold passes to get if / for / shebang+`set`+`chmod` clean — repetition worked as designed. MS lecture 1 done. Next when asked: CLE (lecture 2).
