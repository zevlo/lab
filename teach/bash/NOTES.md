# Teaching notes

## Language style: ISO 24495 plain language (user request, 2026-09-10)
All teaching materials follow ISO 24495-1 (plain language) principles:
- **Relevant**: only what the reader needs for the DevOps mission. No digressions.
- **Findable**: informative headings, scannable structure, clear sequence.
- **Understandable**: words the reader knows; short sentences (aim ≤ 20 words); active voice; address the reader as "you"; define each new term at first use and link to the glossary.
- **Usable**: key message first in each section; steps as numbered actions; every example copy-paste runnable.
- 2026-09-21: user asked for "ISO 24995" language for all future lessons. No such standard exists; read as ISO 24495-1 (the standing convention above) — confirmed by the user.

## Learner profile (2026-09-10)
- Comfortable with terminal commands; scripts "feel like magic".
- DevOps work spans CI/CD, Linux servers, containers/Kubernetes.
- Goals: automate own work AND read/fix existing scripts.
- ~30 min/day. macOS terminal; teach bash, flag Linux differences.
- Confirmed after lesson 0001: Greg's Wiki BashGuide suits them — use as recurring primary source.

## Working agreements
- Lessons ≤ ~15 minutes. One tangible win each.
- Quiz answers: equal word counts across options. No format clues.
- Grow `reference/bash-glossary.html` each lesson; reuse its terms verbatim.
- Space and interleave: revisit earlier material in later quizzes.

## Curriculum (rolling plan)
- 0004 decisions/tests — `[[ ]]`, file/string tests, guards vs if/else. Built 2026-09-13; added `reference/test-operators.html` + glossary "Decisions and tests" section (incl. `guard`, missing since 0003).
- 0005 loops — Built 2026-09-16; `for`/`do`/`done`, `"$@"` finally delivered, globs vs `$(ls)`, `continue`/`break`. Glossary gained "Loops" section (loop, for, continue, break, glob, while/until teaser); `dollarat` entry promoted from teaser to full definition. Quiz Q3 interleaves lesson-0002 word splitting. Planted seed for later: loop-with-skips still exits 0 — future `set -e` / failure-tracking motivation.
- 0006 commands that talk back — Built 2026-09-21; command substitution `$(...)` (capture stdout only, quote it, backticks read-only, subshell) + any command as an `if` condition (`if grep -q …`, `>/dev/null` for noisy commands, `curl -sf -o /dev/null`). Guided build: `snapshot.sh` (dated tarball, `tar` as condition). Glossary gained "Commands that talk back" section (command substitution, condition, subshell). Quiz Q3 reviews exit-status-0 semantics (lessons 0003–0004). Pipelines deferred again — fold into a later lesson. Lesson 0005 completion recorded 2026-09-21 (record 0006, quiz 4/4, both scripts upgraded unprompted).
- 0007 fail loudly — failure tracking / `set -euo pipefail`. Motivation now doubled: 0005's loop-with-skips exits 0; 0006's failing command inside `$(...)` dies silently. Honesty notes in both lessons point here.
- Then: functions, pipelines, or a ShellCheck-driven debugging lesson — pick by what the user's own scripts need.
