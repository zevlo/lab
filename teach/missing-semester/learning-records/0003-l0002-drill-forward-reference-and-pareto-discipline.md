# Lesson 0002 drill had forward-reference bug; user pushed for pareto discipline

Original L0002 drill answers used `/api-gateway<Enter>` and `/db.internal<Enter>` despite search not being introduced until L0003. The user hit `E486: Pattern not found: db.internal` and correctly diagnosed that the lesson's motions weren't aligned with what had been taught.

**Root cause of E486**: pedagogical (forward-reference to untaught `/`), not vim. `/db.internal` as a regex (`.` matches any char, including the literal dot) should have matched the literal text — so the buffer almost certainly didn't contain it, likely due to paste-with-autoindent mangling.

**User feedback**: "use the pareto principle when deciding which motions and shortcuts to teach me." Recorded as a standing preference in [NOTES.md](../NOTES.md).

**Changes applied**:
- L0002 rewritten: search (`/pattern<Enter>` + `n`/`N` + `*`) moved up from L0003, since real navigation uses both interleaved. Cut `t`/`T`, `,`-reverse, `:jumps`, built-in marks, backtick-vs-apostrophe distinction, `gi`/`gd` bonus.
- L0003 will be substitute-only (`:s`/`:%s/`/`cgn`/`g&`).
- Drill tasks now use only motions from the current or prior lessons — no forward-references.
- Drill file creation uses `cat > file <<'EOF'` from bash, not in-vim paste, to avoid autoindent/paste-mode issues.
- Reference doc reorganized with a "Beyond the pareto" section for cut items.

**Implications for future lessons**: every proposed motion/shortcut must pass the pareto test ("is this in the 20% that delivers 80% of real-world value?") before going into a lesson. Extras belong in reference docs, not lessons.
