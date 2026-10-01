# Mission: Pass a DevSecOps engineering panel interview

## Why

You have a panel interview in about two weeks for the Dev Sec Engineering – Level 2 role at Lockheed Martin Space. You want to answer its behavioral and technical questions with confidence, and to be useful from your first day. The job centers on security in CI/CD (GitLab CI, Ansible, Argo CD), risk management, and compliance. It builds on the Git, Kubernetes, and Linux skills you already have.

## Success looks like

- In about two minutes, you explain how you would secure a CI/CD pipeline: which control runs at each stage, and which findings block a merge.
- You run a GitLab CI pipeline with security scans on a runner that you registered yourself.
- You write an idempotent Ansible playbook that hardens a RHEL-family host and keeps its secrets in Ansible Vault.
- You threat model a small system and rank its findings by real risk, not by count.
- You explain how RMF, NIST SP 800-53, DISA STIGs, and NIST SP 800-171 with CMMC fit together. You show a STIG scan before and after a fix.
- You deploy with Argo CD and use Git to recover from drift and from a bad release.
- You tell at least five STAR stories that cover the job's skill areas. Each has specific actions and a measurable result.

## Constraints

- Interview expected around 2026-10-14 (date not confirmed). About 2 hours a day.
- macOS on Apple Silicon, with OrbStack for containers, Kubernetes, and Linux machines.
- A GitLab.com free account, with a runner on the Mac. No paid cloud resources.
- Git, Kubernetes, Helm, Bash, Docker, and Python are taught in sibling workspaces. Reuse them; do not re-teach them.

## Out of scope

- Certification cramming (for example, Security+ or CKS).
- LeetCode-style algorithm practice.
- Service mesh.
- GitHub Actions. GitLab CI is the target platform.
- OpenStack and Azure. AWS covers the cloud basics.
