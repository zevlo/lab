# StatefulSets verified; storage arc closed

User scored 5/5 on lesson 0016 quiz.

## Evidence
- Quiz 5/5 on Deployment vs StatefulSet pod naming, volumeClaimTemplate PVC naming (`data-db-0`), headless Service requirement, PVC surviving scale-down, Helm Postgres → StatefulSet connection.
- No lab friction reported.

## Diagnosis
StatefulSet mental model landed on first pass. User grasps stable ordinals, per-replica PVCs, ordered scaling, and the ops hazard of manually deleting StatefulSet PVCs. Storage arc (0015 PVC → 0016 StatefulSet) is solid.

## Implications
- User explicitly requested a **troubleshooting arc** next — real DevOps-applicable skills, not new resource types.
- Prior lessons scattered diagnostic habits (describe/events, endpoints, PVC vs pod Pending); 0017 should **formalize the workflow** into a repeatable reflex.
- Troubleshooting arc plan: 0017 workflow + status vocabulary → 0018 pod failure modes deep-dive → 0019 service/ingress/network path → 0020 rollout/Helm debugging.
- Quiz spacing: revisit "diagnose the right object" (pod vs PVC vs endpoints) inside scenario stems.
