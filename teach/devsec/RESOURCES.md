# DevSec Engineering (Classified) Resources

## Knowledge

- [Standard: NIST SP 800-37 Rev. 2 — Risk Management Framework for Information Systems and Organizations](https://csrc.nist.gov/pubs/sp/800/37/r2/final)
  The RMF source document. Defines the seven steps, roles, and tasks. Use for: every RMF claim. Verified live.
- [Standard: NIST SP 800-53 Rev. 5 — Security and Privacy Controls (+ SP 800-53A assessment procedures, + SP 800-53B baselines)](https://csrc.nist.gov/pubs/sp/800/53/r5/upd1/final)
  800-53 is the control catalog. 800-53A defines how each control is assessed. 800-53B defines low/moderate/high control baselines. Use for: RMF steps Select and Assess. Verified live. Current release 5.2.0 (Aug 2025).
- [Standard: FIPS 199 — Standards for Security Categorization of Federal Information and Information Systems](https://csrc.nist.gov/pubs/fips/199/final)
  Defines confidentiality, integrity, availability impact levels. Use for: RMF step Categorize. Verified live.
- [Guide: NIST SP 800-137 — Information Security Continuous Monitoring (ISCM)](https://csrc.nist.gov/pubs/sp/800/137/final)
  Defines the continuous monitoring strategy and program. Use for: RMF step Monitor. Verified live.
- [Portal: DISA STIGs — cyber.mil/stigs](https://cyber.mil/stigs/)
  The official STIG library: STIGs, SRGs, STIG Viewer, compilations. Use for: hardening requirements per technology. Verified live (redirects from public.cyber.mil).
- [Portal: DoD Cyber Exchange, RMF — cyber.mil/rmf](https://cyber.mil/rmf/)
  DoD's RMF knowledge service: policy access (DoDI 8510.01), guides, eMASS references, training. Use for: the DoD-specific overlay on NIST RMF. Verified live.
- [Guide: Red Hat Enterprise Linux 9 — Security Hardening](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/9/html/security_hardening/index)
  Vendor documentation for security profiles and OpenSCAP (`oscap`) scanning on RHEL. Use for: Rocky/RHEL hardening labs. Verified live. Applies to Rocky (RHEL-compatible).
- [Project: ComplianceAsCode / SCAP Security Guide](https://complianceascode.github.io/)
  The upstream source of the SCAP content RHEL and Rocky ship, including DISA STIG profiles. Use for: profile IDs, remediations, `scap-security-guide` details. Verified live.
- [Distro: Rocky Linux — download](https://rockylinux.org/download/) and [docs.rockylinux.org](https://docs.rockylinux.org/)
  Rocky 9 ISOs and distribution documentation. Use for: lab installs, Rocky-specific notes. Verified live (rockylinux.org, docs.rockylinux.org, dl.rockylinux.org).
- [Standard: NIST SP 800-218 — Secure Software Development Framework (SSDF) v1.1](https://csrc.nist.gov/pubs/sp/800/218/final)
  Core secure-development practices in four groups (PS, PO, PW, RV), attachable to any SDLC. Use for: SDLC promotion, pipeline gates, artifact integrity. Verified live.
- [Tool: NIST CPRT — Cybersecurity and Privacy Reference Tool](https://csrc.nist.gov/projects/cprt/catalog)
  Interactive browser for SP 800-53 Rev. 5 control text, with exportable data. Use for: quoting control statements (CM family, SI-7) without the PDF. Verified live (catalog is a JavaScript app; fetch the abstract via the project page).
- [Docs: HashiCorp Vault — What is Vault?](https://developer.hashicorp.com/vault/docs/what-is-vault)
  The one-page definition: secrets, centralized well-audited access, plugin design (auth, secrets, database). Use for: every Vault-what-it-is claim. Verified live.
- [Docs: HashiCorp Vault — Key concepts](https://developer.hashicorp.com/vault/docs/concepts) (index)
  Concept pages that matter: [Seal/Unseal](https://developer.hashicorp.com/vault/docs/concepts/seal) (sealed state, root key, Shamir shares, threshold, auto-unseal), [Lease, Renew, Revoke](https://developer.hashicorp.com/vault/docs/concepts/lease) (TTL, auto-revoke, prefix revocation, KV issues no leases), [Policies](https://developer.hashicorp.com/vault/docs/concepts/policies) (path-based, deny by default, HCL capabilities, built-in default/root), [Authentication](https://developer.hashicorp.com/vault/docs/concepts/auth). Use for: lessons on Vault. All verified live 2026-09-24.
- [Docs: HashiCorp Vault — Run on Kubernetes](https://developer.hashicorp.com/vault/docs/deploy/kubernetes)
  Helm deployment modes (dev/standalone/HA/external) and the three consumption integrations (Agent Injector, Secrets Store CSI, Vault Secrets Operator) with a [comparison page](https://developer.hashicorp.com/vault/docs/deploy/kubernetes/comparisons). Use for: K8s bridging. Verified live.
- [Docs: GitLab — Application security testing](https://docs.gitlab.com/ee/user/application_security/)
  The overview: scans run in pipelines on commit or MR, findings surface in the MR before merge; vulnerability cycle detect/triage/analyze/remediate. Use for: every scanning-workflow claim. Verified live 2026-09-27.
- [Docs: GitLab — SAST](https://docs.gitlab.com/ee/user/application_security/sast/)
  Source-code scanning via `include: template: Jobs/SAST.gitlab-ci.yml`, jobs in the test stage, findings in MR reports, six severity levels, FIPS-enabled analyzer images. Use for: SAST claims, scanner templates. Verified live 2026-09-27.
- [Docs: GitLab — Dependency scanning](https://docs.gitlab.com/ee/user/application_security/dependency_scanning/)
  SCA against the GitLab advisory database, transitive packages included; continuous dependency scanning re-scans when advisories update, no pipeline run. Use for: SCA claims, new-CVE-on-old-build scenario. Verified live 2026-09-27.
- [Docs: GitLab — Secret detection](https://docs.gitlab.com/ee/user/application_security/secret_detection/)
  Push protection blocks pushes containing credentials; pipeline detection scans history; guidance to store secrets outside the repository. Use for: secrets-scanning claims, Vault tie-in. Verified live 2026-09-27.
- [Docs: GitLab — CI/CD quick start](https://docs.gitlab.com/ee/ci/quick_start/)
  Defines .gitlab-ci.yml, pipeline, stage (sequential; parallel jobs), runner, rules. Use for: the GitHub Actions mapping table. Verified live 2026-09-27.
- [Docs: GitLab — Merge request approvals](https://docs.gitlab.com/ee/user/project/merge_requests/approvals/)
  Required approvals block merging; failed pipeline blocks merging; prevent-author-approval setting; CODEOWNERS as reviewer source. Use for: team-mechanics claims, CM-5 tie-in. Verified live 2026-09-27.
- [Docs: Microsoft Learn — What is PowerShell?](https://learn.microsoft.com/powershell/scripting/overview)
  The definition (shell + scripting language + configuration management framework) and the object pipeline ("no need to parse text output"). DSC enforces settings and reports drift. Use for: every PowerShell-what-it-is claim. Verified live 2026-09-28.
- [Docs: Microsoft Learn — about_Execution_Policies](https://learn.microsoft.com/powershell/module/microsoft.powershell.core/about/about_execution_policies)
  "The execution policy isn't a security boundary, it's defense in depth"; prevents unintentional violations; GPO "Turn on Script Execution" sets it enterprise-wide. Use for: execution-policy claims and traps. Verified live 2026-09-28.
- [Docs: Microsoft Learn — about_Logging_Windows](https://learn.microsoft.com/powershell/module/microsoft.powershell.core/about/about_logging_windows)
  Module logging and script block logging; Event ID 4104 in the Operational channel; enable via GPO "Turn on PowerShell Script Block Logging"; Protected Event Logging (CMS encryption). Use for: PowerShell audit-trail claims. Verified live 2026-09-28.
- [Docs: Microsoft Learn — AD DS overview](https://learn.microsoft.com/windows-server/identity/ad-ds/ad-ds-getting-started)
  The directory storing user and computer accounts; one logon network-wide; policy-based administration. Use for: domain, domain-join, GPO-delivery framing. Verified live 2026-09-28 (canonical URL redirects here).
- [Reference: Wikipedia — VMware vSphere](https://en.wikipedia.org/wiki/VMware_vSphere)
  Convenience source: vSphere as VMware's virtualization platform; ESXi as the hypervisor component; vCenter as centralized management. Use for: lesson 0008 definitions until Broadcom docs are reachable. Verified live 2026-09-29.
- [Reference: Wikipedia — vCenter](https://en.wikipedia.org/wiki/VCenter)
  Convenience source: VCSA definition (manages VMs, multiple ESXi hosts, dependent components from one location); vMotion memory-transfer mechanics (USENIX-cited); Storage vMotion mirroring. Use for: lesson 0008 vMotion claims. Verified live 2026-09-29.

## Wisdom (Communities)

- [r/DevOps](https://www.reddit.com/r/DevOps/)
  Practitioner discussion of CI/CD, hardening, pipelines. Use for: tooling trade-offs, war stories.
- [r/LockheedMartin](https://www.reddit.com/r/lockheedmartin/)
  Current and former employees on the hiring process, clearances, and role reality. Use for: interview-process wisdom.

## Gaps (verify before use)
- DoDI 8510.01 direct PDF (esd.whs.mil) — 403 to bots. Reach in browser via cyber.mil/rmf.
- open-scap.com — unreachable from this network. ComplianceAsCode covers the same ground.
- stigviewer.com — community mirror of STIGs, 403 to bots, works in browsers. Convenience only, never a citation.
- DoD CIO (dodcio.defense.gov) — 403 to bots. Hosts the cATO guidance. User reaches it in a browser.
- UCDMO (ucdmo.gov) — unreachable from this network. Cross-domain baseline content; teach CDS concepts via 800-37/800-218 instead.
- dod-devsecops.github.io (DoD Enterprise DevSecOps Fundamentals) — 404 as of 2026-09-23. Do not cite.
- GitLab protected branches page — 403 to bots. Team-mechanics claims taught via the verified approvals page instead.
- Broadcom / VMware docs (techdocs.broadcom.com, broadcom.com, vmware.com) — product pages JS-walled or 404 to bots; user reaches them in a browser. Verify DRS/HA/lockdown behavioral details there before citing.
- cyber.mil/stigs — transient transport error on 2026-09-29 re-check; verified live 2026-09-11 and stable since. Retry before next citation.
- Ansible docs — verify if a lesson is ever requested.
- CIS Benchmarks — verify when comparing against STIGs in the hardening lab.
