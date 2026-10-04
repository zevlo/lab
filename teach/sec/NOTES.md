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
  Update after week-1 review (Lesson 0007): 19 of 20 — first miss of the sprint: crypto key-direction pairing (protection + key in one answer). Fluency held in-lesson, storage failed in mixed recall; retrieval schedule set (LR 0008). Control category+type pairing held clean in the PBQ, so paired vocab is not weak in general — the crypto golden rules are. Strongest remaining gap hypotheses: governance (Domain 5), attack-name catalog (2.1–2.4).
- Mission: DoD 8140 requirement. Exam ~Nov 12–13, 2026.
- Time: ~40 hrs/week total study. ≥10 hrs/week in this workspace (lessons + review). The rest: Gibson book reading, Messer videos, Gibson practice-exam questions.

## Teaching strategy decisions
- Compress Domain 3 (Security Architecture, 18%) — cloud/IaC content is review for a DevOps engineer. Spend the saved hours on Domains 2 and 5.
- Extra retrieval reps for: cryptography (1.4), governance/risk/compliance (Domain 5), and the attack-name catalog (2.1–2.4). These are vocabulary-heavy and new.
- Use DevOps hooks in lessons (guardrails = preventive, alerting = detective, rollback = corrective, runbooks = directive) to anchor new vocabulary to what the user already knows.
- Every lesson opens with 3 spaced-retrieval questions from earlier lessons, interleaved across domains.
- Weekly mixed-review session (end of each week) covering all prior lessons.
- From Lesson 0006: stopwatch on every quiz (budget 60 seconds per question), half of practice items multi-hop, one best-answer item. For home-turf topics, judge by pace and best-answer discrimination — raw score is no longer the signal.
- PBQ-style practice must be genuinely performance-based: drag-and-drop, constructing rules or calculations, placing devices, typing answers — never option buttons wearing a PBQ costume (user request, Oct 3, after Lesson 0007's exercise read as multiple choice).

## Schedule checkpoints
- Week 1 (Oct 2–9): Domain 1. User should book the exam this week.
- Week 5 end (Nov 6): first timed full-length practice exam. Target 750+.
- Week 6 (Nov 7–13): review + PBQ strategy + 1–2 more practice exams. Exam Nov 12–13.
- Safety net: SY0-701 English retires June 11, 2027 — slipping a week or two is safe.
- Oct 3: Domain 1 finished at lesson depth — six lessons in two days, ahead of pace. Week-1 review pulled forward as Lesson 0007 (mixed, timed, no cues, first PBQ-style exercise). If clean at pace, start Domain 2 immediately (Lesson 0008, threat actors). Confirm the exam is booked (Nov 12–13).
- Oct 3: Week-1 review 19/20 — only miss: crypto key-direction pairing. Reps scheduled in 0008 warm-ups, ~0010, and the week-2 review (LR 0008). Domain 2 started same day with Lesson 0008 (2.1, threat actors). Review pace and PBQ score not yet reported — ask.
- Oct 3: Lesson 0009 inserted at user request — a full performance-based lab, untimed, 10 scored blocks: drag-and-drop matching (controls, authentication factors, incident response order), firewall/ACL rule writing plus a ruleset audit, log analysis (beacon/scan/exfil), network diagram placement, and vulnerability triage plus SLE/ALE math. Previews objectives 3.3, 4.5, 5.4 with primer tables only. Threat vectors (2.2) becomes Lesson 0010; the key-direction rep moves: rep 2 fired in 0009 warm-ups (typed), rep 3 lands in 0010, the "~0010" rep from LR 0008 moves to ~0011. Lesson numbering past 0009 shifts by one.
