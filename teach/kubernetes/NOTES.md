# Teaching Notes

Scratchpad for teaching preferences and session history. Per the teach skill: preferences drive lesson design; working notes capture completions and friction.

## Preferences

### Learning style
- Hands-on local cluster + quizzes for retention. Not reading-first.
- Intense pace — multiple sessions per week; each lesson stays small and self-contained.
- Ship / break / fix labs work well. User learns from debugging unexpected friction — preserve it.
- Quiz: equal-length options; vary `data-correct`; scenario-based stems (2+ concepts) since lesson 0005.
- User reads lab output closely — expected-output text must be precise; hedge version-dependent output.

### Environment
- **OrbStack on macOS** — context `orbstack`, single node. No `minikube` commands.
- Quirks: no bundled Ingress (install Traefik once); `*.k8s.orb.local` for LB/Ingress; metrics-server not bundled (Helm install); stale `rancher-desktop` context → connection refused on :6443.
- Pod metrics on older OrbStack may need kubelet `featureGates: PodAndContainerStatsFromCRI: true`.

### Mission
- Dual: job competence + homelab. Tie lessons to both where possible.

### Lesson & manifest edits
- **Do not change lesson content or lab manifests without explicit user agreement.**
- **When user is stuck during a lab: explain in chat only.** Do not edit lessons or YAML unless they explicitly ask.

### Lab & kubectl conventions
- **Namespace on context** — after creating the lab namespace, run `kubectl config set-context --current --namespace=<ns>`. Omit `-n` from lab commands unless teaching cross-namespace scope. Reset to `default` after cleanup if useful.
- **Diagnose with CLI; fix with manifests** — inspection funnel first (`get` → `describe` → `logs` → `endpoints`). Fixes: edit YAML → `kubectl diff` (when useful) → `kubectl apply`. Matches Git-tracked production workflow.
- **Core kubectl toolkit** (daily): `get`, `describe`, `logs`, `apply`, `delete`, `get endpoints`, `config current-context`, `rollout status`, `get rs`.
- **Deploy-incident triage** (production): after an `apply`/upgrade breaks a Deployment → `rollout status` → `get rs` (old vs new ReplicaSet) → `describe`/`logs` on the failing pod. `rollout undo` is **recovery** (stop the bleeding), not root-cause diagnosis; at work the durable fix is usually revert the manifest in Git and re-apply.
- **Command complexity budget** — no inline JSON `patch` or jsonpath one-liners when a YAML file teaches the same lesson. Basic `patch` / `set image` only when they illustrate a distinct ops move; note the YAML equivalent.
- **OrbStack gotchas** — Break C: `--previous` logs may fail on fast-crashing containers; two-pod stuck rollouts during RollingUpdate are real friction (intentional).
- **EndpointSlice vs Endpoints** — Kubernetes v1.33+ deprecates `kubectl get endpoints` (warning: use `discovery.k8s.io/v1 EndpointSlice`). Prefer `kubectl get endpointslice -l kubernetes.io/service-name=<svc>` in new lessons; `get endpoints` still works on older clusters. Lesson 0002/0005 already use EndpointSlice.

## Roadmap

**Troubleshooting arc:** 0017 workflow ✓ → 0018 pod failure modes ✓ → 0019 service/ingress path ✓ → 0020 rollout/Helm revision debugging [next].

**Closed arcs:** fundamentals/control loop (0001–0003) · rollouts/probes (0004–0006) · namespaces/TLS (0007–0008) · resources/quota (0009–0011) · HPA (0012) · Kustomize/Helm (0013–0014) · storage/StatefulSets (0015–0016).

## Working notes

| Lesson | Quiz | Notes |
|--------|------|-------|
| 0019 | 5/5 | Service/Ingress path landed. Inside-out funnel: EndpointSlice → targetPort → Ingress backend. |
| 0018 | 5/5 | Pod failure modes landed. User validates break/fix via separate YAML or vim edit workflow. |
| 0017 | 5/5 | Great lesson/lab/quiz. Break C: rollout friction + OrbStack logs valuable. Break D: patch → YAML. Conventions above locked 2026-06-23. |
| 0016 | 5/5 | StatefulSets landed. |
| 0015 | 5/5 | PVC foundation. |
| 0014 | 5/5 | Helm arc closed. |
| 0013 | 5/5 | Kustomize: preview ≠ apply. |
| 0012 | 5/5 | metrics-server + context switch friction on OrbStack. |
| 0005 | 4/5 | readiness vs liveness consequence split still forming — revisit in scenario quizzes. |
| 0001 | 5/5 | Lesson length/density right. |

**Recurring patterns:** containment during failed rollouts (watch pod status, not HTTP) · selector/endpoints debugging · user troubleshoots independently at host/cluster boundary (lesson 0002 port-forward).

**Lesson 0017 cleanup (2026-06-23):** namespace on context; breaks via YAML files; Break C keeps rollout friction; rollout triage documented in conventions.
