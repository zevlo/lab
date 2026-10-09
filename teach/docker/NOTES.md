# NOTES.md

## User profile
- Dabbler: has run `docker run` / `docker compose` occasionally, copy-pasted Dockerfiles, no real understanding
- Goal: career move to DevOps/platform/backend. Wants interview-grade understanding + production operation skills
- Time budget: 5+ hrs/week (deep dive)
- Chosen success outcome: "both build and operate"

## Environment
- macOS, Apple Silicon
- Docker provided by **OrbStack** (context `orbstack`), NOT Docker Desktop — `open -a Docker` fails; use `open -a OrbStack`
- Docker CLI 29.4.0. Daemon was started and verified working during session 1
- Teaching implication: hands-on lessons must note that container processes run inside OrbStack's Linux VM and are not visible in macOS `ps` output

## Teaching preferences
- No "Why this lesson" mission-callout boxes in lessons — user had the block removed from 0001 (2026-10-08). Keep mission ties inline in prose instead.
- Lessons use clear, concise plain language (ISO 24495, recorded 2026-10-08 after lesson 0003): short sentences, one idea per sentence, everyday words, active voice, define terms at first use.
- (ask occasionally what's working and what isn't)

## Session log
- Session 1 (2026-10-05): Mission interview conducted. Workspace initialized. Lesson 0001 (image vs container mental model) created and opened. Prior experience recorded as LR-0001.
- Session 2 (2026-10-05): Reconfirmed: lessons must run hands-on against Mac + OrbStack. Daemon verified running. Lesson 0001 (re)opened for the user.
- Session 3 (2026-10-08): Lesson 0001 quiz aced 4/4 first pass (LR-0002). Mission callout box removed from 0001 on request (recorded as preference). Lesson 0002 (image anatomy: layers, tags, digests) + reference/image-anatomy.html created; lesson opened.
- Session 4 (2026-10-08): Lesson 0002 quiz aced 4/4 first pass — Module 1 closed clean (LR-0003). Lesson 0003 (Module 2: namespaces, UTS/PID/NET via =host flags) + reference/isolation-namespaces.html created; namespaces(7) man page verified live and added to RESOURCES; lesson opened. Next: cgroups.
- Session 5 (2026-10-08): Lesson 0003 quiz aced 4/4 — third consecutive first-pass 4/4 (LR-0004). Plain-language preference (ISO 24495) recorded. Lesson 0004 (cgroups: memory kills / CPU slows, exit 137, /sys/fs/cgroup) + reference/cgroups-limits.html written in plain style; kernel.org cgroup-v2 doc verified live and added to RESOURCES; lesson opened. Next: client/daemon split (Module 2 wrap).
