# Teaching notes

## Conventions

- ISO 24495-1 plain language (relevant, findable, understandable, usable).
- Leave teaching-meta words such as "pareto" out of lesson copy.
- No role title or employer name in any lesson or reference doc.
- Randomized quizzes: vary `data-correct` positions in the source and shuffle options with Fisher-Yates on every page load.

## Environment

- macOS on Apple Silicon, Homebrew, OrbStack (Docker 29.4.0).
- Kubernetes contexts: `homelab` (current) and `orbstack`. Installed: git 2.55, kubectl 1.37, Helm 4.3, argocd CLI, terraform, gh, Python 3.12 (mise).
- Not installed at start: ansible, trivy, gitleaks, cosign, syft, gitlab-runner, glab, oc.
- OrbStack machine `linux-lab` (Ubuntu 24.04, arm64) exists. Create a `rocky:9` machine for the Ansible and STIG lessons.
- Lab repos live in `~/devsec-lab/`, outside the `/Users/za/lab` Git repo. Lesson 0001 creates `~/devsec-lab/gate-demo`. Lesson 0002 pushes it to GitLab.com.
- STAR story drafts live in `~/devsec-lab/star-stories.md`, outside any Git repo.
- Trivy: use v0.74.0 or later. Never use v0.69.4 (binary) or v0.69.5 and v0.69.6 (Docker Hub images). These were compromised in March 2026.
- CI platform: GitLab.com free tier with a project runner on the Mac. Hosted runners need identity verification; a local runner avoids that and uses no compute minutes.

## Roadmap

Build each lesson only after the previous quiz score is recorded. If the interview date moves up, skip to 0010.

| # | Lesson | Status |
|---|---|---|
| 0001 | Security gate: secrets and dependencies (Gitleaks, Trivy) | Built 2026-09-30 |
| 0002 | GitLab CI with your own runner; the gate as a merge check | — |
| 0003 | Ansible: idempotent hardening of Rocky 9, Vault, check mode | — |
| 0004 | Threat model (four questions, STRIDE) and risk ranking (CVSS, EPSS, KEV, SSVC) | — |
| 0005 | Compliance: RMF, SP 800-53, STIG scan and fix with OpenSCAP, SP 800-171 and CMMC | — |
| CQ01 | Combined quiz on 0001–0005 | — |
| 0006 | GitOps with Argo CD: drift, self-heal, rollback by revert | — |
| 0007 | Supply chain: SBOM, signing, verifying the tools you run (Trivy incident) | — |
| 0008 | Optional: Terraform and IaC scanning | — |
| 0009 | Optional: Kubernetes admission policy and OpenShift SCC | — |
| CQ02 | Combined quiz on 0006–0009 | — |
| 0010 | Mock panel interview, behavioral and technical | — |

## Working notes

- Interview format: the employer's interview guide says most hiring managers use STAR (Situation, Task, Action, Result). Candidate reports (low trust) describe a panel with mostly behavioral questions, where technical depth comes out through questions about past work. Each lesson adds one STAR prompt, so story practice is spaced across the two weeks.
- Skill areas in the job description (map STAR stories to these; keep the role and employer names out of lessons):
  1. Maintain development infrastructure, with some system administration.
  2. Technical expertise: coding, scripting, automation, cloud, containers, Kubernetes.
  3. Security knowledge: principles, threat modeling, risk assessment, security testing tools.
  4. Automation mindset: security in CI/CD with Argo CD, Ansible, GitLab CI, and automated testing tools.
  5. Risk management: assess, prioritize, and manage risk in line with business goals.
  6. Compliance and governance: meet legal and regulatory security requirements.
  - Required: Git, Ansible, Kubernetes. Desired: AWS, OpenStack, Azure, or OpenShift; Helm; Linux; Argo CD; CI/CD; Terraform; Bash; software development.
- GitLab Free includes SAST, secret detection, and container scanning (JSON report artifacts). Dependency scanning and security dashboards need Ultimate, so Trivy covers SCA.

| Date | Lesson | Result | Notes |
|---|---|---|---|
| 2026-09-30 | 0001 built | — | Lab verified in `debian:stable-slim` (arm64) with Gitleaks 8.30.1 and Trivy 0.74.0, release checksums verified. Homebrew ships the same versions. The first Trivy run downloads a 119 MB database (about 4 minutes here). Unfiltered scan: 5 findings (PyYAML CVE-2020-14343 CRITICAL, 4 MEDIUM in requests), exit 0. With `--severity HIGH,CRITICAL --exit-code 1`: 1 finding, exit 1. PyYAML 6.0.3 and requests 2.34.2: 0 findings. |
