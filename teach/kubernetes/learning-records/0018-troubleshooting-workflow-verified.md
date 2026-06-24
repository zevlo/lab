# Troubleshooting workflow verified; debugging reflex forming

User scored 5/5 on lesson 0017 quiz. Strong positive feedback on lesson, lab, and quiz.

## Evidence
- Quiz 5/5 on Pending vs logs, ImagePullBackOff → describe Events, Running pods + empty endpoints → selector check, CrashLoopBackOff → logs --previous, wrong namespace/context scope.
- Lab done with real debugging friction on Break C (two-pod rollout, `--previous` logs unavailable on OrbStack, discovered describe vs logs split and wrong-pod trap).
- Break D: understood RELATED layer (endpoints empty despite healthy pods); questioned inline JSON patch vs production YAML-edit workflow.

## Diagnosis
SCOPE→STATUS→EVENTS→LOGS→RELATED funnel landed. User debugged beyond the happy path and retained the concepts. Ready for deeper failure-mode lessons in the arc. Teaching style preferences updated: context default namespace, declarative fixes over imperative complexity, core kubectl toolkit first.

## Implications
- Troubleshooting arc continues: 0018 pod failure modes (Pending/OOM/scheduling).
- Future labs: `kubectl config set-context --current --namespace=…` at start; breaks via YAML files + apply; reserve patch/jsonpath for when declarative path is worse.
- Lesson 0017 Break C and Break D are candidates for agreed fixes later (OrbStack logs, selector break as YAML not patch) — do not change without user agreement.
