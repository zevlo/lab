# Working Notes

## User profile (2026-09-01)
- Passed SAA-C03. Core-service theory is exam-level — do NOT re-teach certification basics.
- Hands-on level: "dabbled" — has launched an EC2, made buckets. Everything should be operational/practical.
- Personal AWS account (free tier). 3–5 h/week.
- Goal: hireable DevOps engineer — interviews + real job duties.

## Lesson writing style (user preference, 2026-09-01)
Lessons follow the [Google developer documentation style guide](https://developers.google.com/style). Key rules to apply in every lesson:
- Sentence case for headings and titles; Google-docs section conventions: "Before you begin", "Check your understanding", "Recommended reading", "Next steps".
- Second person, active voice, present tense. Conditions before instructions.
- Procedures: intro sentence ending in a colon, one action per step, goal before action ("To …, choose …"), location before action ("In the AWS Management Console, …"), UI elements in bold with `>` for menu paths, results/justifications after the action.
- Descriptive link text (never "docs" or "click here"); "For more information, see …".
- Tone: conversational but not cute. No exclamation marks, no "simply/easy/quickly" in procedures, no "let's", no "please" in instructions, no figurative language or superlatives, no "above/below" (use "the following/preceding").
- Code in `code font`; serial commas.

## Teaching strategy
- Frame every lesson as one of: "you're on call", "you're in an interview", "you're building it".
- Every service lesson gets a hands-on, cost-aware drill in their account.
- One continuous reference architecture across lessons (three-tier web app), growing in complexity — this becomes their interview story and portfolio.
- Quiz design: options within a question must have matching word counts (no formatting tells).
- Interleave previously-covered services into each new lesson's quiz (spacing + interleaving).
- Billing alarm was assigned in Lesson 0001 as a prerequisite for all future hands-on.

## Lesson roadmap (working plan)
1. 0001 — The DevOps map: one request's journey through all nine services (done)
2. VPC hands-on: 2-AZ VPC, public/private subnets, IGW, NAT (console + CLI)
3. IAM operationally: roles vs users, policy evaluation, least privilege, instance/task roles
4. EC2 ops: launch in a private subnet, user data, SSM Session Manager (no SSH), instance profiles
5. ALB + target groups + health checks + Auto Scaling
6. RDS in isolated data subnets; SG chaining app → DB
7. S3: build artifacts, static hosting, bucket policies, presigned URLs
8. Route 53: hosted zone, record types, health checks; ACM cert + HTTPS on the ALB
9. CloudWatch: metrics, logs, alarms, dashboards
10. ECS: cluster, task definition, Fargate service behind the ALB; ECR
11. EKS: cluster, deployment + service; the ECS-vs-EKS decision
12. Capstone: full stack + CI/CD; interview narration drill

## Next lesson number: 0002
