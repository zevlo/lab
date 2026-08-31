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

### Writing (from 0025)
- Follow the [Google developer documentation style guide](https://developers.google.com/style): clarity, brevity, inclusivity.
- Second person, active voice, sentence-case headings, serial commas, US English.
- Conditions before instructions. Descriptive link text (page title, not “docs” or “click here”).
- Short sentences. No idioms, metaphors, slang, or ableist language.
- Inclusive terms: allowlist/blocklist, controller/replica. Do not use “simply,” “just,” or “please” in procedures.
- Do not rewrite lessons 0001–0024 unless the user asks.

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

**Troubleshooting arc:** 0017–0020 ✓ complete.

**Closed arcs:** fundamentals/control loop (0001–0003) · rollouts/probes (0004–0006) · namespaces/TLS (0007–0008) · resources/quota (0009–0011) · HPA (0012) · Kustomize/Helm (0013–0014) · storage/StatefulSets (0015–0016) · troubleshooting (0017–0020).

**TLS automation:** 0022 cert-manager ✓. **Network security:** 0021 NetworkPolicies ✓.

**Fundamentals track:** ✓ **COMPLETE** (2026-06-30) — lessons 0001–0023. Sign-off: lesson 0023 **10/10**, Combined Quiz 02 **12/12**. Prior Combined Quiz 01: 11/12 (HPA gap remediated on 02).

**Ops hardening arc (post-fundamentals):** 0024 RBAC + ServiceAccounts ✓. **0025** SecurityContext + Pod Security Standards (in progress). Candidates after: Jobs/CronJobs · PDBs · enforced NetworkPolicy · public ACME.

**OrbStack quirk (0021):** k3s starts with `--disable-network-policy` — policies apply to API only, not enforced. Lab is read-and-predict unless kind/other cluster used.

## Working notes

| Quiz | Score | Notes |
|------|-------|-------|
| Combined 02 | 12/12 | Fundamentals sign-off. cert-manager, NetworkPolicy, HPA metrics vs requests all clean. |
| Combined 01 | 11/12 | Strong cross-arc recall. Q11: conflated resource HPA with Prometheus/custom metrics path. |

| Lesson | Quiz | Notes |
|--------|------|-------|
| 0024 | 5/5 | RBAC + ServiceAccounts landed. auth can-i --as, RoleBinding scope, get vs list clean. |
| 0023 | 10/10 | Fundamentals wrap-up. Clean integration recall; track sign-off with Quiz 02 12/12. |
| 0022 | 5/5 | cert-manager landed. Issuer → Certificate → Secret → Ingress; three breaks clean. |
| 0021 | 5/5 | NetworkPolicy model landed. OrbStack: enforcement off; lab conceptual. |
| 0020 | 4/5 | Deploy-incident triage landed. Missed readiness-vs-liveness on wrong probe port (same gap as 0005). Arc complete. |
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
