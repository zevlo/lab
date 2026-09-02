# Mission: AWS for DevOps Engineers

## Why
Land a DevOps engineer job. I passed the AWS Solutions Architect Associate (SAA-C03), so the theory is largely in place — what's missing is the ability to **operate** AWS: build real infrastructure, deploy containers, wire up networking, and debug failures the way a working engineer does.

## Success looks like
- Build a production-style three-tier stack in my own account: VPC → private compute (EC2, then ECS/EKS) behind an ALB → RDS, with Route 53 DNS in front
- Explain and defend that architecture in an interview ("walk me through how a request reaches my app")
- Deploy a container to ECS (Fargate) and to EKS, and know when to choose which
- Set up CloudWatch metrics, logs, and alarms so the stack pages me before users notice
- Debug the classic failures fast: security-group/NACL mismatches, IAM access denials, unhealthy ALB targets, stuck ECS tasks

## Constraints
- 3–5 hours per week
- Personal AWS account on the free tier — keep spend near zero; a billing alarm is non-negotiable before any hands-on
- Theory is already SAA-covered; lessons should be hands-on and operational, not re-teaching certification content

## Out of scope (for now)
- Another certification exam (e.g. DOP-C02) — revisit only if interviews demand it
- Non-AWS clouds
- Deep serverless / ML / analytics services
- Terraform/CDK mastery (light exposure fine; deep IaC is a later mission)
