# Lesson 0004 complete: 4/4 on quiz; next is registers & system clipboard

User reported 4/4 on Lesson 0004 (visual & block mode). The L0004 ask-the-teacher's open question — registers & clipboard vs marks/macros — is resolved: **next is L0005 — Registers & system clipboard**.

Pedagogical decisions for L0005 (locked in via pre-build questions):
- **OSC 52 / remote clipboard: one paragraph + one drill task.** Full depth (remote `pbcopy` forwarding, vim-to-tmux hooks, `allow-passthrough` interplay) deferred to the tmux phase. The lesson flags the gotcha and teaches tmux copy-mode yank as the bridge; nothing more.
- **`set clipboard=unnamedplus` omitted entirely** — user's defaults-only constraint is absolute. Lesson uses explicit `"+` prefixes throughout; reference notes the option's existence only in "Beyond the pareto" as a deliberate non-recommendation.
- **`1`–`9` numbered registers: family mentioned, only `1` drilled.** Pareto cut: full rotation mechanics, small-delete `-` register, expression `=` register, alternate-file `#` register — all moved to the reference's "Beyond the pareto" or omitted.
- **Drill file**: a `Secret`-shaped YAML (`/tmp/secrets.yaml`), so the system-clipboard tasks feel like real DevOps work — copy a `whsec_` token to your local browser.

User feedback signals incorporated from prior records:
- **Reinforce "right tool for the job"** (record 0005): surface that `"+` is just another register prefix, not a special command. The same composition rules apply.
- **Randomize quiz answers** (record 0004): Fisher-Yates shuffle on page load, applied to L0005.
- **Drill uses `cat > /tmp/... <<'EOF'` from bash** (NOTES.md pareto discipline): applied.
- **No forward references**: drills use only registers + previously-taught motions (L0001 grammar, L0002 navigation, L0003 substitute, L0004 visual). The one forward reference — tmux copy-mode in Task 5 — is explicit and labeled as the bridge to Lesson 0006.

Implications for L0006:
- Registers lesson surfaces tmux copy-mode briefly (the OSC 52 bridge). L0006 naturally starts the **tmux phase proper**: sessions, windows, panes, prefix, copy-mode depth.
- Alternative if user wants to stay in vim: marks, macros, jump-list depth.
- Decision deferred to L0005 ask-the-teacher feedback.

New GLOSSARY.md entries: register, unnamed register, named register, black-hole register, system clipboard register, OSC 52.
