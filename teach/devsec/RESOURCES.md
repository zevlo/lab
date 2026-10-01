# DevSecOps Resources

## Knowledge

### Secure pipelines

- [OWASP DevSecOps Guideline: Overview](https://github.com/OWASP/DevSecOpsGuideline/blob/master/current-version/0-Intro/0-2-Overview.md) — Community guide to pipeline controls, with a recommended order for adding them and rules for gates that do not block delivery. Use for: the control order and gate policy in lesson 0001.
- [OWASP DevSecOps Guideline project page](https://owasp.org/www-project-devsecops-guideline/) — Entry point to the full guideline and its tool lists. Use for: going deeper on one control.
- [NIST SP 800-204D](https://csrc.nist.gov/pubs/sp/800/204/d/final) — NIST strategies for software supply chain security in CI/CD pipelines. Use for: authoritative wording on pipeline threats, OIDC, and GitOps.
- [NIST SP 800-218, SSDF 1.1](https://csrc.nist.gov/pubs/sp/800/218/final) — The Secure Software Development Framework: a core set of secure development practices. Use for: naming the federal baseline for secure development.
- [DoD Enterprise DevSecOps Fundamentals v2.5](https://dodcio.defense.gov/Portals/0/Documents/Library/DoD%20Enterprise%20DevSecOps%20Fundamentals%20v2.5.pdf) — DoD definitions of software factories, the DevSecOps lifecycle, and continuous authorization. Use for: defense-sector vocabulary.
- [DoD CIO Library](https://dodcio.defense.gov/Library/) — Index of current DoD DevSecOps reference designs, playbooks, and memos. Use for: finding the newest version of a DoD document.

### Scanners

- [Gitleaks](https://github.com/gitleaks/gitleaks) — Secret scanner README: the `git`, `dir`, and `stdin` commands, exit codes, `.gitleaksignore`, and config. Use for: the lesson 0001 lab.
- [Trivy documentation](https://trivy.dev/docs/latest/) — Official docs for scanning files, images, IaC, and SBOMs. Use for: flags and output formats.
- [Trivy: filtering](https://trivy.dev/docs/latest/configuration/filtering/) — Filter by severity, by fix status (`--ignore-unfixed`), and by ID (`.trivyignore`). Use for: gate thresholds and exceptions.
- [Trivy: exit code](https://trivy.dev/docs/latest/configuration/others/) — States that Trivy exits 0 by default, even when it finds issues. Use for: why a gate needs `--exit-code`.
- [Trivy: installation](https://trivy.dev/docs/latest/getting-started/installation/) — Official install methods, including Homebrew. Use for: installing a safe version.
- [Trivy advisory GHSA-69fq-xp46-6x23](https://github.com/aquasecurity/trivy/security/advisories/GHSA-69fq-xp46-6x23) — Official record of the March 2026 compromise, with affected and safe versions. Use for: lessons 0001 and 0007.
- [Microsoft: Trivy supply chain compromise](https://www.microsoft.com/en-us/security/blog/2026/03/24/detecting-investigating-defending-against-trivy-supply-chain-compromise/) — Incident analysis with detection and defense steps. Use for: the lesson 0007 case study.

### GitLab CI

- [CI/CD YAML syntax reference](https://docs.gitlab.com/ci/yaml/) — Every `.gitlab-ci.yml` keyword. Use for: lesson 0002 and later pipelines.
- [Install GitLab Runner on macOS](https://docs.gitlab.com/runner/install/osx/) — Install the runner and run it as a service on a Mac. Use for: lesson 0002.
- [Registering runners](https://docs.gitlab.com/runner/register/) — Register a runner with a `glrt-` token. Use for: lesson 0002.
- [Docker executor](https://docs.gitlab.com/runner/executors/docker/) — How jobs run in containers on your runner. Use for: lesson 0002.
- [Secret detection](https://docs.gitlab.com/user/application_security/secret_detection/) — GitLab's secret detection methods, and the rule to revoke and replace exposed secrets. Use for: lessons 0001 and 0002.
- [SAST](https://docs.gitlab.com/user/application_security/sast/) — GitLab SAST analyzers and templates. Use for: lesson 0002.
- [Container scanning](https://docs.gitlab.com/user/application_security/container_scanning/) — Trivy-based image scanning in GitLab. Use for: lesson 0007.
- [Auto-merge and "Pipelines must succeed"](https://docs.gitlab.com/user/project/merge_requests/auto_merge/) — How to block a merge until the pipeline passes. Use for: making the gate a merge check.
- [Identity verification](https://docs.gitlab.com/security/identity_verification/) — Why GitLab.com may ask you to verify before you use hosted runners. Use for: lesson 0002 setup.

### Ansible

- [Ansible playbooks](https://docs.ansible.com/projects/ansible/latest/playbook_guide/playbooks_intro.html) — Playbook structure and idempotency. Use for: lesson 0003.
- [Check mode and diff mode](https://docs.ansible.com/projects/ansible/latest/playbook_guide/playbooks_checkmode.html) — Dry runs with `--check` and `--diff`. Use for: safe changes to servers.
- [Encrypting content with Ansible Vault](https://docs.ansible.com/projects/ansible/latest/vault_guide/vault_encrypting_content.html) — `encrypt_string` and vault IDs. Use for: secrets in playbooks.
- [ansible-playbook CLI](https://docs.ansible.com/projects/ansible/latest/cli/ansible-playbook.html) — All playbook flags. Use for: CI jobs that run Ansible.
- [Ansible Lint](https://docs.ansible.com/projects/lint/) — Linter for playbooks and roles. Use for: a quality gate on Ansible code.
- [OrbStack: SSH](https://docs.orbstack.dev/machines/ssh) and [OrbStack: Linux distros](https://docs.orbstack.dev/machines/distros) — SSH access to OrbStack machines (with an Ansible inventory example) and the supported distros, including Rocky Linux. Use for: the lab host.

### Risk

- [Threat Modeling Manifesto](https://www.threatmodelingmanifesto.org/) — The four key questions and the values of threat modeling. Use for: lesson 0004.
- [OWASP Threat Modeling Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Threat_Modeling_Cheat_Sheet.html) — STRIDE, diagrams, and a practical process. Use for: lesson 0004.
- [FIRST CVSS v4.0](https://www.first.org/cvss/v4-0/) — The standard severity score and its metric groups. Use for: explaining what a severity label means.
- [FIRST EPSS](https://www.first.org/epss/) — A daily probability that a CVE will be exploited in the next 30 days. Use for: ranking by likelihood.
- [CISA KEV catalog](https://www.cisa.gov/known-exploited-vulnerabilities-catalog) — CVEs known to be exploited in the wild, with due dates. Use for: the "fix first" list.
- [CISA SSVC](https://www.cisa.gov/stakeholder-specific-vulnerability-categorization-ssvc) — A decision tree that maps a vulnerability to Track, Track\*, Attend, or Act. Use for: turning scores into actions.
- [SSVC with EPSS](https://certcc.github.io/SSVC/howto/using_epss/epss_probability/) — CERT/CC guidance on combining EPSS with SSVC. Use for: lesson 0004 examples.

### Compliance

- [NIST SP 800-37 Rev. 2 (RMF)](https://csrc.nist.gov/pubs/sp/800/37/r2/final) — The seven-step Risk Management Framework. Use for: lesson 0005.
- [NIST SP 800-53 Rev. 5](https://csrc.nist.gov/pubs/sp/800/53/r5/upd1/final) — The federal catalog of security and privacy controls (release 5.2.0, August 2025). Use for: control names such as CM-6 and SI-2.
- [NIST SP 800-171 Rev. 2](https://csrc.nist.gov/pubs/sp/800/171/r2/upd1/final) — Requirements for protecting CUI on contractor systems. NIST withdrew it in May 2024 in favor of Rev. 3, but CMMC Level 2 still assesses against Rev. 2. Use for: lesson 0005.
- [NIST SP 800-171 Rev. 3](https://csrc.nist.gov/pubs/sp/800/171/r3/final) — The current NIST revision. Use for: knowing what comes next.
- [DoD CIO: About CMMC](https://dodcio.defense.gov/cmmc/About/) — Official CMMC status and phases. Use for: current status (Phase II suspended on July 13, 2026).
- [DISA STIG downloads](https://public.cyber.mil/stigs/downloads/) — The official STIG library. Use for: the RHEL 9 STIG.
- [ComplianceAsCode content](https://github.com/ComplianceAsCode/content) — Source of the SCAP Security Guide profiles and their Ansible remediation. Use for: lesson 0005.
- [Rocky Linux DISA STIG guide](https://docs.rockylinux.org/9/books/disa_stig/disa_stig_part2/) — Scan a Rocky host with OpenSCAP against the STIG profile. Use for: the lesson 0005 lab.
- [cATO memo (2022)](https://media.defense.gov/2022/Feb/03/2002932852/-1/-1/0/CONTINUOUS-AUTHORIZATION-TO-OPERATE.PDF) — DoD memo on continuous authorization to operate. Use for: how DevSecOps connects to authorization.
- [cATO evaluation criteria](https://dowcio.war.gov/Portals/0/Documents/Library/cATO-EvaluationCriteria.pdf) — What DoD checks before it grants a continuous ATO. Use for: lesson 0005.

### GitOps

- [OpenGitOps principles](https://opengitops.dev/) — The four GitOps principles (v1.0.0). Use for: lesson 0006.
- [Argo CD automated sync](https://argo-cd.readthedocs.io/en/latest/user-guide/auto_sync/) — `automated`, `prune`, and `selfHeal`. Use for: lesson 0006.
- [Argo CD projects](https://argo-cd.readthedocs.io/en/stable/user-guide/projects/) — Restrict source repos, destinations, and resource kinds. Use for: least privilege in GitOps.
- [Red Hat OpenShift GitOps](https://docs.redhat.com/en/documentation/red_hat_openshift_gitops/1.20/html-single/understanding_openshift_gitops/index) — Red Hat's Argo CD distribution. Use for: OpenShift context.

### Supply chain and platforms

- [SLSA specification v1.2](https://slsa.dev/spec/v1.2/) — Build and Source tracks for supply chain integrity. Use for: lesson 0007.
- [CISA 2026 Minimum Elements for an SBOM](https://www.cisa.gov/resources-tools/resources/2026-minimum-elements-software-bill-materials-sbom) — Final guidance from July 2026. It replaces the 2021 NTIA list. Use for: lesson 0007.
- [Sigstore: signing containers](https://docs.sigstore.dev/cosign/signing/signing_with_containers/) — Sign and attest images with cosign. Use for: lesson 0007.
- [Terraform: manage sensitive data](https://developer.hashicorp.com/terraform/language/manage-sensitive-data) — Why state holds secrets, and how to protect it. Use for: lesson 0008.
- [OpenShift: managing security context constraints (4.22)](https://docs.redhat.com/en/documentation/openshift_container_platform/4.22/html/authentication_and_authorization/managing-pod-security-policies) — SCCs control what a pod may do. Use for: lesson 0009.

### Interview and writing

- [MIT CAPD: the STAR method](https://capd.mit.edu/resources/the-star-method-for-behavioral-interviews/) — STAR structure and time split (S 20%, T 10%, A 60%, R 10%). Use for: the interview kit.
- [Employer interview guide (PDF)](https://www.lockheedmartin.com/content/dam/lockheed-martin/careers/hiring-process/interview-guide.pdf) — The employer's own interview advice. It says most hiring managers use STAR. Use for: the interview format.
- [ISO 24495-1:2023](https://www.iso.org/standard/78907.html) — The plain language standard these lessons follow. Use for: writing style.
- [IPLF: the ISO plain language standard](https://www.iplfederation.org/iso-standard/) — A free summary of the four principles. Use for: checking a lesson's language.

## Wisdom (Communities)

- [OWASP Slack](https://owasp.org/slack/invite), channel `#devsecops` — Practitioners who discuss pipeline tools and gate policy. Use for: "how do teams really gate on this?" questions.
- [GitLab Forum: DevSecOps](https://forum.gitlab.com/c/devsecops-security/47) and [GitLab Forum: CI/CD](https://forum.gitlab.com/c/gitlab-ci-cd/23) — The official GitLab community forum. Use for: runner and pipeline problems.
- [Ansible Forum](https://forum.ansible.com/) — The official Ansible community forum. Use for: playbook and collection questions.
- [CNCF Slack](https://slack.cncf.io/), channel `#argo-cd` — Argo CD maintainers and users. Use for: sync and drift questions.

## Gaps

- GitLab.com Free has no dependency scanning or security dashboards (Ultimate only). Trivy covers SCA, and reports are read as job artifacts.
- No verified source yet on which STIG rules apply inside an OrbStack machine, which shares a kernel and has no bootloader. Check before lesson 0005.
- No public source describes how defense programs run DevSecOps on classified or air-gapped networks. DoD reference designs are the public proxy.
- No verified free way to run OpenShift on this Mac. Lesson 0009 may be reading-only.
