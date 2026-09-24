# Rocky hardening lab demonstrated (Lesson 0003)

Field report received 2026-09-23. The user ran the full lab on a Rocky 9 VM on Proxmox: baseline DISA STIG scan, targeted manual fixes, then automatic remediation after a snapshot.

**Numbers.** Baseline: failed 257 of 434 rules, 11 High. After manual fixes (banner): failed 256, High 11. After `--remediate` plus reboot: failed 20, High 4 — kept, no rollback.

**Survivors, each with a reason.** grub2 password pair (fix needs interactive input), FIPS mode (a conscious decision, not a default), vendor-support rule on Rocky (permanent — documented exception), five partition rules (build-time fixes, not in-place).

**Evidence**: user-reported numbers, recorded in the Lesson 0003 field report.

**Implications**: oscap, profile, data stream, finding, and remediation are now demonstrated skills, not vocabulary. The snapshot-before-remediate instinct is the interview-worthy part. Lesson 0004 (SDLC promotion) proceeds as planned; its warm-up must include interleaved retrieval of RMF, STIG, and this lab, per record 0003.
