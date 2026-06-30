# NetworkPolicies verified; OrbStack enforcement gap documented

User scored 5/5 on lesson 0021 quiz. Lab completed (conceptual pass on OrbStack — `--disable-network-policy` in k3s node-args; policies accepted by API but not enforced).

## Evidence
- Quiz 5/5 on default allow-all, podSelector = protected pods, ingress allow-list, egress DNS requirement, Service vs NetworkPolicy orthogonality.
- Lab: all three breaks walked; connectivity tests on OrbStack did not show deny (expected — enforcement disabled). User understood breaks via YAML + quiz.

## Diagnosis
NetworkPolicy mental model landed: opt-in isolation, podSelector vs ingress.from, DNS before app ports on egress. OrbStack quirk is a platform constraint, not a user error — lesson needs prerequisite check (user declined patch in prior turn; note for future agreement).

## Implications
- Ready for cert-manager when user chooses.
- Lesson 0021: add OrbStack `--disable-network-policy` callout when user agrees to lesson edit.
- Quiz spacing: podSelector typo + egress DNS worth revisiting in combined quiz 02 if needed.
