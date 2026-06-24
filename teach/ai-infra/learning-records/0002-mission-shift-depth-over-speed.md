# Mission shift: depth-first, not a 1-month sprint

The learner corrected the timeline: **no hard 1-month deadline**. Priority is now **proper depth and true mastery of fundamentals** on each of the 9 stages, not speed. They explicitly value mastering fundamentals despite having devops experience.

Hardware confirmed: **RTX A2000 6 GB** variant. Deliberately staying on **small models** (Phi-4-mini 3.8B, Qwen3-4B, VibeThinker-3B, LFM2-2.6B) — no need to push the largest models the card can run. Small models keep iteration fast and fundamentals front-and-center.

Implications (supersedes the "skip fundamentals / front-load only the serving layer" stance in [[0001-prior-knowledge-and-mission.md]]):
- Teach Stage 1 (Linux/networking) and other fundamentals **at real depth**, not as a skip. Devops familiarity means we can go deeper faster, but we do NOT skip.
- More, smaller lessons per stage (depth via granularity), each in the ZPD.
- Ground hands-on work in small quantized models via Ollama/vLLM on 6 GB; emphasize the *why* (memory hierarchy, roofline, KV cache) over chasing big-model bragging rights.
- Mission outcome (inference/infra engineer) unchanged; only the pace and depth changed. See updated [[MISSION.md]].
