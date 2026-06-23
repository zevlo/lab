# ConfigMaps & Secrets verified; break step looked like a no-op

User scored 5/5 on lesson 0006 quiz and completed the lab. Topic landed well ("lab was good"). Env-vs-volume contrast and Secret ≠ encryption understood at quiz level.

## Evidence
- Quiz 5/5 on scenario questions (Secret vs ConfigMap, volume live-update, env frozen, base64 ≠ encryption, per-env ConfigMaps).
- Step 4 break (typo `configMapKeyRef` key) did not *feel* broken — user reported nothing seemed to break.

## Diagnosis
Likely **containment illusion**, not a cluster bug. Typoing the env key only changes `spec.template` → rollout starts → **new** pods fail `CreateContainerConfigError` → rollout stalls → **old** pods keep serving. `curl` / port-forward still succeed. Lesson mentioned old pods serving but buried it; step 4 did not foreground "check pods, not the browser."

Secondary risks: `kubectl describe pod -l app=web | tail -20` can show a healthy old pod's events; ambiguous instruction (two `SITE_BANNER` keys exist — ConfigMap `data` vs Deployment `configMapKeyRef`).

## Implications
- ConfigMaps/Secrets mechanics can advance; no re-teach needed.
- Fix lesson 0006 step 4: explicit "curl still works" callout, pin edit to Deployment env block only, better failing-pod diagnostics (`get pods` first, describe the broken pod by name).
- Keep ship/break/fix structure; when failure is rollout containment, always tell user which signal to watch (pods/rs, not HTTP).
