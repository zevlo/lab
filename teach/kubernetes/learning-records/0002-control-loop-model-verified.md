# Control-loop mental model verified

User scored 5/5 on the lesson 0001 quiz covering controllers, reconciliation after pod deletion, where desired state lives (etcd via API server), spec vs status, and node-reboot recovery. Combined with their prior fundamentals course, this confirms the declarative/reconciliation mental model is solid — not just covered.

## Evidence
Quiz answered from memory, all correct; reported the conceptual explanation landed well.

## Implications
- The fundamentals floor is real. Next lessons can build *on* the control loop rather than re-establish it.
- Good next-layer candidates: the Service/networking model (how traffic finds ephemeral pods), Deployment rollout mechanics (the control loop applied to updates), ConfigMaps/Secrets.
