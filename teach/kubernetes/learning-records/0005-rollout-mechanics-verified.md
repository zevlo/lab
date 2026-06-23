# Rollout mechanics verified

User scored 5/5 on the lesson 0004 quiz (new-ReplicaSet-per-template-change, maxUnavailable semantics, revisions as zero-scaled ReplicaSets, stuck-rollout containment, ImagePullBackOff first move) and completed the ship/break/rollback lab.

## Evidence
Quiz from memory, all correct. Notably, the diagnostic-first-move question (describe pod → events) — answered on intuition in lesson 0003 — was correct again here, suggesting the describe/events reflex is consolidating.

## Implications
- Deployment internals (Deployment → ReplicaSet → Pod, rollouts, rollbacks) can be treated as known.
- The lesson's closing caveat (rolling updates don't catch apps that start but are broken) is a live, acknowledged gap — readiness/liveness probes are the natural next lesson and were explicitly teed up.
- Four 5/5 quizzes in a row: consider raising quiz difficulty (scenario-based, multi-concept questions) to keep desirable difficulty.
