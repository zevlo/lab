# RBAC and ServiceAccounts verified

User scored 5/5 on lesson 0024 quiz after completing the ship/break/fix lab (default SA denial, least-privilege RoleBinding, get-vs-list verbs, subject typo, missing ServiceAccount on Deployment).

## Evidence
- Quiz covered default SA assignment, RoleBinding-to-ClusterRole namespace scoping, auth can-i --as for Pod identity vs admin kubeconfig, list vs get verbs, and missing SA create failures.
- Lab exercises the production diagnosis pattern: impersonate the ServiceAccount, not the OrbStack admin user.

## Implications
- Workload identity + least-privilege RBAC is a new floor for ops hardening.
- Natural next topics: SecurityContext / Pod Security Standards, Jobs/CronJobs, or PodDisruptionBudgets — all build on "who runs" and "what may change."
- Optional later: human-user RBAC / OIDC (out of Pod SA path) when mission needs shared-cluster access control.
