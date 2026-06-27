# Dell RTX A2000 Prerequisite Checklist And Setup Guide

This is course setup material, not a lesson. Its job is to make the Dell Precision 5820 with RTX A2000 a reliable GPU node for hands-on AI infrastructure work and connect it cleanly to the Kubernetes homelab.

Assumption: the Dell runs a modern Linux distribution, preferably Ubuntu Server 22.04 LTS or 24.04 LTS. If it runs something else, keep the checklist but adjust package commands.

## Target End State

The Dell should be able to:

- Run `nvidia-smi` on the host.
- Run GPU containers with the NVIDIA Container Toolkit.
- Join the K3s cluster as the dedicated GPU node.
- Advertise `nvidia.com/gpu: 1` to Kubernetes.
- Run a GPU smoke-test pod.
- Expose basic GPU telemetry through DCGM Exporter or the NVIDIA GPU Operator.
- Support small-model inference labs within the RTX A2000 6 GB VRAM limit.

The Dell does not need MIG, vGPU, NVLink, or InfiniBand for local labs. Those topics will be taught conceptually or with rented cloud hardware.

## Hardware And BIOS Checklist

- Confirm the RTX A2000 is physically seated and powered.
- Update Dell BIOS/firmware if the machine is far behind.
- Enable virtualization support in BIOS if you plan to run local VMs.
- Disable Secure Boot unless you are prepared to sign NVIDIA kernel modules.
- Set the Dell to a static IP or DHCP reservation.
- Confirm adequate airflow around the RTX A2000.
- Put the Dell and K3s nodes on stable wired Ethernet.

Why: GPU infrastructure problems often masquerade as software issues. BIOS, Secure Boot, firmware, thermals, and unreliable networking can break higher layers in confusing ways.

## Base OS Checklist

- Install Ubuntu Server 22.04 LTS or 24.04 LTS.
- Set hostname, for example `dell-gpu-01`.
- Configure SSH access with keys.
- Install basic tools:

```bash
sudo apt update
sudo apt install -y \
  build-essential \
  ca-certificates \
  curl \
  gnupg \
  htop \
  jq \
  lsb-release \
  pciutils \
  ripgrep \
  tmux \
  unzip
```

- Confirm the GPU is visible on PCIe:

```bash
lspci | rg -i 'nvidia|vga|3d'
```

Expected: a line identifying an NVIDIA GPU. This only proves PCIe visibility, not driver health.

## NVIDIA Driver Checklist

- Install a current NVIDIA production driver from the Ubuntu driver packages or NVIDIA CUDA repository.
- Prefer distro-packaged drivers unless a lesson explicitly needs a newer CUDA path.
- Reboot after installation.
- Verify:

```bash
nvidia-smi
```

Record:

- GPU name.
- Driver version.
- CUDA version reported by `nvidia-smi`.
- Total VRAM.
- Idle memory used.
- Idle power draw and temperature.

Expected for this lab: RTX A2000 with roughly 6 GB VRAM.

Notes:

- The CUDA version shown by `nvidia-smi` is the maximum CUDA runtime API version supported by the installed driver. It does not necessarily mean the full CUDA Toolkit is installed.
- You do not need the full CUDA Toolkit for most container/Kubernetes labs. Containers can provide user-space CUDA libraries, while the host provides the driver.

## Container Runtime Checklist

Choose one primary local container runtime path.

For this course, Docker is useful on the Dell for simple local GPU tests. K3s will use containerd internally for Kubernetes pods.

### Docker For Local GPU Tests

Install Docker Engine using Docker's official instructions for your OS.

Verify Docker:

```bash
docker version
docker run --rm hello-world
```

Install NVIDIA Container Toolkit using NVIDIA's official instructions:

https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html

Configure Docker runtime:

```bash
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
```

Verify GPU containers:

```bash
docker run --rm --gpus all nvidia/cuda:12.4.1-base-ubuntu22.04 nvidia-smi
```

Expected: the container prints the same RTX A2000 through `nvidia-smi`.

### Containerd For K3s

K3s uses containerd. The NVIDIA device plugin or GPU Operator needs the containerd runtime path configured correctly.

After installing NVIDIA Container Toolkit, configure containerd for NVIDIA runtime support:

```bash
sudo nvidia-ctk runtime configure --runtime=containerd
sudo systemctl restart containerd || true
sudo systemctl restart k3s-agent || sudo systemctl restart k3s || true
```

On K3s, containerd config may be generated from K3s templates. If GPU pods fail even though Docker GPU tests pass, inspect the K3s containerd template path instead of assuming the global containerd config is used.

Useful paths to know:

```text
/var/lib/rancher/k3s/agent/etc/containerd/config.toml
/var/lib/rancher/k3s/agent/etc/containerd/config.toml.tmpl
```

Do not blindly edit these without checking how your K3s node is installed.

## K3s Homelab Integration Checklist

Decide whether the Dell is:

- A K3s server node with the GPU.
- A K3s agent node with the GPU. This is usually cleaner for a homelab.

Recommended: join the Dell as an agent GPU node unless you intentionally want it in the control plane.

### Before Joining

- Confirm the Dell can resolve and reach the K3s server.
- Confirm the K3s server token is available.
- Confirm host time sync works:

```bash
timedatectl
```

- Confirm firewall policy allows required K3s traffic between nodes.
- Set a useful hostname:

```bash
hostnamectl
```

### Join As K3s Agent

On the K3s server, get the node token:

```bash
sudo cat /var/lib/rancher/k3s/server/node-token
```

On the Dell:

```bash
curl -sfL https://get.k3s.io | \
  K3S_URL=https://<k3s-server-ip>:6443 \
  K3S_TOKEN=<node-token> \
  sh -
```

Then from a machine with `kubectl` access:

```bash
kubectl get nodes -o wide
```

Optional: label the node:

```bash
kubectl label node dell-gpu-01 node-role.kubernetes.io/gpu=true
kubectl label node dell-gpu-01 accelerator=nvidia-rtx-a2000
```

Optional: taint the node so only GPU workloads land there:

```bash
kubectl taint node dell-gpu-01 nvidia.com/gpu=true:NoSchedule
```

If you taint it, GPU workloads need a matching toleration.

## Kubernetes GPU Enablement Checklist

There are two common paths:

- NVIDIA GPU Operator: more complete and closer to real operations.
- NVIDIA device plugin only: simpler and lighter.

Recommended for this course: GPU Operator once the host and container runtime are clean, because NCP-AIO cares about operations, telemetry, and lifecycle components.

### Option A: GPU Operator

Install Helm if needed:

```bash
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
```

Install the GPU Operator following NVIDIA's official docs:

https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/latest/getting-started.html

Typical flow:

```bash
helm repo add nvidia https://helm.ngc.nvidia.com/nvidia
helm repo update
kubectl create namespace gpu-operator
helm install --wait gpu-operator nvidia/gpu-operator -n gpu-operator
```

Important decision: if you already installed the host driver yourself, you may choose an operator configuration that does not manage the driver. This avoids fighting over driver ownership. Check the current GPU Operator docs before choosing values.

Verify:

```bash
kubectl get pods -n gpu-operator
kubectl describe node dell-gpu-01 | rg -C 3 'nvidia.com/gpu|Capacity|Allocatable'
```

Expected: `nvidia.com/gpu: 1` appears under Capacity and Allocatable.

### Option B: NVIDIA Device Plugin Only

Use this if GPU Operator is too much for the first pass.

Official repository:

https://github.com/NVIDIA/k8s-device-plugin

Typical install:

```bash
kubectl create -f https://raw.githubusercontent.com/NVIDIA/k8s-device-plugin/v0.16.2/deployments/static/nvidia-device-plugin.yml
```

Before running this, check the current latest version in the official repository.

Verify:

```bash
kubectl get pods -A | rg nvidia
kubectl describe node dell-gpu-01 | rg -C 3 'nvidia.com/gpu|Capacity|Allocatable'
```

## GPU Smoke-Test Pod

Once Kubernetes advertises the GPU:

```bash
kubectl run gpu-smoke \
  --rm -it \
  --restart=Never \
  --image=nvidia/cuda:12.4.1-base-ubuntu22.04 \
  --limits='nvidia.com/gpu=1' \
  -- nvidia-smi
```

If you tainted the GPU node, use a manifest with tolerations instead of `kubectl run`.

Minimal manifest:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: gpu-smoke
spec:
  restartPolicy: Never
  tolerations:
    - key: "nvidia.com/gpu"
      operator: "Equal"
      value: "true"
      effect: "NoSchedule"
  containers:
    - name: cuda
      image: nvidia/cuda:12.4.1-base-ubuntu22.04
      command: ["nvidia-smi"]
      resources:
        limits:
          nvidia.com/gpu: 1
```

Apply and inspect:

```bash
kubectl apply -f gpu-smoke.yaml
kubectl logs gpu-smoke
kubectl describe pod gpu-smoke
kubectl delete pod gpu-smoke
```

## Observability Checklist

For this course, you want at least one path to GPU telemetry.

Minimum:

```bash
nvidia-smi dmon
nvidia-smi pmon
```

Better:

- DCGM installed on the host, or
- DCGM Exporter deployed through GPU Operator, or
- DCGM Exporter deployed standalone.

Verify DCGM Exporter if installed:

```bash
kubectl get pods -A | rg dcgm
kubectl get svc -A | rg dcgm
```

Metrics to learn early:

- GPU utilization.
- Memory used/free.
- Memory copy utilization.
- Power draw.
- Temperature.
- SM and memory clocks.
- ECC counters, where available.
- XID errors from system logs.

On RTX A2000, some data-center reliability fields may be missing or less useful than on A-series data-center GPUs.

## NGC And NVIDIA Software Access

Create or confirm an NVIDIA NGC account:

https://catalog.ngc.nvidia.com/

Install NGC CLI later when a lesson needs it. For now, you only need:

- Ability to pull public NVIDIA CUDA containers.
- Awareness that NIM and some NGC assets may require authentication or license terms.

For private or authenticated pulls:

```bash
docker login nvcr.io
```

Username is usually `$oauthtoken`; password is your NGC API key. Do not paste API keys into lesson pages or chat logs.

## Local Model Runtime Checklist

This is not required before Lesson 1, but it will be useful soon.

Install only after the GPU path works:

- Python 3.10+ or 3.11.
- `uv` or another Python environment manager.
- A local model runner appropriate for small models.
- Enough disk space for model weights.

Keep the first local inference targets small because the RTX A2000 has 6 GB VRAM. Prefer quantized 2B-4B class models for memory-pressure lessons.

## Security And Hygiene Checklist

- Keep NVIDIA driver versions, container runtime versions, and K3s versions recorded.
- Do not install random CUDA scripts from blogs when official NVIDIA docs exist.
- Keep NGC API keys out of shell history where possible.
- Do not run privileged GPU pods broadly. Use them only when a specific operator or diagnostic requires it.
- Treat the GPU node as special capacity: label it, consider tainting it, and schedule intentionally.
- Snapshot important K3s manifests in git.

## Known Non-Goals For Local Setup

Do not try to force these onto the RTX A2000 homelab:

- MIG. RTX A2000 does not support it.
- vGPU. This requires a supported stack and NVIDIA licensing.
- NVLink/NVSwitch/Fabric Manager. The local card and workstation do not expose this.
- InfiniBand fabric. Teach conceptually or with cloud/lab hardware.
- Multi-GPU training. Teach conceptually or with rented multi-GPU nodes.

## Ready For The Course When

You can show:

```bash
nvidia-smi
docker run --rm --gpus all nvidia/cuda:12.4.1-base-ubuntu22.04 nvidia-smi
kubectl get nodes -o wide
kubectl describe node dell-gpu-01 | rg -C 3 'nvidia.com/gpu|Capacity|Allocatable'
kubectl logs gpu-smoke
```

And you can answer:

- Does the host driver see the GPU?
- Can a local container see the GPU?
- Does Kubernetes advertise the GPU as allocatable?
- Can a scheduled pod consume the GPU?
- Is telemetry available through `nvidia-smi`, DCGM, or DCGM Exporter?

## Official References

- NVIDIA Container Toolkit: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html
- NVIDIA GPU Operator: https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/latest/getting-started.html
- NVIDIA DCGM Exporter: https://docs.nvidia.com/datacenter/cloud-native/gpu-telemetry/latest/
- NVIDIA Kubernetes Device Plugin: https://github.com/NVIDIA/k8s-device-plugin
- K3s Documentation: https://docs.k3s.io/
- NGC Catalog: https://catalog.ngc.nvidia.com/
