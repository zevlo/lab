# Service and Ingress path verified; RELATED-layer debugging landed

User scored 5/5 on lesson 0019 quiz.

## Evidence
- Quiz 5/5 on empty EndpointSlice → selector vs pod labels; full EndpointSlice but failed port-forward → `targetPort` vs `containerPort`; Service works but Ingress fails → verify backend `service.name` and `port.number`; readiness `0/1` → excluded from endpoints; pod restarts with persistent empty endpoints → inspect EndpointSlice before touching pods.
- Lab: network-troubleshoot-lab (selector, targetPort, Ingress backend breaks) completed as part of lesson flow.

## Diagnosis
The inside-out funnel (pods → EndpointSlice → port-forward Service → Ingress host) landed. User distinguishes selector breaks (empty endpoints, pods innocent) from port-map breaks (endpoints full, traffic still dead) and Ingress backend mismatches (Service layer fine). Complements lesson 0017 Break D and lesson 0018 pod-layer failures — troubleshooting arc networking half is solid.

## Implications
- Ready for lesson 0020: rollout and Helm revision debugging (deploy-incident triage).
- Reinforce readiness vs liveness impact on endpoints in future scenario quizzes (quiz Q4 touched this).
- Conventions hold: EndpointSlice inspection, YAML apply for fixes, namespace pinned on context during labs.
