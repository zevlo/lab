# LimitRange & ResourceQuota verified; three-layer resource model landed

User scored 5/5 on lesson 0011 quiz.

## Evidence
- Quiz 5/5 on quota aggregate math (3×150m cap), LimitRange default injection under quota, Forbidden on max violation, quota vs per-pod request distinction, no retrofit of running pods.
- Lesson 0011 used varied `data-correct` indices (2, 1, 0, 3, 2) plus shuffle JS — reduces position-bias concern from 0010.

## Diagnosis
Namespace guardrails layer is solid. User can distinguish admission Forbidden (LimitRange max), ReplicaSet FailedCreate (quota aggregate), and lesson-0009 Pending (node allocatable). Resource-management arc (0009 → 0011) complete.

## Implications
- Can advance to scaling (HPA) or manifest tooling (Kustomize) — both build on requests/limits and authoring workflow.
- HPA is the tighter next step: connects rollouts (0004), resources (0009), and namespace policy; homelab needs metrics-server check on OrbStack.
- Keep scenario-based quiz difficulty; interleave resource/quota concepts occasionally in future quizzes for spacing.
