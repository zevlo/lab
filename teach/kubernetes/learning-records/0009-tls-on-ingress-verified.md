# TLS on Ingress verified; curl output confusion on break step

User scored 5/5 on lesson 0008 quiz and completed the lab (after step 2 fix — Traefik 404 before Ingress was lesson bug, not user error).

## Evidence
- Quiz 5/5 on TLS termination location, tls.crt/tls.key keys, SNI hostname match, self-signed browser warning, broken secretName symptom.
- Lab complete. User expected visible difference in curl body output; always saw `<!DOCTYPE html>` with `curl -sk https://hello.localhost/`.

## Diagnosis
User conflated **transport** (TLS) with **content** (nginx HTML). HTTP and HTTPS to the same backend return identical bodies by design. The lesson's observable differences are: (1) Traefik 404 before Ingress vs HTML after, (2) step 5 break — HTTP still HTML, HTTPS fails or wrong cert on `-vk`/without `-k`, (3) verbose curl shows handshake metadata not body changes.

## Implications
- TLS on Ingress can advance.
- Future TLS/ingress labs: explicitly say "same HTML expected; watch status codes, SSL lines, or `-k` vs no `-k`" when teaching encryption vs application layer.
