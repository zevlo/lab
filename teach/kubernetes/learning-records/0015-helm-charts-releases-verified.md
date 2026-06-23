# Helm charts & releases verified; manifest tooling arc complete

User scored 5/5 on lesson 0014 quiz.

## Evidence
- Quiz 5/5 on `helm template` vs `helm install`, multiple releases from one chart, debugging via rendered selector vs pod labels, `upgrade --install` idempotency, Helm vs Kustomize fit.
- No lab friction reported — preview/deploy distinction from 0013 likely transferred cleanly.

## Diagnosis
Helm mental model landed on first pass. User connects chart/release/values vocabulary, understands revision history and rollback as the differentiator from Kustomize, and applies the same rendered-output debugging pattern (selector/endpoints) across manifest tools.

## Implications
- Manifest tooling arc (0010 → 0013 Kustomize → 0014 Helm) complete.
- Prior Helm usage (Traefik, metrics-server) now grounded in first principles — future add-on installs can reference 0014 patterns.
- Natural next gap: **storage** — pods taught as ephemeral; ConfigMap volumes hold config not durable app data; Helm Postgres/Redis charts assume PVC literacy.
- Candidates for 0016: StatefulSets; cert-manager; NetworkPolicies.
- Quiz spacing: Helm template vs install + Service selector scenarios worth revisiting in a later combined quiz.
