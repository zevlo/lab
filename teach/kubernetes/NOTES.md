# Teaching Notes

## Preferences (stated 2026-06-10; updated 2026-06-16)
- Practice style: hands-on with a local cluster + quizzes for retention. Not reading-first.
- Local environment is **OrbStack on macOS** (context `orbstack`, single node `orbstack`). Used minikube on LabEx; previously Rancher Desktop. ALL labs must target OrbStack — no `minikube` commands. Mind its quirks: no Ingress controller bundled (install Traefik once for ingress labs), LoadBalancer/Ingress reachable via `*.k8s.orb.local`, `kubectl` bundled in PATH, single-node so no multi-node scheduling exercises. **metrics-server** is not bundled — install once via Helm; ensure current context is `orbstack` (:26443), not stale `rancher-desktop` (:6443). Pod metrics on older OrbStack may need kubelet `featureGates: PodAndContainerStatsFromCRI: true`.
- Pace: intense — multiple sessions per week. Keep individual lessons small anyway.
- Mission is dual: job competence + homelab. Tie lessons to both where possible; homelab gives good "real stakes" framing.

## Working notes
- 2026-06-10: Workspace initialized. Lesson 0001 = desired state & the control loop (retrieval-heavy, doubles as diagnostic of what stuck from their prior course).
- 2026-06-10: Lesson 0001 quiz: **5/5** (→ learning record 0002). Conceptual explanation "well explained" — current lesson length/density is right; keep it.
- Lesson 0001 lab updated for Rancher Desktop (was minikube); re-targeted to OrbStack 2026-06-16.
- Lesson 0002 complete: quiz **5/5** (→ learning record 0003). Lab done end-to-end on Rancher Desktop; user independently troubleshot a stale port-forward blocking localhost:8080. On OrbStack, LoadBalancer services use `*.k8s.orb.local` instead — no port-forward UI gotchas.
- 2026-06-16: User switched local K8s from Rancher Desktop to OrbStack. Ingress labs need one-time Traefik install; hostnames use `*.k8s.orb.local`.
- User responds well to troubleshooting; start including deliberately-broken diagnose-and-fix exercises.
- Lesson 0003 complete: quiz **5/5** (→ learning record 0004). IP-per-pod insight landed; troubleshooting Q answered on intuition (keep drilling the describe/get/logs flow). Lesson's step-5 expected output was imprecise (describe doesn't always show an explicit endpoint error) — fixed; lesson expected-outputs must hedge version-dependent output.
- User reads lab output closely and reports discrepancies — keep expected-output text precise.
- Quiz design: equal-length options; **never** leave all correct answers as option A — vary `data-correct` in HTML; quiz JS shuffles options on page load (added 2026-06-14 across all lessons).
- Lesson 0004 complete: quiz **5/5** (→ learning record 0005), "great lesson" feedback. The ship/break/rollback arc works well — keep that structure.
- Four straight 5/5s: raise quiz difficulty from 0005 onward — scenario-based stems combining 2+ concepts, rather than single-fact recall.
- Lesson 0005 complete: quiz **4/5** (→ learning record 0006). Lab done end-to-end. Topic felt less clear than prior lessons — readiness/liveness consequence split still forming; user missed the "liveness checks DB → restart storm" scenario (confused design rule with runtime behavior). Keep ship/break/fix labs; add tighter upfront contrast when concepts differ by consequence. Harder quiz format felt right.
- Before 0006: briefly re-anchor readiness vs liveness with a one-line decision rule.
- 2026-06-11: Lesson 0006 complete — quiz **5/5** (→ learning record 0007). Lab good. Step 4 break felt like a no-op: containment kept curl working; user watched HTTP not pods. Fixed step 4 wording + diagnostics. When rollout failures are contained, always say which signal to watch.
- 2026-06-11: Lesson 0006 published — ConfigMaps & Secrets (volume live-update vs env frozen, Secret ≠ encryption, CreateContainerConfigError break/fix). Reference: `reference/configuration-patterns.html`. Glossary updated.
- 2026-06-11: Lesson 0007 published — Namespaces & contexts (scope vs aim, -A diagnostic, cross-ns FQDN, invisible deploy to wrong namespace). Reference: `reference/namespaces-contexts.html`. Glossary: context, kubeconfig.
- 2026-06-11: Lesson 0007 complete — quiz **5/5** (→ learning record 0008). User chose TLS for 0008.
- 2026-06-11: Lesson 0008 published — TLS on Ingress (self-signed Secret, spec.tls, SNI hostname match, break via wrong secretName — HTTP still works). Reference: `reference/ingress-tls.html`. Glossary: Ingress TLS.
- 2026-06-13: Lesson 0008 complete — quiz **5/5** (→ learning record 0009). Lab complete after step 2 fix. User expected curl body to differ for HTTPS; clarified transport vs content. Step 2 lesson bug fixed (port-forward before Ingress).
- 2026-06-14: Lesson 0009 published — Resource requests/limits (scheduler uses requests, kubelet enforces limits, OOMKilled vs Pending break/fix). Reference: `reference/resource-management.html`. Glossary: resource request, limit, QoS, OOMKilled, allocatable.
- 2026-06-14: Lesson 0009 complete — quiz **5/5** (→ learning record 0010). Follow-up question on manifest authoring workflow.
- 2026-06-14: Lesson 0010 published — Manifest authoring (dry-run scaffold, strip server fields, server dry-run + diff, apply; break via Service selector typo). Reference: `reference/manifest-authoring.html`. Glossary: dry-run, kubectl diff.
- 2026-06-14: Lesson 0010 step 2 fix — `kubectl expose` requires live Deployment; use `create service clusterip … --dry-run=client` for scaffold.
- 2026-06-14: Lesson 0010 complete — quiz **5/5** (→ learning record 0011). User flagged quiz answer position bias (0008–0010 all option A). Fixed: shuffle options on load in all lesson quiz JS; future lessons must vary `data-correct` in source too.
- 2026-06-14: Lesson 0011 published — LimitRange & ResourceQuota (quota without resources fails; LimitRange defaults; scale past quota; LimitRange max Forbidden). Reference: `reference/namespace-resource-policies.html`. Glossary: ResourceQuota, LimitRange.
- 2026-06-14: Lesson 0011 complete — quiz **5/5** (→ learning record 0012). Resource-management arc (0009–0011) closed.
- 2026-06-18: Lesson 0012 step 1 fix — OrbStack does not ship metrics-server (APIService NotFound is expected until install). Kubelet gate must use `featureGates: PodAndContainerStatsFromCRI: true`, not a bare top-level key. Gotcha: leftover `rancher-desktop` kubeconfig context points at :6443 — Helm/kubectl fail with connection refused until `kubectl config use-context orbstack` (:26443).
- 2026-06-18: Lesson 0012 complete — quiz **5/5** (→ learning record 0013). Lab unblocked after metrics-server install + context switch. Scaling arc (0004 → 0012) closed.
- 2026-06-18: Lesson 0013 step 3/4 clarification — `kubectl kustomize` is preview-only; empty namespace after preview is expected until `apply -k`.
- 2026-06-18: Lesson 0013 complete — quiz **5/5** (→ learning record 0014). Lab friction: previewed without apply; lesson wording fixed. Manifest arc (0010 → 0013) closed.
- 2026-06-19: Lesson 0014 complete — quiz **5/5** (→ learning record 0015). Manifest tooling arc (0010 → 0014) closed.
- 2026-06-19: Lesson 0015 complete — quiz **5/5** (→ learning record 0016). Storage foundation landed.
- 2026-06-19: Lesson 0016 published — StatefulSets (headless Service, volumeClaimTemplates, stable ordinals db-0/db-1, ordered scale, break by deleting PVC). Reference: `reference/statefulsets.html`. Glossary: StatefulSet, headless Service, volumeClaimTemplate.
- Candidates for 0017: cert-manager; NetworkPolicies; reclaim policies deep-dive.
