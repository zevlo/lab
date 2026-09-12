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
