# Kubernetes Resources

## Knowledge

- [Official Docs: Concepts](https://kubernetes.io/docs/concepts/)
  The canonical source for how Kubernetes works — architecture, workloads, networking, storage, configuration. Use for: grounding any conceptual claim; always prefer this over blog posts.
- [Official Docs: Tutorials](https://kubernetes.io/docs/tutorials/)
  Maintainer-written walkthroughs (Kubernetes Basics, Hello Minikube, stateless/stateful app examples). Use for: guided hands-on sequences with a known-good path.
- [Official Docs: Standardized Glossary](https://kubernetes.io/docs/reference/glossary/?fundamental=true)
  The project's own term definitions. Use for: settling any terminology dispute; our local glossary mirrors this.
- [Official Docs: Learning Environment](https://kubernetes.io/docs/setup/learning-environment/)
  Options for practice clusters (minikube, kind, playgrounds). Use for: homelab/local-cluster setup decisions.
- [kubectl Quick Reference](https://kubernetes.io/docs/reference/kubectl/quick-reference/)
  Official command cheat sheet. Use for: command syntax during labs.
- [Official Docs: Object Management (kubectl)](https://kubernetes.io/docs/concepts/overview/working-with-objects/object-management/)
  Imperative vs declarative workflows, dry-run, diff, apply. Use for: how engineers author and validate manifests.
- [Official Docs: Resource Quotas](https://kubernetes.io/docs/concepts/policy/resource-quotas/)
  Namespace aggregate caps on CPU, memory, object counts. Use for: multi-tenant cluster policy, platform-team guardrails.
- [Official Docs: Limit Ranges](https://kubernetes.io/docs/concepts/policy/limit-range/)
  Per-container defaults and min/max in a namespace. Use for: enforcing resource declarations when ResourceQuota is active.
- [Task: Configure Memory and CPU Quotas for a Namespace](https://kubernetes.io/docs/tasks/administer-cluster/manage-resources/quota-memory-cpu-namespace/)
  Maintainer walkthrough of quota + LimitRange together. Use for: lab sequences on namespace resource policy.
- [Official Docs: Horizontal Pod Autoscaling](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/)
  HPA concepts, metrics types, stabilization windows, and API versions. Use for: autoscaling behavior and prerequisites (requests, metrics-server).
- [Task: Horizontal Pod Autoscaler Walkthrough](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/)
  Maintainer hands-on sequence with the `hpa-example` image and load generator. Use for: lab design for lesson 0012.
- [metrics-server (kubernetes-sigs)](https://github.com/kubernetes-sigs/metrics-server)
  The cluster metrics aggregator behind `kubectl top` and resource-based HPA. Use for: troubleshooting missing metrics on local clusters.
- [Kustomize — kubectl documentation](https://kubectl.docs.kubernetes.io/guides/introduction/kustomize/)
  Official Kustomize intro: base, overlays, transformers, built-in `kubectl apply -k`. Use for: manifest layering without Helm templates.
- [Task: Declarative Management Using Kustomize](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/kustomization/)
  Maintainer walkthrough of kustomization.yaml and overlays. Use for: lab sequences on base + staging/production.
- [Helm — Using Helm](https://helm.sh/docs/intro/using_helm/)
  Official intro: charts, releases, repositories, install/upgrade/rollback. Use for: package-manager mental model and command vocabulary.
- [Helm — Chart Template Guide](https://helm.sh/docs/chart_template_guide/getting_started/)
  How Go templates and values.yaml connect. Use for: chart anatomy labs and debugging rendered output.
- [Helm — Chart Best Practices: Values](https://helm.sh/docs/chart_best_practices/values/)
  How to structure values files and overrides. Use for: `-f` vs `--set` precedence and readable chart design.
- [Artifact Hub](https://artifacthub.io/)
  Search index for public Helm charts. Use for: finding vetted third-party charts (Traefik, metrics-server, etc.).
- [Official Docs: Persistent Volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)
  PV, PVC, binding, reclaim policies, access modes. Use for: stateful workload storage model.
- [Official Docs: Storage Classes](https://kubernetes.io/docs/concepts/storage/storage-classes/)
  Dynamic provisioning, volumeBindingMode, provisioners. Use for: why PVCs stay Pending.
- [Task: Configure a Pod to Use a PVC](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/)
  Maintainer walkthrough of PVC + pod mount. Use for: lab sequences on persistence.
- [local-path-provisioner (Rancher)](https://github.com/rancher/local-path-provisioner)
  Default-style provisioner for k3s/OrbStack local clusters. Use for: homelab dynamic provisioning setup.
- [Official Docs: StatefulSets](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/)
  Stable pod identity, ordered deployment, volumeClaimTemplates. Use for: stateful workload controller model.
- [Task: Run a Replicated Stateful Application](https://kubernetes.io/docs/tasks/run-application/run-replicated-stateful-application/)
  Maintainer MySQL StatefulSet walkthrough (headless Service + templates). Use for: lab design patterns; skip MySQL specifics for fundamentals.
- [Official Docs: Troubleshooting Applications](https://kubernetes.io/docs/tasks/debug/debug-application/)
  Hub for debugging containerized apps (not cluster internals). Use for: the canonical troubleshooting task index and links to pod/service/statefulset debug guides.
- [Task: Debug Pods](https://kubernetes.io/docs/tasks/debug/debug-application/debug-pods/)
  Maintainer walkthrough of pod triage — Pending, crashing, ImagePullBackOff. Use for: lesson design on STATUS → tool mapping.
- [Task: Determine the Reason for Pod Failure](https://kubernetes.io/docs/tasks/debug/debug-application/determine-reason-pod-failure/)
  How to read termination messages and failure reasons. Use for: CrashLoopBackOff and OOMKilled diagnosis.
- [Task: Debug Services](https://kubernetes.io/docs/tasks/debug/debug-application/debug-service/)
  Missing endpoints, selector mismatches, DNS, kube-proxy. Use for: networking-layer troubleshooting lessons.
- [Task: Declare a Network Policy](https://kubernetes.io/docs/tasks/administer-cluster/declare-network-policy/)
  Maintainer walkthrough of isolating pods by ingress rules. Use for: lab design on default-allow vs explicit-allow models.
- [cert-manager documentation](https://cert-manager.io/docs/)
  TLS automation via Certificate/Issuer CRDs; writes standard kubernetes.io/tls Secrets for Ingress. Use for: lesson 0022 lab design and Let's Encrypt vs selfSigned issuer tradeoffs.
- [Official Docs: Using RBAC Authorization](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)
  Role, ClusterRole, RoleBinding, ClusterRoleBinding, default roles, privilege escalation rules. Use for: any RBAC claim; lesson 0024.
- [Official Docs: Service Accounts](https://kubernetes.io/docs/concepts/security/service-accounts/)
  SA identity model, default SA, tokens, cross-namespace grants. Use for: workload identity vs human users.
- [Task: Configure Service Accounts for Pods](https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/)
  Assigning SAs, automount opt-out, TokenRequest / projected tokens. Use for: lab design and token lifecycle guidance.
- [Official Docs: Checking API Access](https://kubernetes.io/docs/reference/access-authn-authz/authorization/#checking-api-access)
  `kubectl auth can-i` and impersonation. Use for: diagnosing whether a ServiceAccount (not your admin user) is allowed a verb.
- [Task: Configure a Security Context for a Pod or Container](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/)
  `securityContext` fields: UID/GID, privileged, capabilities, seccomp, `allowPrivilegeEscalation`. Container fields override overlapping Pod fields. Use for: lesson 0025 lab design and any runtime-privilege claim.
- [Official Docs: Pod Security Standards](https://kubernetes.io/docs/concepts/security/pod-security-standards/)
  Three profiles (`privileged`, `baseline`, `restricted`) and the controls each requires. Use for: what “restricted” actually demands (`runAsNonRoot`, drop `ALL`, `RuntimeDefault` seccomp).
- [Official Docs: Pod Security Admission](https://kubernetes.io/docs/concepts/security/pod-security-admission/)
  Namespace labels (`enforce` / `warn` / `audit`). Enforce applies to Pod objects, not to the Deployment object itself. Use for: why `kubectl apply` on a Deployment can succeed while Pods are rejected.
- [Task: Enforce Pod Security Standards with Namespace Labels](https://kubernetes.io/docs/tasks/configure-pod-container/enforce-standards-namespace-labels/)
  Label a namespace to opt into a profile. Use for: lab sequences; pin a version in production, `latest` is fine on a local cluster.
- [OrbStack Kubernetes Documentation](https://docs.orbstack.dev/kubernetes)
  Official docs for the user's local cluster environment (service exposure via `*.k8s.orb.local`, kubelet config, Traefik/Ingress setup). Use for: anything specific to how the local lab cluster behaves on macOS.
- [Kubernetes the Hard Way — Kelsey Hightower](https://github.com/kelseyhightower/kubernetes-the-hard-way)
  Manual cluster bootstrap teaching component internals (etcd, API server, kubelet). Use for: LATER — once fundamentals are solid and the homelab demands deeper internals.
- [CNCF: Top 28 Kubernetes resources for 2026](https://www.cncf.io/blog/2026/01/19/top-28-kubernetes-resources-for-2026-learn-and-stay-up-to-date/)
  Curated meta-list from the foundation behind Kubernetes. Use for: discovering next-layer resources as the mission expands.

## Wisdom (Communities)

- [r/kubernetes](https://reddit.com/r/kubernetes)
  Large, active subreddit with production war stories. Use for: homelab troubleshooting, "is this normal?" questions.
- [Kubernetes Slack](https://slack.k8s.io/)
  Official project Slack (#kubernetes-novice, #kubeadm, etc.). Use for: direct questions to practitioners and maintainers.
- [r/homelab](https://reddit.com/r/homelab)
  Use for: hardware and homelab-architecture questions that aren't Kubernetes-specific.
- KubeCraft community
  User is already a member (completed their fundamentals course). Use for: continuity with prior learning.

## Gaps

- No vetted resource yet for homelab-specific Kubernetes distros (k3s vs Talos vs kubeadm) — needed when homelab build gets serious.
