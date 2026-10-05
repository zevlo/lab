# Mission: Docker & Containers

## Why
Career move toward DevOps/platform/backend roles where containers are table stakes. I need to go from copy-pasting docker commands to genuinely understanding what containers are, so I can both build images and operate them confidently in production — and speak fluently about containers in interviews and on the job.

## Success looks like
- Explain what a container actually is (isolation primitives, not "lightweight VM" hand-waving) — interview-grade
- Take a real application and ship it end-to-end: optimized Dockerfile → compose stack → running deployment
- Debug a misbehaving containerized service: inspect, exec, read logs, trace networking/storage
- Harden containers for production: non-root users, minimal images, pinned digests, known security tooling

## Constraints
- 5+ hours per week — deep dive pace, lessons plus real project work
- macOS + OrbStack (not Docker Desktop) as the local environment
- ~2 month horizon to demonstrable competence

## Out of scope
- Kubernetes (after Docker is solid; may become a future mission)
- Container runtimes internals beyond Docker (containerd, CRI-O) except where it clarifies Docker's architecture
- Orchestration, service meshes, cloud-specific container platforms

## Curriculum roadmap
1. Fundamentals — image vs container, lifecycle, core commands
2. Container Architecture & Isolation — namespaces, cgroups, union filesystems, daemon/client split
3. Dockerfile Optimization & Image Layering — cache, multi-stage builds, small images
4. Storage, Networking & Composition — volumes, bind mounts, networks, compose
5. Production Readiness & Security — non-root, scanning, supply chain, resource limits
