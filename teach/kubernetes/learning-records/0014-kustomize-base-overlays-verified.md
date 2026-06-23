# Kustomize base & overlays verified; manifest layering landed

User scored 5/5 on lesson 0013 quiz.

## Evidence
- Quiz 5/5 on overlay `replicas` field, patch targets using base name (not prefixed), `images.name` without tag, debugging via rendered output vs live endpoints, Kustomize vs Helm distinction.
- Lab friction: user ran `kubectl kustomize` (preview) then checked cluster for `stg-api` before `apply -k` — empty namespace expected. Step 3/4 lesson wording clarified preview ≠ deploy.

## Diagnosis
Manifest tooling layer solid on top of lesson 0010 pipeline. User grasps base/overlay split, transformers, and that Kustomize is a build step before the same declarative apply. Selector-break via patch connects back to 0010 endpoints debugging — pattern transferring across tools.

## Implications
- Manifest arc (0010 scaffold/apply → 0013 Kustomize) complete for homelab-scale layering.
- Keep explicit `kustomize` vs `apply -k` distinction in any future tooling lessons (Helm would need same).
- Candidates for 0014: PersistentVolumes (stateful homelab workloads); Helm intro (contrast with Kustomize); cert-manager; NetworkPolicies.
- Quiz spacing: overlay patch naming + Service selector scenarios worth revisiting in a later combined quiz.
