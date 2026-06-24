# AI Inference / Infrastructure Engineering — Resources

Curated, high-trust sources. Knowledge for lessons is drawn from here, not from the model's memory. Verified during setup session on 2026-06-24.

## Knowledge

- [Inference Engineering — interactive guide (Philip Kiely / Baseten, 2026)](https://inferenceengineering.tech/)
  The single best mission-aligned resource: GPU hardware → CUDA → inference engines (vLLM, SGLang, TensorRT-LLM) → quantization, speculative decoding, KV cache → containerization, autoscaling, observability. Animated diagrams, calculators, quizzes. **Use as the spine of the whole curriculum.**
- [Modal GPU Glossary](https://modal.com/gpu-glossary)
  Crisp, authoritative definitions of GPU/host concepts (SMs, CUDA cores, `nvidia-smi`, VRAM, etc.). Use for: precise terminology, settling "what does this actually mean" questions.
- [vLLM documentation](https://docs.vllm.ai/)
  Official docs for the serving engine you'll run on the A2000. Use for: `gpu_memory_utilization`, KV cache, PagedAttention, `max_model_len`, `max_num_seqs`, quantization flags.
- [PagedAttention paper — Kwon et al., 2023 (SOSP)](https://www.cs.usfca.edu/~mmalensek/cs677/schedule/papers/kwon2023efficient.pdf)
  The primary source behind vLLM. Use for: *why* KV-cache fragmentation matters and how paging fixes it. Read after the KV-cache lesson.
- [AI Engineering — Chip Huyen (O'Reilly, 2025)](https://huyenchip.com/books/)
  Real-world architecture, inference, evaluation, MLOps. Use for: framing serving decisions in product/system terms (interview gold).
- [Designing Machine Learning Systems — Chip Huyen (O'Reilly, 2022)](https://huyenchip.com/books/)
  Holistic ML system design. Use for: data pipelines, monitoring, the Stage 5–9 systems topics.
- [NVIDIA `nvidia-smi` documentation](https://docs.nvidia.com/deploy/nvidia-smi/index.html)
  Reference for the GPU telemetry tool. Use for: interpreting memory/util/power fields, scripting CSV queries.
- [llm-systems-cookbook (GitHub)](https://github.com/hassan11196/llm-systems-cookbook)
  64 hands-on notebooks: GPU programming, inference engines, KV cache, quantization, serving, RAG, eval. Use for: hands-on practice that self-scores.

## Hands-on tooling & small models (for the 6 GB A2000)

- [Ollama](https://ollama.com/)
  Easiest way to pull and run small quantized (GGUF) models locally. Use for: first hands-on serving, watching VRAM fill up. (`ollama run phi4-mini`, `qwen3:4b`, `lfm2:2.6b`.)
- [Hugging Face model cards — Phi-4-mini, Qwen3-4B, LiquidAI/LFM2-2.6B, WeiboAI/VibeThinker](https://huggingface.co/)
  Primary sources for exact param counts, architecture, quant footprints, recommended sampling params. LFM2 = hybrid conv+attention (good fundamentals contrast vs pure transformer); VibeThinker = tiny reasoning model (Qwen2.5-Math finetune).
- [vLLM — supported quantization & serving docs](https://docs.vllm.ai/)
  Use for: the step up from Ollama to a production-grade engine on the same small models.

## Wisdom (Communities)

- [r/LocalLLaMA](https://reddit.com/r/LocalLLaMA)
  The highest-signal practical community for running models on your own/limited hardware — exactly the A2000 situation. Use for: which model+quant fits your VRAM, real throughput numbers, troubleshooting.
- [vLLM Forum (discuss.vllm.ai)](https://discuss.vllm.ai/)
  Official Q&A with maintainers. Use for: serving-engine config and tuning questions.
- [r/MachineLearning](https://reddit.com/r/MachineLearning)
  Broader research/engineering discussion. Use for: keeping current, sanity-checking claims.

## Gaps (drive future search)

- A trusted, hands-on **CUDA-from-scratch** tutorial calibrated to a single small GPU (for the Stage 3 "what's actually happening on the SMs" lesson).
- **Kubernetes-for-GPU** specifics (device plugin, scheduling, GPU sharing/MIG) — need a high-trust source beyond vendor blogs.
- **Interview-prep** material specific to inference/infra roles (system-design prompts, rubrics). Currently inferring from Huyen + job descriptions.
