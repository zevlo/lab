# Combined Scenario Quiz 01 — 11/12; HPA `<unknown>` denominator gap

User scored 11/12 on combined scenario quiz 01.

## Evidence
- Missed Q11: chose "Ingress must expose Prometheus metrics" for HPA `TARGETS <unknown>/70%` with three Running pods under load. Correct: CPU requests not set on containers.
- Other arcs solid on recall: SCOPE, readiness vs liveness (Q2/Q3), networking funnel, OOM, PVC Pending, rollout containment, Helm template, Kustomize apply -k, StatefulSet ordering.

## Misconception
User may be conflating **resource metrics HPA** (CPU/memory via metrics-server + requests) with **custom/external metrics HPA** (Prometheus adapter, etc.). Ingress exposes HTTP routes — it is not in the HPA metrics pipeline for standard CPU utilization.

## Rule to lock in
- **Numerator:** metrics-server → current pod CPU usage (`kubectl top`)
- **Denominator:** `resources.requests.cpu` on each container
- **Formula:** utilization % = usage / request — no request → `<unknown>`
- **Separate failure:** metrics-server down → also `<unknown>` or scaling stalls; check `kubectl top pod` first

## Implications
- Readiness/liveness split held on Q2/Q3 — prior 0020 miss appears remediated on quiz recall.
- HPA requests denominator worth one more spaced scenario if custom-metrics topic is taught later.
- Ready for cert-manager or NetworkPolicies when user chooses.
