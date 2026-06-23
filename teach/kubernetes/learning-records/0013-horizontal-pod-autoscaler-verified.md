# Horizontal Pod Autoscaler verified; metrics pipeline wired on OrbStack

User scored 5/5 on lesson 0012 quiz.

## Evidence
- Quiz 5/5 on missing CPU requests → `<unknown>` TARGETS, HPA vs ResourceQuota partial scale-out, HPA reconciling manual scale within bounds, metrics-server dependency, EndpointSlice/readiness path for new replicas.
- Lab blocked initially: APIService NotFound (metrics-server not installed on OrbStack); Helm failed on stale `rancher-desktop` context (:6443). Fixed: `kubectl config use-context orbstack`, Helm install metrics-server, kubelet `featureGates: PodAndContainerStatsFromCRI`. User confirmed OrbStack setup working.

## Diagnosis
HPA control-loop model landed — user connects metrics → replica patch → Deployment/ReplicaSet from prior lessons. Can distinguish `<unknown>` (missing requests / metrics) from quota/scheduling caps. Homelab metrics-server is now a known one-time OrbStack prerequisite, not a surprise.

## Implications
- Scaling arc (manual scale 0004 → HPA 0012) complete for CPU resource metrics.
- Keep `kubectl config use-context orbstack` callout in OrbStack labs; warn when multiple contexts share localhost ports.
- Candidates for 0013: Kustomize (manifest layering), PersistentVolumes, cert-manager, or custom-metrics HPA — Kustomize or PVs are natural next ops topics.
- Occasional quiz spacing: HPA + quota + requests in one scenario (already in 0012 Q2).
