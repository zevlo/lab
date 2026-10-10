# Dockerfile mechanics locked — mini-project seed chosen

Sixth consecutive first-pass 4/4 (0001–0006). Lesson 0006's mechanics — instruction set, RUN-vs-CMD, cache-stops-at-first-change, content-based invalidation (`touch` ≠ invalidate) — are now demonstrated, not merely covered. Same session, the user chose `rust/count_errors` as the mini-project seed (over `python/security_monitor.py` and a from-scratch app).

## Evidence
Score line self-reported 2026-10-10: "4 / 4 — the recipe is yours." Project choice made via structured question, same session.

## Implications
- Lesson 0007 = multi-stage build of count_errors: builder stage → `FROM scratch`, dep-cache ordering (`Cargo.toml`/`Cargo.lock` copied before `src`), ENTRYPOINT-vs-CMD for CLI images
- count_errors scans a directory, so the lab runs it against a bind-mounted logs folder — a controlled preview of Module 4 storage before its formal lesson
- All retrieval to date has been same-session fluency. Once Module 3 closes, schedule a spaced, interleaved review lesson across Modules 1–3 — storage strength is the real goal
