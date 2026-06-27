# Resources

This file is the source list for the teaching workspace. Prefer official NVIDIA documentation and high-trust primary sources. Lessons should cite the resources they use.

## Official Exam Source

### NVIDIA NCP-AI Operations Certification Page

- URL: https://www.nvidia.com/en-us/learn/certification/ai-operations-professional/
- Trust level: Primary source
- Use for: Official certification details, exam audience, learning path, and exam blueprint.
- Verified notes:
  - Duration: 120 minutes.
  - Questions: 30.
  - Hands-on lab: Yes, 3 lab exercises according to the public page content.
  - Canonical blueprint:
    - Installation and Deployment: 31%
    - Administration: 23%
    - Workload Management: 23%
    - Troubleshooting and Optimization: 23%
  - Topics include BCM, Slurm administration, Kubernetes administration, system management tools, Run:ai, MIG, NGC containers, networking, DPUs, storage, Fabric Manager, and Magnum IO troubleshooting.

## NVIDIA Operations Stack

### NVIDIA Mission Control / Base Command Manager

- URL: https://docs.nvidia.com/mission-control/docs/systems-administration-guide-b200/2.1.0/overview.html
- Trust level: Primary source
- Use for: How NVIDIA positions Mission Control, BCM, Slurm, Run:ai, provisioning, firmware, networking, and cluster lifecycle operations.
- Notes: Public docs are system- and version-specific. Treat them as conceptual grounding unless licensed access is available.

### NVIDIA DGX BasePOD / SuperPOD Deployment Guides

- URL: https://docs.nvidia.com/dgx-basepod/deployment-guides/dgx-basepod-b200/latest/b200-nmc-2-3.html
- Trust level: Primary source
- Use for: Reference architecture, management nodes, Kubernetes nodes, Slurm nodes, Run:ai, observability, and operational topology.

### NVIDIA GPU Operator

- URL: https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/latest/getting-started.html
- Trust level: Primary source
- Use for: Kubernetes GPU enablement, driver/runtime/device-plugin/DCGM stack, GPU telemetry, MIG, time-slicing, GPUDirect, and operator-managed lifecycle.

### NVIDIA DCGM Exporter

- URL: https://docs.nvidia.com/datacenter/cloud-native/gpu-telemetry/latest/
- URL: https://github.com/NVIDIA/dcgm-exporter
- Trust level: Primary source plus official GitHub implementation
- Use for: GPU telemetry, Prometheus metrics, health checks, utilization, ECC, temperature, power, and operations observability.

### NVIDIA Run:ai Documentation

- URL: https://run-ai-docs.nvidia.com/
- Trust level: NVIDIA product documentation
- Use for: Queueing, quotas, workload scheduling, GPU sharing, MIG profile behavior, training and inference workload operations.

### Slurm Documentation

- URL: https://slurm.schedmd.com/documentation.html
- Trust level: Primary source for Slurm
- Use for: Slurm concepts, partitions, GRES, cgroups, job submission, scheduling, accounting, and troubleshooting.

## NVIDIA AI Software Stack

### NGC Catalog

- URL: https://catalog.ngc.nvidia.com/
- Trust level: Primary source
- Use for: NVIDIA containers, models, Helm charts, NIMs, Triton images, framework containers, and deployment artifacts.

### NVIDIA AI Enterprise Software Documentation

- URL: https://docs.nvidia.com/ai-enterprise/software/latest/
- Trust level: Primary source
- Use for: Enterprise-supported NVIDIA AI software components, support boundaries, NIM, Triton, TensorRT, frameworks, and application/infrastructure layer mapping.

### NVIDIA NIM Documentation

- URL: https://docs.nvidia.com/nim/
- Trust level: Primary source
- Use for: NIM microservices, model deployment, OpenAI-compatible APIs, NGC authentication, runtime behavior, and production serving.

### NVIDIA Triton Inference Server

- URL: https://docs.nvidia.com/deeplearning/triton-inference-server/user-guide/docs/
- URL: https://catalog.ngc.nvidia.com/orgs/nvidia/containers/tritonserver
- Trust level: Primary source
- Use for: Inference serving, model repositories, dynamic batching, backends, ensembles, model analyzer, metrics, HTTP/gRPC serving, and NGC container workflows.

### NVIDIA TensorRT

- URL: https://docs.nvidia.com/deeplearning/tensorrt/latest/
- Trust level: Primary source
- Use for: Inference optimization, precision, engine plans, dynamic shapes, profiling, benchmarking, and deployment tradeoffs.

### NVIDIA cuDNN

- URL: https://developer.nvidia.com/cudnn
- Trust level: Primary source
- Use for: Deep learning primitives such as convolution, attention, matmul, pooling, and normalization.

### NVIDIA NCCL

- URL: https://developer.nvidia.com/nccl
- URL: https://docs.nvidia.com/deeplearning/nccl/
- Trust level: Primary source
- Use for: Multi-GPU and multi-node collectives, all-reduce, all-gather, reduce-scatter, topology-aware communication, and distributed training infrastructure.

### CUDA Documentation

- URL: https://docs.nvidia.com/cuda/
- Trust level: Primary source
- Use for: CUDA programming model, memory hierarchy, streams, kernels, occupancy, profiling, and the host/device execution model.

## Hardware, Virtualization, And Fabric

### NVIDIA Multi-Instance GPU User Guide

- URL: https://docs.nvidia.com/datacenter/tesla/mig-user-guide/
- Trust level: Primary source
- Use for: MIG concepts, profile sizing, GPU instance vs compute instance, operational setup, Kubernetes/Slurm integration.
- Local note: RTX A2000 does not support MIG, so local lessons must be conceptual or cloud-backed.

### NVIDIA Virtual GPU Documentation

- URL: https://docs.nvidia.com/vgpu/
- Trust level: Primary source
- Use for: vGPU concepts, licensing, guest/host split, virtualization operations, and differences from MIG and time-slicing.

### NVIDIA DOCA Documentation

- URL: https://docs.nvidia.com/doca/
- Trust level: Primary source
- Use for: BlueField DPU concepts, DOCA services, offload, isolation, networking/security acceleration, and exam DPU topics.

### NVIDIA Magnum IO

- URL: https://developer.nvidia.com/magnum-io
- Trust level: Primary source
- Use for: GPU-accelerated IO, NCCL/NVSHMEM/GPUDirect, storage and networking data paths, and troubleshooting context.

### NVIDIA Networking Documentation

- URL: https://docs.nvidia.com/networking/
- Trust level: Primary source
- Use for: InfiniBand, Ethernet/RoCE, switches, NICs, fabric concepts, congestion, topology, and cluster networking.

## Communities For Wisdom

### NVIDIA Developer Forums

- URL: https://forums.developer.nvidia.com/
- Trust level: Practitioner community hosted by NVIDIA
- Use for: Real-world operational failure modes, certification discussion, driver/container/GPU Operator issues, and vendor-specific troubleshooting clues.

### Slurm Users Mailing List

- URL: https://slurm.schedmd.com/mail.html
- Trust level: Practitioner community
- Use for: Real-world Slurm scheduling, GRES, cgroup, and cluster operations problems.

### Kubernetes SIG Node / Device Plugin Ecosystem

- URL: https://github.com/kubernetes/community/tree/master/sig-node
- Trust level: Primary Kubernetes community
- Use for: Device plugin, DRA, kubelet resource management, and node-level scheduling concepts.
