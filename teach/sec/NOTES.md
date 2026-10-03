# NOTES.md — Teaching Preferences and Working Notes

## Language style (permanent rule)
All lessons and reference documents use ISO 24495-1:2023 plain language. Applied concretely:

- Most important information first.
- Short sentences. One idea per sentence.
- Everyday words. Every acronym expanded on first use, every time it first appears in a document.
- Tables for anything that compares or contrasts.
- Quiz answers are the same length so the format never reveals the answer.
- Define a term before it is used, or link to the glossary.

## User profile (from intake, Oct 2 2026)
- Background: DevOps. Comfortable with cloud, containers, IaC, CI/CD, networking basics, automation/scripting.
- Assumed gaps (verify as we go): formal security vocabulary, governance/compliance concepts, cryptography internals, attack taxonomy names.
  Update after Lesson 0004: cryptography fundamentals (hashing, symmetric/asymmetric, signatures) did NOT test as a gap — DevOps tooling already covers it. Untested: PKI/certificate detail, crypto attacks, governance. Governance (Domain 5) is now the strongest remaining gap hypothesis. See LR 0005: quiz difficulty rising from Lesson 0005 — multi-hop questions, at least a third.
- Mission: DoD 8140 requirement. Exam ~Nov 12–13, 2026.
- Time: ~40 hrs/week total study. ≥10 hrs/week in this workspace (lessons + review). The rest: Gibson book reading, Messer videos, Gibson practice-exam questions.

## Teaching strategy decisions
- Compress Domain 3 (Security Architecture, 18%) — cloud/IaC content is review for a DevOps engineer. Spend the saved hours on Domains 2 and 5.
- Extra retrieval reps for: cryptography (1.4), governance/risk/compliance (Domain 5), and the attack-name catalog (2.1–2.4). These are vocabulary-heavy and new.
- Use DevOps hooks in lessons (guardrails = preventive, alerting = detective, rollback = corrective, runbooks = directive) to anchor new vocabulary to what the user already knows.
- Every lesson opens with 3 spaced-retrieval questions from earlier lessons, interleaved across domains.
- Weekly mixed-review session (end of each week) covering all prior lessons.

## Schedule checkpoints
- Week 1 (Oct 2–9): Domain 1. User should book the exam this week.
- Week 5 end (Nov 6): first timed full-length practice exam. Target 750+.
- Week 6 (Nov 7–13): review + PBQ strategy + 1–2 more practice exams. Exam Nov 12–13.
- Safety net: SY0-701 English retires June 11, 2027 — slipping a week or two is safe.
