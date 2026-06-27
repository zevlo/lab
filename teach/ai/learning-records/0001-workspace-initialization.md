# 0001 - Workspace Initialization

## Date

2026-06-24

## Context

The teaching workspace was initialized for a depth-first path toward becoming a strong AI Infrastructure Engineer and passing NVIDIA-Certified Professional: AI Operations.

The learner provided a seed three-domain exam model, but the official NVIDIA NCP-AIO page currently publishes a four-domain blueprint:

- Installation and Deployment: 31%
- Administration: 23%
- Workload Management: 23%
- Troubleshooting and Optimization: 23%

## Decision

Use the official four-domain blueprint as canonical. Do not preserve the older three-domain model in the curriculum except as background context if needed.

## Learning Implication

The curriculum must emphasize NVIDIA operations tooling more directly than a generic AI infrastructure curriculum would:

- Mission Control and Base Command Manager
- Slurm and Run:ai
- Kubernetes administration for GPU workloads
- NGC container workflows
- MIG, vGPU, DPUs, Fabric Manager, Magnum IO
- Troubleshooting and optimization across containers, fabric, storage, and cluster management

## ZPD Estimate

The learner has strong DevOps foundations, so Linux, containers, Kubernetes, and cloud concepts can move quickly. The first learning gap is the GPU-specific path from hardware and driver to container runtime and scheduler visibility.

## Next Lesson

Start with a hands-on GPU baseline diagnostic to establish what the local A2000/K3s lab can actually expose.
