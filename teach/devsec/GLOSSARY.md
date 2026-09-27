# DevSec Engineering Glossary

Canonical vocabulary for this workspace. Every lesson, quiz, and record uses these terms. Seeded 2026-09-11 after demonstrated understanding (RMF quiz 4/4; STIG practices passed).

## RMF

**RMF (Risk Management Framework)**:
NIST's life-cycle process for managing security risk, in seven steps. Defined in SP 800-37 Rev. 2.
_Avoid_: the framework, risk process

**Control**:
One safeguard that reduces risk. Controls are cataloged in SP 800-53.
_Avoid_: requirement, rule (rule belongs to STIGs)

**Control baseline**:
The starting control list for an impact category, per SP 800-53B.
_Avoid_: control set, baseline list

**Authorizing Official (AO)**:
The senior official who accepts residual risk and issues or denies the ATO. Never the build team.
_Avoid_: approver, authorizer

**ATO (authorization to operate)**:
The AO's decision to accept a system's residual risk. Not a safety certificate.
_Avoid_: approval, certification

**SysSP (System Security Plan)**:
The document recording which controls are chosen and how each is implemented.
_Avoid_: SSP, security plan

**SAP (Security Assessment Plan)**:
The assessor's plan for how the assessment will run.
_Avoid_: test plan

**SAR (Security Assessment Report)**:
The assessor's report of what the assessment found.
_Avoid_: audit report

**POA&M**:
The list of open gaps, each with an owner and a date. Read as "poh-am."
_Avoid_: remediation list

**Reciprocity**:
One authorization accepted across organizations, to avoid duplicate assessment.
_Avoid_: re-use, transfer

**eMASS**:
DoD's system of record for authorization packages.
_Avoid_: the portal

## STIG

**STIG (Security Technical Implementation Guide)**:
DISA's checklist of security requirements for one technology.
_Avoid_: hardening guide

**SRG (Security Requirements Guide)**:
The parent document of a STIG; a STIG instantiates it per product.
_Avoid_: parent STIG

**Rule**:
One STIG requirement. Fields: statement, discussion, check, fix, CCI, severity.
_Avoid_: control (control belongs to 800-53)

**CCI (Control Correlation Identifier)**:
The identifier mapping one STIG rule to one 800-53 control.
_Avoid_: mapping ID

**Severity**:
High, Medium, or Low. Legacy names: CAT I, II, III. Impact drives severity.
_Avoid_: priority, risk level

**Finding**:
A rule that failed its check. Needs a fix, or an exception with a POA&M entry.
_Avoid_: violation, issue

**SCAP (Security Content Automation Protocol)**:
The standard that makes STIG content machine-readable.
_Avoid_: scan format

**oscap**:
The tool that evaluates SCAP content against a live host.
_Avoid_: OpenSCAP scanner (oscap is the command; OpenSCAP is the project)

## SDLC promotion

**Environment**:
One copy of the system reserved for one purpose: dev, test, prod. Each sits at a classification level. Low side = unclassified networks. High side = classified networks.
_Avoid_: stage, tier

**Artifact**:
The immutable output of one build. A container image digest or a signed package.
_Avoid_: build, image (an image is one kind of artifact)

**Promotion**:
Moving an artifact from one environment to the next. Build once, promote everywhere. Never rebuild per environment.
_Avoid_: deployment, release (deploy is what happens to the artifact in the target environment)

**Gate**:
A check that must pass before promotion. Tests, SAST, an oscap STIG scan, or human approval.
_Avoid_: check (a gate is a blocking check), stage

**CCB (change control board)**:
The group that approves changes to the baseline. Control CM-3.
_Avoid_: approval board

**CDS (cross-domain solution)**:
The accredited mechanism that moves data across a classification boundary. Guard = two-way, every byte inspected. Data diode = one-way, no return path.
_Avoid_: VPN, bridge

**cATO (continuous ATO)**:
An ATO attached to a monitored pipeline instead of one release package.
_Avoid_: auto-ATO (nothing is automatic; the AO still accepts risk)

## Vault

**Secret**:
Sensitive information an attacker needs and an application uses: password, API key, encryption key, certificate.
_Avoid_: password, key (each names one kind of secret)

**Vault**:
HashiCorp's server for secrets. It stores secrets, generates credentials on demand, performs encryption, and audits every request.
_Avoid_: password box, keystore

**Auth method**:
Verifies a client's identity by delegating to a directory or platform: Kubernetes, LDAP, AppRole. Vault keeps no copy.
_Avoid_: login provider, IdP

**Token**:
What authentication returns. Carries the client's policies. Has a TTL.
_Avoid_: session, key

**Policy**:
A grant of capabilities on paths. Deny by default; an explicit deny overrides any wider grant. Control AC-6.
_Avoid_: permission, role

**Static secret**:
A secret a human writes and later replaces. Stored by the KV engine, with version history. No lease, no expiry.
_Avoid_: password entry

**Dynamic secret**:
A secret Vault generates on request, for one caller, for a limited time. Always carries a lease.
_Avoid_: temporary password

**Lease**:
Metadata attached to a dynamic secret, with a time to live (TTL). Vault guarantees the credential for the TTL, then revokes it automatically.
_Avoid_: timer, expiry (expiry is the result; the lease is the mechanism)

**Sealed / unsealed**:
Sealed: the server can reach its storage but cannot decrypt anything in it. A threshold of Shamir shares unseals it.
_Avoid_: locked, encrypted state

**Root key**:
The key that protects the encryption key protecting the data. Itself protected by the unseal key.
_Avoid_: master key

**Shamir shares**:
Splits of the unseal key, created once by `vault operator init`. A threshold, for example 3 of 5, unseals. Shares are presented in any order.
_Avoid_: key shards, pieces

**Audit device**:
Writes the log of every request, granted or denied. Enabled before other setup. Control AU-2.
_Avoid_: log, monitor
