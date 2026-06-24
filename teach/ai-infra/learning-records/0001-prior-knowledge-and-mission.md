# Prior knowledge established + mission set (baseline)

Learner is a capable software/infra engineer: comfortable with Docker and the Linux CLI, has **some Kubernetes and cloud** experience, and reports a solid infra/devops base. The **gap is the GPU + LLM-serving layer** (Stages 3–6 of their syllabus), which is also the differentiator for the target role.

Mission set: **get hired as an AI inference/infra engineer in ~1 month**, intense daily pace, mostly hands-on, on a homelab RTX A2000 (+ cloud when needed). See [[MISSION.md]].

Implications for future sessions:
- Skip generic Docker/Linux/k8s teaching; only cover GPU/serving-specific twists.
- Start teaching at the GPU/inference layer (their ZPD floor is "knows infra, doesn't know GPUs"), not at Linux basics.
- Anchor lessons to the A2000's real VRAM budget to make quantization/batching/KV-cache constraints concrete.
