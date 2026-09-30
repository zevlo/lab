# DevSec Engineering Resources

Sources for the Lockheed Martin Space DevSec Engineering Level 2 interview path. Lessons draw claims from this list.

## Knowledge

- [Book: _Pro Git_ — Scott Chacon and Ben Straub](https://git-scm.com/book/en/v2)
  The Git project's own book. Use for: what a commit, a diff, and a branch are. Start with [Recording Changes](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository) and [Branches in a Nutshell](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell).
- [Article: "Removing sensitive data from a repository" — GitHub Docs](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository)
  Official account of what remains after a secret is committed. Use for: why a later delete leaves the secret in older commits, and why rotation comes first.
- [Book: _The Linux Command Line_ — William Shotts](https://linuxcommand.org/tlcl.php)
  Free book on the shell. Use for: files, permissions, processes, and Bash.
- [Docs: Kubernetes Concepts](https://kubernetes.io/docs/concepts/)
  The project’s concept guide. Use for: containers, pods, Deployments, Services, and access control. This is also the source for the container lesson.
- [Docs: Ansible Getting Started](https://docs.ansible.com/ansible/latest/getting_started/index.html)
  Official first path through Ansible. Use for: inventory, play, and task.
- [Docs: Helm](https://helm.sh/docs/)
  Official Helm documentation. Use for: what a chart is and how it packages Kubernetes configuration.
- [Docs: Argo CD](https://argo-cd.readthedocs.io/en/stable/)
  Official Argo CD documentation. Use for: Git as the source of truth for a cluster.
- [Docs: GitLab CI/CD](https://docs.gitlab.com/ci/)
  Official GitLab CI documentation. Use for: pipeline stages and a job that can stop a change.
- [Docs: Terraform](https://developer.hashicorp.com/terraform/docs)
  Official Terraform documentation. Use for: creating infrastructure, and for the split between Terraform and Ansible.
- [Standard: NIST SP 800-218, Secure Software Development Framework, version 1.1](https://nvlpubs.nist.gov/nistpubs/specialpublications/nist.sp.800-218.pdf)
  NIST’s practice set for secure software. Use for: threat modeling as practice PW.1.1, and for the words around secure release.
- [Guide: DoD Enterprise DevSecOps Reference Design, version 1.0, public release, 12 August 2019](https://dodcio.defense.gov/Portals/0/Documents/DoD%20Enterprise%20DevSecOps%20Reference%20Design%20v1.0_Public%20Release.pdf?ver=2019-09-26-115824-583)
  Department of Defense reference for a software factory. Use for: the shape of a factory, including pipeline gates and hardened images. It is a 2019 public design, not a Lockheed Martin internal manual.
- [Guide: DoD Enterprise DevSecOps Fundamentals](https://dodcio.defense.gov/Portals/0/Documents/Library/DoD%20Enterprise%20DevSecOps%20Fundamentals%20v2.5.pdf)
  Later public compendium, approved 16 October 2024. The file name is v2.5. Use for: the current public definitions of DevSecOps and authority to operate. The index of related public guides is the [DoD CIO library](https://dodcio.defense.gov/Library/).
- [Guide: Threat Modeling — OWASP](https://community.owasp.org/Threat_Modeling)
  OWASP’s community page on threat modeling. Use for: how to name threats on one small system before ranking them.

## Wisdom (Communities)

- [Kubernetes community](https://kubernetes.io/community/)
  Official community page. The Slack invite it points to is <https://slack.k8s.io/>. Use for: questions about pods, Deployments, and cluster behavior from people who run Kubernetes.
- [Ansible Forum](https://forum.ansible.com/)
  Official Ansible community forum. Use for: playbook review and questions about inventory, plays, and tasks.
- [OWASP chapters](https://owasp.org/chapters)
  Local OWASP chapters. Use for: talking through a threat model with security practitioners, which is the wisdom step a page cannot give you.

## Gaps

- No public Lockheed Martin interview rubric or question bank for DevSec Engineering Level 2. Lessons practice the skills named in the posting. They do not claim to be the company’s questions.
- A program will still have internal guidance that these public DoD PDFs do not contain. Use the public documents until you are on the program.
