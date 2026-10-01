# Prior knowledge baseline: strong platform floor, no security or compliance practice

2026-09-30. The learner has a verified floor in Git, Kubernetes, Helm, the shell, Docker, and Python from sibling workspaces. They report basic hands-on use of AWS, Ansible, Terraform, Argo CD, and Trivy, and no experience with GitLab CI or compliance frameworks. The interview is expected in about two weeks, with about 2 hours a day to study.

## Evidence

- Kubernetes (`teach/kubernetes`): fundamentals signed off, with 10/10 on lesson 0023 and 12/12 on combined quiz 02 (record 0023). RBAC and ServiceAccounts 5/5 (record 0024). Helm, Kustomize, NetworkPolicy, and cert-manager verified. Lesson 0025 (Pod security context) was built, but no result is recorded.
- Git (`teach/missing-semester`, record 0044): the blob, tree, and commit model, staging, refs, and HEAD, 4/4.
- Shipping (`teach/missing-semester`, record 0045): artifacts, SemVer, app lock files, images versus containers, and Compose, 4/4.
- Code quality (`teach/missing-semester`, record 0048): format versus lint, check-only CI, Git hooks, and GitHub Actions YAML, 4/4.
- Shell: `$?` and return codes (Missing Semester lesson 0023). Shebang, `set -euo pipefail`, and `chmod +x` (record 0022). Bash track lessons 0001–0005 at 4/4. Lesson 0006 (command substitution, commands as conditions) was built, with no result recorded.
- Python (`teach/python`): fundamentals through list comprehensions, including subprocess, JSON, errors, and environment variables. Writing classes was beyond the zone of proximal development (record 0019).
- AWS (`teach/aws`): basic console use; public subnet and EC2 reachability (records 0001–0002).
- Self-reported: basic use of AWS, Ansible, Terraform, Argo CD, and Trivy. No GitLab CI. No compliance frameworks (RMF, NIST SP 800-53, STIGs, CMMC).

## Implications

- Do not re-teach Git, Kubernetes, Helm, the shell, Docker, or Python. Use them as reuse points and as mixed-in quiz items.
- Start GitLab CI, threat modeling, risk ranking, and compliance from zero.
- Ansible, Argo CD, Terraform, and Trivy start from "basic use". Probe the depth in the first lesson that touches each one before assuming more.
- The Git object model supports lesson 0001: a deleted secret stays in an older commit. Return codes support the gate contract (exit 0 passes, nonzero fails).
