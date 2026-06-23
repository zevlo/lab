# Resource requests/limits verified; scheduler vs kubelet split landed

User scored 5/5 on lesson 0009 quiz.

## Evidence
- Quiz 5/5 on scheduler uses requests, OOMKilled vs throttling, Pending/Insufficient cpu, Burstable QoS.
- User asked follow-up on real-world manifest authoring workflow (templates vs memory vs dry-run) — indicates readiness to connect YAML skills to production practice.

## Implications
- Resource requests/limits can advance.
- Natural next topics: LimitRange/ResourceQuota (namespace guardrails), or a short lesson on manifest authoring workflow if user wants it formalized.
