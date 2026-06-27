# Notes

## Shared Setup Decisions

- Use the official NVIDIA 4-domain NCP-AIO blueprint as canonical.
- Optimize for depth and retention, not a fixed exam date.
- Start with a hands-on diagnostic lesson because the current Dell GPU node state is unknown.
- Cloud rental is acceptable when a lesson genuinely needs MIG, multi-GPU, NVLink, InfiniBand, vGPU, or larger memory.

## Teaching Preferences

- Do not skip fundamentals because of DevOps experience; go deeper, faster.
- Prefer "why this behaves this way" explanations over runbook-only instructions.
- Use the local A2000's small VRAM as a teaching tool for memory, quantization, batching, and KV cache constraints.
- Keep lessons short, beautiful, and reviewable.
- Include interactive checks, retrieval questions, and immediate feedback where practical.

## Hardware Reality

- Local: single RTX A2000 6 GB, no MIG.
- Local cluster: K3s with Dell intended as GPU node.
- Conceptual or cloud-backed topics: MIG, vGPU, NVLink/NVSwitch, InfiniBand/RoCE fabric, DPU/DOCA operations, large distributed training.

## Open Items To Learn From Lesson 1

- Exact NVIDIA driver version.
- Whether `nvidia-smi` works on the host.
- Whether Docker or containerd can expose the GPU.
- Whether K3s sees the Dell as a schedulable GPU node.
- Whether the NVIDIA device plugin or GPU Operator is already installed.
- Actual free VRAM under idle conditions.
