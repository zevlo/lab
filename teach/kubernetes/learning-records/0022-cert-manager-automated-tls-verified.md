# cert-manager automated TLS verified

User scored 5/5 on lesson 0022 quiz. Lab completed.

## Evidence
- Quiz 5/5 on Ingress still references TLS Secret; dnsNames vs host mismatch symptom; Issuer ref fix; selfSigned vs Let's Encrypt for local hostnames; CertificateRequest/Issuer diagnostics.
- Lab: cert-manager Helm install, Issuer + Certificate + Ingress flow, three breaks (bad dnsNames, bad issuerRef, bad ingress secretName) completed.

## Diagnosis
cert-manager control loop landed on top of lesson 0008 manual TLS. User connects Certificate → Secret → Ingress secretName; distinguishes issuance failures (Issuer) from binding failures (Ingress typo) from name mismatches (dnsNames/SNI). TLS automation arc complete for fundamentals track.

## Implications
- Cluster add-on pattern (Traefik, metrics-server, cert-manager) now a familiar trio.
- Production LE/ACME is conceptual next step when user has a public domain — not required for fundamentals closure.
- Candidates for 0023: combined scenario quiz 02, deeper homelab topics, or mission review.
