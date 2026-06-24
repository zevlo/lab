# Teaching Notes

## Learner profile
- Goal: become a strong AI inference/infra engineer (get hired + real depth).
- **Pace: depth-first, no hard deadline.** Master fundamentals; don't rush.
- Background: solid devops — Docker + some Kubernetes/cloud. New to GPUs + LLM serving, but explicitly wants deep fundamentals everywhere.
- Hardware: Dell Precision 5820, Xeon W-2223 (4c/8t), **RTX A2000 6 GB** (confirmed), 288 GB/s. Can rent cloud GPUs when truly needed.
- Models: stay **small** — Phi-4-mini (3.8B), Qwen3.5-4B, VibeThinker-3B, LFM2-2.6B. Don't chase biggest-model-that-fits.

## Preferences
- Strong preference for **mastering fundamentals**. Go deep; explain the *why* down to hardware.
- Devops basics known — can move fast through Docker/k8s mechanics, but still cover the GPU/serving-specific depth.
- Hands-on where possible; conceptual lessons fine when they build the mental model.
- Retrieval-practice quizzes; equal-length answer options (no length tells).
- Each lesson: one tangible win, primary source link, citations, reminder to ask the teacher (me).

## Teaching strategy (depth-first)
- Follow the learner's 9-stage order, but more granular: multiple focused lessons per stage (depth via granularity), each in the ZPD.
- Lesson 1 (GPU/VRAM budget) is the motivating opener and also covers Stage 1's "GPUs/memory" bullet; then go deep on the rest of Stage 1 fundamentals.
- Ground hands-on in small quantized models via Ollama/vLLM on 6 GB; emphasize memory hierarchy, roofline, KV cache.
- See `reference/curriculum.html` for the full roadmap and progress.

## Confirmed / resolved
- A2000 VRAM = **6 GB** (6144 MiB). [resolved 2026-06-24]

## Open threads / TODO
- Confirm NVIDIA driver/CUDA + (likely) Ollama installed on the homelab box — Lesson 2 needs it.
- Capstone target: deployed, observable inference service (portfolio artifact).
