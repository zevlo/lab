# Mission: AI Inference / Infrastructure Engineering

## Why
Become a genuinely strong **AI/ML infrastructure & inference engineer** — hired into the role, and able to back it up with real depth. Already a capable software/devops engineer (Docker, some Kubernetes, cloud); the goal is to **master the full stack from Linux/networking fundamentals up through GPU internals, LLM serving, and production reliability** — not to memorize tools, but to understand *why* each layer works the way it does.

## Success looks like
- Can stand up an LLM inference server (vLLM) on a real GPU and explain **every** memory / throughput / latency trade-off it makes, down to the hardware.
- Can derive, from fundamentals, why decode is memory-bandwidth-bound, why batching helps, and how KV cache sizing works — not just recite it.
- Can whiteboard the whole stack in an interview: processes/sockets → GPU memory & CUDA model → KV cache & PagedAttention → batching & quantization → load balancing/autoscaling → observability & cost.
- Has built, deployed, and instrumented a real model-serving system end to end (homelab + cloud) as a portfolio artifact.

## Constraints
- **Pace:** depth-first, **no hard deadline**. Prioritize true understanding and fundamentals over speed. Steady, deliberate progress.
- **Hardware:** homelab Dell Precision 5820 (Xeon W-2223, 4c/8t) + **RTX A2000 6 GB** (Ampere GA106, 288 GB/s) + ability to rent cloud GPUs when a topic genuinely needs more.
- **Models:** deliberately **small** — Phi-4-mini (3.8B), Qwen3.5-4B, VibeThinker-3B, LFM2-2.6B, and similar. No need to push the largest models the card can run; small models keep iteration fast and fundamentals in focus.
- **Style:** strong preference for **mastering fundamentals**; hands-on where possible, conceptual where it builds the mental model. Devops background means we can go deep quickly — but we don't skip.

## Scope
- **In scope:** all 9 stages, taught at depth — Linux/networking, async Python/backend, GPU fundamentals, LLM inference, distributed systems, AI serving, data pipelines, Kubernetes/cloud, monitoring/reliability.
- **Out of scope (for now):** model **training/fine-tuning research** and deep DL theory beyond what serving requires; frontend/product work.

> The 6 GB A2000 is the perfect teacher: its tight budget makes every fundamental (memory hierarchy, quantization, KV cache, batching) concrete and unavoidable. We learn the constraints by living inside them.
