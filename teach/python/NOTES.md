# Teaching Notes

- **(2026-07-03) No bash comparisons anywhere.** User first asked to drop bash bridges from new lessons, then to remove them from previous lessons and references too. All bash-to-Python comparison content has been purged; the single reference doc is python-quick-reference.html. Teach Python purely on its own terms.
- **(2026-07-03, updated) Difficulty is judged from `learning-records` per the /teach skill's ZPD section.** The user previously asked not to auto-escalate on strong scores; that is now folded into standard ZPD judgment rather than a standing rule.
- **(2026-07-15) Abstract runtime concepts need more scaffolding.** Lesson 0017 (`__name__` / run vs import): quiz and exercise succeeded, but user needed extra resources to fully understand. For similar “how Python works under the hood” topics, add a tighter before/after demo in the lesson itself — don’t rely on the primary-source link alone.
- **(2026-07-15) Classes (0018) were past ZPD.** Exercise completed, but user lacked prerequisite object-model knowledge (`class` vs instance, what `self` is, why methods exist). Remediate with a slower, narrower lesson before any more OOP. Do not escalate.
- **(2026-07-24) Quiz wording can nullify the check.** Lesson 0024 exercise was correct from memory, but quiz was 0/3 because the questions were hard to parse (and one option used untaught `if x` truthiness). For quizzes: plain stems, no untaught ideas in stems/options, concrete options over metaphorical glosses ("passed the test").
- Sessions are 15–20 min. One concept per lesson, max. Resist scope creep.
- Mission is interview-focused: prioritize writing-from-blank-file fluency over tooling breadth. Retrieval practice (typing code from memory) matters more than reading.
- Mixed work environment — keep examples tool-agnostic (files, logs, processes, APIs) rather than AWS-specific, at least early on.
