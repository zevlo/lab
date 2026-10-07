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
  Update after Lesson 0018: 11/11 at 1:51 — record pace (17 percent of exam budget). 3.2 banked first pass; on home-turf-adjacent objectives only pace and best-answer discrimination carry signal. Measured-boot reframe rep passed but the anchor was printed in the warm-up header — a cued pass. Uncued rep is 0019 warm-up 1; graduation at week-3 review.
  Update before that — Lesson 0017: 11/12 at 2:23 — MCQ 8/8 on first exposure to 3.1; compression validated. Vertical/horizontal repair held (Q1 passed) — pair returns to normal spacing. Repair phrases 3 of 4 produced typed: threat scope reduction, adaptive identity, passwordless authentication → expanding-gap confirmation near week-3 review. **Measured boot reclassified**: second consecutive miss, user typed "safe boot" — not production failure but family discrimination (TPM-record role maps to a blocking-family name). Anchor: measured = TPM writes it down · attestation = someone reads it · secure/safe = firmware refuses. Reframe rep in 0018 warm-ups, graduation at week-3 review. Miss taxonomy: no-cue pairing, term discrimination, spacing decay, phrase-production gap (retiring), boot-family confusion.
  Update after PBQ lab (Lesson 0009, Oct 3): 90 percent on the 10-block lab — above the strong bar (LR 0009). All five PBQ shapes performed cleanly on first exposure; format is not a risk. Missed block not named — ask which one before the Domain 4/5 lessons it previews. Key-direction typed rep 2 fired inside the run.
- Mission: DoD 8140 requirement. Exam **booked** (reported Oct 6 2026) for **earlier than the Nov 12–13 window** — exact date not stated. Do not ask about booking again; let the user volunteer the date.
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
- Oct 3: Lesson 0008 11/11 at pace; pairing rep one held (LR 0010, renumbered after a parallel session's PBQ-lab record took 0009). After the lab took the 0009 slot, threat vectors (2.2) is Lesson 0010 and waits for a go signal. Exam booking still unconfirmed.
- Oct 3: Lesson 0010 11/11 at pace (LR 0011). Key-direction rep 3 held; rep 4 in 0011 warm-ups, graduation at the week-2 review. 2.3 split into 0011 (input family) + 0012 (platform catalog) per LR 0011.
- Oct 3: Lesson 0011 11/11 at pace (LR 0012). Rep 4 held — special schedule ended; graduation at week-2 review. Gap-prediction strategy retired. Next: 0012 platform catalog (compressed), then 2.4.
- Oct 3: Lesson 0012 10/11 at pace — miss: sideloading/jailbreaking (LR 0013). Confusable-pair warm-up heuristic adopted. 2.4 split: 0013 malware + IoCs, 0014 attack names.
- Oct 3: Lesson 0013 10/11 — miss: threat scope reduction, a decay miss (LR 0014). Zero trust flagged under-spaced; repair reps in 0014-0015. Plan: 0015 = 2.5 mitigation, 0016 = week-2 mixed review (Domains 1+2, no-cue, timed, PBQ) — graduation for both missed pairs and the zero-trust repair.
- Oct 3: Lesson 0009 inserted at user request — a full performance-based lab, untimed, 10 scored blocks: drag-and-drop matching (controls, authentication factors, incident response order), firewall/ACL rule writing plus a ruleset audit, log analysis (beacon/scan/exfil), network diagram placement, and vulnerability triage plus SLE/ALE math. Previews objectives 3.3, 4.5, 5.4 with primer tables only. Threat vectors (2.2) becomes Lesson 0010; the key-direction rep moves: rep 2 fired in 0009 warm-ups (typed), rep 3 lands in 0010, the "~0010" rep from LR 0008 moves to ~0011. Lesson numbering past 0009 shifts by one.
- Oct 3: Lesson 0009 complete — 90 percent (LR 0009). User asked that no next lesson be created; 0010 (threat vectors) waits for their go. Ask when resuming: which block was the one miss, lab time, and whether the exam is booked (Nov 12–13) — still unconfirmed.
- Oct 6: Lesson 0014 11/11 at pace (LR 0015). Zero-trust repair reps held; attack-name gap hypothesis retired — Domain 2 objectives 2.1–2.4 banked. Next: 0015 (2.5 mitigation) with zero-trust warm-ups, then 0016 week-2 review — graduation for key-direction, sideloading, and zero-trust items. Exam booking still unconfirmed — ask.
- Oct 6: Lesson 0015 11/11 at pace (LR 0016). Domain 2 complete. Zero-trust architecture terms all held — repair fully loaded, graduation pending. Next: 0016 week-2 mixed review (Domains 1+2, no-cue, timed, PBQ) — calibrate to full exam difficulty; two straight perfect lessons. Exam booking still unconfirmed — ask.
- Oct 6: Exam reported **booked, earlier than Nov 12–13** — stop asking. Schedule impact: the Week 5 checkpoint (Nov 6 first practice exam, target 750+) and Week 6 review block likely compress; Domain 3 compression (already planned) becomes more important. Revisit checkpoint dates when the user states the exam date. Lesson 0016 (week-2 review) created: 24 mixed no-cue items (2 typed) + 3 performance stations; graduation for key-direction, sideloading, and zero trust.
- Oct 6: Lesson 0016 complete — quiz 22/24 at 5:53, PBQ 9/12 (LR 0017). Key-direction retired clean; zero-trust not — phrase-production gap (fourth miss species). Repair phrases scheduled into 0017 warm-ups. Second quiz miss was Q1 vertical/horizontal — schema error (axis set by data's worth, not by what changed); rep scheduled as 0017 Q1; sideloading pair graduates. Next: Lesson 0017 opens Domain 3 (compressed track).
- Oct 6: Lesson 0017 complete — 11/12 at 2:23 (LR 0018). 3.1 banked 8/8 first pass; three repair phrases produced typed; measured boot missed again as "safe boot" → reclassified family confusion, reframe rep in 0018. Next: 0018 = objective 3.2 (zones, appliance placement, firewall types — new vocabulary, full attention).
- Oct 7: Lesson 0018 complete — 11/11 at 1:51, warm-ups 3/3 (LR 0019). Record pace. 3.2 banked; measured-boot reframe passed cued (anchor was printed in the lesson) — uncued rep in 0019 warm-ups, graduation at week-3 review. Domain 3 closes with 0019 (3.3 review + 3.4 new: backups, RAID, sites, metrics); 0020 opens Domain 4 (4.1) a week ahead of the map. Exam date still unstated — do not ask.
