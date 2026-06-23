# Namespaces & contexts verified

User scored 5/5 on lesson 0007 quiz and requested lesson 0008 on TLS on Ingress.

## Evidence
- Quiz 5/5 on scenario questions (namespace name uniqueness, -A diagnostic, cross-ns FQDN, cluster-scoped Node, context default namespace).
- User accepted recommended topic order (namespaces before TLS).

## Implications
- Namespace scope and kubectl aiming can be treated as known.
- Lesson 0008 should combine Ingress (0003), Secrets (0006), and namespace discipline (0007). Use homelab namespace habit; self-signed certs locally; mention cert-manager as production path without labbing it.
