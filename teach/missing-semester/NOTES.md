# Teaching notes

## User stance (established at workspace init)
- **Comfortable dabbler**: uses the shell daily, can edit in vim, but slow and reliant on the mouse/plugins. Targeted gaps: vim grammar, text objects, tmux scripting, remote tmux patterns, POSIX-correct pipelines.
- Opinionated about defaults, POSIX, and fundamentals. No plugins, no remaps in curriculum. Owns starship + kitty configs already — do not teach expanding those.
- Shell: **bash** (intentionally switched from default zsh on macOS).
- Terminal: **ghostty 1.3.1** (Gruvbox Dark) as taught stack; kitty also configured. One Ghostty custom keybind: `shift+enter=text:\x1b\r`.
- Tools installed: vim 9.1, tmux 3.7b, ghostty 1.3.1.
- Dotfiles present: bashrc, tmux, vim, ghostty, kitty, starship, ssh, gitconfig.
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

## L0019 design notes (MS CLE — signals & job control)
- **Primary source:** https://missing.csail.mit.edu/2026/command-line-environment/ — “Signals” section (+ MS Signals and Job Control exercise shape).
- **Scope:** `Ctrl-C`/`SIGINT`, `Ctrl-\`/`SIGQUIT`, `Ctrl-Z`/`SIGTSTP`; `jobs` / `fg` / `bg` / `&` / `%N`; `kill` default `TERM` vs `KILL`; `SIGHUP` + `nohup`; link to existing tmux as durable hangup answer.
- **Reuse:** `pgrep`/`pkill` from L0008 in the drill (no re-teach).
- **Skill win:** cold rebuild suspend → `bg` → `kill %N`; explain SIGHUP vs tmux.
- **Defer:** `wait`/`pidwait`/`trap`; Arguments & globs; env/`export`; return codes `&&`/`||`; SSH config; aliases/dotfiles; CLE tmux redo; fancy CLIs (fzf, mosh, rg, oh-my-*).

## L0020 design notes (MS lecture 1 exercises workbook — user-requested)
- **Pattern:** Like L0014 — no new Knowledge. Full MS [course-shell Exercises](https://missing.csail.mit.edu/2026/course-shell/) set in one HTML workbook (spread across sittings).
- **Scope:** All 17 MS exercises (ls -l → globs/quoting → redirects/`$?` → cd builtin → check.sh/`chmod`/`set -x` → dated backup → flaky `$@` → extensions/`xargs`/`curl`/`jq`/`awk` → SSH pipe + history).
- **Exception:** Include MS `jq` exercise despite fancy-CLI constraint; note `brew install jq` in-lesson.
- **Scratch:** `/tmp/ms-ex/`. Hidden `show answer` = one valid approach.
- **Ref:** `reference/shell-ms-exercises.html` — cluster → prior lesson/man map (not a solution key).
- **Tone:** MS-era — no pareto/reps/storage-strength meta in lesson copy.

## L0020 complete (will re-run)
- Workbook finished once; user wants more passes through exercises. Keep L0020 available for spaced re-runs alongside CLE progress.

## L0019 complete (4/4; solid)
- Signals/jobs floor set. User progressed to CLE Arguments & globs.

## L0021 design notes (MS CLE — arguments & globs)
- **Primary source:** https://missing.csail.mit.edu/2026/command-line-environment/ — “Arguments” section (flags + globs / braces).
- **Scope:** `$0`/`$1`/`$@`/`$#`; flag conventions (`-`/`--`, grouping); shell expands `*`/`?` before exec; brace `{a,b}`; quotes freeze globs; multi-operand cmds.
- **Reuse:** `$1` from L0018; L0020 glob/quoting exercises as prior exposure (formalize model here).
- **Skill win:** cold rebuild brace `touch` + glob into argv printer; explain shell-vs-program expansion.
- **Scratch:** `/tmp/ms-args/`.
- **Defer:** `**`/globstar; Streams concurrency; env/`export`; return codes `&&`/`||`; SSH; aliases/dotfiles; fancy CLIs.
- **Next when asked:** env vars or return codes.

## L0021 complete (4/4; structure/style praised)
- Args/globs floor set. User likes current MS lesson shape — keep it.

## L0022 design notes (MS CLE — environment variables & export)
- **Primary source:** https://missing.csail.mit.edu/2026/command-line-environment/ — “Environment variables”.
- **Scope:** shell-local vs environment; `printenv`; one-shot `VAR=value cmd`; `export`; `unset`; `'` vs `"` refresh; ALL_CAPS convention; `HOME`/`PATH`/`TZ`/`DEBUG`.
- **Reuse:** `name=value` / `$(date…)` from L0018; `PATH`/`HOME` from L0015.
- **Skill win:** cold rebuild one-shot `TZ=… date` + `export`/`bash -c`/`unset`; explain child inheritance.
- **Scratch:** `/tmp/ms-env/`.
- **Defer:** process substitution `<(…)`; return codes; SSH; aliases/dotfiles; fancy CLIs.
- **Next when asked:** return codes or SSH.

## L0022 complete (4/4; drills good)
- Env/`export` floor set. User asked real use of `bash -c` → one-shot child bash for a command string (not just the inheritance probe).
- Next: return codes (MS CLE order) or SSH.

## L0023 design notes (MS CLE — return codes)
- **Primary source:** https://missing.csail.mit.edu/2026/command-line-environment/ — “Return codes”.
- **Scope:** exit status convention (0 success, nonzero failure); `$?`; `true`/`false`; short-circuit `&&` / `||`; `exit NUM` in scripts; same rule powers `if`/`while` (tie to L0018).
- **Reuse:** `[ -f ]` / `if` from L0018; `grep -q` shape from MS notes; L0020 `$?`/`&&`/`||` exposure formalized here.
- **Skill win:** cold rebuild `$?` after true/false; `grep -q &&` / `||`; one-sentence: why 0 means success.
- **Scratch:** `/tmp/ms-rc/`.
- **Defer:** full MS flaky-retry exercise; `wait`/`pidwait`; SSH; aliases/dotfiles; fancy CLIs.
- **Next when asked:** SSH / remote machines, or aliases & dotfiles.

## L0023 complete (4/4; cold rebuild success)
- Return-codes floor set (`$?`, `&&`/`||`, `exit NUM`, 0 = success). Cold rebuild first pass.
- Next: SSH / remote machines, or aliases & dotfiles.

## L0024 design notes (MS CLE — SSH / remote machines)
- **Primary source:** https://missing.csail.mit.edu/2026/command-line-environment/ — “Remote Machines”.
- **Scope:** `ssh user@host`; non-interactive remote cmds; local vs remote pipe quoting; ed25519 keys / `ssh-keygen` / `authorized_keys` / `ssh-copy-id`; `scp` + `rsync` (`-av`, `--partial`); `~/.ssh/config` Host / User / HostName / Port / IdentityFile.
- **Reuse:** tmux for durable remotes (L0006+); `SIGHUP` on SSH drop (L0019); `bash -c` quoting analogy (L0022); L0010-style Drill A local / Drill B remote.
- **Skill win:** cold rebuild `ssh HOST hostname`; quoted `ssh HOST 'ls | wc -l'`; one-sentence why `~/.ssh/config`.
- **Scratch:** `/tmp/ms-ssh/`. Never drill dumping private key material.
- **Skip:** mosh and other MS “consider installing” tools. Do not re-teach CLE tmux section.
- **Defer:** sshd hardening; port forwarding (`-L`/`-R`/`-N`/`-f`); ssh-agent depth; aliases & dotfiles.
- **Next when asked:** aliases & dotfiles.

## L0024 complete (4/4; drills and cold rebuild clean)
- SSH floor set (connect, keys, quoting, scp/rsync, config). No friction reported.
- Next: aliases & dotfiles.

## L0025 design notes (MS CLE — aliases & dotfiles)
- **Primary source:** https://missing.csail.mit.edu/2026/command-line-environment/ — “Customizing the Shell”.
- **Scope:** dotfiles concept + common paths; bash `~/.bashrc` / `~/.bash_profile` light; `export PATH="$PATH:…"`; `alias` / `alias name` / `\cmd` / `unalias`; compose; persist via sourced file; VC+symlink pattern named only.
- **Reuse:** `export` (L0022); `~/.ssh/config` as a known dotfile (L0024); no-spaces-around-`=` footgun (L0018/L0022).
- **Skill win:** cold rebuild `alias ll` + inspect; source a practice bashrc fragment; one-sentence what a dotfile is.
- **Scratch:** `/tmp/ms-dot/` — do not require editing real `~/.bashrc` in the drill.
- **Skip:** brew rg/fd/tldr, oh-my-*, fzf, AI shells, Terminal Emulator re-pick (Ghostty stays).
- **Defer:** shell functions; full dotfiles repo migrate/publish; package managers; Ctrl-R depth.
- **Next when asked:** next MS lecture, or deferred CLE (functions / sshd / port forward).

## L0025 complete (4/4; existing inventory)
- Aliases / bashrc / PATH / source-persist floor set. User already has dotfiles for bashrc, tmux, vim, ghostty, kitty, starship, ssh, gitconfig.
- CLE lecture 2 main slices done. Starship/kitty are owned configs — do not expand prompt frameworks in lessons; Ghostty stays the taught terminal.
- Next when asked: MS lecture 3 (Dev Environment & Tools), deferred CLE (functions / sshd / port forward), or L0020 re-run.

## L0026 design notes (MS Dev Environment — terminal vs IDE map)
- **Primary source:** https://missing.csail.mit.edu/2026/development-environment/ — intro + Text editing and Vim / Putting it all together.
- **Scope:** IDE vs terminal workflow; map Ghostty/bash/tmux/vim/ssh; vim as edit core via retrieval (not re-teach L0001–0005); MS fizzbuzz compose drill.
- **Reuse:** vim grammar L0001–0005; tmux L0006+; SSH L0024; dotfiles L0025.
- **Skill win:** cold rebuild map sentences + `ci"`; working `python3 fizz.py` after composed fixes.
- **Scratch:** `/tmp/ms-dev/`.
- **Skip:** Caps Lock remaps; vim plugins; installing VS Code; language server install tonight.
- **Defer:** LSP / CLI checkers (ruff/mypy class); AI autocomplete / inline chat / agents; IDE extensions (Remote SSH, Live Share, devcontainers).
- **Next when asked:** language servers / CLI checkers, or AI form factors.

## L0026 complete (4/4; vim fluency gap)
- Terminal vs IDE map floor set; fizzbuzz compose landed and felt good vs early vim lessons.
- User still needs practice: motions + workflow not natural yet. Prefer a dedicated vim practice / spaced-retrieval slice when they want fluency work; do not treat L0001–0005 as “done forever.”
- Next when asked: vim motions/workflow practice, language servers / CLI checkers, or AI form factors.

## L0027 design notes (vim motions and workflow practice — user-requested)
- **Pattern:** Like L0014 — no new Knowledge. Interleave L0001–0005 + L0026 compose habits.
- **Scope:** habits (Esc / arrive by name / speak the sentence / undo+Ctrl-o); one YAML config multi-edit drill; cold rebuild; 6-question interleaved quiz.
- **Scratch:** `/tmp/vim-practice/service.yaml`.
- **Ref:** `reference/vim-retrieval-index.html` — pocket card + links to vim refs (open after attempt).
- **Tone:** MS-era — no pareto/reps/storage-strength meta in lesson copy.
- **Defer:** new motions beyond L0001–0005; LSP/AI lecture-3 slices.
- **Next when asked:** another vim pass, language servers / CLI checkers, or AI form factors.

## L0027 complete (6/6; :s preferred over cgn)
- Motions/workflow practice pass done. User asked simplest visual yank/paste and `:s` vs `cgn` tradeoffs.
- Preference logged: substitute for bulk; do not push `cgn` as mandatory. Teach when each wins.
- Next when asked: another vim pass, language servers / CLI checkers, or AI form factors.

## L0028 design notes (MS Dev Environment — LSP & CLI checkers)
- **Primary source:** https://missing.csail.mit.edu/2026/development-environment/ — Code intelligence and language servers.
- **Scope:** LSP concept + feature list; terminal map (CLI checkers beside vim); `python3 -m py_compile`; `gofmt` / `go vet`; install+run `mypy` (MS-named; one-off like jq); exit status reuse L0023.
- **Reuse:** L0026 terminal vs IDE map; L0023 `$?` / `&&`; vim fix loop.
- **Skill win:** cold rebuild py_compile / gofmt+vet / why mypy ≠ compile.
- **Scratch:** `/tmp/ms-lsp/`.
- **Skip:** vim LSP plugins; VS Code extension setup; gopls-as-IDE; Ruff install tonight.
- **Defer:** Ruff; Code Quality lecture depth; virtualenvs/packaging; AI form factors; IDE Remote SSH / Live Share / devcontainers.
- **Next when asked:** AI form factors, more vim practice, or MS lecture 4 (Debugging and Profiling).

## L0028 complete (4/4)
- LSP concept + CLI checkers (`py_compile` / `gofmt` / `go vet` / `mypy`) floor set. No friction reported.
- Dev Environment lecture terminal-track slices done. AI form factors still open in lecture 3.
- Next when asked: AI form factors, more vim practice, or MS lecture 4 (Debugging and Profiling).

## L0029 design notes (MS Dev Environment — AI form factors)
- **Primary source:** https://missing.csail.mit.edu/2026/development-environment/ — “AI-powered development” (Autocomplete → Inline chat → Coding agents).
- **Scope:** MS three-form-factor taxonomy (autocomplete / inline chat / agent); boundary = how much existing code the model can touch; stack map to user’s real surfaces; gate AI output with L0028 checkers (py_compile / mypy / gofmt+vet) via L0023 exit status; honest boundary — checkers catch syntax/types, not placement/style (motivates later Code Quality lecture).
- **Reuse:** L0028 checkers as the gate; L0023 `$?` / `&&`; L0026 terminal-vs-IDE map (Zed now sits in IDE column; opencode straddles terminal column as agent); L0024 SSH/remote framing for why vim stays.
- **User surfaces (named, not parametrically detailed):** Zed = AI-native IDE (all three form factors; exact panel/mode names deferred to zed.dev/docs). opencode = terminal-native coding agent (the user is inside it during lessons). vim = no-AI defaults floor + review surface.
- **Mission-constraint handling:** This is a Knowledge lesson about the form-factor landscape, not “install an IDE” or “abandon vim.” Zed treated like kitty/starship in L0025 — owned config, not curriculum to expand. Vim stays the taught daily editor floor; AI framed as a layer, not a replacement. Same posture as L0028’s “Cursor gives IDE-side intelligence — this is the SSH-box/defaults vim path.”
- **Skill win:** cold-rebuild three form factors + which touches existing code + why gate AI output; live agent drill (opencode or Zed) refactors MS’s buggy `extract.py`, then gated with py_compile+mypy.
- **Scratch:** `/tmp/ms-ai/`.
- **Skip:** installing a second IDE; Zed extension/mode shopping; prompt engineering depth; model/provider comparison; agentic tool-use internals.
- **Defer:** MS Agentic Coding lecture (agents in depth); Code Quality lecture (linters like Ruff that catch placement/style); prompt engineering; IDE extensions (Remote SSH, Live Share, devcontainers).
- **Next when asked:** MS lecture 4 (Debugging and Profiling), more vim practice, or L0020 workbook re-run.

## L0029 complete (4/4; AI form factors floor set)
- Three-form-factor taxonomy (autocomplete / inline chat / agent) + boundary (how much existing code the model can touch) + stack map (Zed / opencode / vim) + L0028-checkers-as-gate reuse all landed. No friction reported.
- MS lecture 3 named slices (editing, language servers, AI form factors) done. Only remaining lecture-3 item is the deferred IDE-extensions bullet: dev containers — user picked it next.
- Mission posture held: Zed = owned/not expanded; vim = no-AI floor + review surface; opencode = terminal-native agent. No second-IDE install, no prompt-engineering depth.

## L0030 design notes (MS Dev Environment — dev containers)
- **Topic choice:** User-requested after L0029 4/4. The last open lecture-3 item — MS lists dev containers under "Extensions and other IDE functionality" ("use a container to run development tools … portability or isolation"), pointing to the editor-agnostic `containers.dev` spec, and defers container depth to its own Packaging and Shipping Code lecture.
- **Out-of-scope handling:** This is NOT the deferred container/k8s CLI depth (kubectl/helm/compose — still MISSION out-of-scope). It is the dev-environment concept: a container as a reproducible dev box. Container *build* depth (multi-stage, distroless, registries, CI) deferred to MS Shipping Code lecture; orchestration (compose/k8s) stays out of scope.
- **Primary sources:** MS Dev Environment lecture (Extensions section); `containers.dev` spec intro. Verified exact MS wording via webfetch (not parametric).
- **Scope:** three nouns (image / container / dev container); `docker` CLI core (build / images / run / ps / exec / stop / rm / rmi / logs); the `-it` / `--rm` / `-v` / `-w` / `-p` / `--name` flags; minimal `devcontainer.json` and the key→`docker run` mapping; dev container spec is editor-agnostic.
- **Reuse:** L0028 checkers baked into the image as the portable gate; L0023 exit status still the verdict; L0024 SSH framing (container as a local, disposable "remote box" via `exec`); L0025 dotfiles/versioning (devcontainer.json is versioned config); L0029 agent can run inside the same container, gated the same way.
- **Skill win:** cold-rebuild three nouns + `-it`/`--rm` flags + devcontainer.json-vs-Dockerfile line; live drill builds an image with mypy baked in, mounts MS's `extract.py`, runs py_compile+mypy from inside the container (status=0, same as L0029 host run); long-running container + `exec` to mirror the SSH-to-a-box loop.
- **Mission-constraint handling:** IDE path named, not expanded (same posture as Zed L0029, kitty/starship L0025). `docker` CLI is the curriculum. The `devcontainer` CLI (`npm install -g @devcontainers/cli`) framed as an optional one-off install like `jq` (L0020) / `mypy` (L0028) — not a dependency. The drill's `devcontainer.json` task is a "read & map to docker run" task so it runs without the CLI.
- **Environment note (agent host):** this opencode host runs Docker 29.7.1 on Linux (no `devcontainer` CLI, no `colima`). Lesson keeps the corpus's macOS framing — Docker Desktop/colima provides the Linux VM, commands identical Mac↔Linux (same pattern as `ss`/`lsof`, BSD/GNU sed caveats in earlier lessons).
- **Scratch:** `/tmp/ms-devcontainer/`.
- **Skip:** installing a second IDE; `devcontainer` CLI as a hard dependency; docker-compose; kubectl/helm; image hardening; registries/CI.
- **Defer:** MS Packaging and Shipping Code lecture (container build depth, multi-stage, distroless, layer caching, BuildKit, volumes, networking); compose; k8s.
- **Next when asked:** MS lecture 4 (Debugging and Profiling), MS Shipping Code lecture, more vim practice, or L0020 workbook re-run.

## L0030 complete (4/4; dev containers floor set)
- Three-noun split (image / container / dev container), `docker` CLI core, `-it`/`--rm`/`-v`/`-w`/`-p` flags, and `devcontainer.json`-as-versioned-config all landed. No friction reported.
- MS lecture 3 (Dev Environment) fully done: terminal-workflow map (L0026), LSP + CLI checkers (L0028), AI form factors (L0029), dev containers (L0030). Do not re-teach unless retrieval decay shows.
- Mission posture held: IDE/dev-container path named not expanded; `docker` CLI is the curriculum; `devcontainer` CLI framed as optional one-off install (like `jq` L0020 / `mypy` L0028). Container build depth deferred to MS Shipping Code; compose/k8s still out of scope.

## L0031 design notes (MS Lecture 4 — debugging fundamentals, first slice)
- **Topic choice:** Spine continuation after L0030. MS lecture 4 (Debugging and Profiling) is dense and splits like Lectures 1–3 did. First slice = the foundational debugging half only.
- **Primary sources:** MS Debugging and Profiling — “Printf Debugging and Logging” + “Debuggers” sections. Verified exact wording via webfetch (golden rule phrasing; severity levels; debugger capability list; `pdb`/`gdb` naming).
- **Scope:** the golden rule; printf vs logging (severity levels, the convert-print-to-log advice); third-party logs (`-v`/`--verbose`, `/var/log/`, `journalctl -u` — Linux/systemd only, called out like `ss`/`lsof`); the debugger concept; `pdb` launch (3 ways incl. `breakpoint()`) + core commands (b/c/n/s/p/l/w/q); `gdb` named only (command shapes mirror pdb) — Python is the primary track so `pdb` is the hands-on debugger; the reproduce→isolate→inspect→fix→gate loop; the cardinal rule (inspect the ACTUAL value); tidy logs (CSV-ish → sets up the profiling half).
- **Bug-class framing (the throughline):** L0028 checkers pass (syntax/types clean, L0023 `0`) and the program is still wrong = a *logic* bug. That is exactly the bug class this slice targets, and the Q4 / cold-rebuild hinge.
- **Reuse:** L0028 checkers + L0023 exit status (drill 4 gate); L0008 ops loop (drill 5 third-party logs via `python3 -m http.server` + `curl -i`); the Python track (functions/lists/loops — `running_max`); L0029 AI form factors noted as *distinct* from AI-for-debugging (authoring vs diagnosing).
- **Skill win:** cold-rebuild golden rule + when-debugger-beats-print + why-checkers-miss-a-logic-bug; live drill reproduces a `biggest = 0` init bug with a print, then re-does it in `pdb` (`breakpoint()`, `p biggest`, `n`, `c`), then fixes + gates (`py_compile`/`mypy` → `status=0`) and reads `http.server` request logs.
- **Scratch:** `/tmp/ms-debug/`. Buggy file built with `cat <<'EOF'` (house rule).
- **Skip / Defer:** `rr` (record-replay, reverse debugging, Linux-only); `strace`/`dtruss`/`bpftrace` (syscall tracing — its own later slice, highest DevOps leverage); `tcpdump`/Wireshark (network debugging, relates to L0010); ASan/TSan/MSan/UBSan + Valgrind (memory debugging, mostly C/C++/Rust); AI-for-debugging; the whole Profiling half (`time` real/user/sys, `htop`, `perf` + flame graphs, callgrind/massif, `hyperfine`). gdb drill depth (C/Rust debug) waits until a compiled-language need appears.
- **Next when asked:** next Lecture-4 slice (strace/dtruss, tcpdump, or the Profiling half), more vim practice, or L0020 workbook re-run.
