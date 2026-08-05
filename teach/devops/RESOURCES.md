# DevOps Resources

## Knowledge

### Curriculum spine

- [Local PDF: _DevOps Beginner Roadmap_](./DevOps.pdf)
  A printable snapshot of the roadmap.sh beginner path supplied by the learner. Use for: a breadth checklist and sequencing prompts, not as proof of mastery or as a technical authority.
- [roadmap.sh: DevOps Beginner](https://roadmap.sh/devops-beginner)
  Community-maintained orientation to common DevOps topics. Use for: spotting broad curriculum omissions; verify every technical lesson against primary documentation.
- [AWS Well-Architected: DevOps Guidance](https://docs.aws.amazon.com/wellarchitected/latest/devops-guidance/devops-guidance.html)
  AWS's first-party framework for designing, developing, securing, and operating software at cloud scale. Use for: the AWS capstone, operational practices, anti-patterns, and review criteria.
- [DORA Research 2025: _State of AI-assisted Software Development_](https://dora.dev/dora-report-2025/)
  Current primary research on software-delivery performance and the five delivery metrics. Use for: judging outcomes rather than mistaking tool adoption for DevOps performance.
- [Google SRE Books](https://sre.google/books/)
  Google's free primary texts on reliability, practical SRE, and secure systems. Use for: SLIs/SLOs, toil, monitoring, incident response, and production engineering.

### Linux fundamentals

- [Linux man-pages: `/proc/pid`](https://man7.org/linux/man-pages/man5/proc_pid.5.html) and [`/proc/pid/fd`](https://man7.org/linux/man-pages/man5/proc_pid_fd.5.html)
  Documentation from the Linux man-pages project for the kernel's process view and open file descriptors. Use for: process inspection and understanding stdin, stdout, stderr, files, pipes, and sockets.
- [systemd: `systemctl`](https://freedesktop.org/software/systemd/man/latest/systemctl.html) and [`journalctl`](https://freedesktop.org/software/systemd/man/latest/journalctl.html)
  Upstream service-manager and journal documentation. Use for: unit state, service lifecycle, and unit-scoped logs.
- [Linux man-pages: `ss(8)`](https://man7.org/linux/man-pages/man8/ss.8.html)
  Primary command reference for inspecting sockets. Use for: proving whether a process is listening on the expected address and port.
- [OrbStack Linux Machines](https://docs.orbstack.dev/machines/)
  First-party documentation for full Linux machines on macOS, including init systems and shared files. Use for: reproducible local Linux labs with systemd.

### Employer-demand checks

A 16-posting snapshot of live, direct-employer listings on 2026-08-04 covered DevOps, cloud, platform, and SRE roles. It strongly favored AWS, Terraform, Kubernetes, CI/CD, security, observability, incident response, scripting, and production communication. This is a purposive snapshot, not a statistical census.

- [SimpliFed: Junior DevOps Engineer](http://job-boards.greenhouse.io/simplifed/jobs/5082279008)
  Entry-level market signal. Use for: checking the practical baseline employers attach even to a “junior” title.
- [Encoura: DevOps Engineer II](https://job-boards.greenhouse.io/encoura/jobs/4253388009)
  Mid-level US remote market signal. Use for: checking expected hands-on delivery and cloud-operating depth.
- [Twin Health: Senior Platform Engineer, Productivity & Cloud](https://job-boards.greenhouse.io/twinhealth/jobs/6115577004)
  Platform-engineering market signal. Use for: developer enablement, reusable tooling, and self-service expectations.
- [Accela: Site Reliability Engineer 2](http://job-boards.greenhouse.io/accela/jobs/8010423)
  SRE market signal. Use for: reliability, observability, incident response, and software-engineering expectations.

## Wisdom (Communities)

- [AWS re:Post — DevOps](https://repost.aws/topics/TA0BlCQ-o2Qwm5OryR2K_Qw/devops)
  AWS-moderated practitioner Q&A. Use for: testing AWS architecture and troubleshooting questions against current field experience.
- [DevOps Stack Exchange](https://devops.stackexchange.com/)
  Moderated, searchable practitioner Q&A. Use for: narrowly scoped operational questions with reproducible context.
- [CNCF Community](https://www.cncf.io/community/)
  Project communities and practitioner groups around Kubernetes and cloud-native operations. Use for: project-specific implementation wisdom once the capstone reaches that layer.

## Gaps

- No statistically representative, continuously updated dataset for US remote and Pennsylvania DevOps skill demand is curated here; refresh the direct-posting sample during the six-month mission.
