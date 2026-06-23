# Probes: lab complete, but readiness/liveness split not yet automatic

User scored 4/5 on the lesson 0005 quiz and completed the full three-stage lab (quarantine, quiet-failure rollout stall, liveness self-heal). Topic felt less clear than previous lessons despite successful lab completion.

## Evidence
- Missed Q2: with a liveness probe checking database connectivity, user answered "nothing happens; liveness probes ignore external dependency failures." Correct answer: every API container gets restarted repeatedly.
- Lab completed end-to-end — hands-on mechanics landed even where conceptual clarity lagged.

## Misconception
User may be conflating "liveness only tests the container itself" (a design rule) with "liveness ignores external failures" (false at runtime). A liveness probe that *checks* the database will fail when the database is down, and the kubelet will restart the container on each failure threshold — repeatedly, uselessly, while the DB is still down.

## Implications
- Do not assume probes are solid yet. Revisit readiness vs liveness with a one-line decision rule before the next lesson.
- Future lessons: keep the ship/break/fix lab structure (still works), but add a tighter upfront contrast table or mnemonic when two concepts differ mainly in *consequence* not *mechanism*.
- Quiz difficulty increase was appropriate (4/5); keep scenario-based questions.
