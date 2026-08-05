# Teaching Notes

## Learner and environment

- Target: a stronger DevOps/SRE role within six months, focused on US remote employers and Pennsylvania.
- Time: 3–5 focused hours per week.
- Reported basic familiarity: Linux, bash/shell, networking, tmux, Vim, Ansible, Terraform, Docker, Kubernetes, Git, GitHub Actions, GitOps/Argo CD, AWS, and Python.
- Treat that list as prior exposure, not demonstrated operating fluency. Start with integrative retrieval and troubleshooting; record the actual floor from evidence.
- Local machine: macOS with bash. Linux access: an OrbStack Ubuntu Noble machine named `linux-lab`, plus an Arch Linux ThinkPad.
- Cross-workspace teaching preferences: one concept at a time, plain wording, primary sources, short hands-on drills, hidden answers, immediate quiz feedback, and no unexplained forward references.
- Abstract system models need a concrete before/after trace. Quiz wording must be direct, and answer choices must not introduce untaught ideas.
- Lesson 0001's delivery-lifecycle model was rejected as too abstract. Start with commands against a real system; introduce cross-tool models only after the component fundamentals have been exercised.

## Curriculum stance

- Cover these roadmap fundamentals deliberately: Python, Linux, networking, Docker, Git, GitHub Actions, AWS, Terraform, Ansible, and Kubernetes. The learner selected Linux as the first domain.
- Keep each lesson narrow and runnable. Connect tools into an end-to-end delivery system later, after their individual mechanics are durable.
- AWS first. Add another cloud only after the capstone demonstrates reliable operation.
- Fundamentals remain first-class even when job descriptions assume them: Linux, processes, files, permissions, networking, DNS, HTTP/TLS, Git, scripting, and troubleshooting.
- Every major skill should leave evidence in the capstone: code, tests, plans, logs, dashboards, alerts, runbooks, recovery, or an incident artifact.
- Cloud exercises must include cost visibility and teardown.
- Use the supplied roadmap only as a coverage map. Its suggestion that completing the list may qualify someone for roles is not evidence of competence.

## Employer-demand snapshot — 2026-08-04

Method: 16 live direct-employer postings, four each across DevOps, cloud, platform, and SRE; 13 remote-eligible, four Pennsylvania-anchored, with one overlap. The sample is purposive and senior-heavy, not a statistical census.

Explicit mentions out of 16:

- Cloud 16; AWS 14; security/IAM 16; containers 16; collaboration/documentation 16.
- Terraform/IaC 15; Kubernetes 15; reliability/scalability 15.
- CI/CD 14; observability 14; incident response/RCA 14.
- programming/scripting 13; Git/GitOps 12; networking 12.
- on-call 8; databases 7; Linux/Unix 6. Linux is often assumed rather than named.

Priority:

1. Linux and networking; Git; Bash/Python; AWS; Terraform; Docker/Kubernetes; CI/CD; security.
2. Observability; SLI/SLOs; incidents and postmortems; resilience and recovery; databases; cost; written communication.
3. GitOps; another cloud; compliance; internal platforms; role-specific distributed systems.

Direct sources checked:

- SimpliFed — Junior DevOps Engineer: http://job-boards.greenhouse.io/simplifed/jobs/5082279008
- Cadent — DevOps Engineer, Philadelphia: https://careers-cadent.icims.com/jobs/1390/devops-engineer/job
- Encoura — DevOps Engineer II: https://job-boards.greenhouse.io/encoura/jobs/4253388009
- Ascensus — Senior DevOps Engineer, Philadelphia/remote: https://careers.ascensus.com/jobs/senior-devops-engineer-philadelphia-pennsylvania-united-states-d183875a-7e46-4ce8-a9b3-792b264635fa
- UJET — Senior Cloud Infrastructure Engineer: https://job-boards.greenhouse.io/ujet/jobs/4710574005
- Hypori — Senior Engineer, Cloud Operations: https://job-boards.greenhouse.io/hypori/jobs/6112925004
- Comcast — Principal Cloud Engineer, West Chester/Philadelphia: https://jobs.comcast.com/job/west-chester/principal-cloud-engineer-ai-agentic/45483/93984797888
- Lockheed Martin — Cloud Platform Engineer III, King of Prussia: https://www.lockheedmartinjobs.com/job/king-of-prussia/cloud-platform-engineer-level-iii-ts-sci-w-poly/694/98050794384
- Twin Health — Senior Platform Engineer: https://job-boards.greenhouse.io/twinhealth/jobs/6115577004
- Verantos — Senior Platform Engineer: https://job-boards.greenhouse.io/verantos/jobs/5988306004
- Strivacity — Senior Platform Engineer: https://job-boards.greenhouse.io/strivacity/jobs/5155432007
- Defense Unicorns — Platform Engineer: https://job-boards.greenhouse.io/defenseunicorns/jobs/5165337007
- Accela — Site Reliability Engineer 2: http://job-boards.greenhouse.io/accela/jobs/8010423
- Cohere Health — Site Reliability Engineer II: https://job-boards.greenhouse.io/coherehealth/jobs/7807972003?gh_src=fbc59ee93us
- MyFitnessPal — Site Reliability Engineer / Software Engineer III: https://job-boards.greenhouse.io/myfitnesspal/jobs/8085214
- Filevine — Senior Site Reliability Engineer: https://jobs.lever.co/filevine/88e5a7c2-3e27-4da7-9d8e-817401880ffc
