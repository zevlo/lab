# Ingress model verified; IP-per-pod insight landed

User scored 5/5 on the lesson 0003 quiz and completed the lab end-to-end, including the deliberate break/fix stage (Ingress backend port mismatch), diagnosing it from the `describe` output's Backends column.

## Evidence
- Quiz from memory, all correct — though the troubleshooting question (best first move on a Traefik error) was answered by intuition rather than certainty.
- Articulated a genuine before/after: previously didn't fully grasp that multiple Deployments can all be exposed on the same port. Now understands this works because of the IP-per-pod network model — ports are per-pod, not cluster-scoped.
- Observed and correctly interpreted fine lab detail (whoami's IP line changing per request = Service load balancing across replicas).

## Implications
- Networking thread (Pods → Services → Ingress) is solid through layer 7. TLS is the remaining natural extension.
- Troubleshooting instinct is forming but not yet automatic — future lessons should keep exercising the `describe`/`get`/`logs` diagnostic flow until it's reflexive.
- User reads lab output carefully and reports discrepancies — expected-output text in lessons must be precise; hedge where output varies by version.
