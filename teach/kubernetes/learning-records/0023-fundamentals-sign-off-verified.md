# Fundamentals sign-off verified

User scored 10/10 on lesson 0023 quiz and 12/12 on combined scenario quiz 02.

## Evidence
- Lesson 0023: clean run across control loop, HPA requests denominator, NetworkPolicy allow lists, cert-manager Secret binding, readiness quarantine, LimitRange vs ResourceQuota, headless Service purpose, targetPort mismatch, Deployment pod recreation, rollout undo vs Git revert.
- Combined Quiz 02: clean run across cert-manager issuerRef, NetworkPolicy egress/DNS, liveness dependency trap, storage quota, CreateContainerConfigError, Ingress backend port vs targetPort, metrics-server vs requests for HPA unknown, helm template vs upgrade, ResourceQuota scheduling, ReplicaSet reconciliation, StatefulSet PVC binding, kustomize apply -k.
- Prior Combined Quiz 01: 11/12 (HPA requests gap) — appears fully remediated on Quiz 02 Q7 (metrics-server vs requests distinction).

## Diagnosis
Fundamentals track complete per MISSION.md success criteria at recall level: cross-arc scenario reasoning, preview-vs-deploy discipline, troubleshooting funnel, networking inside-out, probe consequence split, TLS automation chain, policy model. Prior weak spots (HPA denominator, readiness vs liveness on quizzes) held on sign-off.

## Implications
- **Fundamentals closed** — ready for next mission layer (homelab hardening, production patterns, or topics previously out of scope: CI/CD, operators, mesh, CKA prep).
- **Wisdom gap remains** — recall quizzes ≠ production muscle memory; real-world friction (multi-node, enforced NetworkPolicy, ACME on public domain) still ahead.
- Spaced re-quiz of Combined 01/02 in ~2–4 weeks optional for storage strength.
