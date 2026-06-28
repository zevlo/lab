# Rollout and Helm revision debugging verified; troubleshooting arc complete

User scored 4/5 on lesson 0020 quiz. Lab completed.

## Evidence
- Quiz 4/5: missed Q2 — readiness probe on wrong port (8080 vs container 80) during stuck rollout; user likely conflated with liveness or unrelated layers (selector, scheduler).
- Other items landed: ImagePullBackOff → describe Events first; `rollout undo` for fast kubectl recovery; `helm rollback` as Helm equivalent; maxSurge explaining three pods during two-replica stuck rollout.
- Lab: deploy-incident-lab (image break, probe break, Helm values break) completed as part of lesson flow.

## Diagnosis
Deploy-incident funnel landed: `rollout status` → `get rs` → describe failing pod → undo/rollback vs manifest fix. Readiness-vs-liveness **consequence** split still not automatic — same gap flagged at lesson 0005/0006, resurfaced in deploy context (Running 0/1 + stalled rollout = readiness, not liveness). User got readiness impact on endpoints in 0019 Q4 (5/5) but still mixes probe types when stem names readiness explicitly.

## Implications
- Troubleshooting arc (0017–0020) closed.
- Revisit readiness vs liveness with one-line rule in future combined scenario quizzes: **readiness = quarantine (0/1, rollout stall); liveness = restart (RESTARTS climb)**.
- Next topic candidates unchanged: cert-manager, NetworkPolicies, combined scenario quiz.
