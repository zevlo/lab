# Teaching notes

## Language style: ISO 24495 plain language (user request, 2026-09-10)
All teaching materials follow ISO 24495-1 (plain language) principles:
- **Relevant**: only what the reader needs for the DevOps mission. No digressions.
- **Findable**: informative headings, scannable structure, clear sequence.
- **Understandable**: words the reader knows; short sentences (aim ≤ 20 words); active voice; address the reader as "you"; define each new term at first use and link to the glossary.
- **Usable**: key message first in each section; steps as numbered actions; every example copy-paste runnable.

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
- 0005 loops — `for`, processing many args/files; finally `"$@"` (glossary has promised it since 0003). Reuse guard pattern inside loops.
- 0006 command substitution `$(...)` + checking command exit status (`if cmd; then`), pipelines.
- Then: functions, `set -euo pipefail`, or a ShellCheck-driven debugging lesson — pick by what the user's own scripts need.
