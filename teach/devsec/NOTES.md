# Working Notes

## User profile
- Developer background: Linux basics, Terraform, GitHub Actions, Docker, Kubernetes, Bash, Python scripting.
- Gaps to fill: Linux admin + hardening, Windows admin, RMF / DoD classified processes, STIGs, Vault, VMWare, SDLC promotion, Ansible, GitLab in teams.
- Inactive Secret clearance, within 2-year reinstatement threshold.
- Interviewing within weeks. Sequence lessons for interview fluency first, lab depth second.

## Teaching preferences
- ISO 24495-1 controlled natural language. One term = one meaning. Define before first use. Short declarative sentences. No synonyms.
- Quiz option sets: identical word counts within each question. No formatting clues. Instant feedback.
- Every claim carries a citation link. Every lesson names one primary source to read.
- Bridge new material to the existing floor: Ansible↔Terraform, GitLab CI↔GitHub Actions, vSphere↔Proxmox, Vault↔K8s secrets.
- Every lesson ends with a reminder to ask the agent follow-up questions.

## Lab inventory
- Mac + OrbStack (containers, local k8s)
- Proxmox homelab (Rocky/Windows VMs — the hardening lab target)
- AWS account
- Kubernetes homelab

## Curriculum map (interview-priority order)
1. RMF seven steps — lesson 0001 ✓
2. STIGs — lesson 0002 ✓
3. Linux admin + hardening lab: Rocky on Proxmox, OpenSCAP scan, fixes — lesson 0003 ✓ (field report: 257→20 failed, High 11→4, remediate kept; see learning record 0004)
4. SDLC promotion in classified environments (dev → test → prod, cross-domain) — lesson 0004 ✓ (quiz all correct; see learning record 0005)
5. Vault secrets management — lesson 0005 delivered (fluency-first; boundary tie-in; Vault cheat sheet reference)
6. GitLab CI in a team + DevSecOps scanning (SAST, SCA, secrets scanning)
7. Windows administration + PowerShell
8. VMWare/vSphere concepts (bridged from Proxmox)

After interviews: begin spaced, interleaved review quizzes across all lessons.

## Glossary policy
- Promote terms from cheat sheets into the glossary only after the user demonstrates understanding (post-quiz evidence).
- SDLC promotion section added 2026-09-24 after lesson 0004 quiz evidence (environment, artifact, promotion, gate, CCB, CDS, cATO).
- Vault terms (secret, auth method, token, policy, lease, sealed/unsealed) deferred until lesson 0005 quiz evidence returns.

## Resource notes
- public.cyber.mil 302-redirects to www.cyber.mil. Cite cyber.mil.
- DoDI 8510.01 direct PDF (esd.whs.mil) returns 403 to bots. User reaches it in a browser via the DoD Cyber Exchange: cyber.mil/rmf.
- stigviewer.com returns 403 to bots but works in browsers. It is a community mirror, not authoritative. Label as convenience only.
- open-scap.com unreachable from this network. ComplianceAsCode (complianceascode.github.io) is the authoritative upstream for the SCAP Security Guide content that Rocky ships.

## Session log
- 2026-09-11: Workspace created. Mission locked. Lessons 0001 (RMF) and 0002 (STIGs) delivered.
- 2026-09-11: User completed lesson 0001 (self-reported, quiz scores pending). Next: lesson 0002, then the Rocky hardening lab.
- 2026-09-11: Evidence arrived — lesson 0001 quiz 4/4; lesson 0002 complete, practices passed. GLOSSARY.md seeded (adhere to it in all lessons). RMF/STIG now working vocabulary; fluency only — schedule spaced review. Next: lesson 0003, Rocky hardening lab on Proxmox.
- 2026-09-11: Lesson 0003 (Rocky hardening lab) delivered with runbook. Awaiting lab numbers: baseline/after failures, High counts, remediate verdict. Lesson 0004 (SDLC promotion) next session.
- 2026-09-23: Lab results arrived — 257→20 failed, High 11→4, remediate kept; learning record 0004 written, lesson 0003 closed. Lesson 0004 (SDLC promotion, fluency-only) delivered with sdlc-promotion-cheatsheet reference. Warm-up includes first interleaved RMF/STIG/lab retrieval. Glossary additions (promotion, artifact, gate, CDS, cATO) deferred until quiz evidence returns, per policy. Next: lesson 0005 (Vault).
- 2026-09-24: Lesson 0004 evidence arrived — all quiz questions correct. Learning record 0005 written; SDLC terms promoted into GLOSSARY.md. Lesson 0005 (Vault) delivered with vault-cheatsheet reference; HashiCorp docs verified live (what-is-vault, seal, lease, policies, deploy/kubernetes) and logged in RESOURCES.md. Warm-up runs the second interleaved cycle (RMF, STIG, lab, promotion). Vault glossary terms deferred per policy. Next: lesson 0006 (GitLab CI in a team + DevSecOps scanning).
