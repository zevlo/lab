# Docker & Containers Resources

All links verified live. Annotate when adding new ones; prune ruthlessly when something proves shallow.

## Knowledge

- [Docs: "What is a container?" — Docker official](https://docs.docker.com/get-started/docker-concepts/the-basics/what-is-a-container/)
  Canonical definition, containers-vs-VMs, hands-on walkthrough. Use for: fundamentals, citations for what a container IS.
- [Docs: "What is an image?" — Docker official](https://docs.docker.com/get-started/docker-concepts/the-basics/what-is-a-container/what-is-an-image/)
  Image layers, tags, registries explained from first principles. Use for: image model, layer caching groundwork.
- [Docs: Build, tag, and publish an image — Docker official](https://docs.docker.com/get-started/docker-concepts/building-images/build-tag-and-publish-an-image/)
  build context, image naming anatomy (`HOST/PATH:TAG`), push workflow. Use for: Dockerfile/registry lessons.
- [Docs: Dockerfile best practices — Docker official](https://docs.docker.com/build/concepts/dockerfile-best-practices/) (tree under docs.docker.com/build — verify exact page when first cited)
  Use for: layer ordering, cache optimization, multi-stage builds.
- [Repo: containers-from-scratch — Liz Rice](https://github.com/lizrice/containers-from-scratch)
  A container in ~100 lines of Go (namespaces + cgroups). Use for: Module 2 — seeing isolation primitives with zero Docker magic. Companion talk: [DockerCon 2017 video](https://www.youtube.com/watch?v=MHv6cWjvQjM&t=1316s).
- [Cheat Sheet: Docker Security — OWASP](https://cheatsheetseries.owasp.org/cheatsheets/Docker_Security_Cheat_Sheet.html)
  14 rules: user, capabilities, read-only fs, socket exposure, scanning, secrets, supply chain. Use for: Module 5 — the production security checklist.

## Wisdom (Communities)

- [r/docker](https://www.reddit.com/r/docker/)
  Active subreddit for troubleshooting and "why does my container do X". Use for: sanity-checking real-world problems.
- [Docker Community Forums](https://forums.docker.com/)
  Official forums; maintainers and staff answer. Use for: version-specific bugs, OrbStack-vs-Desktop oddities.
- Local/in-person: none identified yet — user hasn't expressed interest; revisit when they near production topics.

## Gaps
- No verified high-quality resource yet for: container networking deep-dive, compose in production, storage drivers. Fill before Modules 4.
- Book-length reference not yet chosen (candidates to evaluate when mission demands: Liz Rice — *Container Security*, O'Reilly).
