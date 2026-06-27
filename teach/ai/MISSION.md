# Mission

Become a strong AI Infrastructure Engineer and pass the NVIDIA-Certified Professional: AI Operations (NCP-AIO) exam.

The goal is not tool memorization. The goal is durable engineering depth: understand the fundamentals and the "why" down to hardware, then connect that understanding to NVIDIA's operations stack well enough to operate, troubleshoot, and explain real AI infrastructure.

## Why This Matters

You want to be hired into an AI infrastructure role and be able to back it up with real depth. The certification is a forcing function and credential, but the deeper outcome is practical credibility: the ability to reason from GPU silicon and memory behavior up through drivers, containers, Kubernetes or Slurm, scheduling, monitoring, networking, and production inference or training workloads.

## Learner Profile

- Strong DevOps foundation: Linux, containers, Kubernetes, AWS.
- Newer to GPUs and AI infrastructure.
- Wants fundamentals everywhere, especially where AI infrastructure differs from general DevOps.
- Prefers hands-on work when the available hardware supports it.
- Accepts conceptual lessons, diagrams, simulations, or cloud rentals when local hardware cannot expose the real mechanism.

## Available Lab Environment

- Dell Precision 5820 with Xeon W-2223 and RTX A2000 6 GB.
- 3-node Beelink K3s cluster with the Dell as the GPU node.
- Small models on local hardware: Phi-4-mini 3.8B, Qwen-family 4B-class models, LFM2-2.6B, VibeThinker 3B, or similar.
- Cloud GPUs may be rented when the topic genuinely requires hardware the A2000 cannot provide.

## Hardware Constraints To Teach Around

- RTX A2000 is Ampere but has no MIG support.
- Single local GPU means multi-GPU training, NVLink, NVSwitch, InfiniBand, Fabric Manager, and large-scale distributed failure modes are mostly conceptual unless using cloud.
- 6 GB VRAM is a feature for learning: quantization, KV cache pressure, batching, allocator behavior, and model sizing must become concrete.

## Official Exam Shape

The official NVIDIA NCP-AIO public blueprint is canonical for this workspace:

- Installation and Deployment: 31%
- Administration: 23%
- Workload Management: 23%
- Troubleshooting and Optimization: 23%

The exam page describes 30 questions, 3 hands-on lab exercises, 120 minutes, and a professional-level operations focus.

## Teaching Principles

- Depth-first: always connect operational procedures to the mechanism beneath them.
- Official-source-first: use NVIDIA documentation and other high-trust resources before relying on memory.
- Small lessons: each lesson should create one tangible win and one durable mental model.
- Retrieval practice: lessons should ask you to recall, predict, diagnose, or explain before revealing answers.
- Vendor stack matters: BCM, Mission Control, Run:ai, Slurm, GPU Operator, DCGM, NGC, NIM, Triton, CUDA, NCCL, cuDNN, TensorRT, MIG, vGPU, DPU/DOCA, and Magnum IO are first-class objects.
- Interview strength matters too: inference serving, observability, quantization, batching, and memory pressure remain a differentiator.
