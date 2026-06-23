# Service/networking model verified, plus independent troubleshooting

User scored 5/5 on the lesson 0002 quiz (selectors as live queries, pod IP instability, port vs targetPort, ClusterIP semantics, DNS naming) and completed the full lab including the LoadBalancer-to-localhost step on Rancher Desktop.

## Evidence
Quiz from memory, all correct. More significantly: `curl localhost:8080` initially failed due to a stale Rancher Desktop port-forward from a previous deployment occupying the port. User diagnosed and resolved this independently, then completed the lab.

## Implications
- The Service layer (ClusterIP, DNS, selectors, EndpointSlices, LoadBalancer) can be treated as known and built upon.
- Demonstrated real debugging ability at the host/cluster networking boundary — lessons can include deliberately broken scenarios; user is ready for diagnose-and-fix exercises, not just happy-path labs.
- Environment note: stale Rancher Desktop port forwards can shadow ServiceLB ports. Future labs should mention checking existing port forwards when localhost access misbehaves.
