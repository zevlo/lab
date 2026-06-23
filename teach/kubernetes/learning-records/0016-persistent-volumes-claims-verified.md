# Persistent volumes & claims verified; storage foundation landed

User scored 5/5 on lesson 0015 quiz.

## Evidence
- Quiz 5/5 on data surviving pod delete via PV/PVC binding, WaitForFirstConsumer Pending behavior, PVC describe for Helm chart failures, emptyDir vs PVC choice, wrong StorageClass staying Pending.
- No lab friction reported.

## Diagnosis
PVC mental model solid: user grasps pod ephemeral vs claim durable, binding diagnostics (describe PVC events), and StorageClass as provisioner gate. Ready for the workload controller built on top of PVCs — StatefulSets.

## Implications
- Storage arc continues: 0015 PVC wiring → 0016 StatefulSets (stable identity + volumeClaimTemplates).
- Helm Postgres/Redis charts often deploy StatefulSets — 0016 connects storage lesson to real chart internals.
- Candidates for 0017: cert-manager; NetworkPolicies; reclaim policies / StorageClass deep-dive.
- Quiz spacing: PVC Pending vs pod Pending distinction worth revisiting alongside StatefulSet ordinal scenarios.
